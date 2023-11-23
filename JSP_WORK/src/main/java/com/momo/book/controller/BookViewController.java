package com.momo.book.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.momo.book.dao.BookDao;
import com.momo.lib.dto.BookDto;

@WebServlet("/book/view")
public class BookViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * 도서정보를 조회 후 request영역에 저장 하고 view.jsp 이동 합니다.
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 도서정보를 조회후 request영역에 저장
		BookDao dao = new BookDao();
		BookDto dto = dao.view(request.getParameter("no"));
		request.setAttribute("bookDto", dto);

		// 자원 반납
		dao.close();

		// /book/view.jsp 페이지 전환
		request.getRequestDispatcher("/book/view.jsp")
								.forward(request, response);
		
	}

}
