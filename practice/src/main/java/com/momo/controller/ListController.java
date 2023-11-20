package com.momo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.momo.dao.BoardDao;
import com.momo.dto.BoardDto;
import com.momo.dto.Criteria;

@WebServlet("/list")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	/**
	 * 리스트 조회후 반환
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BoardDao dao = new BoardDao();
		
		// request 영역에  list를 담아 준다.
		List<BoardDto> list = dao.getList(new Criteria());
		request.setAttribute("list", list);
		System.out.println("list");

		// 자원반납
		dao.close();
		// forward - request 영역을 공유하기 위해서
		request.getRequestDispatcher("/09JSTL/core/list.jsp").forward(request, response);
		
	}

}

