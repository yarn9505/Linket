package com.java.kosta.service.matching;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.java.kosta.dao.matching.matchingDAOImpl;
import com.java.kosta.dto.board.BoardDTO;
import com.java.kosta.dto.matching.matchingCntDTO;
import com.java.kosta.dto.matching.matchingDTO;
import com.java.kosta.dto.mypage.EvalDTO;
import com.java.kosta.dto.timeline.TimelineDTO;
import com.java.kosta.dto.user.UserVO;

@Service
public class MatchingServiceImpl implements MatchingService {

	@Inject
	matchingDAOImpl dao;

	// 사용자가 설정한 키워드를 포함하는 게시글 목록 가져오기 + 넣기
	@Override
	public List<matchingDTO> requestList(UserVO vo, String productKeywords) {

		return dao.keywordList(vo, productKeywords);
	} // end of requestList()

	@Override
	public int testCount() {
		return dao.testCount();
	}

	@Override
	public void insertMatchingT(UserVO vo, matchingDTO dto) {
		dao.insertMatchingT(vo, dto);
	}

	@Override
	public UserVO getAddr(UserVO vo) {
		return dao.getAddr(vo);
	}

	@Override
	public List<matchingCntDTO> listMyMatch(UserVO vo) {
		return dao.listMyMatch(vo);
	}

	@Override
	public List<matchingDTO> listMatchContent(UserVO vo, String bno, String condi) {
		return dao.listMatchContent(vo, bno, condi);
	}

	@Override
	public int avgWantedValue(UserVO vo, String bno) {
		return dao.avgWantedValue(vo, bno);
	}

	@Override
	public matchingDTO calcCompare(UserVO vo, String mno) {
		return dao.calcCompare(vo, mno);
	}

	@Override
	public TimelineDTO showMyBoard(UserVO vo, String mno) {
		return dao.showMyBoard(vo, mno);
	}

	@Override
	public void updateAllowVal(String mno, String bno, String sellerId, String swit) {
		dao.updateAllowVal(mno, bno, sellerId, swit);
	}

	@Override
	public List<matchingDTO> selectMyBno(String userId) {
		return dao.selectMyBno(userId);
	}

	@Override
	public UserVO WhoAmI(String userId) {
		return dao.WhoAmI(userId);
	}

	@Override
	public BoardDTO infoForUpdate(String mno) {
		return dao.infoForUpdate(mno);
	}

	@Override
	public void insertTranPost(String mno, UserVO vo) {
		dao.insertTranPost(mno, vo);
	}

	@Override
	public matchingDTO selectEval(String mno) {
		return dao.selectEval(mno);
	}

} // end of service