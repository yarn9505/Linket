package com.java.kosta.controller.board.category;

import javax.inject.Inject;

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
import com.java.kosta.dto.user.UserVO;
import com.java.kosta.service.board.BoardServiceImpl;

@Controller
@RequestMapping("/category/*")
public class BoardFavoirteController {
	Logger logger = LoggerFactory.getLogger(BoardFavoirteController.class);

	@Inject
	BoardServiceImpl service;

	// 좋아요했는지 체크
	@RequestMapping(value = "/checkFavorite")
	@ResponseBody
	public String checkFavorite(@RequestParam(value = "bno") String bNo,
			@RequestParam(value = "userId") String userId,Model model) {
		logger.info("들어오는지 확인" + bNo + userId);

		int fcnt = service.searchFavorite(userId, bNo);
		int count = service.countFavorite(bNo);
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
		logger.info("handlingFavorite" + bNo + userId);

		/*// 로그인 안되어있으면 좋아요 할 수 없음.
		if (userId == null) {
			return "notLogin";
		}*/

		int fcnt = service.searchFavorite(userId, bNo);

		if (fcnt != 0) {// 좋아요 취소
			try {
				System.out.println(fcnt);
				service.unfavoriteBoard(userId, bNo);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (fcnt == 0) {
			try {
				System.out.println(fcnt);
				service.favoriteBoard(userId, bNo);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} // end of if-else
		return "안뇽";
	}
	//좋아요 개수를 조회
	@RequestMapping(value="/countFavorite")
	@ResponseBody
	public int countFavorite(@RequestParam(value="bno")String bNo){
		int likeCount = service.countFavorite(bNo);
		return likeCount;
	}

}// end of main