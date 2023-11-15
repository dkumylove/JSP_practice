package com.login.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.login.dao.BoardDao;

/**
 * 게시글 목록 조회후 반환, 페이지 전환
 */
@WebServlet("/boardList")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * 게시글 목록 조회
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 리스트 조회후 리퀘스트 영역에 저장
		BoardDao dao = new BoardDao();
		
		// 페이징을 위한 시작번호, 끝번호 전에 세팅
		int pageNo = 1;
		int amount = 10;
		// 전달된 값이 잆으면 변경없이 기본값
		if(request.getParameter("pageNo") != null && !"".equals(request.getParameter("pageNo"))){
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		}
		if(request.getParameter("amount") != null && !"".equals(request.getParameter("amount"))){
			amount = Integer.parseInt(request.getParameter("amount"));
		}
		System.out.println("pageNo : " + pageNo);
		System.out.println("amount : " + amount);
		
		// 페이징을 위한 시작번호, 끝번호
		int endNum = pageNo * amount;
		int startNum = endNum - (amount - 1);
		
		// request영역에 저장 -> 화면까지 데이터를 유지하기 위해서
		request.setAttribute("list", dao.getList(startNum, endNum));
		
		// 자원반납
		dao.close();
		
		// 페이지 전환
		request.getRequestDispatcher("/board/board.jsp").forward(request, response);
	}

}
