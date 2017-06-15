package com.java.kosta.service.user;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.java.kosta.dao.user.UserDAOImpl;
import com.java.kosta.dto.user.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	UserDAOImpl dao;

	// 로그인
	@Override
	public UserVO login(UserVO vo) {
		return dao.login(vo);
	}

	// 아이디 중복체크
	@Override
	public int idCheck(String userId) {
		return dao.idCheck(userId);
	}

	// 구글아이디 체크
	@Override
	public UserVO googlecheckDuplicateId(String uniqId) {
		return dao.googlecheckDuplicateId(uniqId);
	}

	// 일반 회원가입
	@Override
	public void insertUser(UserVO vo) {
		dao.insertUser(vo);
	}

	// 구글 회원가입
	@Override
	public void googleinsertUser(UserVO vo) {
		dao.googleinsertUser(vo);
	}

	// 패스워드 얻어오기
	@Override
	public UserVO getPwd(UserVO vo) {
		return dao.getPwd(vo);
	}

	// 회원정보 업데이트
	@Override
	public void updateInfo(UserVO vo) {
		dao.updateInfo(vo);
	}

	// 패스워드 인캡슐화
	@Override
	public String encapsulation(String userPw) {
		return dao.encapsulation(userPw);
	}

	// 아이디 찾기
	@Override
	public List<UserVO> selectId(UserVO vo) {
		return dao.selectId(vo);
	}

	// 패스워드 찾기
	@Override
	public UserVO selectPw(UserVO vo) {
		return dao.selectPw(vo);
	}

	// 패스워드 업데이트
	@Override
	public void pwupdate(UserVO vo) {
		dao.pwupdate(vo);
	}

	// 안드로이드 토큰값 저장
	@Override
	public void inputToken(String token, String userId) {
		dao.inputToken(token, userId);
	}

	// 토큰값이 저장 되어있나 없나 확인
	@Override
	public String checkToken(String userId) {
		return dao.checkToken(userId);
	}

}
