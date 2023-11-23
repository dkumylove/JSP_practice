package com.momo.book.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/regProcess")
public class MemberRegController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// servlet 에서 세션을 사용하기 위해서 request 로 꺼내온다.
		HttpSession session = request.getSession();
		
		// 파라미터수집
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		
		if () {
			// 회원가입 성공
			
			// 로그인페이지로 이동
			response.sendRedirect("로드인페이지");
			
		} else {
			// 회원가입 실패
			//  
			
		}
		
	}

}
