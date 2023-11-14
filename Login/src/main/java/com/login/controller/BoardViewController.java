package com.login.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.login.dao.BoardDao;
import com.login.dto.BoardDto;

/**
 * 게시글 상세보기
 */
@WebServlet("/boardView")
public class BoardViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

 	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
 		// 파라미터 수집
 		String num = request.getParameter("num");
 		System.out.println("요청게시글번호 : " + num);
 		
 		// DB로부터 1건의 게시글을 조회
 		BoardDao dao = new BoardDao();
 		
 		// 게시글 선택시 조회수증가
 		dao.updeteVisitCount(num);
 		
 		// 상세보기조회 조회
 		BoardDto dto= dao.getOne(num);
 		request.setAttribute("dto", dto);
 		request.setAttribute("id", dto.getId());
 		
 		// 자원반납
 		dao.close();
 		
 		// 페이지 전환
 		request.getRequestDispatcher("/board/view.jsp").forward(request, response);
	}
}
