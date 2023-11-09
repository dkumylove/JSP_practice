<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- include지시어로 감싼 JSP파일은 포함관계를 가지므로 같은 페이지
		페이지 여역이나 변수 등을 공유 
		다시 정의하면 오히려 오류가 발생한다. -->
	<ul>
		<li>String : <%= page_str %></li>
		<li>int : <%= page_int %></li>
		<li>person : <%= page_p.getAge() %>/<%=page_p.getName() %></li>
	</ul>
	
	<ul>
		<li>String : <%= pageContext.getAttribute("page") %></li>
		<li>int : <%= pageContext.getAttribute("page_int") %></li>
		<li>person : <%= pageContext.getAttribute("pagePerson") %></li>
	</ul>
	
</body>
</html>