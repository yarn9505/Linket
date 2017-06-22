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

	// 안드로이드 토큰값 저장
	public void inputToken(String token, String userId);

	// 토큰값이 저장 되어있나 없나 확인
	public String checkToken(String userId);
}
