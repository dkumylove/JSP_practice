<%@page import="java.util.List"%>
<%@page import="com.momo.dto.DeptDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>부서목록</h2>
	<%
		// jsp를 단독으로 실핼할 경우, null이 출력될수 있다.
		// 리스트를 불러와야하는데 DB에 접근해서 리스트를 조회할 권한이 없음
		List<DeptDto> list = (List<DeptDto>)request.getAttribute("list");
		out.print(list);
	
	%>
	
</body>
</html>