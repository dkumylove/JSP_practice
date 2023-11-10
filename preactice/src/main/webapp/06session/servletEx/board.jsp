<%@page import="com.momo.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%--= request.getAttribute("list") --%>
	<script type="text/javascript">
	// 화면에서 동적처리
	// 화면을 처리하고 실행하기위해
	window.onload = function(){
		
		console.log('onload event ====');
		let logoutBtn = document.querySelector("#logoutBtn");
		let loginBtn = document.querySelector("#loginBtn");
		if(logoutBtn != null){
			// 로그아웃
			logoutBtn.onclick = function(){
				loginForm.action = "/logout";
				loginForm.submit();
			}
		}
		if(loginBtn != null){
			// 로그인페이지로 이동
			loginBtn.addEventListener('click', function(){
				//alert('test');
				//loginForm.action = "loginForm.jsp";
				loginForm.action = "/06session/servletEx/loginForm.jsp";
				loginForm.submit();
			});
		}
	}
	</script>
	
	
	<!-- 로그인/ 로그아웃 링크 보여주기
		- 세션에 user_id가 null 이 아니면 로그아웃 링크
		- 아니면 로그인 링크를 화면에 출력	
	 -->
	 <form name="loginForm">
	<%

		Object user_id = session.getAttribute("user_id");
		if(user_id != null && !"".equals(user_id)){
		// 로그인한 사용자 -> 로그아웃 버튼 출력 -> 세션을 만료 시키고 로그인 페이지로 이동
	%>
		<%=session.getAttribute("user_id") %>님 환영합니다.
		<button id="logoutBtn">로그아웃</button>
		<!--<a href="logoutProcess">로그아웃</a> -->
	
	<%	} else { 
			// 로그인 하지 않은 사용자 -> 로그인버튼 출력 -> 로그인 페이지로 이동
	%>
		<!-- <a href="loginform.jsp">로그인</a> -->
		<button id="loginBtn">로그인</button>
	<%}%>

	<h2>게시판</h2>
	<%=session.getAttribute("user_id") %>
	<table border="1">
		<tr>
			<th>일련변호</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		
		<%
			if(request.getAttribute("list") != null) {
				List<BoardDto> list = (List<BoardDto>)request.getAttribute("list");
				for(BoardDto dto : list){		
		%>
		
		<tr>
			<td><%= dto.getNum()%></td>
			<td><a href="/boardRead?num=<%=dto.getNum()%>"><%= dto.getTitle()%></a></td>
			<td><%= dto.getContent()%></td>
			<td><%= dto.getId()%></td>
			<td><%= dto.getPostdate()%></td>
			<td><%= dto.getVisitcount()%></td>
		</tr>
	
		<%		}
			} %>
	</table>
	</form>
	
</body>
</html>