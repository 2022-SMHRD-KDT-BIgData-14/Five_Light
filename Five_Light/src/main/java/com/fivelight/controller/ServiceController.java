package com.fivelight.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fivelight.domain.Exercise;
import com.fivelight.domain.Feedback;
import com.fivelight.domain.Ranking;
import com.fivelight.domain.User;
import com.fivelight.mapper.ServiceMapper;

@Controller
public class ServiceController {
	@Autowired
	private ServiceMapper mapper;

	// 회원관리 이동 ctrl
	@RequestMapping("/userInfo.do")
	private String userInfo() {
		return "UserInfo";
	}
	
	// 회원(PT수강자) 이동 ctrl
	@RequestMapping("/myInfo.do")
	private String myInfo(HttpServletRequest request, Model model, HttpSession session) {
		session = request.getSession();

		User nickname = (User)session.getAttribute("info");
		List<Feedback> feedbackList = mapper.feedback(nickname);

		session.setAttribute("feedbackList", feedbackList);

		return "MyInfo";
	}

	// 개인 사용자 이동 ctrl
	@RequestMapping("/memberInfo.do")
	private String memberInfo(HttpServletRequest request, Model model, HttpSession session) {
		session = request.getSession();

		User nickname = (User)session.getAttribute("info");
		List<Feedback> feedbackList = mapper.feedback(nickname);
		
		List<Exercise> exerciseList = mapper.exercise();
		session.setAttribute("exerciseList", exerciseList);
		
		session.setAttribute("feedbackList", feedbackList);

		return "MemberInfo";
	}	

	// logout ctrl
	@RequestMapping("/logout.do")
	private String logout(HttpSession session) {
		// 세션 삭제
		session.invalidate();
		
		return "redirect:/";
	}

	// PT관리자 뷰의 피드백
	@RequestMapping("/userInfoDetail.do")
	public String userInfoDetail(User nickname, Model model, HttpSession session) {
		System.out.println("디데일 입장");
		
		User user = mapper.userInfoSelect(nickname);
		List<Feedback> feedbackList = mapper.feedback(nickname);		
	
		session.setAttribute("feedbackList", feedbackList);
		session.setAttribute("userInfo", user);		
		
		System.out.println("디데일 나가기");
		
		return "UserInfoDetail";
	}
		
	// 첼린지 페이지연결
	@RequestMapping("/challenge.do")
	public String challenge() {
		return "Challenge";
	}

	// 피드백 디테일 연결
	@RequestMapping("/feedDetail.do")
	public String feedDetail() {
		return "FeedDetail";
	}
	
	// 트레이닝 연결
	@RequestMapping("/training.do")
	public String training() {
		return "Training";
	}

	// 랭킹 연결
	@RequestMapping("/ranking.do")
	public String ranking(Ranking ranking, String ex_name, Model model, HttpSession session) {
		List<Exercise> exerciseList = mapper.exercise();
		session.setAttribute("exerciseList", exerciseList);
		
		for(int i = 0; i < exerciseList.size(); i++) {			
			List<Ranking> rank = mapper.ranking(exerciseList.get(i).getEx_name());
			
			session.setAttribute("ranking" + i + "List", rank);			
		}
		
		return "Ranking";
	}

	// userInfo >> 랭킹확인
	@RequestMapping("/rank.do")
	public String rank(String ex_name, Model model, HttpSession session) {
		List<Exercise> exerciseList = mapper.exercise();
		session.setAttribute("exerciseList", exerciseList);
		
		for(int i = 0; i < exerciseList.size(); i++) {			
			List<Ranking> rank = mapper.ranking(exerciseList.get(i).getEx_name());
			
			session.setAttribute("ranking" + i + "List", rank);			
		}
		
		return "Rank";
	}
}