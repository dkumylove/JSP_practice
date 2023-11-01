<%@page import="com.momo.dto.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
		// request 영역에 2개의 값을 저장
		request.setAttribute("request_str", "request_str");
		request.setAttribute("request_person", new Person("momo", 30));
		
		String request_str = "값없음";
		Person request_person = new Person();
	
		if(request.getAttribute("request_str") != null){
			request_str = request.getAttribute("request_str").toString();
		}
		
		if(request.getAttribute("request_person") != null){
			request_person = (Person)request.getAttribute("request_person");
		}
		
		/*
		request_str = request.getAttribute("request_str") != null ?
				request.getAttribute("request_str").toString() : "값없음";
				
		*/
	%>
	
	<br><%= request_str%>
	<br><%= request_person%>
	
	<%
		// forward : request 영역 공유
		// Senderdirect : request 영역 공유 안됨
	%>

	<h2>forward된 페이지에서 request 영역 속성 값 읽기</h2>
	
	<%
		
		if(request.getParameter("isRedirect") != null){
			// redirect 2가지 방식
			/*
				redirect 방식 이용시 다음 요청 페이지에 값을 넘기는 방법
				request 영역 공유되지 않으므로 request영역에 값을 저장해도 유지되지 않음
				1. 쿼리스트링 이용방법
					쿼리스트링 이용시 getParamatet()메소드를 이용해서 값을 꺼내욜수 있다.
				2. session을 이용하는 방법
					세선은 서버에 저장되는 영역이므로 필요시 생성후 제거해 준다.
			*/
			request.setAttribute("isRedirect", 1);
			session.setAttribute("isRedirect", "1");
			response.sendRedirect("requestForward.jsp?isRedirect=1");
		} else {
			// forward 방식
			RequestDispatcher d = request.getRequestDispatcher("requestForward.jsp");
			d.forward(request, response);
		}
	
		// redirect 방식
		//response.sendRedirect("requestForward.jsp?isRedirect=1");
		
		// forward 방식
		//RequestDispatcher d = request.getRequestDispatcher("requestForward.jsp");
		//d.forward(request, response);
		
	%>
	
</body>
</html>