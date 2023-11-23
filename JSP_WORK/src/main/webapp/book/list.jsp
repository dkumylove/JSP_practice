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

<style type="text/css">
	.pointer {
		cursor : pointer;
	}
</style>	

</style>
<script type="text/javascript">
	/*
	 	스크립트에서 함수를 정의 하는 방법
		function 함수명(파람0, 파람1, ...){	
		}
		
		함수의 호출
		함수명(파람0, 파람1, ...);	
	*/

	function msg(str){
		alert(str);
	}

	function view(no) {
		location.href = "/book/view?no=" + no;
	}

	// 화면 요청
	// location.href = "/book/view?no=1"; 

</script>

</head>

<body>

	<!-- header 외부파일 인클루드 -->
	<%@ include file="common/header.jsp" %>
	
	<!-- 도서목록을 출력합니다. -->
	<!-- 도서목록을 출력<br>
	${list } -->
	
	<h2>도서목록 출력</h2>
	<form action="/book/list" name="searchForm">
		<input name="pageNo">
		<input name="amount" value="5">
	</form>
	<table class="table">
		<thead>
		<tr>
			<th scope="col">no</th>
			<th scope="col">제목</th>
			<th scope="col">작가</th>
			<th scope="col">대여여부</th>
		</tr>
		</thead>
		<tbody>
		<!-- 리스트가 비어있으면 메시지 출력/ 데이터가 없는경우, empty/ 만약 리스트의 사이즈가 0이라면 조회된 데이터가 없습니다를 출력 -->
		<c:if test="${empty list }" var="res">
		<tr>
			<td colspan="4" align="center">목록이 존재하지 않습니다.</td>
		</tr>
		</c:if>
		<!-- 리스트가 있으면 도서록록 출력/ 데이터가 있는경우, 만약 리스트의 사이즈가 0이 아니라면 목록을 출력-->
		<c:if test="${not res }">
		<c:forEach items="${list }" var="dto">
		<tr>
			<th scope="row">${dto.no }</th>
			<th class = "pointer" onclick="view(${dto.no})">${dto.title }</th>
			<th>${dto.author }</th>
			<!-- Y/N -> 대여/대여중 -->
			<th>${dto.rentynStr }</th>
		</tr>
		</c:forEach>	
		</c:if>
		</tbody>
	</table>
	<!-- page navi -->
	<!-- pageDto가 request영역에 저장되어 있으면 페이지 블럭을 출력 -->
	<%@ include file="../06session/servletEx/PageNavi.jsp" %>	
	
	<!-- footer 외부파일 인클루드 -->
	<%@ include file="common/footer.jsp" %>
	
<!-- 부트스트랩 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>