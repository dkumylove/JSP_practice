<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>JSTL 제어문을 통해 짝수/ 홀수 판단하기</h2>
	<c:set var="num" value="101"></c:set>
	<!-- 제어문에서 사용되는 속성
		test : if 문에서 사용할 조건 지정 (표현언어 사용 가능)
		var : 조건의 결과를 저장할 변수명
		scope : 변수가 저장될 영역
	 -->
	<c:if test="${num mod 2 eq 0}" var="result">
		<!-- 조건이 참일때만 실행됨/ else문장이 없음 : 단일조건문 처리만 가능-->
		<br>${num }은 짝수이다.
	</c:if>
	<c:if test="${not result}">
		<br>${num }은 홀수이다.
	</c:if>
	<br>result : ${result}
	<hr>
	
	<h2>문자열 비교와 else문장</h2>
	<c:set var="str" value="JSP"></c:set>
	<c:if test="${str eq 'Java' }" var="result">
		<br>\${str eq 'Java' }
		<br>문자열 : ${str }
	</c:if>
	<c:if test="${str ne 'Java' }">
		<br>\${str ne 'Java' }
		<br>문자열 : ${str }
	</c:if>
	<c:if test="${not result }">
		<br>\${not result }
		<br>문자열 : ${str }
	</c:if>
	<hr>
	
	<h2>조건식 주의사항</h2>
	<!-- el(표현언어)가 사용되지 않는경우 -->
	<!-- true 입력시 대소문자 상관없이 : true -->
	<c:if test="true" var="result4"></c:if>
	<c:if test="tRuE" var="result6"></c:if>
	<!-- 숫자 문자 입력시 : false -->
	<c:if test="100" var="result5"></c:if>
	<c:if test="str" var="result8"></c:if>
	<!-- 표현언어 " " 공백이 있을경우 : false -->
	<c:if test="${true} " var="result7"></c:if>
	result4 : ${result4 }<br>
	result5 : ${result5 }<br>
	result6 : ${result6 }<br>
	result7 : ${result7 }<br>	
	result8 : ${result8 }<br>
	
</body>
</html>