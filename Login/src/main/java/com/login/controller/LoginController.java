package com.login.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.login.dao.MemberDao;
import com.login.dto.MemberDto;

@WebServlet("/loginAction")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   	/**
   	 * 로그인처리
   	 * 	- 요청데이터 확인
   	 * 		id.pw가 일치하는 사용자가 있는지 확인후
   	 * 		사용자가 있으면 - 로그인 성공
   	 * 			-> 사용자정보를 세선에 저장후 board.jsp페이지로 이동
   	 * 		사용자가 없으면 - 로그인 실패
   	 * 			-> 'id, pw를 확인해주세요' 메시지 띄우고 이전페이지로 이동
   	 * 	- 요청메서드에 따라 doGet, doPost 메서드가 실행된다.
   	 * 요청방식(method) - 요청방식을 지정하지 않으면 get 방식으로 호출
   	 * 				- 요청방식에 해당하는 메서드가 구현되지 않을경우 405 오류 발생할수 있다.
   	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// servlet 에서 세션을 사용하기 위해서 request 로 꺼내온다.
		HttpSession session = request.getSession();
		
		// 1. 요청 데이터 수집(id, pw)
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		System.out.println("id : " + id);
		System.out.println("pw : " + pw);
		
		// 2. 사용자 정보조회 (MemberDao.login(id,pw))
		MemberDao dao = new MemberDao();
		MemberDto dto = dao.login(id, pw);
		
		// 자원반납
		dao.close();
		
		if(dto != null) {
			// 로그인성공 -> session에 저장 -> board.jsp로 이동
			session.setAttribute("memberDto", dto);
			session.setAttribute("user_id", dto.getId());
			System.out.println("로그인성공");
			
			// 페이지 전환
			response.sendRedirect("/boardList");
			// 서블릿을 요청시 주의사항
			// forward 방식으로 페이지를 전환시 405 오류가 발생 할 수 있다.
			// /loginAction - > post
			// /list -> get
			// 요청 받을 당시 방식(mothod)가 유지되므로 405 오류가 발생할 소지가 있다.
				
		} else {
			// 로그인 실패
			
			request.setAttribute("msg", "아이디, 비밀번호를 확인해 주세요");
			request.getRequestDispatcher("/msgbox.jsp").forward(request, response);
			
//			// 서블릿의 한글께짐 처리
//			response.setContentType("text/html; charset=UTF-8");
//			// 'id, pw를 확인해주세요' 메시지 알림창 띄우기 -> 페이지전환
//			response.getWriter().append("<script>");
//			response.getWriter().append("	alert('아이디, 비밀번호 확인해주세요');");
//			response.getWriter().append("	history.back();");
//			response.getWriter().append("</script>");
			
			// 사용자가 존재하지 않으면 이전페이지로 넘어가서 오류 메시지 출력
			//System.out.println("로그인실패");
			//request.getRequestDispatcher("login.jsp?isError=1").forward(request, response);
		}
	}
}
