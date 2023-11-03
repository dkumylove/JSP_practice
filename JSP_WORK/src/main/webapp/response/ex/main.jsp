<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h2>로그인</h2>
	<%
		String loginErr = request.getParameter("loginErr");
		String loginId = request.getParameter("id");
		String msg = "";
		
		// 로그인오류메시지 출력
		if("1".equals(loginErr)){
			msg = "로그인실패 : 아이디/비밀번호를 확인해주세요";
		}
		out.print(msg);
		
		// 사용자 입력한 아이디 출력
		String id ="momo";
		
		if(loginId != null){
			id = loginId;
		}
		
	%>
	
	<!-- is : momo pw:1234 이면 loginOk페이지 전환
		아니면 오류메시지를 출력할수 있도록 main페이지로 파라미터 전달 -->
	
	<form action="login.jsp" method="post">
		아이디 : <input type="text" name="id" value="<%= id %>"><br>
		비밀번호 : <input type="password" name="pw" value="1234"><br>
		<input type="submit" value="로그인"><br>
	</form>

</body>
</html>