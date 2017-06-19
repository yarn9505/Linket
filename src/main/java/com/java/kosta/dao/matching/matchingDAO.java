package com.java.kosta.dao.matching;

import java.util.List;

import com.java.kosta.dto.board.BoardDTO;
import com.java.kosta.dto.matching.matchingCntDTO;
import com.java.kosta.dto.matching.matchingDTO;
import com.java.kosta.dto.mypage.EvalDTO;
import com.java.kosta.dto.timeline.TimelineDTO;
import com.java.kosta.dto.user.UserVO;

public interface matchingDAO {
   public List<matchingDTO> keywordList(UserVO vo, String productKeywords);
   
   public int testCount();
   
   //MatchingT 에 값을 요청메시지와 함께 값을 넣어줌
   public void insertMatchingT(UserVO vo, matchingDTO dto);
   
   // 로그인된 유저의 주소 가져오기
   public UserVO getAddr(UserVO vo);
   
   //내가 요청을 받은 게시글 리스트 확인
   public List<matchingCntDTO> listMyMatch(UserVO vo);
   
   //게시글의 요청내용을 확인하는 mapper
   public List<matchingDTO> listMatchContent(UserVO vo, String bno, String condi);
   
   //요청비용의 평균 요청가격을 구함
   public int avgWantedValue(UserVO vo, String bno);
   
   //나와 너 사이의 거리
   public matchingDTO calcCompare(UserVO vo, String mno);
   
   public TimelineDTO showMyBoard(UserVO vo, String mno);
   
   //업데이트에 필요한 내용 가지고 오기
   public BoardDTO infoForUpdate(String mno);
   
   //게시자가 요청글을 선택한 경우
   public void updateAllowVal(String mno, String bno, String sellerId, String swit);
   
   //isSwap = 'N' /allowVal ='Y' 인 게시글 중에서 내 아이디를 검색
   public List<matchingDTO> selectMyBno(String userId);
   
   //3) 내 정보를 가지고 오기
   public UserVO WhoAmI(String userId);
   
 //후기에 정보 넣어주기
   public void insertTranPost(String mno, UserVO vo);
   
   public EvalDTO selectEval(String mno);
   
   
   
}
