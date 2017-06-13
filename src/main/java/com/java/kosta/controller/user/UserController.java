package com.java.kosta.controller.user;
import java.sql.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.java.kosta.common.Constants;
import com.java.kosta.dto.user.UserVO;
import com.java.kosta.service.user.UserServiceImpl;

@Controller
@RequestMapping("/user/*")
public class UserController {
	@Inject
	UserServiceImpl service;

	Logger logger=LoggerFactory.getLogger(UserController.class);

	/*
	 * @method Name : modifyInfo()
	 * @Author : 황영롱
	 * @description : 회원가입 수정 폼으로 이동
	 */
	@RequestMapping(value="/modifyInfo", method=RequestMethod.POST)
	public String modifyInfo(RedirectAttributes rttr,HttpSession session,@RequestParam("password") String password){
		logger.info("수정으로 넘어오는 비밀번호 : " + password);
		// 세션에서 현재 회원정보 가져오기
		UserVO vo = (UserVO) session.getAttribute("loginSession");
		logger.info("세션에 있는 아이디 : " + vo.getUserId());
		// 로그인되어 있는 회원의 패스워드 가져오기
		UserVO tempVO = new UserVO();
		tempVO.setUserId(vo.getUserId());
		tempVO.setUserPw(password);
		UserVO vo2 = service.getPwd(tempVO); // 암호화된 패스워드가 넘어옴

		if ( vo2 != null ){
			logger.info("입력한 암호가 맞는 경우");
			// 입력한 암호가 맞는 경우
			// 수정페이지로 이동
			return "user/modifyInfoForm";
		}else{
			logger.info("입력한 암호가 틀린 경우");
			// 입력한 암호가 잘못된 경우
			Map map = new HashMap();
			map.put("msg", "FAIL");
			rttr.addFlashAttribute("map",map);
			return "redirect:/";
		}
	}// end of modifyInfo()

	/*
	 * @method Name : modifyInfoProcess()
	 * @Author : 황영롱
	 * @description : 회원가입 수정 처리
	 */
	@RequestMapping(value="/modifyInfoProcess", method=RequestMethod.POST)
	public @ResponseBody HashMap<String,Object> modifyInfoProcess(UserVO vo){
		logger.info("넘어온 회원 정보 : " + vo);

		service.updateInfo(vo);
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put(Constants.RESULT, Constants.RESULT_OK);
		map.put(Constants.RESULT_MSG,"업데이트 되었습니다.");
		return map;
	}// end of modifyInfoProcess()



	/*
	 * @method Name : login
	 * @Author : 송아름
	 * @description : 로그인 화면
	 */
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login(){
		return "/user/login"; 
	}

	/*
	 * @method Name : loginProcAjax
	 * @Author : 송아름
	 * @description : 로그인 비동기 처리
	 */
	@RequestMapping(value="/loginProc", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> loginProcAjax(UserVO vo, HttpServletRequest req,HttpServletResponse response) 
	{
		logger.info("체크박스로 넘어온 값:"+vo.isUseCookie());
		
		if ( req.getSession().getAttribute(Constants.LOGINSESSION)!= null ){
            // 기존에 login이란 세션 값이 존재한다면
			req.getSession().removeAttribute(Constants.LOGINSESSION); // 기존값을 제거해 준다.
        }
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		//로그인 실패
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "아이디와 비밀번호를 확인하세요.");

		try {
			UserVO uservo = service.login(vo);

			if( uservo != null  && uservo.getUserId().equals(vo.getUserId())) {
				//로그인 성공 - 세션에 저장
				req.getSession().setAttribute(Constants.LOGINSESSION, uservo);
				resMap.put(Constants.RESULT, Constants.RESULT_OK);
				System.out.println( uservo.getUserId() +  "로그인 성공!!!!");

	            /*
	             *  [   세션 추가되는 부분      ]
	             */
	            // 1. 로그인이 성공하면, 그 다음으로 로그인 폼에서 쿠키가 체크된 상태로 로그인 요청이 왔는지를 확인한다.
	            if ( vo.isUseCookie() ){ // dto 클래스 안에 useCookie 항목에 폼에서 넘어온 쿠키사용 여부(true/false)가 들어있을 것임
	            	 int amount = 60 * 60 * 24 * 7;
	            	// 쿠키 사용한다는게 체크되어 있으면...
	                // 쿠키를 생성하고 현재 로그인되어 있을 때 생성되었던 세션의 id를 쿠키에 저장한다.
	                Cookie cookie = new Cookie("loginCookie", req.getSession().getId());
	                // 쿠키를 찾을 경로를 컨텍스트 경로로 변경해 주고...
	                cookie.setPath("/");
	                cookie.setMaxAge(amount); // 단위는 (초)임으로 7일정도로 유효시간을 설정해 준다.
	                // 쿠키를 적용해 준다.
	                response.addCookie(cookie);
	                
	                logger.info("유저쿠키:"+vo.isUseCookie());
	                
	             // currentTimeMills()가 1/1000초 단위임으로 1000곱해서 더해야함 
	                Date sessionLimit = new Date(System.currentTimeMillis() + (1000*amount));
	                // 현재 세션 id와 유효시간을 사용자 테이블에 저장한다.
	                service.keepLogin(uservo.getUserId(), req.getSession().getId(), sessionLimit);
	            }

				return resMap;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return resMap;
	}
	
	/*
	 * @method Name : loginToken
	 * @Author : 이한나
	 * @description : 안드로이드 토큰값 업데이트 
	 */
	
	@RequestMapping(value="/loginToken")
	@ResponseBody
	public Map<String, Object> loginToken (UserVO vo){
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		String userId = vo.getUserId();
		System.out.println("아이디 : "+userId);
		
		String token = vo.getToken();
		System.out.println("토큰 : "+token);
		
		
		//토큰값 디비에 업데이트(토큰값이 바뀔수도있어서 항상 업데이트해주기!)
		service.inputToken(token, userId);
		
		
		return resMap;
	}

	/*
	 * @method Name : subscribeMethod
	 * @Author : 송아름
	 * @description : 회원가입 화면
	 */
	@RequestMapping(value = "/subscribeJoin", method = RequestMethod.GET)
	public String subscribeMethod() {
		return "user/join";
	}
	

	/*
	 * @method Name : idCheck
	 * @Author : 송아름
	 * @description :  회원가입 시 아이디 중복체크
	 */
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> idCheck(@RequestParam(value = "userId") String userId) {

		Map<String, Object> res = new HashMap<String, Object>();
		res.put(Constants.RESULT, Constants.RESULT_OK);
		res.put(Constants.RESULT_MSG, "사용 가능한 아이디입니다.");

		int cnt = service.idCheck(userId);

		if (cnt > 0) {
			res.put(Constants.RESULT, Constants.RESULT_FAIL);
			res.put(Constants.RESULT_MSG, "이미 사용중인 아이디입니다.");
		}

		return res;
	}


	/**
	 * 회원가입 비동기처리 [회원가입처리부분]
	 * 김용래
	 */

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> joinProc(UserVO vo, HttpServletRequest req,RedirectAttributes redirectattri) {
		Map<String, Object> res = new HashMap<String, Object>();

		logger.info("회원가입시 저장된 위도경도값 : " + vo.getLat() + " : " + vo.getLon());

		int cnt = service.idCheck(vo.getUserId());
		String str=req.getParameter("idCheckboolean");
		logger.info("체크:"+str);

		//아이디 중복체크
		if (cnt > 0) {
			res.put(Constants.RESULT, Constants.RESULT_FAIL);
			res.put(Constants.RESULT_MSG, "이미 사용중인 아이디입니다.");
			return res;
		}
		//아이디 체크 버튼을 눌렀는지 안눌렀지 여부
		else if(str.equals("n")){
			res.put(Constants.RESULT, Constants.RESULT_FAIL);
			res.put(Constants.RESULT_MSG,"아이디 중복체크를 해주세요.");
			return res;
		}
		else if(vo.getUniqId().equals("")){//일반회원가입 고유아이디가 없을때
			try{
				service.insertUser(vo);
				res.put(Constants.RESULT, Constants.RESULT_OK);
				res.put(Constants.RESULT_MSG,"회원가입 되었습니다");
			}catch(Exception e){
				e.printStackTrace();
				res.put(Constants.RESULT, Constants.RESULT_FAIL);
				res.put(Constants.RESULT_MSG, "일반회원가입 실패");
				/*	res.put("userId",vo.getUserId());//유저 아이디
  				res.put("uniqId",vo.getUniqId());//유니크 아이디
  				res.put("userName",vo.getUserName());
  				res.put("email",vo.getUserEmail());
  				redirectattri.addFlashAttribute("UserVO",res);*/
			}
			return res;

		}
		else{//구글 회원가입

			try{
				service.googleinsertUser(vo);
				res.put(Constants.RESULT, Constants.RESULT_OK);
				res.put(Constants.RESULT_MSG,"회원가입 되었습니다");
			}catch(Exception e){
				e.printStackTrace();//에러코드 찍는거
				res.put(Constants.RESULT, Constants.RESULT_FAIL);
				res.put(Constants.RESULT_MSG, "구글회원 가입 실패");
			}

			return res;
		}
	}

	/*
	 * @method Name : Logout
	 * @Author : 김용래
	 * @description :  회원 로그아웃
	 */
	@RequestMapping("/Logout")
	public String Logout(HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		Object obj = session.getAttribute(Constants.LOGINSESSION);
		if ( obj != null ){
            UserVO vo = (UserVO)obj;
            // null이 아닐 경우 제거
            session.removeAttribute(Constants.LOGINSESSION);
            session.invalidate(); // 세션 전체를 날려버림
            //쿠키를 가져와보고
            Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
            if ( loginCookie != null ){
                // null이 아니면 존재하면!
                loginCookie.setPath("/");
                // 쿠키는 없앨 때 유효시간을 0으로 설정하는 것 !!! invalidate같은거 없음.
                loginCookie.setMaxAge(0);
                // 쿠키 설정을 적용한다.
                response.addCookie(loginCookie);
                // 사용자 테이블에서도 유효기간을 현재시간으로 다시 세팅해줘야함.
                Date date = new Date(System.currentTimeMillis());
                service.keepLogin(vo.getUserId(), session.getId(), date);
            }
        }
		return "redirect:/";
	}


	/*
	 * @method Name : Idselect
	 * @Author : 김용래
	 * @description :아이디찾는곳으로 뷰단
	 */
	@RequestMapping("/Idselect") //아이디를 찾는곳으로감
	public String Idselect(){
		return "user/selectId";
	}


	/*
	 * @method Name : Pwselect
	 * @Author : 김용래
	 * @description : 패스워드 찾는 뷰단
	 */
	@RequestMapping("/Pwselect") //패스워드를 찾는곳으로감
	public String Pwselect(){
		return "user/selectPw";
	}


	/*
	 * @method Name : selectId
	 * @Author : 김용래
	 * @description :아이디 찾기
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/selectId", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String,Object> selectId(UserVO userVO){

		HashMap<String,Object> res=new HashMap<String, Object>();
		try{
			
			logger.info("유저이름:"+userVO.getUserName());//이름출력
			logger.info("유저 번호:"+userVO.getUserHp());//번호 출력
			UserVO tempvo=new UserVO();
			tempvo.setUserName(userVO.getUserName());
			tempvo.setUserHp(userVO.getUserHp());
			
			logger.info("vo2의값은:"+tempvo.getUserName());
			List<UserVO> list = service.selectId(tempvo); // 아이디값들이 넘어옴

			logger.info("vo2의값은:"+list.get(0).getUserId());
			
			if(list!=null){//아이디 찾기 성공
				String result="";
				Iterator<UserVO> iterator = list.iterator();
				res.put(Constants.RESULT, Constants.RESULT_OK);
				while(iterator.hasNext()){
				String id=iterator.next().getUserId();
				result+="아이디:"+id+"\n";
				}
				res.put(Constants.RESULT_MSG,"아이디 조회 결과\n"+result);
			}else{//아이디 찾기 실패
				res.put(Constants.RESULT, Constants.RESULT_OK);
				res.put(Constants.RESULT_MSG,"아이디를 찾을수가 없습니다");
			}

		}catch (Exception e) {
			e.printStackTrace();
			res.put(Constants.RESULT, Constants.RESULT_OK);
			res.put(Constants.RESULT_MSG,"아이디를 찾을수가 없습니다");
			return res;
		}
		return res;
	}



	/*
	 * @method Name : selectPw
	 * @Author : 김용래
	 * @description :패스워드 찾기
	 */
	@RequestMapping(value = "/selectPw", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String,Object> selectPw(UserVO vo,@RequestParam("Id")String id,@RequestParam("Name")String name){
		HashMap<String,Object> res=new HashMap<String, Object>();
		
		logger.info("아이디:"+id);
		logger.info("이름:"+name);
		
		vo.setUserId(id);
		vo.setUserName(name);
		
		try {
			UserVO uservo=service.selectPw(vo);
			logger.info("패스워드는:"+uservo);
			if(uservo!=null){
				res.put(Constants.RESULT, Constants.RESULT_OK);
			}else{
				res.put(Constants.RESULT, Constants.RESULT_FAIL);
				res.put(Constants.RESULT_MSG,"일치하는 정보가 존재하지 않습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			res.put(Constants.RESULT, Constants.RESULT_FAIL);
			res.put(Constants.RESULT_MSG,"일치하는 정보가 존재하지 않습니다.");
		}
	
		return res;
	}
	
	
	/*
	 * @method Name : pwmodify
	 * @Author : 김용래
	 * @description :패스워드 수정
	 */
	
	@RequestMapping(value = "/pwmodify", method = RequestMethod.GET)//데이터를 받아서 넘겨줌
	public String pwmodify(@RequestParam("userId")String id,RedirectAttributes rttr){
		/* Map<String, Object> map = new HashMap<String,Object>();
		 map.put("id",id);
		 rttr.addFlashAttribute("vo", map);*/
		 
		rttr.addFlashAttribute("id",id);
		return "redirect:/user/pwmodify1";
	}
	
	
	@RequestMapping("/pwmodify1")//받은 데이터를 안보이게 숨김
	public String pwmodify1(){
		return "/user/pwmodify";
	}
	
	
	/*
	 * @method Name : pwmodify
	 * @Author : 김용래
	 * @description :패스워드 업데이트
	 */
	
	@RequestMapping(value = "/PwUpdate", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String,Object> pwUpdate(UserVO vo,@RequestParam("Id")String id,@RequestParam("Pw")String pw)
	{
		HashMap<String,Object> res=new HashMap<String, Object>();
		
		logger.info("넘어온 아이디값:"+id);
		logger.info("넘어온 패스워드값:"+pw);
		vo.setUserId(id);
		vo.setUserPw(pw);
		
		try {
			service.pwupdate(vo);
			res.put(Constants.RESULT, Constants.RESULT_OK);
			res.put(Constants.RESULT_MSG,"수정완료");
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return res;
	}
	


}