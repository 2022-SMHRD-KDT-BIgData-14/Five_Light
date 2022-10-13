package com.fivelight.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fivelight.domain.Feedback;
import com.fivelight.mapper.ServiceMapper;

@Controller
public class FlaskController {
	@Autowired
	private ServiceMapper mapper;
	
	@RequestMapping("/flaskFeedDetail.do")
	private String feedDetail(HttpServletRequest request, Feedback feed, HttpSession session) {
		
		 String nickname=  request.getParameter("nickname");
		 String ex_name= request.getParameter("ex_name");
		 System.out.println(nickname);
		 System.out.println(ex_name);
		
		 List<Feedback> flaskfeedback =mapper.flaskFeedback(nickname,ex_name);
		 session.setAttribute("flaskfeedback", flaskfeedback);
		 System.out.println(flaskfeedback);
		 
		 return "FlaskFeedDetail";
	}	
	

}