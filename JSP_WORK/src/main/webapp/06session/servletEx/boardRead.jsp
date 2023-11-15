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
		// 화면이 모두 불러 들여져 오면 실행
		window.onload = function(){
			alert('test');
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
			
			deleteBtn.addEventListener('click', ()=>{
				// jsp를 단독으로 실행할 경우, 경로문제가 발생하지 않는다.
				// 같은 경로에 들어있기 때문
				// 하지만 서블릿으로 왔을떄는 경우, 경로문제가 발생할수 있다
				// 그래서 루트경로부터 풀로 경로를 적어주는 것이 오류가 발생하지 않도록 하는 방법이다.
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
		
		 <%	}%>
</body>
</html>