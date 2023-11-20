<%@page import="com.momo.dto.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h2>sendRedirect</h2>
	<p>request 영역은 하나의 요청에 대한 응답이 완료될때 소멸됨!!</p>
	<%
	
		// forward : request 영역 공유
		// Senderdirect : request 영역 공유 안됨
		
		/*
			redirect 방식 이용시 다음 요청 페이지에 값을 넘기는 방법
			request 영역 공유되지 않으므로 request영역에 값을 저장해도 유지되지 않음
			1. 쿼리스트링 이용방법
				쿼리스트링 이용시 getParamatet()메소드를 이용해서 값을 꺼내욜수 있다.
			2. session을 이용하는 방법
				세선은 서버에 저장되는 영역이므로 필요시 생성후 제거해 준다.
			*/
		
		// request 영역에 2개의 값을 저장
		// request 영역을 이용시 값이 유지 되지 않으므로 다른방법을 이용해야 함
		request.setAttribute("request_str", "request_str");
		request.setAttribute("request_person", new Person("momo", 30));
		
		// session영역에 값을 저장
		session.setAttribute("session_str", "session_str");
		
		// 쿼리스트링을 통한 파마이터 전달
		response.sendRedirect("requestRedirect.jsp?isRedirect=1");
		
	%>
	
</body>
</html>