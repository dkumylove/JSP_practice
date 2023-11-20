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
	
	
	<%-- 객체생성 --%>
	<%
		BoardDto boardDto1 = new BoardDto();
		boardDto1.setContent("내용");
		boardDto1.setTitle("제목");
		
		request.setAttribute("boardDto1", boardDto1);
		
		// 위아래 내용은 같은 내용
	%>
	
	<jsp:useBean id="boardDto"
				class="com.momo.dto.BoardDto"
				scope="request"></jsp:useBean>
	
	<%-- setProperty매서드를 이용해서 속성값을 지정 --%>

	<jsp:setProperty property="content" name="boardDto" value="내용"/>
	<jsp:setProperty property="title" name="boardDto" value="제목"/>
	
	<%
		if(request.getAttribute("boardDto") != null){
			BoardDto dto = (BoardDto)request.getAttribute("boardDto");
	%>
		제목 : <%=dto.getTitle() %>
		내용 : <%=dto.getContent() %>
	
	<%	}%>
	
</body>
</html>