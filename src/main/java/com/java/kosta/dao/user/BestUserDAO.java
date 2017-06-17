package com.java.kosta.dao.user;

import java.util.List;

import com.java.kosta.dto.board.BoardPagingDTO;
import com.java.kosta.dto.mypage.EvalDTO;

public interface BestUserDAO {
	
	/** 상위 10명의 파워딜러들의 평점 가져오기 */
	public List<EvalDTO> avgScore();
	
	/** 파워딜러 제외한 판매자들 리스트 페이징해서 가져오기 */
	public List<EvalDTO> lowerAvgScore(BoardPagingDTO pagingDTO);
	
	/** 하위 판매자들의 총 갯수 가져오기 */
	public int lowerUserTotCount(BoardPagingDTO pagingDTO);
	
	/** 리뷰에 대한 전체 갯수 가져오기 */
	public int selectReviewTotCount(String userId);
	
	/** 해당 유저의 리뷰 리스트 */
	public List<EvalDTO> selectReview(BoardPagingDTO pagingDTO);
	
	/** 해당 유저의 각 별점의 수를 세서 리스트로 반환 */
	public List<EvalDTO> countScore(EvalDTO evalDTO);
	
}
