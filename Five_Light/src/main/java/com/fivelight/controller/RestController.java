package com.fivelight.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fivelight.domain.Ranking;
import com.fivelight.domain.User;
import com.fivelight.mapper.ServiceMapper;

@Controller
public class RestController {	
	@Autowired
	private ServiceMapper mapper;	
	 
	@RequestMapping("weight.do")
	 public @ResponseBody String weight(User user, HttpSession session) {
		mapper.weight(user);
		System.out.println("가져오는 값 : " + user);
		session.setAttribute("info", user);
		
		return "";		
	}
	
	@RequestMapping("nickcorr.do")
	 public @ResponseBody String nick(User user, HttpSession session) {
		mapper.nickcorr(user);
		System.out.println("가져오는 값 : " + user);
		session.setAttribute("info", user);
		 
		return "";		
	}	

	@RequestMapping("/memberInfo2.do")
	private @ResponseBody List<Ranking> memberInfo2(Ranking ranking) {
		List<Ranking> rankgraph = mapper.rankgraph(ranking);		

		return rankgraph;
	}
}