package com.java.kosta.service.user;

import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.java.kosta.dao.user.BestUserDAO;
import com.java.kosta.dto.board.BoardPagingDTO;
import com.java.kosta.dto.mypage.EvalDTO;

@Service
public class BestUserServiceImpl implements BestUserService {

	@Inject
	BestUserDAO buDAO;

	@Override
	public List<EvalDTO> avgScore() {
		return buDAO.avgScore();
	}

	@Override
	public List<EvalDTO> selectReview(BoardPagingDTO pagingDTO) {
		return buDAO.selectReview(pagingDTO);
	}

	@Override
	public List<EvalDTO> countScore(EvalDTO evalDTO) {
		return buDAO.countScore(evalDTO);
	}

	@Override
	public int selectReviewTotCount(String userId) {
		return buDAO.selectReviewTotCount(userId);
	}

	@Override
	public List<EvalDTO> lowerAvgScore(BoardPagingDTO pagingDTO) {
		return buDAO.lowerAvgScore(pagingDTO);
	}

	@Override
	public int lowerUserTotCount(BoardPagingDTO pagingDTO) {
		return buDAO.lowerUserTotCount(pagingDTO);
	}
}
