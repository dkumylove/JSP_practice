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
	
	<h2> 페이지 이동후 페이지여역의 속성 값 읽기</h2>
	<%
		Object page_str = pageContext.getAttribute("page");
		Object page_int = pageContext.getAttribute("page_int");
		Object page_p = pageContext.getAttribute("pagePerson");
	%>
	
	<br>String : <%= page_str == null ? "값없음" : page_str%>
	<br>int : <%= page_int == null ? "값없음" : page_int%>
	<br>Person : <%= page_p == null ? "값없음" : page_p%>
	
</body>
</html>