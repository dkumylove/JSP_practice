package com.login.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.login.dao.BoardDao;
import com.login.dto.Criteria;
import com.login.dto.PageDto;


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
		
		// 리스트를 조회하기 위한 파라미터 수집
		Criteria cri = new Criteria(request.getParameter("pageNo"), request.getParameter("amount"));
		
		// 리스트 조회후 리퀘스트 영역에 저장
		BoardDao dao = new BoardDao();
		
		// request영역에 저장 -> 화면까지 데이터를 유지하기 위해서
		request.setAttribute("list", dao.getList(cri));
		
		// 페이지 블럭의 생성하기 위해 필요한 정보를 저장
		int total = dao.getTotalCnt();
		PageDto pageDto = new PageDto(total, cri);
		
		request.setAttribute("pageDto", pageDto);
		
		// 자원반납
		dao.close();
		
		// 페이지 전환
		request.getRequestDispatcher("/board/board.jsp").forward(request, response);
	}

}
