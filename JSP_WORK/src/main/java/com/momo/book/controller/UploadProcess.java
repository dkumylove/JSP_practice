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
		System.out.println("파일명 fileName: " + fileName);
		
		//저장된 파일명 변경하기
        String sFileName = fileDao.renameFile(sDirectory, fileName);
		System.out.println("파일명 sFileName : " + sFileName);  
		System.out.println("===== DB저장시작전");
        
        //DB에 저장하기
        int res = insertFile(request, fileName, sFileName);
        System.out.println(res);
        System.out.println("=======insertFile()까지");
 		// 입력된 내용을 DB에 저장 합니다.
 		//int res = fileDao.regFile(fileDto);  
          
        
        // 페이지 전환

 		if(res > 0) {
 			request.setAttribute("msg", "등록되었습니다.");
 			// list.jsp를 바로 호출할경우 데이터를 조회 할 수 없으므로
 			// 서블릿을 호출합니다
 			request.setAttribute("url", "/10upload/list.jsp");
 		} else {			
 			request.setAttribute("msg", "등록중 예외사항이 발생 하였습니다. 관리자에게 문의해주세요.");
 		}
 		
 		request.getRequestDispatcher("/msgbox.jsp").forward(request, response);
	}

	
	
	
	private int insertFile(HttpServletRequest request, String fileName, String sFileName) {
		//파일 외 폼값 받기
		String name = request.getParameter("name");
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
	    System.out.println("insertFile()_파일외폼값 : " + name + "/ " + title + "/ "+ cateBuf + "/ "+ fileName + "/ "+ sFileName);
	    
		//Dto에 담기
        FileDto fileDto = new FileDto();
        fileDto.setName(name);
        fileDto.setTitle(title);
        fileDto.setCate(cateBuf.toString());
        fileDto.setOfile(fileName);
        fileDto.setSfile(sFileName);
        
        System.out.println(fileDto);

        //Dao를 통해 데이터베이스에 반영
        FileDao dao = new FileDao();
        int res = dao.regFile(fileDto);
        
        System.out.println(res);
       
        // 자원반납
        dao.close();
        
        return res;
        
       
	}
}
