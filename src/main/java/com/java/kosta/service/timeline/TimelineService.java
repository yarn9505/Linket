package com.java.kosta.service.timeline;

import java.util.List;

import com.java.kosta.dto.note.PagingDTO;
import com.java.kosta.dto.timeline.FilterDTO;
import com.java.kosta.dto.timeline.TimelineDTO;
import com.java.kosta.dto.user.UserVO;

public interface TimelineService {

	// 관심사, 거리에 따른 타임라인 게시글 목록
	public List<TimelineDTO> listMatch(UserVO vo, PagingDTO pageMaker, String keywords);

	// 관심사가 일치하는 전체 게시글 수 출력
	public int countTimeline(UserVO vo, String keywords);

	// 테스트 용도
	public int listAll();

	// 필터 적용된 게시물을 페이징하기 위한 관심사에 따른 게시글 갯수 반환(혜연추가)
	public int countFilterList(FilterDTO filter);

	// 필터 적용에 따라서 게시글 반환(혜연추가)
	public List<TimelineDTO> listFilter(FilterDTO filter, PagingDTO pageMaker);

	public int maxValue();

	// 로그인한 아이디가 좋아요 한 게시물인지 아닌지 확인하기위해서
	public int searchFavorite(String bno, String userId);

	// 타임라인 좋아요 업데이트
	public void updateFavorite(String bno, String userId);

	// 타임라인 좋아요 취소
	public void deleteFavorite(String bno, String userId);

	// 전체 게시글 조회
	public List<TimelineDTO> allBoardList(PagingDTO page, String keywords);

	public int allBoardListCnt(String keywords);
}