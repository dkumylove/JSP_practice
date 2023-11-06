package com.momo.utils;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CookieManager {

	// 기보생성자	
	public CookieManager() {
		
	}
	
	// 쿠키를 생성후 응답 객체에 저장
	/**
	 * 쿠키를 생성후 응답 객쳉 저장
	 * 
	 * 쿠키생성시 필요한 값 : 쿠키이름, 쿠키값, 유지시간
	 * 
	 * 사용자에게 응답하기 위해 필요한 값 : 응답객체를 매개변수로 전달 받는다.
	 * 
	 */
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
	/**
	 * 요청객체로부터 쿠키배열을 가지고 온뒤 원하는 쿠키이름를 찾아서 쿠키값을 반환 
	 * @return
	 * */
	public static String readCookie(HttpServletRequest request, String name){ 
		String value = "";	
		// 요청객체로부터 쿠키배열을 획득
		Cookie[] cookies = request.getCookies();
		// 확인용출력
		System.out.println("cookies : " + cookies);
		// 브라우저를 통해 처음 접근했을떄
		// 쿠키가 하나도 저장되어 있지 않은 경우(jsessionid값이 없는경우)
		// getCookies()를 호출하면 null을 반한
		if(cookies != null) {
			// 쿠키배열을 돌면서 쿠킹름이 일치하는 객체가 있는지 확인
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals(name)) {
					value = cookie.getValue();
					break;
				}
			}
		}
		return value;
	}
	
	/**
	 * 쿠키를 삭제합니다.
	 * @param response
	 * @param name
	 * */
	
	public static void deleteCookie(HttpServletResponse response, String name) {
		makeCookie(response, name, "", 0);
	}
}
