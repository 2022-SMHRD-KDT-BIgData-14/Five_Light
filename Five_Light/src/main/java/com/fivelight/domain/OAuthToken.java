package com.fivelight.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// 카카오 토큰 생성자
@Data
@NoArgsConstructor
@AllArgsConstructor
public class OAuthToken {
	private String access_token;
	
	private String token_type;
	
	private String refresh_token;
	
	private int expires_in;
	
	private String scope;
	
	private int refresh_token_expires_in;
}