package com.momo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.momo.dao.BoardDao;

@WebServlet("/boardList")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 리스트 조회후 리퀘스트 영역에 저장
		BoardDao dao = new BoardDao();
		request.setAttribute("list", dao.getList());
		
		// 자원반납
		dao.close();
		
		// 페이지 전환 forward방식으로 전환하amfh request영역이 공유됨
		request.getRequestDispatcher("/06session/servletEx/board.jsp").forward(request, response);
	}

	

}
