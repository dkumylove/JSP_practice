<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test jsp</h1>
	
	<!-- 선언부 -->
	<%!
		String title = "hello JSP";
	%>
	
	<!-- 하나의 값 출력 -->
	<h1><%= title %></h1>
	
	<!-- 내장객체를 이용한 출력 -->
	
	<h1>
		<%
			out.print(title + "학습");
		%>
	</h1>
	
	<%
		Date today = new Date();
		out.print("오늘날짜 : " + today);
	%>
	<hr>
	오늘날짜 : <%= today%>
	
</body>
</html>