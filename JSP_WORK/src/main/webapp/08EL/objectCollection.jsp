<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.momo.dto.Person"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
		//리스트 생성
		List<Object> aList = new ArrayList<>();
		aList.add("문자열");
		aList.add(new Person("momo",25));
		
		// 페이지 영역에 리스트 저장
		// el 표현언어를 사용하기 위해서는 내장객체에 값이 저장되어 있어야 한다.
		pageContext.setAttribute("aList", aList);
	%>
	<h3>List 컬럭션</h3>
	<!-- 영역을 저장하지 않아도 작은영역부터 차례로 탐색해서 있으면 출력한다. -->
	<br>${aList }
	<!-- 객체의 주소값이 출력(toString()의 호출결과)/ 오버라이딩하면 재정의한 값으로 출력가능 -->
	<br>${aList[0] }
	<br>${aList[1] }
	<br>${aList[1].name }
	<br>${aList[1].age }
	<!-- 값이 없어도 오류가 발생핮지 않는다. -->
	<br> 없어도 오류가 발생하지 않는다 === ${aList[2].age }
	<hr>
	
	<%
		Map<String, String> map = new HashMap<>();
		// key, value
		map.put("한글", "모모");
		map.put("Eng", "momo");
		
		pageContext.setAttribute("map", map);
	%>
	
	<h3>Map 컬랙션</h3>
	<ul>
		<li>
			한글
			<p>${map['한글']}</p>
			<p>${map["한글"]}</p>
			<!-- 한글은 .을 찍어서 접근 할 수 없다.
				\${} : 주석처리
			 -->
			<p>\${map.한글}</p>
			<p><%=map.get("한글") %></p>
		</li>
		<li>
			Eng
			<p>${map['Eng'] }</p>
			<p>${map["Eng"] }</p>
			<p>${map.Eng }</p>
			<p><%= map.get("Eng")%></p>
		</li>
	</ul>
	
	
</body>
</html>