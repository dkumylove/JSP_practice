<%@page import="com.momo.utils.CookieManamer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>팝업용 쿠키를 생성하는 페이지</h2>
	
	<%
		
		// inactiveToday값을 출력하기
		// 값이 출력이 안될떄는 파라미터값(요소의 name속성의 값이이다)
		// value속성값 = request.getParameter("name속성의값");
		out.print("inactiveToday : " + request.getParameter("inactiveToday"));
		
		// request.getParameter("inactiveToday").equale("y")시 
		// 값이 없는데 .을 찍으면 넢포인트입셉션이 나옴
		if("y".equals(request.getParameter("inactiveToday"))){
			// 팝업닫기용(popupClose, Y) 쿠키 생성
			CookieManamer.makeCookie(response, "popupClose", "Y", 3600);
			
			// 끝나면 cookiePopupMain 페이지로 이동(페이지전환)
			response.sendRedirect("cookiePopupMain1.jsp");	
		}
		
	%>
	
</body>
</html>