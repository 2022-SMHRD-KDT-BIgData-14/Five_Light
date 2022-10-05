package com.fivelight.controller;


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
		System.out.println(user);
		mapper.weight(user);
		
		//System.out.println(test);
		
		return "";
		
	}
	
	

}
