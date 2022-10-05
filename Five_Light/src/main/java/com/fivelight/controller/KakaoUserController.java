package com.fivelight.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fivelight.domain.KakaoProfile;
import com.fivelight.domain.OAuthToken;
import com.fivelight.domain.User;
import com.fivelight.mapper.UserMapper;


@Controller

public class KakaoUserController {

	@Autowired
	private UserMapper mapper;
		
	
	@RequestMapping("/")
	public String kakaotest() {
		
		return "Index";
	}
	



	@RequestMapping("/infoDelete.do")
	private String delete(String email) {
		System.out.println("del 컨트롤러"+email);
		
		mapper.delete(email);
		
		return "redirect:/";
	}

	@GetMapping("/auth/kakao/callback")
	public String kakaoCallback(String code, Model model,  HttpSession session) throws IOException {// Data를 리턴해주는 컨트롤러 함수
		
		// post 방식으로 key=value 데이터를 요청(카카오쪽으로)
		// Retrofit2
		// OkHttp
		// RestRestTemplate
		
		RestTemplate rt = new RestTemplate();
		
		
		// HttpHeaders 오브젝트 생성
		HttpHeaders headers=new HttpHeaders();
		headers.add("Content-type","application/x-www-form-urlencoded;charset=utf-8");
		
		System.out.println("카카오 코드 : "+code);
	
		// HttpBody 오브젝트 생성
		MultiValueMap<String, String> params=new LinkedMultiValueMap<>();  // 키, 벨류값 넣을 리스트
		params.add("grant_type","authorization_code");
		params.add("client_id", "536db342453fd097b152b710e7334733");
		params.add("redirext_uri", "http://localhost:8085/auth/kakao/callback");
		params.add("code", code);
		
		
		// HttpHeaders와 HttpBody 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String,String>> kakaoTokenRequest=   // << 바디값과 헤드값을 가진 값이 된다
				new HttpEntity<>(params,headers);
		
		
		// Http 요청하기 >> post 방식으로 그리고 response 변수 응답 받음.
		ResponseEntity<String> response = rt.exchange(
				"https://kauth.kakao.com/oauth/token",     //요청할 주소
				HttpMethod.POST,						// 요청방식
				kakaoTokenRequest,						// 바디 헤드 값 
				String.class							// 받을 방법
		);
		
		// Gson, Tson, Simple, ObjectMapper
		ObjectMapper objectMapper = new ObjectMapper();
		OAuthToken oauthToken=null;
		
		try {
			oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		System.out.println("카카오 엑세스 토큰 : "+ oauthToken.getAccess_token());
		
		
	// RestRestTemplate
		RestTemplate rt2 = new RestTemplate();
		
		// HttpHeaders 오브젝트 생성
		HttpHeaders headers2=new HttpHeaders();
		headers2.add("Authorization", "Bearer "+oauthToken.getAccess_token());
		headers2.add("Content-type","application/x-www-form-urlencoded;charset=utf-8");
			
		
		// HttpHeaders와 HttpBody 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String,String>> kakaoProfileRequest2=   // << 바디값과 헤드값을 가진 값이 된다
				new HttpEntity<>(headers2);
		
		
		// Http 요청하기 >> post 방식으로 그리고 response 변수 응답 받음.
		ResponseEntity<String> response2 = rt2.exchange(
				"https://kapi.kakao.com/v2/user/me",     //요청할 주소
				HttpMethod.POST,						// 요청방식
				kakaoProfileRequest2,						// 바디 헤드 값 
				String.class							// 받을 방법
		);
		
				System.out.println(response2.getBody());
		
				// Gson, Tson, Simple, ObjectMapper
				ObjectMapper objectMapper2 = new ObjectMapper();
				KakaoProfile kakaoProfile=null;
				
				
				try {
					kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
				} catch (JsonMappingException e) {
					System.out.println("성공");
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					System.out.println("제발/...");
					e.printStackTrace();
				}
		
				
				
//				User 오브젝트
				System.out.println("카카오 아이디(번호) : " + kakaoProfile.getId());
				System.out.println("카카오 아이디(아이디) : " + kakaoProfile.getKakao_account().getEmail());

				System.out.println(
						"우리 사이트 유저 네임 : " + kakaoProfile.getKakao_account().getEmail() + "_" + kakaoProfile.getId());
				System.out.println("우리 사이트 이메일 : " + kakaoProfile.getKakao_account().getEmail());

				// 유저 정보 생성
				User kakaoUser = User.builder().email(kakaoProfile.getKakao_account().getEmail())
						.name(kakaoProfile.getProperties().getNickname())
						.gender(kakaoProfile.getKakao_account().getGender()).access(null).build();

				System.out.println(kakaoUser.getEmail());

				User user = mapper.login(kakaoUser);

				if (user == null) {
					int join = mapper.join(kakaoUser);

					user = mapper.login(kakaoUser);
				}

				if (user.getAccess() == null) {
					
					session.setAttribute("info", user);	
					return "redirect:/myInfo.do";
					
				} else if (user.getAccess().equals("V")) {

				
					List<User> userList = mapper.userList();
					System.out.println(userList);
					
					session.setAttribute("info", user);
					session.setAttribute("userList", userList);
	
					
					return "redirect:/userInfo.do";

				} else {
					
					session.setAttribute("info", user);
					return "redirect:/memberInfo.do";
				}

			}

	
		}
