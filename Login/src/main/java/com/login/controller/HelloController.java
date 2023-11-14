package com.login.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.login.common.DBConnPool;
import com.login.dao.HelloDao;

/**
 * 1. 사용자의 요청을 수집
 * 2. jsp페이지 전환
 * @WebServlet("/url")
 * url 메핑 - url이 호출되면 서블릿이 실행
 * 만약 url이 중복될 경우, 서버가 실행이 안될 수  있다.
 * 
 */
@WebServlet("/hello")
public class HelloController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("str", "만나서 반갑습니다.");
		
		HelloDao dao = new HelloDao();
		request.setAttribute("time", dao.getTime());
		
		// 사용자의 요청을 처리후 화면으로 전환
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
