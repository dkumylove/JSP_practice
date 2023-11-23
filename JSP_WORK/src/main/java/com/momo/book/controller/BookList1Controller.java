package com.momo.book.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.momo.book.dao.BookDao;
import com.momo.dto.Criteria;
import com.momo.lib.dto.BookDto;

@WebServlet("/book/list")
public class BookList1Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * 도서 목록을 조회 후 request영역에 저장
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 사용자의 요청 정보를 수집 합니다.
		Criteria cri = new Criteria(request.getParameter("pageNo"),		// 요청 페이지 번호 (기본값 : 1)
									request.getParameter("amount"));	// 페이지당 보여줄 게시물의 수 (기본값 : 10)
							
		
		// 도서목록 조회후 request 영역에 담아 줍니다. -> 화면에서 출력 하기 위해서!!
		BookDao dao = new BookDao();
		
		// request 영역에  list를 담아 준다.
		List<BookDto> list = dao.getList(cri);
		request.setAttribute("list", list);
		// 위에 두개를 하나로 합친것
		//request.setAttribute("list", dao.getList());
		
		// 자원반납
		dao.close();
		
		// 페이지전환 : forward - request 영역을 공유하기 위해서
		request.getRequestDispatcher("/book/list.jsp").forward(request, response);
	}

	
}
