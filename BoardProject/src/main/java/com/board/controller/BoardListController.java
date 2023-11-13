package com.board.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.board.dao.BoardDao;


@WebServlet("/boardList")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/boardList");
		
		// BoardList 조회
		BoardDao dao = new BoardDao();
		
		// request영역에 저장 -> 화면까지 데이터를 유지하기 위해서
		request.setAttribute("list", dao.getList());
		
		// 자원반납
		dao.close();
		
		// 데이터 유지를 위해 화면 전환은 forward방식
		request.getRequestDispatcher("/board/list.jsp").forward(request, response);
		
	}


}
