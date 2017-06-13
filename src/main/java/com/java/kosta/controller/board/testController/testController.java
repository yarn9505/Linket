package com.java.kosta.controller.board.testController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class testController {

	@RequestMapping("/loginFormTest")
	public String test(){
		return "templateLayout/logiForm";
	}
	@RequestMapping("/loginFormTest2")
	public String test2(){
		return "templateLayout/mypage";
	}
	@RequestMapping("/loginFormTest3")
	public String test3(){
		return "templateLayout/searchPage";
	}
	@RequestMapping("/loginFormTest4")
	public String test4(){
		return "templateLayout/loginForm2";
	}
	@RequestMapping("/FormTest5")
	public String test5(){
		return "templateLayout/modal1";
	}
	@RequestMapping("/FormTest6")
	public String test6(){
		return "templateLayout/modalTest";
	}
}
