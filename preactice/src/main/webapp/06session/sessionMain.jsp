<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h2>세션 설정</h2>

	<h2>Session 설정 확인</h2>
	<%
		//session.setMaxInactiveInterval(300);
		// 날짜 표시 형식을 지정
		// long 타입의 날짜의 포맷을 변환하여서 출력
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		String createTime = sdf.format(new Date(session.getCreationTime()));
		String listTime = sdf.format(new Date(session.getLastAccessedTime()));
	%>
	<ul>
		<li>세션 유지 시간 : <%= session.getMaxInactiveInterval() %></li>
		<li>세션 아이디 : <%= session.getId()%></li>
		<li>최초 요청 시각 : <%= session.getCreationTime() + "/" + createTime%></li>
		<li>마지막 요청 시각 : <%= session.getLastAccessedTime() + "/" + listTime%></li>
	</ul> 
	
	
	
</body>
</html>