<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h2>각 영역에 속성 읽기</h2>
	<ul>
		<li>페이지영역 : ${pageScope.pageValue}</li>
		<li>요청영역 : ${requestScope.requestValue}</li>
		<!-- 영역을 지정하지 않고 속성을 읽어 올수 있다. -->
		<li>세션영역 : ${sessionValue}</li>
		<li>어플리케이션영역 : ${applicationValue}</li>
	</ul>
	
</body>
</html>