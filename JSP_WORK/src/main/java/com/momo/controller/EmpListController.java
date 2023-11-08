package com.momo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.momo.dao.EmpDao;
import com.momo.dto.EmpDto;

@WebServlet("/empList")
public class EmpListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// emp리스트 조회
		//EmpDao dao = new EmpDao(request.getServletContext());
		// 				DBConnPool 사용으로 생성자 바뀌기 떄문에 삭제
		EmpDao dao = new EmpDao();
		List<EmpDto> list = dao.getList();
		
		// 리스트를 request영역에저장
		request.setAttribute("list", list);
		
		// view 페이지로 이동
		request.getRequestDispatcher("/jdbc/empList.jsp").forward(request, response);
		
	}

}
