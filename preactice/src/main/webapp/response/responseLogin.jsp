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
		
		// id == momo, pw == 1234 로그인성공
		if("momo".equals(id) && "1234".equals(pw)){
			// 로그인성공
			// 페이지전환 -> 웹브라우저 -> 웹브라우저가 다시 요청
			// 기존 요청 정보가 공유되지 않는다.
			// 아이디를 파라미터로 넘겨주지 않으면 id값이 공유되지 않는다.
			response.sendRedirect("responseWelcome.jsp?id=" + request.getParameter("id"));
		} else {
			// 로그인실패
			// 기존 요청 정보가 공유된다
			request.getRequestDispatcher("responseMain.jsp?loginErr=1")
				.forward(request, response);
		}
			
	%>
	
	<!-- 웰컴으로 넘어가면서 보이지 않을 페이지 -->
	<h2> 페이지 전환하는 방법</h2>
	<p>sendRedirect - 요청하는 페이지가 바뀜</p>
	<p>forward</p>
	
	id : <%= id %><br>
	pw : <%= pw %><br>
	
</body>
</html>