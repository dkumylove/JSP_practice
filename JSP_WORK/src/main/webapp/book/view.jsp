<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 부트스트랩 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">


</head>
<body>
	
	<script type="text/javascript">
		// 화면이 모두 불러 들여져 오면 실행
		window.onload = function(){
			//alert('test');
			// 이동하기 버튼을 클릭하면 리스트 페이지로 이동
			console.log('onload event ====');
			// 화면에 있는 요소를 선택해서 변수에 저장
			let listBtn = document.querySelector("#listBtn");
			// 리스트 버튼이 화면에 존재하면 이벤트를 추가
			if(listBtn != null){
				listBtn.onclick = function(){
					//alert('test');
					// 리스트 페이지로 이동
					//location.href = '/book/list';
					history.back();
					//searchForm.submit();
				}
			}
			
			deleteBtn.addEventListener('click', ()=>{
				// jsp를 단독으로 실행할 경우, 경로문제가 발생하지 않는다.
				// 같은 경로에 들어있기 때문
				// 하지만 서블릿으로 왔을떄는 경우, 경로문제가 발생할수 있다
				// 그래서 루트경로부터 풀로 경로를 적어주는 것이 오류가 발생하지 않도록 하는 방법이다.
				location.href = 
					'/book/bookDeleteProcess.jsp?no=${param.no }';
			});
		}
		
	</script>

	<h2>도서정보</h2>
	
	
	요청도서번호 : ${param.no }<br>
	도서정보 : ${bookDto }<br>
	도서번호 : ${bookDto.no }<br>
	도서명 : ${bookDto.title }<br>
	작사 : ${bookDto.author }<br>
	대여여부 : ${bookDto.rentynStr }<br>
	
	<button id="listBtn" type="button" class="btn btn-primary">리스트로 이동하기</button>
	<button id="editBtn" type="button" class="btn btn-primary">수정</button>
	<button id="deleteBtn" type="button" class="btn btn-primary">삭제</button>	
	<table border="1" class="table">
	<thead>
		<tr>
			<th>요청도서번호</th>
			<th>도서정보</th>
			<th>도서번호</th>
			<th>도서명</th>
			<th>작사</th>
			<th>대여여부</th>
		</tr>
		</thead>
		
		<tbody>
	<!-- 데이터가 없는경우, empty/ 만약 리스트의 사이즈가 0이라면 조회된 데이터가 없습니다를 출력 -->
	<%-- <c:if test="${empty list }" var="result">
		<tr >
			<td colspan="6" align="center">게시글이 존재하지 않습니다</td>
		</tr>
	</c:if> --%>
	<!-- 데이터가 있는경우, 만약 리스트의 사이즈가 0이 아니라면 목록을 출력-->
	<%--<c:if test="${not empty list }">
		<c:forEach items="${list }" var="dto"> --%>
			<tr>
				<td>${param.no }</td>
				<td>${bookDto }</td>
				<td>${bookDto.no }</td>
				<td>${bookDto.title }</td>
				<td>${bookDto.author }</td>
				<td><a onclick="">${bookDto.rentynStr }</a></td>
			</tr>
		<%--</c:forEach>
	</c:if> --%>
	</tbody>
	</table>

<!-- 부트스트랩 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	

</body>
</html>