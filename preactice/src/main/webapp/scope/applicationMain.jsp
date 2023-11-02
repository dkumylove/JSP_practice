<%@page import="java.util.HashMap"%>
<%@page import="com.momo.dto.Person"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>application 영역</h2>
	
	 
	<%
		Map<String, Person> map = new HashMap<>();
	 
	 	map.put("actor1", new Person("RM", 30));
	 	map.put("actor2", new Person("user2", 30));
	 	map.put("actor3", new Person("user3", 40));
	 	
	 	application.setAttribute("map", map);
	%>

	<p>어플리케이션 영역에 속성이 저장 되었습니다.</p>
	
	<p>web.xml에 저장한 초기화 변수 출력</p>
	<%= "<br>" + application.getInitParameter("INTI_PARAM") %>
	 
	<p>서버의 물리적 경로</p>
	<%= application.getRealPath("") %>
	
	
</body>
</html>