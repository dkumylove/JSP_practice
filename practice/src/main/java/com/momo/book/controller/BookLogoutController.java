package com.momo.book.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/book/logout")
public class BookLogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * 로그아웃 후 logoutForm.jsp로 redirect
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		if(session != null) {
			// 세션무효화
			session.invalidate();
		}
		System.out.println("로그아웃 - 세션무효화");
		response.sendRedirect("/book/bookLoginForm.jsp");
	}

}
