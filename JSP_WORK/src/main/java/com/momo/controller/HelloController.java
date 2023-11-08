package com.momo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * URL매핑 ("/deptList" 페이지를 요청하면 실행)]
 * 요청메서드에 따라서 실행되는 메서드가 결정
 *
 * 주소표시줄, 링크 -> get방식 -> doget() 메서드 호출
 * Connection 
 * 	- 사용자의 요청정보를 수집
 * 	- 비지니스 로직 호출(서비스로 만들어지는 객체)
 * 	- View로 페이지 전환( 컨트롤러에서 페이지 생성하지 않음. 번거로움)
 * -------------------------------------------------
 * 
 * 사용자가 /hellocontroller 경로를 요청하면
 * 요청 URL에 매핑된 서블릿이 실행
 * 
 * 요청 전달된 메서드에 의해 실행될 메서드가 결정된다.
 * - 사용자가 지정하지 않은 경우 get방식
 * - 링크를 클릭했을떄 주소창에 직접 입력했을떄
 * 
 * get방식 요청에 대해서는 doget메서드가 실행되고
 * post방식 요청에 대해서는 dopost메서드가 실행된다.
 * 해당 요청방식이 구현되지 않은 경우 오류발생한다.
 * 
 * 서블릿파일 호출방법
 * localhost : 포트 / path / 매핑주소
 * @WebServlet("/매핑주소")
 * @WebServlet("/h")
 * 
 * 서블릿이 아닌 java파일을 실행할 경우, 404 오류 발생할수 있다.
 * 
 * 
 */
@WebServlet("/h")
public class HelloController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelloController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.append("<h2>out 객체를 이용한 출력</h2>");
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
