<%@page import="com.momo.dto.Criteria"%>
<%@page import="com.momo.dto.PageDto"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.momo.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.odd {
		background-color: #E6E6FA;
	}
</style>
</head>
<body>

	
	<h2></h2>
	<%
		for(int i= 1; i <= 10; i=i+2){
			out.print("( i = " + i + " )");
		}
	%>
	<c:forEach	begin="1" end="10" step="2" var="i">
		i : ${i } /
	</c:forEach>
	<hr>

	<!-- 일반 for문의 경우 : current, index, var 3가지 값이 동일 -->
	<table border="1">
		<c:forEach begin="3" end="5" var="i" varStatus="loop">
			<!-- 첫번쨰 행인 경우, 버튼 출력 -->
			<c:if test="${loop.first }">
				<tr>
					<td colspan="6"><button>글쓰기</button></td>
				</tr>
			</c:if>
			<tr>
				<td>i : ${i }</td>
				<td>loop.current : ${loop.current }</td>
				<td>loop.index : ${loop.index }</td>
				<td>loop.count : ${loop.count }</td>
				<td>loop.first : ${loop.first }</td>
				<td>loop.last : ${loop.last }</td>
			</tr>
			<!-- 마지막 행인 경우, 버튼 출력 -->
			<c:if test="${loop.last }">
				<tr>
					<td colspan="6"><button>글쓰기</button></td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
	<hr>
	
	<h2>1~100까지 정수중 홀수의 합구하기</h2>
	<c:set var="sum" value="0"/>
	<c:forEach begin="1" end="100" var="num">
		<c:if test="${(num mod 2) eq 1 }">
			${sum = sum + num}
		</c:if>
	</c:forEach>
	<p>1 ~ 100 합 : ${sum }</p>
	<hr>
	
	<h2>1~100까지 정수중 홀수의 합구하기</h2>
	<c:set var="sum" value="0"/>
	<c:forEach begin="1" end="100" var="num">
		<c:if test="${(num mod 2) eq 1 }">
			${num }
		<c:set var="sum" value="${sum + num }" />
		</c:if>
	</c:forEach>
	<p>1 ~ 100 합 : ${sum }</p>
	<hr>
	
	<h2>향상된 for문 형태의 forEach 태그</h2>
	<%
		String[] rgba = {"red", "green", "blue", "black"};
		for(String color : rgba){
			out.print(color + "/");
		}
	%>
	<table border="1">
		<c:forEach items="<%=rgba %>" var="color" varStatus="loop">
			<!-- index : 0부터 시작
				 count : 1부터 시작(반복한 수만큼 증가)-->
			<c:set value='${loop.count mod 2 eq 1 ? "odd" : ""}' var="odd"></c:set>
			odd : ${odd }
			<tr class="${odd }">
				<td>color : ${color }</td>
				<td>loop.current : ${loop.current }</td>
				<td>loop.index : ${loop.index }</td>
				<td>loop.count : ${loop.count }</td>
				<td>loop.first : ${loop.first }</td>
				<td>loop.last : ${loop.last }</td>
			</tr>
		</c:forEach>
	</table>
	<hr>
	
	<h2>List 컬랙션 사용하기</h2>
	<%
		List<BoardDto> list = new ArrayList<>();

		list.add(new BoardDto("1", "제목1", "내용1", "id1", "2023-11-21", "10"));
		list.add(new BoardDto("2", "제목2", "내용2", "id2", "2023-11-22", "20"));
		list.add(new BoardDto("3", "제목3", "내용3", "id3", "2023-11-23", "30"));
		list.add(new BoardDto("4", "제목4", "내용4", "id4", "2023-11-24", "40"));
		
		//request.setAttribute("list", list);
	%>
	
	<!-- el표현언어를 통해 사용하기 위해서
		controller를 통해서 화면을 출력할 경우, 내장객체의 영역에 저장해 주고 있으므로 따로 선어하지 않아도 된다. -->
	<c:set var="list" value="<%=list %>"></c:set>
	<c:forEach items="${list }" var="board">
		<li>제목 : ${board.title } / 작성자 : ${board.id } / 작성일 : ${board.postdate }</li>
	</c:forEach>
	
	<h2>Map 컬랙션 사용하기</h2>
	<%
		Map<String, Object> map = new HashMap<>();
		map.put("boardDto", new BoardDto("1", "제목1", "내용1", "id1", "2023-11-21", "10"));
		map.put("pageDto", new PageDto(1, new Criteria()));
	%>
	<c:set var="map" value="<%=map %>"></c:set>
	제목 : ${map.boardDto.title }<br>
	총건수 : ${map.pageDto.totalCnt }<br>
	<hr>
	
	<h2>forTokens 태그 사용</h2>

	<%
		String rgb = "Red,Green,Blue,Black";
	%>
	
	<c:forTokens items="<%=rgb %>" delims="," var="color">
		<span style="color:${color}">${color }</span>
	</c:forTokens>
	
</body>
</html>