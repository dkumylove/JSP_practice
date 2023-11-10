<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>역션태그를 활용한 포워딩</h2>
	<!-- 
		페이지 전환(이동)
		page 영역은 공유되지 않고, request, session영역은 공유 된다.
	 -->
	
	<%
		// 한글꺠짐 방지
		//request.setCharacterEncoding("UTF-8");	
	
		// 내장객체 영역에 속성(값)을 저장
		pageContext.setAttribute("pageAttr", "페이지영역");
		request.setAttribute("requestAttr", "요청역역");
		
		//request.getRequestDispatcher("경록").forward(request, response);
	%>
	
	<jsp:forward page="forwardSub.jsp">
		<jsp:param value="액션태그 파라미터" name="param"/>
	</jsp:forward>
	
</body>
</html>