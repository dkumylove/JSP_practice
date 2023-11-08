package com.momo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;

import java.io.IOException;

import com.momo.dao.MemberDao;
import com.momo.dto.MemberDto;

@WebServlet("/06session/ex/loginProcess")
public class loginProcessController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 요청 파라미터 수집
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		
		// 2. MemberDao를 이용하여 사용자 인증(id, pw 일치하는 사용자가 있다면 member 객체를 반환하고 아니면 null 반환
		MemberDao dao = new MemberDao();
		// 로그인 처리
		MemberDto dto = dao.login(id, pw);
		// 자원반납
		dao.close();
		
		
		if(dto != null) {
			// 로그인 성공
			// 3. session 영역에 memberDto 저장
			HttpSession session = request.getSession();
			// 세션의 만료기간이 남아있고 웹 브라우저를 닫을 때까지 세션 정보가 서버에 유지
			session.setAttribute("memberDto", dto);
			session.setAttribute("user_id", id);
			
			// 4. 페이지 전환
			response.sendRedirect("main.jsp");
			
		} else {
			// 로그인 실패
			// 4. 페이지 전환
			request.getRequestDispatcher("loginForm.jsp?isError=1").forward(request, response);
		}
	}

}
