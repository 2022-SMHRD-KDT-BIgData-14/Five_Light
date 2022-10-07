package com.fivelight.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fivelight.domain.User;

@Mapper
public interface UserMapper {
	// 회원 가입
	public int join(User kakaUser);
	
	// 로그인
	public User login(User kakaUser);
	
	// 권한이 null(PT회원) 리스트
	public List<User> userList(); 
	
	// 회원 탈퇴
	public int delete(String email);
}