<%@page import="com.board.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>목록조회</h2>
	<p>jsp를 단독으로 실행할 경우, request 영역에 list를 저장하지 않으므로 null이 출력된다.</p>
	<p>Controller를 거처서 실행 -> Controllerd에서 리스트를 조회후 request영역에 저장 </p>
	
	<% List<BoardDto> list = (List<BoardDto>)request.getAttribute("list"); %>
	<table border="1">
		<tr>
			<th width="50%">제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<%
			// 조회 결과가 존재한다면 
			if(list != null && list.size()>0 ){
				// 반복문을 돌리면서 리스트 출력
				for(BoardDto dto : list){
		%>
		<tr>
			<!-- 제목을 클릭하면 상세보화면으로 이동(게시글의 num을 가지고 간다. -->
			<td><a href="/boardView?num=<%=dto.getNum()%>"><%= dto.getTitle()%></a></td>
			<td><%= dto.getId()%></td>
			<td><%= dto.getPostdate()%></td>
		</tr>
		
		<%		}
			} else {
				out.print("<tr><td colspan='3'>조회결과가 없습니다.</td></tr>");
			}%>
	</table>
</body>
</html>