<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인 페이지</h2>
	<!-- 
		get : 쿼리스트링을 이용해서 데이터를 전달(주소이용)
		post : body영역을 통해 데이터를 전달
	 -->
	 
	<%
		// 로그인실패시
		String isError = request.getParameter("idError");
		if("1".equals(isError)){
			out.print("아이디, 비밀번호 확인해 주세요.");
		}
		// 삼항연산자방식
		//isError ? "아이디, 비밀번호 확인해 주세요." : "";
		
	%>
	<form action="/loginAction" method="post">
		<div class='loginbox'>
	        <div id='login'>
	            <input type="text" name="id" id="pw" placeholder='ID를 입력해주세요.' value="test"><br>
	            <input type="password" name="pw" id="pw" placeholder='PW를 입력해주세요.' value="1234">
	        </div>
	        <div id='button'>
	        <input type="submit" value="로그인">
	        </div>
	    </div>
	</form>
</body>
</html>