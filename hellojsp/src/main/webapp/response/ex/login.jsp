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
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		if("momo".equals(id) && "1234".equals(pw)){
			// 로그인성공
			response.sendRedirect("logeOk.jsp?id=" + id);
		} else {
			// 로그인실패
			request.getRequestDispatcher("main.jsp?loginErr=1").forward(request, response);
		}
	%>
	
</body>
</html>