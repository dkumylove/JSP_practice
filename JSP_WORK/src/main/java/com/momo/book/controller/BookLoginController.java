package com.momo.book.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.momo.dao.MemberDao;
import com.momo.dto.MemberDto;

@WebServlet("/book/login")
public class BookLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * Controller 의 역할
	 * - 파라미터 수집
	 * - 페이지 전환(jsp로 요청을 위임)
	 * 
	 * 사용자의 로그인 요청을 처리
	 * 1. 파라미터 수집(id, pw)
	 * 2. DB로부터 해당 사용자가 있는지 확인
	 * 	2-1. 사용자가 존재하면 로그인처리(세션에 사용자 정보를 저장)
	 * 	2-2. 사용자가 존재하지 않으면 이전페이지로 넘어가서 오류 메시지 출력
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// servlet 에서 세션을 사용하기 위해서 request 로 꺼내온다.
		HttpSession session = request.getSession();
		
		// 파라미터 수집
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		System.out.println("id : " + id);
		System.out.println("pw : " + pw);
		
		// DB로부터 해당 사용자가 있는지 확인
		MemberDao dao = new MemberDao();
		MemberDto dto = dao.login(id, pw);
		dao.close();
		
		if(dto != null) {
			// 로그인 성공 -> session에 로그인 정보 저장 -> board.jsp로 이동
			// 사용자가 존재하면 로그인처리(세션에 사용자 정보를 저장)
			session.setAttribute("memberDto", dto);
			session.setAttribute("user_id", id);
			System.out.println("로그인 성공");
			
//			// 게시글 조회후 request에 담아줌
//			BoardDao boardDao = new BoardDao();
// 			request.setAttribute("list", boardDao.getList());
			
			// 페이지 이동
			// sendRedirect를 이용할 경우, requst 영역을 공유하지 않기 떄문에 list값이 화면으로 전달 할수 없음
			//response.sendRedirect("board.jsp");
			//request.getRequestDispatcher("board.jsp").forward(request, response);
			// BoardListController페이지로 이동 요청
			response.sendRedirect("/book/list");
			
		} else {
			// 로그인 실패
			// 사용자가 존재하지 않으면 이전페이지로 넘어가서 오류 메시지 출력
			System.out.println("로그인 실패");
			//response.sendRedirect("loginForm.jsp?isError=1");
			request.getRequestDispatcher("loginForm.jsp?isError=1").forward(request, response);
			
		}
			
	}

}
