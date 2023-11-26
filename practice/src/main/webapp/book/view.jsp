<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="/boardList" name="searchForm">
		num : <input type="text" name="num" value="${param.num }"><br>
		pageNo : <input type="text" name="pageNo" value="${param.pageNo }"><br>
		searchWord : <input type="text" name="searchWord" value="${param.searchWord }"><br>
		searchField :<input type="text" name="searchField" value="${param.searchField }"><br>
	</form>

	<h2>도서정보</h2>
	요청도서번호 : ${param.no }<br>
	도서정보 : ${bookDto }<br>
	도서번호 : ${bookDto.no }<br>
	도서명 : ${bookDto.title }<br>
	작사 : ${bookDto.author }<br>
	대여여부 : ${bookDto.rentyn }<br>
	
</body>
</html>