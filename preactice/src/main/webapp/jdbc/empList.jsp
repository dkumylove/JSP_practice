<%@page import="com.momo.dto.EmpDto"%>
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

	<h2>컨트롤러를 이용해서 사원목록을 출력해보자</h2>
	
	<%
		// jsp를 단독으로 실핼할 경우, null이 출력될수 있다.
		// 리스트를 불러와야하는데 DB에 접근해서 리스트를 조회할 권한이 없음
		// request.getAttribute()의 반환타입 Object타입이므로 형변환후 사용
		List<EmpDto> list = (List<EmpDto>)request.getAttribute("list");
		//out.print(list);
	
	%>
	
	<table border="1">
		<tr>
			<td>사번</td>
			<td>사원명</td>
			<td>주민등록번호</td>
		</tr>
		<%for(EmpDto dto: list){
			%>	
		<tr>
			<td><%= dto.getEmp_id()%></td>
			<td><%= dto.getEmp_name()%></td>
			<td><%= dto.getEmp_no()%></td>
		</tr>
		<%}%>
	</table>

</body>
</html>