package com.java.kosta.controller.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.kosta.common.Constants;
import com.java.kosta.dto.board.BoardPagingDTO;
import com.java.kosta.dto.board.CategoryDTO;
import com.java.kosta.dto.mypage.EvalDTO;
import com.java.kosta.service.board.BoardService;
import com.java.kosta.service.user.BestUserService;

/** 
 * 파워딜러들에 대한 평점과 후기들을 보여주는 섹션
 *  by. 이윤지
 *  
 */
@Controller
@RequestMapping("/bestUser/*")
public class BestUserController {
	
	@Inject
	BestUserService buService;
	
	@Inject
	BoardService bService;
	
	/** 회원 평점 및 등급 리스트 */
	@RequestMapping("/bestUserSection")
	public String bestUser(EvalDTO evalDTO, Model model){
		
		// 상위 10명의 파워딜러 평점 가져옴
		List<EvalDTO> evalList = buService.avgScore();
		
		for(EvalDTO dto : evalList){
			String avg = dto.getAvg();
			String avgRound = ""+Math.round( Float.parseFloat(avg) * 100) / 100.0;
			dto.setAvg(avgRound);
			
			// 각 유저의 후기 총 갯수 가져옴
			int totReviewCnt = buService.selectReviewTotCount(dto.getUserId());
			dto.setTotReviewCnt(totReviewCnt);
		}
		
		model.addAttribute("evalList", evalList);
		
		return "/menu/bestUser/bestUserSection";
	}
	
	/** 상위 10명을 제외한 나머지 판매자들의 리스트 페이징 처리해서 가져오는 AJAX */
	@RequestMapping("/lowerUserList")
	@ResponseBody
	public Map<String, Object> lowerUserList(BoardPagingDTO pagingDTO){
		Map<String, Object> resMap = new HashMap<String, Object> ();
		
		// 하위 판매자들의 총 갯수
		int lowerUserCnt = buService.lowerUserTotCount(pagingDTO);
		pagingDTO.calcPage(lowerUserCnt);
		
		// 하위 판매자들의 리스트 가져오기
		List<EvalDTO> lowerUserList = buService.lowerAvgScore(pagingDTO);
		
		for(EvalDTO dto : lowerUserList){
			String avg = dto.getAvg();
			String avgRound = ""+Math.round( Float.parseFloat(avg) * 100) / 100.0;
			dto.setAvg(avgRound);
			
			// 각 유저의 후기 총 갯수 가져옴
			int totReviewCnt = buService.selectReviewTotCount(dto.getUserId());
			dto.setTotReviewCnt(totReviewCnt);
		}
		
		resMap.put(Constants.RESULT, Constants.RESULT_OK);
		resMap.put("lowerUserCnt", lowerUserCnt);
		resMap.put("lowerUserList", lowerUserList);		// 페이징 처리된 리뷰 리스트 넘겨주기
		resMap.put("pagingDTO", pagingDTO);
		
		return resMap;
	}
	
	
	/** 해당 판매자의 후기 페이지 읽기 */
	@RequestMapping("/userReview")
	public String userReview(EvalDTO evalDTO, Model model){
		
		//해당 유저의 각 별점의 수를 세서 리스트로 반환
		List<EvalDTO> scoreList = buService.countScore(evalDTO);
		// 별점이 없는 숫자이면 count를 0으로 셋팅해서 넣어줌
		for(int i=0; i<scoreList.size() ; i++){
			if(!scoreList.get(i).getPscore().equals(5-i+"")){	//54321
				EvalDTO dto = new EvalDTO();
				dto.setPscore(5-i+"");
				dto.setCount(0+"");
				scoreList.add(i, dto);
			}
		}
		if(scoreList.size() < 5){
			for (int i = 5-scoreList.size(); i >=1 ; i--) {
				EvalDTO dto = new EvalDTO();
				dto.setPscore(i+"");
				dto.setCount(0+"");
				scoreList.add(dto);
			}
		}
		
		model.addAttribute("userId", evalDTO.getUserId());	//유저 아이디 넘겨주기
		model.addAttribute("avgVal", evalDTO.getAvg());	//유저 평점 넘겨주기
		model.addAttribute("scoreList", scoreList);	// 각 별점 갯수 넘겨주기
				
		return "/menu/bestUser/userReview";
	}
	
	/** 판매자의 후기 AJAX*/
	@RequestMapping("/showReview")
	@ResponseBody
	public Map<String, Object> showReview(BoardPagingDTO pagingDTO){
	
		Map<String, Object> resMap = new HashMap<String, Object> ();
		
		// 리뷰 총 갯수
		int reviewCnt = buService.selectReviewTotCount(pagingDTO.getUserId());
		
		// 해당 유저의 리뷰 가져오기
		List<EvalDTO> reviewList = buService.selectReview(pagingDTO);
		
		try {
			// 카테고리 이름 매칭해주기
			for (EvalDTO dto : reviewList) {
				CategoryDTO cDTO = bService.selectCategory(dto.getCateId());
				dto.setCateName(cDTO.getCateName());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		resMap.put(Constants.RESULT, Constants.RESULT_OK);
		resMap.put("reviewCnt", reviewCnt);
		resMap.put("reviewList", reviewList);		// 페이징 처리된 리뷰 리스트 넘겨주기
		resMap.put("pagingDTO", pagingDTO);
		
		return resMap;
	}
	
}
