<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
	 
	 <%
	 	session.setAttribute("person", new Person("momo", 30));
	 	List<String> list = new ArrayList<String>();
	 	list.add("list");
	 	list.add("set"); // 로또만들기 (새로운 숫자를 추출 -> 담아 중보제거)
	 	list.add("map");
	 	
	 	session.setAttribute("list", list);
	 %>
	<h2>페이지 이동후 session 영역에 저장된 값을 출력</h2>
	<a href="sessionLocation.jsp">sessionLocation.jsp 바로가기</a>
	<hr>
	
	<h2>세션무효화</h2>
	<a href="sessionInvalidate.jsp">sessionInvalidate.jsp 바로가기</a>
	
</body>
</html>