<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>구구단</h2>
	<%	for(int dan = 2; dan < 10; dan++){%>
		<%=dan %>단<br>
		<%for(int i = 1; i < 10; i++){%>
			<%=dan %>*<%=i %> = <%=dan*i %><br>
		<%}
	}%>
	<hr>
		
	<c:forEach begin="2" end="9" var="dan" >
		<br>${dan }단
		<c:forEach begin="1" end="9" var="i">
			<br> ${dan } * ${i } = ${dan * i }
		</c:forEach>
	</c:forEach>

</body>
</html>