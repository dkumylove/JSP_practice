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
	<%
		String str = "";
		Person person = new Person();
		
		if(request.getAttribute("request_str") != null){
			str = request.getAttribute("request_str").toString();
		}
		if(request.getAttribute("request_person") != null){
			person = (Person)request.getAttribute("request_person");
		}	
	%>
	
	<h2>getAttribute 결과</h2>
	<p>Redirect시 request영역은 공유되지 않으므로 값이 출력 되지 않음</p>
	<br>str : <%= str%>
	<br>person : <%= person%>
	<hr>
	
	<h2>쿼리스트링 출력</h2>
	<p>queryString으로 전달한 데이터는 getParameter()를 이용해서 수집</p>
	<br>isRedirect : <%= request.getParameter("isRedirect")%>
	<hr>
	
	<h2>session을 이용한 값 출력</h2>
	<br>session_str : <%= session.getAttribute("session_str") %>
	
	<%
		//세션에 저정된 속성을 제거합니다.
		session.removeAttribute("session_str");
	%>
	
	<h3>세션제거</h3>
	<br>session_str : <%=session.getAttribute("session_str") %>
	
</body>
</html>