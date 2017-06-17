package com.java.kosta.dao.user;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.java.kosta.dto.board.BoardPagingDTO;
import com.java.kosta.dto.mypage.EvalDTO;

@Repository
public class BestUserDAOImpl implements BestUserDAO {
	
	@Inject
	SqlSession sqlSession;
	
	private final static String NameSpace ="com.java.kosta.dao.user.BestUserDAO";
	
	@Override
	public List<EvalDTO> avgScore() {
		return sqlSession.selectList(NameSpace + ".avgScore");
	}

	@Override
	public List<EvalDTO> selectReview(BoardPagingDTO pagingDTO) {
		return sqlSession.selectList(NameSpace + ".selectReview", pagingDTO);
	}

	@Override
	public List<EvalDTO> countScore(EvalDTO evalDTO) {
		return sqlSession.selectList(NameSpace + ".countScore", evalDTO);
	}

	@Override
	public int selectReviewTotCount(String userId) {
		return sqlSession.selectOne(NameSpace+".selectReviewTotCount", userId);
	}

	@Override
	public List<EvalDTO> lowerAvgScore(BoardPagingDTO pagingDTO) {
		return sqlSession.selectList(NameSpace + ".lowerAvgScore", pagingDTO);
	}

	@Override
	public int lowerUserTotCount(BoardPagingDTO pagingDTO) {
		return sqlSession.selectOne(NameSpace + ".lowerUserTotCount", pagingDTO);
	}

}
