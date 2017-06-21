package com.java.kosta.dao.timeline;

import java.util.HashMap;
import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.java.kosta.dto.note.PagingDTO;
import com.java.kosta.dto.timeline.FilterDTO;
import com.java.kosta.dto.timeline.TimelineDTO;
import com.java.kosta.dto.user.UserVO;

@Repository
public class TimelineDAOImpl implements TimelineDAO {
   
   @Inject
   SqlSession sqlSession;

   Logger logger = LoggerFactory.getLogger(TimelineDAOImpl.class);
   
   @Override
   public List<TimelineDTO> listMatch(UserVO vo,PagingDTO pageMaker,String keywords) {
      HashMap<String,Object> map = new HashMap<String, Object>();
      map.put("UserVO", vo);
      map.put("pageMaker", pageMaker);
      map.put("keywords", keywords);
      return sqlSession.selectList("timelineMapper.listMatch", map);
   }

   @Override
   public int listAll() {
      return sqlSession.selectOne("timelineMapper.listAll");
   }

   @Override
   public int countTimeline(UserVO vo,String keywords) {
      HashMap<String,Object> map = new HashMap<String, Object>();
      map.put("UserVO", vo);
      map.put("keywords", keywords);
      return sqlSession.selectOne("timelineMapper.countTimeline", map);
   }
   
   @Override
   public int countFilterList(FilterDTO filter) {
      return sqlSession.selectOne("timelineMapper.countFilterList", filter);
   }

   @Override
   public List<TimelineDTO> listFilter(FilterDTO filter, PagingDTO pageMaker) {
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("FilterDTO", filter);
      map.put("pageMaker", pageMaker);
      return sqlSession.selectList("timelineMapper.listFilter", map);
   }

   @Override
   public int maxValue() {
      return sqlSession.selectOne("timelineMapper.maxValue");
   }
   
	@Override
	public int searchFavorite(String bno, String userId) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("bno", bno);
		map.put("userId", userId);
		return sqlSession.selectOne("timelineMapper.searchFavorite",map);
	}
   
   @Override
	public void updateFavorite(String bno, String userId) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("bno", bno);
		map.put("userId", userId);
		sqlSession.selectOne("timelineMapper.updateFavorite",map);
	}

	@Override
	public void deleteFavorite(String bno, String userId) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("bno", bno);
		map.put("userId", userId);
		sqlSession.selectOne("timelineMapper.deleteFavorite",map);
	}

	@Override
	public List<TimelineDTO> allBoardList(PagingDTO page, String keywords) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("page", page);
		map.put("keywords", keywords);
		return sqlSession.selectList("timelineMapper.allBoardList", map);
	}

	@Override
	public int allBoardListCnt(String keywords) {
		return sqlSession.selectOne("timelineMapper.allBoardListCnt",keywords);
	}


}