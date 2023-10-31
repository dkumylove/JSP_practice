<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
	<!-- method를 지정하지 않은 경우 get방식으로 호출!! -->
	<p>
		<a href = "requestWebInfo.jsp?eng=Hello&han=안녕">GET 방식 요청</a>
	</p>
	<hr>
	
	<h2>2. 클라이언트의 요청 매개변수 읽기</h2>
		<!-- action: 어디로갈것인가? method: 방식 -->
		<form action="requestParameter.jsp" method="post">
			아이디 : <input type="text" name="id" value="momo">
			<br>
			성별 : <input type="radio" name="sex" value="man">
				  <input type="radio" name="sex" value="woman" checked="checked">
			<br>
			관심사항 : <input type="checkbox" name="favo" value="eco">경제
					<input type="checkbox" name="favo" value="pol">정치
					<input type="checkbox" name="favo" value="ent">연예
					<input type="checkbox" name="favo" value="it">IT
			<br>
			자기소개 : <textarea rows="4" cols="30" name="intro">만나서 반갑습니다.</textarea>
			<br>
			<!-- 폼에 버튼이 하나뿐인 경우에는 서브밋버튼으로 작용함 --> 
			<button>전송</button>
			
		</form>
	<hr>
	
	<h2>3. HTTP 요청 헤더 정보 읽기</h2>
	<a href = "requestHeader.jsp">요청 헤더 정보 읽기</a>
	
</body>
</html>