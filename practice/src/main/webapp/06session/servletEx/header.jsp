<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	#logo>nav>ul>li {
		float: left; /*가로로 출력하기 위해 float 속성을 사용*/
		width: 25%;
		height: 30px;
		list-style: none;
	}
	
	.floatClear {
		clear : both;
	}
</style>

</head>

<body>

	<header id="logo">
		<nav>
			<ul>
				<li>Home</li>
				<li>Board</li>
				<li>Contact</li>
				<li>Map</li>
			</ul>
			<hr class="floatClear">
			<ul>
				<!-- 로그인/ 로그아웃 링크 보여주기
					- 세션에 user_id가 null 이 아니면 로그아웃 링크
					- 아니면 로그인 링크를 화면에 출력	
				 -->
				<li>
					<form name="loginForm">
						<c:if test="${empty user_id}">
							<!-- <a href="loginform.jsp">로그인</a> -->
							<button id="loginBtn">로그인</button>
						</c:if>
						<c:if test="${not empty user_id}">
							user_id : ${user_id }님 환영합니다. <button id="logoutBtn">로그아웃</button>
							<!--<a href="logoutProcess">로그아웃</a> -->
						</c:if>
					</form>
				</li>
			</ul>
		</nav>
	</header>	
	<hr class="floatClear">
	
	
</body>
</html>