package com.java.kosta.controller.matching;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="matching/*")
public class MachingController {
	// /maching/machingMain
	@RequestMapping(value="/matchingMain")
	public String machingMain(){
		
		return "matching/matchingMain";
	}
}
