package com.java.kosta.service.matching;

import java.util.List;

import com.java.kosta.dto.board.BoardDTO;
import com.java.kosta.dto.matching.matchingCntDTO;
import com.java.kosta.dto.matching.matchingDTO;
import com.java.kosta.dto.mypage.EvalDTO;
import com.java.kosta.dto.timeline.TimelineDTO;
import com.java.kosta.dto.user.UserVO;

//사용자가 설정한 키워드를 포함하는 게시글 목록 가져오기
public interface MatchingService {

	public List<matchingDTO> requestList(UserVO vo, String productKeywords);

	public int testCount();

	public void insertMatchingT(UserVO vo, matchingDTO dto);

	public UserVO getAddr(UserVO vo);

	public List<matchingCntDTO> listMyMatch(UserVO vo);

	public List<matchingDTO> listMatchContent(UserVO vo, String bno, String condi);

	public int avgWantedValue(UserVO vo, String bno);

	public matchingDTO calcCompare(UserVO vo, String mno);

	public TimelineDTO showMyBoard(UserVO vo, String mno);

	public BoardDTO infoForUpdate(String mno);

	public void updateAllowVal(String mno, String bno, String sellerId, String swit);

	public List<matchingDTO> selectMyBno(String userId);

	public UserVO WhoAmI(String userId);

	// 후기에 정보 넣어주기
	public void insertTranPost(String mno, UserVO vo);
	
	public matchingDTO selectEval(String mno);

}