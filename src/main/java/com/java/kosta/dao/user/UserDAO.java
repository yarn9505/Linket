package com.java.kosta.dao.user;

import java.sql.Date;
import java.util.List;

import com.java.kosta.dto.user.UserVO;

public interface UserDAO {
	// 로그인
	public UserVO login(UserVO vo);

	// 아이디 중복체크
	public int idCheck(String userId);

	// 구글 회원가입시 중복 체크
	public UserVO googlecheckDuplicateId(String uniqId);

	// 일반유저 insert
	public void insertUser(UserVO vo);

	// 구글유저 insert
	public void googleinsertUser(UserVO vo);

	// 확인용 회원 패스워드 얻어오기
	public UserVO getPwd(UserVO vo);

	// 비밀번호 암호화
	public String encapsulation(String userPw);

	// 회원 정보 수정
	public void updateInfo(UserVO vo);

	// 회원 아이디 찾기
	public List<UserVO> selectId(UserVO vo);

	// 패스워드 있는지 찾기
	public UserVO selectPw(UserVO vo);

	// 패스워드 재설정
	public void pwupdate(UserVO vo);

	// 자동로그인 체크한 경우에 사용자 테이블에 세션과 유효시간을 저장하기 위한 메서드
	public void keepLogin(String uid, String sessionId, Date next);

	// 이전에 로그인한 적이 있는지, 즉 유효시간이 넘지 않은 세션을 가지고 있는지 체크한다.
	public UserVO checkUserWithSessionKey(String sessionId);

	// 안드로이드 토큰값 저장
	public void inputToken(String token, String userId);

	// 토큰값이 저장 되어있나 없나 확인
	public String checkToken(String userId);
}
