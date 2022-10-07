package com.fivelight.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fivelight.domain.User;
import com.fivelight.mapper.ServiceMapper;

@Controller
public class RestController {	
	@Autowired
	private ServiceMapper mapper;	
	 
	@RequestMapping("weight.do")
	 public @ResponseBody String weight(User user, HttpSession session) {
		
		System.out.println(user+"111111111111111111111111111111");
		int test=mapper.weight(user);
		System.out.println(test+"2222222222222222222222222222222222222");
		session.setAttribute("info", user);
		
		return "";		
	}
	
	@RequestMapping("nickcorr.do")
	 public @ResponseBody String nick(User user, HttpSession session) {
		mapper.nickcorr(user);
		session.setAttribute("info", user);
		 
		return "";		
	}
}