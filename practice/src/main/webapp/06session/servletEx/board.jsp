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
	user_id : ${user_id }
	
	<c:if test="${empty user_id}">
		<!-- <a href="loginform.jsp">로그인</a> -->
		<button id="loginBtn">로그인</button>
	</c:if>
	<c:if test="${not empty user_id}">
		${user_id }님 환영합니다.
		<button id="logoutBtn">로그아웃</button>
		<!--<a href="logoutProcess">로그아웃</a> -->
	</c:if>
	</form>
	
	<h2>게시판</h2>
	<%=session.getAttribute("user_id") %><br>
	<table border="1">
		<tr>
			<th>일련변호</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
	<!-- 데이터가 없는경우, empty/ 만약 리스트의 사이즈가 0이라면 조회된 데이터가 없습니다를 출력 -->
	<c:if test="${empty list }" var="result">
		<tr >
			<td colspan="6" align="center">게시글이 존재하지 않습니다</td>
		</tr>
	</c:if>
	<!-- 데이터가 있는경우, 만약 리스트의 사이즈가 0이 아니라면 목록을 출력-->
	<c:if test="${not empty list }">
		<c:forEach items="${list }" var="dto">
			<tr>
				<td>${dto.num}</td>
				<td><a href="/boardRead?num=${dto.num}">${dto.title}</td>
				<td>${dto.content}</td>
				<td>${dto.id}</td>
				<td>${dto.postdate}</td>
				<td>${dto.visitcount}</td>
			</tr>
		</c:forEach>
	</c:if>
	</table>
	
	<%-- <%= request.getAttribute("pageDto") %> --%>
	<!-- pageNavi include -->
	<%@include file="PageNavi.jsp" %>
	
</body>
</html>