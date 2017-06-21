package com.java.kosta.service.timeline;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.java.kosta.dao.timeline.TimelineDAO;
import com.java.kosta.dto.note.PagingDTO;
import com.java.kosta.dto.timeline.FilterDTO;
import com.java.kosta.dto.timeline.TimelineDTO;
import com.java.kosta.dto.user.UserVO;

@Service
public class TimelineServiceImpl implements TimelineService {

	@Inject
	TimelineDAO dao;

	@Override
	public List<TimelineDTO> listMatch(UserVO vo, PagingDTO pageMaker, String keywords) {
		return dao.listMatch(vo, pageMaker, keywords);
	}

	@Override
	public int countTimeline(UserVO vo, String keywords) {
		return dao.countTimeline(vo, keywords);
	}

	@Override
	public int listAll() {
		return dao.listAll();
	}

	@Override
	public int countFilterList(FilterDTO filter) {
		return dao.countFilterList(filter);
	}

	@Override
	public List<TimelineDTO> listFilter(FilterDTO filter, PagingDTO pageMaker) {
		return dao.listFilter(filter, pageMaker);
	}

	@Override
	public int maxValue() {
		return dao.maxValue();
	}
	
	@Override
	public int searchFavorite(String bno, String userId) {
		// TODO Auto-generated method stub
		return dao.searchFavorite(bno, userId);
	}

	@Override
	public void updateFavorite(String bno, String userId) {
		dao.updateFavorite(bno, userId);
	}

	@Override
	public void deleteFavorite(String bno, String userId) {
		dao.deleteFavorite(bno, userId);
	}

	@Override
	public List<TimelineDTO> allBoardList(PagingDTO page, String keywords) {

		return dao.allBoardList(page, keywords);
	}

	@Override
	public int allBoardListCnt(String keywords) {
		return dao.allBoardListCnt(keywords);
	}

}