<%@page import="com.login.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<script type="text/javascript">
		window.onload = function(){
	
			// 이동하기 버튼을 클릭하면 리스트 페이지로 이동
			console.log('onload event ====');
			let listBtn = document.querySelector("#listBtn");
			
			listBtn.onclick = function(){
				//alert('test');
				location.href = '/boardList';
			}
			
			// 수정 버튼을 클릭하면 수정 페이지로 이동
			
			// 삭제 버튼을 클릭하면 삭제 페이지로 이동
		}
	
	</script>



	<h2>상세보기</h2>
	요청 게시글 번호 : <%= request.getParameter("num") %><br>

	<button id="listBtn">리스트로이동</button>
	<!-- 
		글의 작성자만 수정삭제가 가능하게
		게시글의 id가 로그인한 id와 동일 하다면 수정 삭제 버튼 보여주기
	 -->
	 
	<%
		if(session.getAttribute("user_id") != null 
			&& session.getAttribute("user_id").equals(request.getAttribute("id"))){
			// 게시글 작성자면 버튼 출력
	%>
			<button id="editBtn">수정</button>
			<button id="deleteBtn">삭제</button>
			
	<%	} %>
	

	<%
		if(request.getAttribute("dto") != null){
			BoardDto dto = (BoardDto)request.getAttribute("dto");	
	%>
	
	<ul>
		<li>제목 : <%= dto.getTitle() %></li>
		<li>내용 : <%= dto.getContent() %></li>
		<li>작성자 : <%= dto.getId() %></li>
		<li>작성일 : <%= dto.getPostdate() %></li>
		<li>조회수 : <%= dto.getVisitcount() %></li>
	</ul>
	
	<%	} %>
	
</body>
</html>