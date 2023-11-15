package com.login.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.login.dao.BoardDao;

@WebServlet("/boardDelete")
public class BoardDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파리미터 수집
		// 한건의 게시글을 삭제하기 위해 num을 수집(view.jsp의 input태그의 name값
		String num = request.getParameter("num");
		
		// DB로 부터 게시글 삭제
		BoardDao dao = new BoardDao();
		int res = dao.deleteBoard(num);
		
		if(res == 1) {
			// 삭제 성공
			request.setAttribute("msg", "삭제되었습니다.");
			request.setAttribute("url", "/boardList");
			
		} else {
			// 삭제 실패
			request.setAttribute("msg", "삭제 처리중 예외상황이 발생했습니다. \n관리자에게 문의해주세요.");
		}
		// 메시지 출력화면으로 이동
		request.getRequestDispatcher("/msgbox.jsp").forward(request, response);
	}
}
