package com.momo.utils;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CookieManager {

	// 기보생성자	
	public CookieManager() {
		
	}
	
	// 쿠키를 생성후 응답 객체에 저장

	public static void makeCookie(
		HttpServletResponse response, String name, String value , int time) {
		
		// 쿠키생성
		Cookie cookie = new Cookie(name, value);
		
		// 유지시간 설정
		cookie.setMaxAge(time);
		
		// 응답객체에 추가
		response.addCookie(cookie);
	}
	
	// 쿠키 가져오기
	
	public static String readCookie(HttpServletRequest request, String name){ 
		String value = "";	
		// 요청객체로부터 쿠키배열을 획득
		Cookie[] cookies = request.getCookies();
			
		// 쿠키배열을 돌면서 쿠킹름이 일치하는 객체가 있는지 확인
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals(name)) {
				value = cookie.getValue();
				break;
			}
		}
		return value;
	}
	
	// 쿠키 삭제하기
	public static void deleteCookie(HttpServletResponse response, String name) {
		makeCookie(response, name, "", 0);
	}
}
