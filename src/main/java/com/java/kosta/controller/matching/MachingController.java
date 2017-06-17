package com.java.kosta.controller.matching;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.kosta.dto.board.BoardDTO;
import com.java.kosta.dto.matching.matchingCntDTO;
import com.java.kosta.dto.matching.matchingDTO;
import com.java.kosta.dto.timeline.TimelineDTO;
import com.java.kosta.dto.user.UserVO;
import com.java.kosta.service.matching.MatchingServiceImpl;

/**
 * 매칭 컨트롤러
 * @author 황영롱
 *
 */

@Controller
@RequestMapping(value="matching/*")
public class MachingController {
   @Inject
   MatchingServiceImpl service;
   Logger logger = LoggerFactory.getLogger(MachingController.class);
   
   // 매칭 메인으로 이동...
   @RequestMapping(value="/matchingMain")
   public String machingMain(){
      
      return "matching/matchingMain";
   } // end of matchingMain()
   
   //2개의 체크박스를 선택했을때 두 개의 값을 비교해주는 거
   @RequestMapping(value="/compareMatch")
   public @ResponseBody Map<String, Object> compareMatch(HttpSession session,
         @RequestBody matchingDTO content1, @RequestBody matchingDTO content2){
      UserVO vo = (UserVO) session.getAttribute("loginSession");
      /** 사이의 상대적 거리값과 오차범위를 가지고 있음  : 오차범위가 크고 거리값이 작으면 적정수준임 */
      matchingDTO comp1 = service.calcCompare(vo, content1.getBno());    
      matchingDTO comp2 = service.calcCompare(vo, content2.getBno());
      
      logger.info("comp1 : "+comp1);
      logger.info("comp2 : "+comp2);
      
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("comp1", comp1);
      map.put("comp2", comp2);
      return map;
   }//end of Map
    
   // 요청받은 목록 띄우기
   @RequestMapping(value="/receiveList")
   public @ResponseBody List<matchingCntDTO> receiveList(HttpSession session){
      // 로그인되어 있는 사용자 정보 가져오기
      UserVO vo = (UserVO) session.getAttribute("loginSession");
      
      // 리스트 가져오기...
      List<matchingCntDTO> list = service.listMyMatch(vo);
      logger.info("요청받은건??모닝?? : " + list);
      return list;
   }// end of receiveList()
   
   //게시글에 대해 요청내역 가져오기
   @RequestMapping(value="/listMatchContent")
   public @ResponseBody List<matchingDTO> listMatchContent(HttpSession session, @RequestBody matchingCntDTO dto){
      UserVO vo = (UserVO) session.getAttribute("loginSession");
      //테스트용으로 condi는 value값을 넘겨줌 , 뷰단 수정후 받는 값을 condi에 넘겨주면 됨
      List<matchingDTO> list = service.listMatchContent(vo, dto.getBno(),dto.getCondi());
      logger.info("내가 요청받은 내역은? : "+list);
      return list;
   }
   
   // 거래하고 싶은 목록을 설정
   @RequestMapping(value="/requestList",method=RequestMethod.POST)
   public @ResponseBody List<matchingDTO> reqeustList(@RequestBody matchingDTO dto,HttpSession session) throws UnsupportedEncodingException{
      // 로그인 세션 정보를 가져옴
      UserVO vo = (UserVO) session.getAttribute("loginSession");
      String productKeywords = dto.getProductKeywords();
      logger.info("유저 : " + vo.getUserId() + " 키워드 : " + productKeywords);


      // 사고자하는 상품명 입력한 문구를 포함하는 게시글 리스트를 가져옴
      List<matchingDTO> list = service.requestList(vo, productKeywords);

      logger.info("requestList : " + list);
      logger.info("size : " + list.size());
      logger.info("화아아아아아아앙ㄱ잉: " + service.testCount());
      return list;
   }// end of requestList()
   
   @RequestMapping(value="/insertMatching",method=RequestMethod.POST)
   public @ResponseBody String insertMatch(HttpSession session, @RequestBody matchingDTO dto){
      UserVO vo = (UserVO) session.getAttribute("loginSession");
      logger.info("lat : " + dto.getLat() + "lon : " + dto.getLon() + " addr1 : " + dto.getAddr1() + "wantedValue : " + dto.getWantedValue());
      //실제 삽입 처리
      service.insertMatchingT(vo, dto);
      
      return "success";
   } // end of insertMatch()
   
   
   // 로그인된 사용자 주소 가져오기
   @RequestMapping(value="/getAddr",method=RequestMethod.GET)
   public @ResponseBody UserVO getAddr(HttpSession session){
      // 현재 로그인된 사용자 정보
      UserVO vo = (UserVO) session.getAttribute("loginSession");
      UserVO addressObj = service.getAddr(vo);
      
      // lat, lon, addr1 이 세팅된 UserVO 객체를 반환함
      return addressObj;
   } // end of getAddr()
   
   
   // 비교하기 버튼 클릭시... 처리
   @RequestMapping(value="/compareMatching",method=RequestMethod.POST)
   public @ResponseBody Map<String, Object> compareMatching(HttpSession session,@RequestParam("sendData") String[] checkObj){
      logger.info("컨트롤러 진입 확인 : " + Arrays.toString(checkObj));
      UserVO vo = (UserVO) session.getAttribute("loginSession");
      int size = checkObj.length;
      List<matchingDTO> list = new ArrayList<matchingDTO>();
      logger.info("checkObj[0]: " + checkObj[0]);
      TimelineDTO myboard= service.showMyBoard(vo, checkObj[0]);
      
      logger.info("사용자 정보 : " + myboard);
      
      /** 계산을 하는 부분 **/
      
      for (int i = 0; i < size; i++) {
       list.add(service.calcCompare(vo, checkObj[i]));
      }
      
      Collections.sort(list);
      
      logger.info("확인 : " + list);
      
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("list", list);
      map.put("myboard", myboard);
      
      return map;
   }
   
} // end of controller.