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
import com.java.kosta.dto.mypage.EvalDTO;
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
   String swit;
   
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
      return list;
   }// end of receiveList()
   
   //게시글에 대해 요청내역 가져오기
   @RequestMapping(value="/listMatchContent")
   public @ResponseBody List<matchingDTO> listMatchContent(HttpSession session, @RequestBody matchingCntDTO dto){
      UserVO vo = (UserVO) session.getAttribute("loginSession");
      //테스트용으로 condi는 value값을 넘겨줌 , 뷰단 수정후 받는 값을 condi에 넘겨주면 됨
      List<matchingDTO> list = service.listMatchContent(vo, dto.getBno(),dto.getCondi());
      return list;
   }
   
   // 거래하고 싶은 목록을 설정
   @RequestMapping(value="/requestList",method=RequestMethod.POST)
   public @ResponseBody List<matchingDTO> reqeustList(@RequestBody matchingDTO dto,HttpSession session) throws UnsupportedEncodingException{
      // 로그인 세션 정보를 가져옴
      UserVO vo = (UserVO) session.getAttribute("loginSession");
      String productKeywords = dto.getProductKeywords();


      // 사고자하는 상품명 입력한 문구를 포함하는 게시글 리스트를 가져옴
      List<matchingDTO> list = service.requestList(vo, productKeywords);

      return list;
   }// end of requestList()
   
   @RequestMapping(value="/insertMatching",method=RequestMethod.POST)
   public @ResponseBody String insertMatch(HttpSession session, @RequestBody matchingDTO dto){
      UserVO vo = (UserVO) session.getAttribute("loginSession");
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
      UserVO vo = (UserVO) session.getAttribute("loginSession");
      int size = checkObj.length;
      List<matchingDTO> list = new ArrayList<matchingDTO>();
      TimelineDTO myboard= service.showMyBoard(vo, checkObj[0]);
      List<Integer> absList = new ArrayList<Integer>();
      
      
      /** 계산을 하는 부분 **/
      
      for (int i = 0; i < size; i++) {
       list.add(service.calcCompare(vo, checkObj[i]));
       absList.add(Math.abs(Integer.parseInt(list.get(i).getRelValue())));
      }
      
      Collections.sort(list);
      
      
      
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("list", list);
      map.put("myboard", myboard);
      map.put("absList", absList);
      
      return map;
   }
   
   /** 아래 코드와 거의 동일한 코드여서 mno의 값이 있으면 상태바꿔주는 일을 하고 없으면 안하는 코드 이걸로 걍 뜨는거 연결해줘도 될거같음*/
	/** 잘되는거 확인했음 */
	// 매칭 성사된 경우 둘간의 정보를 표시함
	@RequestMapping(value = "/matchingResult")
	public @ResponseBody Map<String, Object> matchingResult(HttpSession session, @RequestParam("mno") String mno) {
		UserVO vo = (UserVO) session.getAttribute("loginSession");
		String myId = vo.getUserId();
		
		if(!mno.isEmpty()){
			swit = "ON"; // 요청 혹은 취소 를 결정하는 switch변수
			
			// 요청글 상태를 바꾸기 위한 필요한 정보 가져오기
			BoardDTO info = service.infoForUpdate(mno);
			logger.info("잘 가져왔나?" + info.getbNo() + "," + info.getUserId());
			
			// 게시자가 요청글을 선택한 경우
			service.updateAllowVal(mno, info.getbNo(), info.getUserId(), swit);
		}

		// 내 정보 가지고 오기
		UserVO myinfo = service.WhoAmI(myId);

		// 게시글 중에서 내 아이디를 검색한 리스트 가지고옴
		List<matchingDTO> mylist = new ArrayList<matchingDTO>();
		mylist = service.selectMyBno(myId);
		logger.info("mylist의 크기 : " + mylist.size());
		// 판매자용 리스트
		List<matchingDTO> IamSeller = new ArrayList<matchingDTO>();
		List<UserVO> MyCustomerList = new ArrayList<UserVO>();
		// 구매자용 리스트
		List<matchingDTO> IamCustomer = new ArrayList<matchingDTO>();
		List<UserVO> MySellerList = new ArrayList<UserVO>();
		System.out.println("myId : " + myId);

		// 내가 판매자인 리스트
		if (mylist.size() != 0) {
			for (int i = 0; i < mylist.size(); i++) {
				if (mylist.get(i).getSellerId().equals(myId)) {
					IamSeller.add(mylist.get(i));
					// 내가 판매자인 경우 구매자의 정보를 가지고 옴
					String MyCustomerId = mylist.get(i).getRequester();
					MyCustomerList.add(service.WhoAmI(MyCustomerId));
				} // if
				/**원래 userId와 sellerId가 동일하지 않기 때문에 else if로 써줘야 하지만*/
				/**테스트 환경에서는 userId와 sellerId가 동일하기 때문에 원활한 테스트를 위해서 if문을 써줌 */
				if (mylist.get(i).getRequester().equals(myId)) {
					// 내가 구매자인 경우
					IamCustomer.add(mylist.get(i));
					// 내가 구매자인 경우 판매자의 정보를 가지고 옴
					String MySellerId = mylist.get(i).getSellerId();
					MySellerList.add(service.WhoAmI(MySellerId));
				} // else
			} // for
		} // if

		/** 뿌려줄때..둘이 거래가 성립된 날짜와 시간 순서대로 sort 해줘야되나... */

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("myinfo", myinfo); // 내 정보
		map.put("IamSeller", IamSeller); // 내가 판매자인 경우 내 게시글 정보(requestMsg등의 정보를 담고 있음) ,
		map.put("MyCustomerList", MyCustomerList); // 내 게시글 구매자 정보를 담고 있음
		map.put("IamCustomer", IamCustomer); // 내가 구매자인 경우((requestMsg등의 정보를 담고 있음),
		map.put("MySellerList", MySellerList); // 내가 요청한 메시지의 판매자 정보를 담고 있음

		return map;
	}
	
	/** 구매를 확정해서 후기가 있는 곳으로! */
	@RequestMapping(value = "/confirmMatching")
	public @ResponseBody Map<String, Object> confirmMatching(@RequestParam("mno") String mno, HttpSession session){
		UserVO vo = (UserVO) session.getAttribute("loginSession");
		logger.info("구매 확정해서 후기로 고고고고고고고고고!");
		
		//넣음넣음
		service.insertTranPost(mno,vo);
		
		EvalDTO eval = service.selectEval(mno);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("eval", eval);
		
		return map;
	}
	
	/** cacleMatching 정상작동하는 거 확인했음!! */
	@RequestMapping(value = "/cancelMatching")
	public @ResponseBody String cancleMatching(HttpSession session, @RequestParam("mno") String mno) {
		logger.info("취소컨트롤러 들어왔음!");
		UserVO vo = (UserVO) session.getAttribute("loginSession");
		swit = "OFF";

		// 요청글 상태를 바꾸기 위한 필요한 정보 가져오기
		BoardDTO info = service.infoForUpdate(mno);
		logger.info("취소할거 잘 가져왔나?" + info.getbNo() + "," + info.getUserId());

		// 게시자가 요청글을 선택한 경우
		service.updateAllowVal(mno, info.getbNo(), info.getUserId(), swit);
		return "cancle";
	}// end of cancleMatching
	
	
   
} // end of controller.