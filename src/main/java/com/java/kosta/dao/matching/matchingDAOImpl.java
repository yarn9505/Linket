package com.java.kosta.dao.matching;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.java.kosta.dto.board.BoardDTO;
import com.java.kosta.dto.matching.matchingCntDTO;
import com.java.kosta.dto.matching.matchingDTO;
import com.java.kosta.dto.mypage.EvalDTO;
import com.java.kosta.dto.timeline.TimelineDTO;
import com.java.kosta.dto.user.UserVO;

@Repository
public class matchingDAOImpl implements matchingDAO{

   @Inject
   private SqlSession session;
   final static String NAMESPACE = "matchingMapper";
   Logger logger = LoggerFactory.getLogger(matchingDAOImpl.class);
   
   // 사용자가 설정한 키워드를 포함하는 게시글 목록 가져오기
   public List<matchingDTO> keywordList(UserVO vo, String productKeywords){
      HashMap<String,Object> map = new HashMap<String,Object>();
      map.put("UserVO", vo);
      map.put("productKeywords", productKeywords);
      return session.selectList(NAMESPACE+".keywordListSel", map);
   } // end of keywordList()

   @Override
   public int testCount() {
      return session.selectOne(NAMESPACE+".countSel");
   }

   @Override
   public void insertMatchingT(UserVO vo, matchingDTO dto) {
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("vo", vo);
      map.put("dto", dto);
      session.selectOne(NAMESPACE+".insertMatchingT", map);
   }

   @Override
   public UserVO getAddr(UserVO vo) {
      return session.selectOne(NAMESPACE+".getAddr", vo);
   }

   @Override
   public List<matchingCntDTO> listMyMatch(UserVO vo) {
      return session.selectList(NAMESPACE+".listMyMatch",vo);
   }

   @Override
   public List<matchingDTO> listMatchContent(UserVO vo, String bno, String condi) {
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("vo", vo);
      map.put("bno", bno);
      map.put("condi",condi);
      return session.selectList(NAMESPACE+".listMatchContent", map);
   }

   @Override
   public int avgWantedValue(UserVO vo, String bno) {
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("vo", vo);
      map.put("bno", bno);
      return session.selectOne(NAMESPACE+".avgWantedValue", map);
   }

   @Override
   public matchingDTO calcCompare(UserVO vo, String mno) {
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("vo", vo);
      map.put("mno", mno);
      return session.selectOne(NAMESPACE+".calcCompare", map);
   }

   @Override
   public TimelineDTO showMyBoard(UserVO vo, String mno) {
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("vo", vo);
      map.put("mno", mno);
      return session.selectOne(NAMESPACE+".showMyBoard", map);
   }
   
   @Override
	public void updateAllowVal(String mno, String bno, String sellerId,String swit) {
		HashMap<String, Object> map= new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("bno", bno);
		map.put("sellerId", sellerId);
		map.put("swit", swit);
		session.selectOne(NAMESPACE + ".updateAllowVal", map);
	}

	@Override
	public List<matchingDTO> selectMyBno(String userId){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		return session.selectList(NAMESPACE + ".selectMyBno", map);
	}


	@Override
	public UserVO WhoAmI(String userId) {
		return session.selectOne(NAMESPACE + ".WhoAmI", userId);
	}

	@Override
	public BoardDTO infoForUpdate(String mno) {
		return session.selectOne(NAMESPACE + ".infoForUpdate", mno);
	}

	@Override
	public void insertTranPost(String mno, UserVO vo) {
		HashMap<String , Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("vo", vo);
		session.selectOne(NAMESPACE + ".insertTranPost", map);
	}

	@Override
	public matchingDTO selectEval(String mno) {
		return session.selectOne(NAMESPACE + ".selectEval", mno);
	}
   
}// end of dao