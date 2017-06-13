package com.java.kosta.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.java.kosta.dto.user.UserVO;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	/*
	 * @Author : 황영롱
	 * @description : 로그인 인터셉터 처리
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// session 얻기
		HttpSession session = request.getSession();
		
		// 로그인 처리 전에 기존 세션에 저장되어 있던 로그인 정보를 제거해줌.
		if ( session.getAttribute("loginSession") != null ){
			logger.info("이전 로그인 세션 제거");
			session.removeAttribute("loginSession");
		}
		// 인터셉터를 거쳐 컨트롤러로 보내야함으로 true 리턴
		return true;
	} // end of preHandle()

}
