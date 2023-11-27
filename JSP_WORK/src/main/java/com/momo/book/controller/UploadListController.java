package com.momo.book.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.momo.dao.FileDao;
import com.momo.dto.FileDto;

@WebServlet("/upload/list")
public class UploadListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * 첨부파일의 목록을 조회 하여 반환 한다
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 파일목록을 조회 합니다.
		FileDao dao = new FileDao();
		
		List<FileDto> list = dao.getList();
		System.out.println("list : " + list);
		
		dao.close();
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/10upload/list.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
