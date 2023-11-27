package com.momo.book.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;

import com.momo.dao.FileDao;
import com.momo.dto.FileDto;
import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;
import fileupload.MyFileDAO;
import fileupload.MyFileDTO;



@WebServlet("/upload/uploadProcess")
@MultipartConfig(maxFileSize = 1024*1024*1, maxRequestSize = 1024*1024*10)
public class UploadProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("method : get ").append(request.getContextPath());
		
		// 한글꺠짐 처리
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		FileDao fileDao = new FileDao(); 
		
		// 요청 정보를 수집하여 DTO객체를 생성 합니다.
		// 업로드된 정보를 DB에 저장 하기 위해서!!!
		FileDto fileDto = new FileDto();
		
		//파일 외 폼값 받기
		fileDto.setName(request.getParameter("name"));
		fileDto.setTitle(request.getParameter("title")); 
		fileDto.setCate(request.getParameterValues("cate")); 
		
		System.out.println("filedto : " + fileDto);
		
		// 저장공간
		String sDirectory = "c:/app/jsp/upload";
		
		//파일 업로드 하기
		// name속성을 이용해 파일을 확인
		String fileName = fileDao.uploadFile(request, sDirectory);
		System.out.println("파일명 : " + fileName);
		
		//저장된 파일명 변경하기
        String sFileName = fileDao.renameFile(sDirectory, fileName);
		System.out.println("파일명 : " + sFileName);        
        
        //DB에 저장하기
        insertFile(request, fileName, sFileName);
	
	 		
 		/* 파일이 첨부된경우 파일명이 중복되어 파일이 유실되는 경우를 방지하기 위해 파일명을 변경 합니다.
 		 * 	- 중복된 파일을 업로드 하는 경우 기존에 저장된 파일이 소실될 우려가 있으므로 파일명을 변경하여 저장 합니다.
 		 * 	- 파일을 저장 할때는 /년/월/일 폴더를 생성후 파일명에 날자를 붙여서 저장 
 		 * 	- 파일을 저장 할때 파일명_날자시간.확장자
 		 * 	- 파일을 저장 할때 날자시간_파일명.확장자
 		 */
        
        // 페이지 전환
 		// 입력된 내용을 DB에 저장 합니다.
 		int res = fileDao.regFile(fileDto);
	 		
 		if(res > 0) {
 			request.setAttribute("msg", "등록되었습니다.");
 			// list.jsp를 바로 호출할경우 데이터를 조회 할 수 없으므로
 			// 서블릿을 호출합니다
 			request.setAttribute("url", "/upload/list");
 		} else {			
 			request.setAttribute("msg", "등록중 예외사항이 발생 하였습니다. 관리자에게 문의해주세요.");
 		}
 		
 		request.getRequestDispatcher("/book/msgBox.jsp").forward(request, response);
	}
	
	private void insertFile(HttpServletRequest request, String fileName, String sFileName) {
		//파일 외 폼값 받기
	    String title = request.getParameter("title");
	    String[] cateArray = request.getParameterValues("cate");
	    StringBuffer cateBuf = new StringBuffer();
	    if (cateArray == null) {
	        cateBuf.append("선택한 항목 없음");
	    }
	    else {
	        for (String s : cateArray) {
	            cateBuf.append(s + ", ");
	        }
	    }
	    System.out.println("파일외폼값:"+title +"\n"+ cateBuf);
	    
		//DB에 입력하기
        FileDto dto = new FileDto();
        dto.setTitle(title);
        dto.setCate(cateBuf.toString());
        dto.setOfile(fileName);
        dto.setSfile(sFileName);
        
        System.out.println();

        //DAO를 통해 데이터베이스에 반영
        FileDao dao = new FileDao();
        dao.regFile(dto);
        dao.close();
	}
}
