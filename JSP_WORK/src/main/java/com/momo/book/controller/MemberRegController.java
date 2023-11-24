package com.momo.book.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import org.apache.catalina.connector.Response;

import com.momo.book.dao.MemberDao;
import com.momo.dto.MemberDto;

@WebServlet("/book/regProcess")
public class MemberRegController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
	/**
	 * 주소표시줄에서 바로 호출하는경우, 기본방식으로 요청이 되어지므로
	 * 405 오류가 발생 할수 있다.
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet()형식으로 요청하세요");
		
		// 한글꺠짐 처리
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.append("post방식으로 요청해주세요");
		
	}
	
	/**
	 * 회원가입 진행
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// servlet 에서 세션을 사용하기 위해서 request로 꺼내온다.
		//HttpSession session = request.getSession();
		
		// 파라미터수집
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		
		// dto를 생성
		MemberDto dto = new MemberDto(id, pw, name, "", email);
		
		// 파라미터 수집 확인
		System.out.println(dto);
		
		// DB에 사용자 등록
		MemberDao dao = new MemberDao();
		int res = dao.regMember(id, pw, name, email);
		
		// 자원반환
		dao.close();
		
		// 메시지 출력후 페이지 전환
		if(res > 0) {
			// 회원가입성공
			request.setAttribute("msg", "가입축하합니다.");
			request.setAttribute("url", "/book/login.jsp");
			
		} else {
			// 회원가입 실패 - 컬럼의 사이즈보다 입력값이 큰경우, 타입이 맞지 않은경우
			request.setAttribute("msg", "회원가입 중  예외상황이 발생했습니다. \n관리자에게 문의해주세요.");
		}
		// 메시지 출력화면으로 이동
		request.getRequestDispatcher("/msgbox.jsp").forward(request, response);
		
	}

}
