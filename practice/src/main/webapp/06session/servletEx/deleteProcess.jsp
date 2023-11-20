<%@page import="com.momo.utils.JSFunction"%>
<%@page import="com.momo.dao.BoardDao"%>
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
		BoardDao dao = new BoardDao();
		if(request.getParameter("num") != null){
			String num = request.getParameter("num");
			if(dao.deleteBoard(num) != 1) {
				JSFunction.alertBack("존재하지 않는 게시글입니다.", out);
			}

			JSFunction.alertLocation("삭제되었습니다.", "", out);
			
		} else {
		
			
			JSFunction.alertBack("게시물번호(num)을 확인할수 없습니다.", out);
		}
		
	%>
	
</body>
</html>