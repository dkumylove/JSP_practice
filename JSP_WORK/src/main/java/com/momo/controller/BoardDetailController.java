package com.momo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.momo.dao.BoardDao;
import com.momo.dto.BoardDto;

@WebServlet("/boardRead")
public class BoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
		// 한건에 게시글 조회하기
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 사용자의 요청 파라미터 수집
		String num = request.getParameter("num");
		System.out.println("요청게시글번호 : " + num);
		
		// 1건 게시글 조회
		BoardDao dao = new BoardDao();
		
		// 조회수 증가
		dao.visitcountUp(num);
		
		// 상세보기조회 조회
		BoardDto dto = dao.getOne(num);	
		request.setAttribute("dto", dto);
		request.setAttribute("id", dto.getId());
		
		// 자원반납
		dao.close();
		
		// 페이지 전환
    	request.getRequestDispatcher("/06session/servletEx/boardReadEl.jsp").forward(request, response);
	}

}
