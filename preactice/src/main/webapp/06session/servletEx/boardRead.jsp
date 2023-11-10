<%@page import="com.momo.dto.BoardDto"%>
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
		window.onload = function() {
			// 이동하기 버튼을 클릭하면 리스트 페이지로 이동
			console.log('onload event ====');
			let listBtn = document.querySelector("#listBtn");
			
			listBtn.onclick = function(){
				alert('test');
				location.href = '/boardList';
			}
			
			deleteBtn.addEventListener('click', ()=>{
				location.href = 
					'/06session/servletEx/deleteProcess.jsp?num=<%=request.getParameter("num")%>';
			});
	
		}
		
	</script>
	
	<h2>게시글 상세보기</h2>	
	<button id="listBtn">리스트로 이동하기</button>
	<button id="editBtn">수정</button>
	<button id="deleteBtn">삭제</button>	
	<%	
		if(request.getAttribute("dto") != null){
			BoardDto dto = (BoardDto)request.getAttribute("dto");
	%>
	
	<br>제목 : <%= dto.getTitle() %>
	<br>내용 : <%= dto.getContent() %>
	<br>작성자 : <%= dto.getId() %>
	<br>작성일 : <%= dto.getPostdate() %>
	<br>조회수 : <%= dto.getVisitcount() %>
	
	 <%}%>
</body>
</html>