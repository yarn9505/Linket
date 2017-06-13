package com.java.kosta.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.java.kosta.dto.user.UserVO;
import com.java.kosta.service.user.UserService;

public class AuthInterceptor extends HandlerInterceptorAdapter{

	/**
	 * @Author : 황영롱
	 * @description : 로그인 인증관련 인터셉터 처리
	 */
	  @Inject
	  UserService service;
	     
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
		
		// 세션을 얻어옴
		HttpSession session = request.getSession();
		
		// 로그인이 안되어 있는 경우
		if ( session.getAttribute("loginSession") == null ){
			logger.info("로그인되어 있지 않은 경우");
			
			 Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			 logger.info("로그인 쿠기"+loginCookie);
	            if ( loginCookie != null ){ // 쿠키가 존재하는 경우(이전에 로그인때 생성된 쿠키가 존재한다는 것)
	                // loginCookie의 값을 꺼내오고 -> 즉, 저장해논 세션Id를 꺼내오고
	                String sessionId = loginCookie.getValue();
	                // 세션Id를 checkUserWithSessionKey에 전달해 이전에 로그인한적이 있는지 체크하는 메서드를 거쳐서
	                // 유효시간이 > now() 인 즉 아직 유효시간이 지나지 않으면서 해당 sessionId 정보를 가지고 있는 사용자 정보를 반환한다.
	                UserVO userVO = service.checkUserWithSessionKey(sessionId);
	                logger.info("userVO:"+userVO.getUserId());
	                if ( userVO != null ){ // 그런 사용자가 있다면
	                    // 세션을 생성시켜 준다.
	                    session.setAttribute("loginSession", userVO);
	                    
	                    return true;
	                }
	            }
			
			// 사용자가 로그인이 안된상태로 요청시 로그인페이지로 가도록 되어 있는데
			// 로그인이 성공한 뒤에 자동으로 이동할 수 있도록 이동 경로를 미리 세션에 기억시켜놓기 위함
			// 사용자가 요청한 uri를 가져옴
			String uri = request.getRequestURI();
			// 쿼리문자열을 가져옴
			String query = request.getQueryString();
			
			if ( query == null || query.equals("null") ){
				// 쿼리문자열 부분이 없으면 그냥 빈 문자열을 넣어주고...
				query = "";
			}else {
				// 쿼리문자열이 있었던 경우는 uri와 함께 합쳐놓기 위해 ?를 추가해준다.
				query = "?" + query;
			}
			
			if ( request.getMethod().equalsIgnoreCase("GET") ){
				logger.info("기억한 uri+query : " + (uri + query) );
				// loginInterceptor에서 로그인 성공시 이동할 주소를 세션에 저장시켜 놓음.
				session.setAttribute("destination", uri+query);
			}
			
			
			// 로그인할 수 있는 페이지로 다시 보냄
			response.sendRedirect("/");
			// 로그인이 안되어 있는 경우 원래 요청했던 페이지로 이동하는 컨트롤러 로직을 탈 수 없도록 false를 리턴해줌
			return false;
		}
		
		// 로그인이 되어 있는 경우는 본래 요청했던 요청을 처리할 수 있도록 함
		return true;
	}

}
