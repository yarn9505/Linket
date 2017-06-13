package com.java.kosta.dao.user;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.java.kosta.dto.user.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	@Inject
	SqlSession sqlSession;
	
	private final static String NAMESPACE = "UserMapper";

	// 로그인
	@Override
	public UserVO login(UserVO vo) {
		return sqlSession.selectOne(NAMESPACE + ".login", vo);
	}

	// 아이디 중복체크
	@Override
	public int idCheck(String userId) {
		return sqlSession.selectOne(NAMESPACE + ".idCheck", userId);
	}
	
	//구글 유니크 아이디 중복체크
	@Override
	public UserVO googlecheckDuplicateId(String uniqId) {
		return sqlSession.selectOne(NAMESPACE+".googlecheckDuplicateId", uniqId);//하나만 반환
	}

	//일반 유저 회원가입
	@Override
	public void insertUser(UserVO vo) {
		 sqlSession.insert(NAMESPACE+".insertUser",vo);
	}

	//구글 유저 회원가입
	@Override
	public void googleinsertUser(UserVO vo) {
		sqlSession.insert(NAMESPACE+".googleinsertUser",vo);
	}

	//패스워드 확인
	@Override
	public UserVO getPwd(UserVO vo) {
		return sqlSession.selectOne(NAMESPACE+".getPwd",vo);
	}

	@Override
	public void updateInfo(UserVO vo) {
		sqlSession.update(NAMESPACE+".updateInfo",vo);
	}

	@Override
	public String encapsulation(String userPw) {
		return sqlSession.selectOne(NAMESPACE+".encapsulation",userPw);
	}

	//유저 아이디를 찾기
	@Override
	public List<UserVO> selectId(UserVO vo) {
		return sqlSession.selectList(NAMESPACE+".selectId",vo);
	}

	@Override
	public UserVO selectPw(UserVO vo){
		return sqlSession.selectOne(NAMESPACE+".selectPw",vo);
	}

	@Override
	public void pwupdate(UserVO vo) {
		sqlSession.update(NAMESPACE+".pwupdate",vo);
	}

	@Override
	// 이전에 로그인한 적이 있는지, 즉 유효시간이 넘지 않은 세션을 가지고 있는지 체크한다.
	public UserVO checkUserWithSessionKey(String sessionId) {
		 // 유효시간이 남아있고(>now()) 전달받은 세션 id와 일치하는 사용자 정보를 꺼낸다.
		return sqlSession.selectOne(NAMESPACE+".checkUserWithSessionKey",sessionId);
	}

	
	
	@Override
	public void keepLogin(String uid, String sessionId, java.sql.Date next) {
		Map<String, Object> map = new HashMap<String,Object>();
        map.put("userId", uid);
        map.put("sessionId", sessionId);
        map.put("next", next);
        // Mapper.xml로 데이터를 전달할 때 한 객체밖에 전달 못함으로 map으로 묶어서 보내줌 단... 주의할 점은
        // Mapper.xml 안에서 #{} 이 안에 지정한 이름이랑 같아야함.. 자동으로 매핑될 수 있도록
        // 아래가 수행되면서, 사용자 테이블에 세션id와 유효시간이 저장됨
        sqlSession.update(NAMESPACE+".keepLogin",map);
	}
	
	@Override
	public void inputToken(String token,String userId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("token", token);
		sqlSession.update(NAMESPACE+".inputToken", map);
	}

	@Override
	public String checkToken(String userId) {
		return sqlSession.selectOne(NAMESPACE+".checkToken", userId);
	}
	
	
}
