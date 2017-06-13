package com.java.kosta.controller.api;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.Connection;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.java.kosta.common.Constants;
import com.java.kosta.dto.user.UserVO;
import com.java.kosta.service.user.UserServiceImpl;

@Controller
public class GoogleApi {
	//구글 연동할려고
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;
	
	@Inject
	UserServiceImpl service;
	
	Logger logger = LoggerFactory.getLogger(GoogleApi.class);//로그
	
	UserVO uniqId;//유니크 아이디 구글 로그인할때 회원가입으로 화면으로 가게 만듬

	@RequestMapping("/api/google")
	public String google() {//승인을 받고
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		System.out.println("URL:"+url);
		return "redirect:"+url;//승인된 곳으로 redirect해서 콜백을 받음
	}
	
	//코드값으로 정보가 넘어오는대 그 코드를 통해서 사용자의 정보를 얻어올수 있다.
	@RequestMapping(value="/callback" ,method = RequestMethod.GET)//승인된 리디렉션 콜백 받는곳 
	public String oauth(String code,HttpSession session,UserVO UserVo,RedirectAttributes redirectAttr){
		
		logger.info("확인 : " + code);
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations(); 
		AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, googleOAuth2Parameters.getRedirectUri(), null);
		String accessToken = accessGrant.getAccessToken(); 
		Long expireTime = accessGrant.getExpireTime(); 
		
		if (expireTime != null && expireTime < System.currentTimeMillis()) { 
		accessToken = accessGrant.getRefreshToken(); 
		logger.info("accessToken is expired. refresh token = {}" , accessToken); 
		}
		
		Connection<Google>connection = googleConnectionFactory.createConnection(accessGrant); 
		Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi(); 
		PlusOperations plusOperations = google.plusOperations();
		Person person = plusOperations.getGoogleProfile();

		uniqId = service.googlecheckDuplicateId(person.getId());
		
		logger.info("아이디:"+uniqId+"");
		
		if(uniqId==null){//유니크 아이디가 없다면 db에 값을 넣어주고 회원가입 화면으로감
/*			UserVo.setUniqid(person.getId());
			UserVo.setEmail(person.getAccountEmail());
			UserVo.setUserName(person.getDisplayName());*/
			
			String emailsplit=person.getAccountEmail();
			String [] idsplit=emailsplit.split("@");
			String id=idsplit[0];
			
//			UserVo.setUserId(id);
//			redirectAttributes.addAttribute("UserVO",UserVo);
//			model.addAttribute("UserVO",UserVo);
			
//			modelAndView.addObject("UserVO",UserVo);
//			modelAndView.setViewName("/user/subForm");
			
			//redirect 로 해서 넘어가야지 뷰단이  제대로 뜸
			//forwading시 이상하게 나옴 
			//map을 이용해서 값을 넣어주고 
			//뷰단에서 값을 꺼낼때는 ${UserVO.userId} 꺼내는 식
			
			
			
			Map map = new HashMap();
//			logger.info("유니크값은:"+uniqId+"");
//			logger.info("아이디값은:"+person.getId()+"");
			String uniqid=person.getId()+"";
			UserVO userVO=new UserVO();
			userVO.setUniqId(uniqid);
			userVO.setUserId(id);
			userVO.setUserName(person.getDisplayName());
			userVO.setUserEmail(person.getAccountEmail());
			
			map.put("userId",id);//유저 아이디
			map.put("uniqId",person.getId());//유니크 아이디
			map.put("userName",person.getDisplayName());
			map.put("email",person.getAccountEmail());
			
			redirectAttr.addFlashAttribute("UserVO",map);
//			return "redirect:/aboutSection";
			return "redirect:/user/subscribeJoin";
			
//			return modelAndView;
		}
		
		else{//유니크 아이디가 있다면 인증하는 컨트롤러로 가게함
			return "redirect:/Verification";//검증하는 쪽으로감
		}
		
	}
	
	@RequestMapping("/Verification")
	public String Verification(HttpSession session,UserVO userVO){
		
		String id=uniqId.getUserId();
		String address1=uniqId.getAddr1();
		String address2=uniqId.getAddr2();
		String email=uniqId.getUserEmail();
		String hp=uniqId.getUserHp();
		String name=uniqId.getUserName();
		String pw=uniqId.getUserPw();
		String uniq=uniqId.getUniqId();
		String cateId1=uniqId.getCateId1();
		String cateId2=uniqId.getCateId2();
		String cateId3=uniqId.getCateId3();
		String cateId4=uniqId.getCateId4();
		String cateId5=uniqId.getCateId5();
		String cateId6=uniqId.getCateId6();
		String lat=uniqId.getLat();
		String lon=uniqId.getLon();
		String sessionkey=uniqId.getSessionKey();
		Date date=uniqId.getSessionLimit();
		
		
		logger.info(uniqId.toString());
		
		userVO.setUserId(id);
		userVO.setAddr1(address1);
		userVO.setAddr2(address2);
		userVO.setUserEmail(email);
		userVO.setUserHp(hp);
		userVO.setUserName(name);
		userVO.setUserPw(pw);
		userVO.setUniqId(uniq);
		userVO.setCateId1(cateId1);
		userVO.setCateId2(cateId2);
		userVO.setCateId3(cateId3);
		userVO.setCateId4(cateId4);
		userVO.setCateId5(cateId5);
		userVO.setCateId6(cateId6);
		userVO.setLat(lat);
		userVO.setLon(lon);
		userVO.setSessionKey(sessionkey);
		userVO.setSessionLimit(date);
		
		session.setAttribute(Constants.LOGINSESSION,userVO);
		
		return "redirect:/";
	}
	

}
