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
		// 화면이 모두 불러 들여져 오면 실행
		window.onload = function(){

			// 이동하기 버튼을 클릭하면 리스트 페이지로 이동
			console.log('onload event ====');
			// 화면에 있는 요소를 선택해서 변수에 저장
			let listBtn = document.querySelector("#listBtn");
			// 리스트 버튼이 화면에 존재하면 이벤트를 추가
			if(listBtn != null){
				listBtn.onclick = function(){
					//alert('test');
					// 리스트 페이지로 이동
					location.href = '/boardList';
				}
			}
			
			// 수정 버튼을 클릭하면 수정 페이지로 이동
			let editBtn = document.querySelector("#editBtn");
			
			
			// 삭제 버튼을 클릭하면 삭제 페이지로 이동
			let deleteBtn = document.querySelector("#deleteBtn");
			// 삭제 버튼이 화면에 존재하면 이벤트를 추가
			if(deleteBtn != null){
				// 삭제버튼에 이벤트 추가
				deleteBtn.addEventListener('click', function() {
					// 외부에 함수 정의하고 함수를 불러옴
					deleteFnc()								
				});
			}
		}
		
		// 게시글 삭제하는 함수 정의
		function deleteFnc(){
			// 컴펌창 : 확인, 취소 버튼이 출력
			// 확인 = true를 반환, 취소 = false를 반환
			if(confirm('정말 삭제하시겠습니까?')){
				alert('확인클릭');
				// 버튼을 클릭하면 삭제 컨튼롤러를 요청
				viewForm.action='/boardDelete';	
				viewForm.submit();
			} else {
				//alert('취소클릭');
			}
		}
	
	</script>



	<h2>상세보기</h2>
	<form method="post" name="viewForm">
		<input type="hidden" name="num" value="<%= request.getParameter("num") %>">
	</form>
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
<%-- 	<% 
		String user_id = "";
		if(session.getAttribute("user_id") != null ) {
			user_id = session.getAttribute("user_id").toString();
			if(user_id.equals(dto.getId())){
				out.print("<button id="editBtn">수정</button> ");
				out.print("<button id="deleteBtn">삭제</button>");
			}
		}
	%> --%>
	
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