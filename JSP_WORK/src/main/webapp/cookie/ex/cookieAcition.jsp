<%@page import="com.momo.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 
		팝업용 쿠키를 생성후 cookieMain페이지로 전환
		popupCookie
		
	// 체크박스의 값을 수집
	String inactiveToday = request.getParameter("inactiveToday");
	// inactiveToday값을 출력하기
	out.print("inactiveToday : " + inactiveToday);
	
	// inactiveToday이 checked이면 쿠키 저장
	if(inactiveToday){
	// 쿠키에 값저장
			
	}
	
	-->
	<%
		// 서버에서 response(응답객체)에 쿠키를 추가해주면 브라우저가 확인후 쿠키저장
		CookieManager.makeCookie(response, "popupCookie", "Y", 3600);
		
		// 페이지 전환
		response.sendRedirect("cookieMain.jsp");
		//request.getRequestDispatcher("cookieMain.jsp").forward(request, response);

	%>
	
</body>
</html>