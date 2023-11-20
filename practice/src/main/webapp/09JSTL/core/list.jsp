<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h2>리스트를 출력하기</h2>
	<table>
		<tr>
			<th>일련변호</th>
			<th style="width: 30%">제목</th>
			<th style="width: 30%">내용</th>
			<th>작성자</th>
			<th style="width: 5%">작성일</th>
			<th style="width: 5%">조회수</th>
		</tr>
		
	<!-- 데이터가 없는경우, empty/ 만약 리스트의 사이즈가 0이라면 조회된 데이터가 없습니다를 출력 -->
	<c:if test="${empty list }" var="res">
		<tr >
			<td colspan="6" align="center">게시글이 존재하지 않습니다</td>
		</tr>
	</c:if>
	<!-- 데이터가 있는경우, 만약 리스트의 사이즈가 0이 아니라면 목록을 출력-->
	<c:if test="${not empty list }">
		<c:forEach items="${list }" var="dto">
			<tr>
				<td>${dto.num}</td>
				<td>${dto.title}</td>
				<td>${dto.content}</td>
				<td>${dto.id}</td>
				<td>${dto.postdate}</td>
				<td>${dto.visitcount}</td>
			</tr>
		</c:forEach>
	</c:if>
	</table>
	
	<c:forEach items="${list }" var="dto">
		${dto.title }
	</c:forEach>
	
	<hr>
	${list }
	
	<%=request.getAttribute("list") %>
	
</body>
</html>