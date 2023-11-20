<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>Cookie</h2>
	
	<h3>1. 쿠키 설정</h3>
	<%
		/*
			쿠키생성
			new Cookie(이름, 값);
				이름 : 쿠키를 구별할 실제 데이터
				값 : 쿠키에 저장할 실제 데이터
				기본생성자 없음, 값 넣어 줘야함
		*/
		Cookie cookie = new Cookie("myCookie", "value"); 
		
		// 쿠키가 유지될 시간을 초단위로 지정(3600초 = 1시간)
		cookie.setMaxAge(3600);
		
		// 생성한 쿠키를 응답객체를 통한 브라우저로 전달
		response.addCookie(cookie);
	%>

	<h3>2. 페이지 이동후 쿠키 값 확인</h3>
	<a href="cookieResult.jsp">저정된 쿠키값 확인</a>
	
</body>
</html>