package com.momo.book.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.momo.book.service.FileUploadService;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/book/9bookRegUplosdProcess")
public class Book_9_RegUplosdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 첨부파일 저장
		FileUploadService fileService = new FileUploadService();
		MultipartRequest mr = fileService.fileUpload(request, "imgFile", "book");
		
		String title = mr.getParameter("title");
		String author = mr.getParameter("author");
		System.out.println(title +"/"+ author);
	}

}
