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
		쿠키, 헤더값을 읽을 수 있는 내장객체를 제공
		
		cookie : 쿠키를 읽을 때 사용
		header : 헤더정보를 읽을 떄 사용
		initParem : web.xml에 설정한 컨텍스트 초기화 매개변수 읽을떄 사용
		pageContext : JSP의 pageContext객체와 동일한 역할
	
	 -->
	<%
		// 쿠키매니져를 이용하여 쿠키를 생성
		CookieManager.makeCookie(response, "elCookie", "표현언어를이용해봅시다", 100);
		
		out.print("elCookie : " + CookieManager.readCookie(request, "elCookie"));
	%>
	<h3>쿠키 값 읽기</h3>
	elCookie : ${cookie.elCookie.value }
	
	<hr>
	
	<h3>HTTP 헤더 읽기</h3>
	<ul>
		<li>host : ${header.host }</li>
		<li>user-agent : ${header['user-agent']}</li>
		<li>cookie : ${header.cookie }</li>
	</ul>
	
	<hr>
	
	<h3>컨텍스트 초기화 매개변수</h3>
	initParam : ${initParam.INIT_PARAM }
	initParam : ${initParam.ㅇ걒ㄷㄱ }
	
	<hr>
	
	<h3>컨태스트 루트 경로 읽기</h3>
	경로를 지정하기 위해 종종 사용된다.
	<br>루트경로 : ${pageContext.request.contextPath }
	
</body>
</html>