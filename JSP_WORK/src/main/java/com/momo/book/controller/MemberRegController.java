package com.momo.book.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.momo.book.dao.MemberDao;

@WebServlet("/book/regProcess")
public class MemberRegController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	/**
	 * 회원가입 진행
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// servlet 에서 세션을 사용하기 위해서 request로 꺼내온다.
		//HttpSession session = request.getSession();
		
		// 파라미터수집
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		
		// 수집파라미터 확인
		System.out.println("id : " + id);
		System.out.println("name : " + name);
		System.out.println("email : " + email);
		System.out.println("pw : " + pw);
		
		// DB에 사용자 등록
		MemberDao dao = new MemberDao();
		int res = dao.register(id, pw, name, email);
		
		if(res == 1) {
			// 회원가입성공
			request.setAttribute("msg", "가입축하합니다.");
			request.setAttribute("url", "/book/bookLoginForm.jsp");
			
		} else {
			// 회원가입 실패
			request.setAttribute("msg", "회원가입중  예외상황이 발생했습니다. \n관리자에게 문의해주세요.");
		}
		// 메시지 출력화면으로 이동
		request.getRequestDispatcher("/msgbox.jsp").forward(request, response);
		
	}

}
