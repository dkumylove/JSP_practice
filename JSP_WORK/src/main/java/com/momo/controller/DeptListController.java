package com.momo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.momo.dao.DeptDao;
import com.momo.dto.DeptDto;

/**
 * URL매핑 ("/deptList" 페이지를 요청하면 실행)]
 * 요청메서드에 따라서 실행되는 메서드가 결정
 *
 * 주소표시줄, 링크 -> get방식 -> doget() 메서드 호출
 * Connection 
 * 	- 사용자의 요청정보를 수집
 * 	- 비지니스 로직 호출(서비스로 만들어지는 객체)
 * 	- View로 페이지 전환( 컨트롤러에서 페이지 생성하지 않음. 번거로움)
 */

@WebServlet("/deptList")
public class DeptListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeptListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		// DB에 접근해서 리스트를 조회
		DeptDao dao = new DeptDao(request.getServletContext());
		List<DeptDto> list = dao.getList();
		
		request.setAttribute("list", list);
		// 컨트롤러에서 화면을 구성하는 태그를 작성하는 것은 매우 번거롭기 떄문에 jsp를 이용해서 화면을 작성후 페이지 전환
		request.getRequestDispatcher("deptList.jsp").forward(request, response);
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
