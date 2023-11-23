package com.momo.lib.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.momo.lib.dao.BookDao;
import com.momo.lib.dto.BookDto;

@WebServlet("/bookList")
public class BookListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * 도서 목록을 조회 후 request영역에 저장
     * bookList.jsp로 forward
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//
		BookDao dao = new BookDao();
		
		// request 영역에  list를 담아 준다.
		List<BookDto> list = dao.getList();
		request.setAttribute("list", list);
		// 위에 두개를 하나로 합친것
		//request.setAttribute("list", dao.getList());
		
		// 자원반납
		dao.close();
		
		// 페이지전환 : forward - request 영역을 공유하기 위해서
		request.getRequestDispatcher("/lib/bookList.jsp").forward(request, response);
	}

	
}
