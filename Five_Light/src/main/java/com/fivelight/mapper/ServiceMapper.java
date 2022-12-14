package com.fivelight.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fivelight.domain.Exercise;
import com.fivelight.domain.Feedback;
import com.fivelight.domain.Ranking;
import com.fivelight.domain.User;

@Mapper
// user, my, member info 서비스 mapper
public interface ServiceMapper {	
	
	public User userInfoSelect(User nickname);
	
	public List<Feedback> feedback(User nickname);
	
	public int weight(User user);
	
	public int c_weight(User user);
	
	public int nickcorr(User user);
	
	public List<Exercise> exercise();
	
	public List<Ranking> ranking(String ex_name);
	
	public List<Ranking> rankgraph(Ranking ranking);
	
	public int userdelete(User nickname);
	
	public int feedchart(String nickname, String ex_name);
	
	public List<Feedback> flaskFeedback(String nickname, String ex_name);
	
	public List<Feedback> FeedbackDetail(int feed_num);
}