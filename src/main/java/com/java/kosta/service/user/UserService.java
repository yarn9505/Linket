package com.java.kosta.service.user;

import java.sql.Date;
import java.util.List;

import com.java.kosta.dto.user.UserVO;

public interface UserService {
	// 로그인
	public UserVO login(UserVO vo);

	// 아이디 중복체크
	public int idCheck(String userId);

	// 구글 아이디 체크
	public UserVO googlecheckDuplicateId(String uniqId);

	// 일반 유저 회원가입
	public void insertUser(UserVO vo);

	// 구글 회원 유저가입
	public void googleinsertUser(UserVO vo);

	// 확인을 위한 회원 패스워드 가져오기
	public UserVO getPwd(UserVO vo);

	// 비밀번호 암호화해서 가져오기
	public String encapsulation(String userPw);

	public void updateInfo(UserVO vo);

	// 아이디 찾기
	public List<UserVO> selectId(UserVO vo);

	// 패스워드 찾기
	public UserVO selectPw(UserVO vo);

	// 패스워드 업데이트
	public void pwupdate(UserVO vo);

	// 안드로이드 토큰값 저장
	public void inputToken(String token, String userId);

	// 토큰값이 저장 되어있나 없나 확인
	public String checkToken(String userId);
}
