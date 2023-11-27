package com.momo.book.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.momo.book.dao.BookDao;
import com.momo.lib.dto.BookDto;

@WebServlet("/book/bookRegProcess")
public class BookRegController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("get방식 요청입니다. 확인후 다시 요청하세요").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 로그인 체크
    	HttpSession session = request.getSession();
    	if(session.getAttribute("user_id") == null) {
    		PrintWriter out = response.getWriter();
    		out.print("<script>");
   			out.print("alert('로그인후 도서등록을 할 수 있습니다.')");
   			out.print("</script>");
    	}
    	
		// 파라미터 수집
		String title = request.getParameter("title");
   		String author = request.getParameter("author");
   		request.getParameter("content");
   		request.getParameter("imgFile");
   		
   		// dto 생성
		BookDto dto = new BookDto("", title, author, "");
  		
		// 파라미터 수집 확인
		System.out.println(dto);
 			
		// DB에 입력 데이터 등록
		BookDao dao = new BookDao();
		int res = dao.regBook(dto);
		
		System.out.println("res : " + res);
		// 자원반납
		dao.close();
   			
		// 메시지 출력후 페이지 전환
		if(res > 0) {
			// 회원가입성공
			request.setAttribute("msg", "도서등록에 성공했습니다.");
			request.setAttribute("url", "/book/list");
   				
		} else {
			// 회원가입 실패 - 컬럼의 사이즈보다 입력값이 큰경우, 타입이 맞지 않은경우
			request.setAttribute("msg", "도서목록 등록 중 예외상황이 발생했습니다. \n관리자에게 문의해주세요.");
   		}
		// 메시지 출력화면으로 이동
		request.getRequestDispatcher("/msgbox.jsp").forward(request, response);
   				
	}
   		
}