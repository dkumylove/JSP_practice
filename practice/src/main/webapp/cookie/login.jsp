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
	<%
	String user_id = "momo"; 
			String checked = "";
			// user_id 쿠키 찾기
			// 요청 정보를 쿠키정보를 꺼내서 user_id값을 변수에 저장 
			// 쿠키는 request
			
			user_id = CookieManager.readCookie(request, "user_id");
			checked = !"".equals(user_id) ? "checked" : "";
			
			/*
			Cookie[] cookies = request.getCookies();
			
			if(cookies != null){
		for(Cookie cookie : cookies){
			if("user_id".equals(cookie.getName())){
				out.print("user_id를 찾았어요");
				user_id = cookie.getValue();
				checked = "checked";
				break;
			}
		}	
			}
			*/
			out.print("<br>checked 값 : " + checked);
	%>
	<form action="loginAction.jsp" method="post">
		<div class='loginbox'>
		
			<div id='login'>
				<input type="text" name="id" id="userid" placeholder='ID를 입력해주세요.' 
					required="required" value="<%= user_id%>"><br>
				<input type="password" name="pw" id="userpw" placeholder='PW를 입력해주세요.' 
				required="required" value="1234"><br> 
				<input
					type="checkbox" <%=checked %> name="save_check" value="Y">아이디 저장하기<br>
			</div>
			<div id='button'>
				<input type="submit" value="로그인">
			</div>
		</div>
		<div id='info'>
			<a href="">회원가입</a> <a href="">ID찾기</a> <a href="">PW찾기</a>
		</div>
	</form>
	
</body>
</html>