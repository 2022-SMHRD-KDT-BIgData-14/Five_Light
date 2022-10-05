package com.fivelight.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


// 유저 정보 생성자


@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
	

	private String email; 			// 이메일

	private String name;  			// 이름
	
	private String nickname; 		//닉네임
	
	private String gender; 			// 성별
	
	private String access;			// 권한
	
	private float weight_start;		// 시작 몸무게
	
	private float weight_now;		// 현제 몸무게
	
	private float weight_target;	// 목표 몸무게
	
	
}
