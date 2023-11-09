<%@page import="com.momo.dto.MemberDto"%>
<%@page import="com.momo.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h2>로그인 프로세서</h2>
	<% 
		/* 1. 사용자의 요청 파라미터 수집 (id, pw)
		   2. DB에 등록된 사용자인지 확인
		   		- user 테이블 생성
		   		- 사용자 정보 등록
		*/ 
		
		// 1. 사용자의 요청 파라미터 수집 (id, pw)
		String id = request.getParameter("user_id");
		String pass = request.getParameter("user_pw");
		
		MemberDao dao = new MemberDao();
		
		// 로그인처리
		MemberDto dto = dao.login(id, pass);
		
		// 자원반납
		dao.close();
		
		// id, pw가 일치하는 사용자 정보를 반환
		if(dto != null){
			// 세션에 저장
			session.setAttribute("memberDto", dto);
			session.setAttribute("user_id", id);
			
			// 로그인 성공 -> 메인페이지로 이동
			response.sendRedirect("main.jsp");
			
		} else {
			// 로그인 실패 -> 로그인 패이지 이동후 메시지 출력
			request.getRequestDispatcher("loginForm.jsp?isError=1").forward(request, response);
		}
		
	%>
	
</body>
</html>