package com.board.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.board.dao.BoardDao;
import com.board.dao.BoardDao2;
import com.board.dto.BoardDto;

@WebServlet("/boardView")
public class BoardViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	/**
	 * 사용자의 요청으로부터 게시글 번호를 추출
	 * 1건의 게시글에 대한 정보를 조회후 request에 담습니다.
	 * view.jsp로 화면 전환	
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 사용자 요청 파라미터 수집
		String num = request.getParameter("num");
		System.out.println("요청게시글번호 : " + num);

		// num에 해당하는 게시글을 조회
		BoardDao dao = new BoardDao();
		BoardDto dto = dao.getOne(num);
		request.setAttribute("dto", dto);
		
		// 자원반납
		dao.close();
		
		// 페이지 전환
		request.getRequestDispatcher("/board/view.jsp").forward(request, response);
	}

}
