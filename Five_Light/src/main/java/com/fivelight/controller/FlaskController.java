package com.fivelight.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FlaskController {
	@RequestMapping("/flaskTest.do")
	private String flaskTest() {
		
		
		return "FlaskTest";
	}
	
	
	@RequestMapping("/flaskTest1.do")
	private String flaskTest(int result, Model model) {
		
		model.addAttribute("flask", result);
		
		return "redirect:/flaskTest.do";
	}
	
}
