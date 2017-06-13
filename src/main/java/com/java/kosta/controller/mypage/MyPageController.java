package com.java.kosta.controller.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.kosta.common.Constants;
import com.java.kosta.dto.board.BoardDTO;
import com.java.kosta.dto.board.BoardPagingDTO;
import com.java.kosta.dto.board.CategoryDTO;
import com.java.kosta.dto.mypage.EvalDTO;
import com.java.kosta.dto.mypage.Mypagepaging;
import com.java.kosta.dto.transaction.TransactionDTO;
import com.java.kosta.dto.user.UserVO;
import com.java.kosta.service.board.BoardServiceImpl;
import com.java.kosta.service.mypage.MyPageServiceImpl;

@Controller
@RequestMapping("/mypage/*")
public class MyPageController {
	Logger logger = LoggerFactory.getLogger(MyPageController.class);
	@Inject
	MyPageServiceImpl service;

	@Inject
	BoardServiceImpl bservice;

	// bno값 가지고 eval 테이블에서 해당 거래자 id 가져오기
	@RequestMapping(value="/getCustomer")
	public @ResponseBody String getCustomer(String bno){
		String customerId = service.getCustomerId(bno);
		return customerId;
	} // end of getCustomer
	
	
	/**
	 * 고객입장에서 상품후기를 남겨야하는 게시글이 몇개인지를 반환함 
	    작성자 : 황영롱
	 */
	@RequestMapping(value="/countClient")
	public @ResponseBody int countClient(TransactionDTO dto){
		// 현재 상품후기를 기술해야하는게 몇개인지...
		int num = service.countClient(dto);
		// 상품후기를 남겨야하는 게시글 수를 반환함
		return num;
	} // end of cuntClient();
	
	/**
	 * 고객입장에서 상품후기를 남겨야하는 게시글이 몇개인지를 반환함 
	    작성자 : 황영롱
	 */
	@RequestMapping(value="/clientTransactionList")
	public @ResponseBody List<BoardDTO> clientTransactionList(TransactionDTO dto){
		List<BoardDTO> list = service.clientTransactionList(dto);
		return list;
	} // end of clientTransactionList();
	
	

	/**
	 * 	구매 결정 모달창에서 거래할 사용자 지정시 존재하는 아이디인지 확인
	 * 	황영롱
	 */
	@RequestMapping(value="/existIdCheck")
	public @ResponseBody String existIdCheck(@RequestBody TransactionDTO dto){
		// 1 이면 있는 사용자 0이면 없는 사용자
		int checkNum = service.existIdCheck(dto);
		int duplicateNum = service.duplicateId(dto);
		String result = "";
		if ( checkNum == 0 ){
			result = "FAIL";
		}else if ( checkNum == 1 ){
			if ( duplicateNum == 0 ){
				result = "SUCCESS";
				// 거래관련 튜플 삽입
				service.insertTransaction(dto);
			}else{
				result = "DUPLICATE";
			}
		}
		
		return result;
	}
	
	
	  /* @RequestMapping(value="listReceive")
	   public String listForReceive(NoteVO vo,PagingDTO page,Model model,HttpSession session) throws Exception{
	      UserVO uvo = (UserVO) session.getAttribute("loginSession");
	      vo.setRecvId(uvo.getUserId());
	      page.setTotalCount(service.totalCntRecv(vo));
	      List<NoteVO> list = service.listForReceiver(vo, page);
	      model.addAttribute("list", list);
	      model.addAttribute("pageMaker", page);
	      logger.info("확인 : " + list);
	      return "note/listForReceive";
	   } // end of listForReceive
*/	
	
	/** 마이페이지 좋아요 보기 */
	@RequestMapping(value="/myList")
	public  String boardList(Mypagepaging pagingDTO, Model model, HttpServletRequest req){
		try {
			UserVO loginSession = (UserVO)req.getSession().getAttribute(Constants.LOGINSESSION);
			model.addAttribute("loginSession", loginSession);

			String userId = loginSession.getUserId();
			System.out.println(loginSession.getUserId());
			// 전체 레코드 갯수 획득
			int totRecord = service.selectFavoritecount(pagingDTO, userId);
			// 페이징 계산
			pagingDTO.setTotalCount(totRecord);

		/*	logger.info(pagingDTO.getTotalCount()+"개수는 ㅁㄴㅇㅁㄴㅇㅁㄴㅇ");*/
			
			// 내가 좋아요 누른 게시글 리스트로 가져와서 전달하기
			List<BoardDTO> list= service.selectFavoriteList(pagingDTO, userId);
			
			for (BoardDTO boardDTO : list) {
				CategoryDTO dto = bservice.selectCategory(boardDTO.getCateId());
				boardDTO.setCateName(dto.getCateName());
			}
			model.addAttribute("MyFavoriteList",list);
			model.addAttribute("pageMaker", pagingDTO);
//			model.addAttribute("boardDTO",dto);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/mypage/myfavoritelist";
	}

	//좋아요 했는지 체크
	@RequestMapping(value="/checkFavorite")
	@ResponseBody
	public String checkFavorite(@RequestParam(value = "bno") String bNo,@RequestParam(value = "userId") String userId,Model model){
		int fcnt = bservice.searchFavorite(userId, bNo);
		int count = bservice.countFavorite(bNo);
		String result = "";
		if (fcnt == 0) {
			result = "FAIL";
			model.addAttribute("likeCount",count);
			// model.addAttribute("favorite","none");
		} else {
			result = "SUCCESS";
			model.addAttribute("likeCount",count);
			// model.addAttribute("favorite", "exist");
		}

		return result;

	}

	// 좋아요 처리
	@RequestMapping(value = "/handlingFavorite")
	@ResponseBody
	public String handlingFavorite(@RequestParam(value = "bno") String bNo,
			@RequestParam(value = "userId") String userId) {

		/*// 로그인 안되어있으면 좋아요 할 수 없음
		if (userId == null) {
			return "notLogin";
		}*/

		int fcnt = bservice.searchFavorite(userId, bNo);

		if (fcnt != 0) {// 좋아요 취소
			try {
				System.out.println(fcnt);
				bservice.unfavoriteBoard(userId, bNo);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (fcnt == 0) {
			try {
				System.out.println(fcnt);
				bservice.favoriteBoard(userId, bNo);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} // end of if-else
		return "안뇽";
	}


	/**좋아요 삭제*/
	@RequestMapping(value="/deleteFavorite")
	@ResponseBody
	public String deleteFavorite(@RequestParam(value = "bno") String bNo,
			@RequestParam(value = "userId") String userId){

		try {
			bservice.unfavoriteBoard(userId, bNo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "삭제";
	}


	@RequestMapping(value="/myBoardList")
	@ResponseBody
	public Map<String,Object> myBoardList(Model model,HttpServletRequest req,Mypagepaging pagingDTO){
		HashMap<String,Object> res=new HashMap<String, Object>();
		
		UserVO loginSession = (UserVO)req.getSession().getAttribute(Constants.LOGINSESSION);
		
		res.put("loginSession", loginSession);
		String userId = loginSession.getUserId();
		
		int totRecord = service.selectMyBoardListCount(pagingDTO, userId);
		// 페이징 계산
		pagingDTO.setTotalCount(totRecord);

		try {
			List<BoardDTO> list = service.selectWritedList(userId);//내가 쓴 글 목록 조회
			res.put("success","success"); 
			res.put("MyBoardList",list);
			res.put("pagingDTO", pagingDTO);
			
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	/** 나의 거래중인 리스트 가져오는 AJAX */
	@RequestMapping("/myExchangeList")
	@ResponseBody
	public Map<String,Object> myExchangeList(Model model, HttpServletRequest req, BoardPagingDTO pagingDTO){
		HashMap<String,Object> res=new HashMap<String, Object>();
		
		UserVO loginSession = (UserVO)req.getSession().getAttribute(Constants.LOGINSESSION);
		
		res.put("loginSession", loginSession);
		String loginId = loginSession.getUserId();
		
		int totRecord = service.selectMyExchangeListCount(pagingDTO, loginId);	// eval 테이블에 있는 나의 거래중인 게시물(거래자 입장) 총 갯수
		System.out.println(totRecord);
		// 페이징 계산
		pagingDTO.calcPage(totRecord);

		try {
			List<BoardDTO> list = service.selectExchangeList(pagingDTO, loginId);	// eval 테이블에 있는 나의 거래중인(거래자 입장) 게시물 리스트 가져오기
			res.put(Constants.RESULT, Constants.RESULT_OK); 
			res.put("MyExchangeList",list);
			res.put("pagingDTO", pagingDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/** 구매 후기 작성 처리 */
	@RequestMapping("/writeReview")
	@ResponseBody
	public Map<String,Object> writeReview(Model model, HttpServletRequest req, EvalDTO evalDTO){
		Map<String,Object> res = new HashMap<String, Object>();
		
		try {
			
			res.put(Constants.RESULT, Constants.RESULT_OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}


}
