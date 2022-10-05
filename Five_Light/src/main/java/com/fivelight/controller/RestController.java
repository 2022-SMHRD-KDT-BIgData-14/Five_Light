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
	
	 
	@RequestMapping("/weight.do")
	 public @ResponseBody String weight(User user) {

		mapper.weight(user);
		
		//System.out.println(test);
		
		return "";
		
	}
	
	@RequestMapping("nickcorr.do")
	 public @ResponseBody String nick(User user) {
		System.out.println("닉네임 변경"+user);
		mapper.nickcorr(user);

		 
		return "";
		
	}

}
