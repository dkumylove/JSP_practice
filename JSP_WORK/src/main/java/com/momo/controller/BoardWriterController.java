package com.momo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.momo.dto.BoardDto;

@WebServlet("/boardWriter")
public class BoardWriterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 로그인 체크
		HttpSession session = request.getSession();
		if(session.getAttribute("user_id") == null) {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('로그인후 게시글을 작성 할수 있습니다.')");
			out.print("</script>");
			return;
		}
		// 파라미터 수집
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		// 세션정보 확인
		String id = session.getAttribute("user_id").toString();
		BoardDto dto = new BoardDto();
		dto.setTitle(title);
		dto.setContent(content);
		dto.setId(id);
		
		
		
		
		
		doGet(request, response);
	}

}
