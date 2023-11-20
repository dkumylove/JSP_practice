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
	
	<h2>다중 조건문</h2>
	
	<p>홀짝 판단하기</p>
	<!-- 변수선언 -->
	<c:set var="num" value="101"/>
	
	<!-- 다중 조건문 사용하기 -->
	<c:choose>
		<c:when test="${num mod 2 eq 0 }">
			num(${num })은 짝수입니다.
		</c:when>
		
		<c:otherwise>
			num(${num })은 홀수입니다.
		</c:otherwise>
	</c:choose>
	<hr>
	
	<h2>국, 영, 수 점수를 입력하면 평균을 내어 학점을 출력</h2>
	<p>>=90 : A학점, >=80 : B학점, >=70 : C학점, >=60 : D학점 </p>
	<!-- form에 actiond을 주지 않은 경우, 동일한 페이지를 다시 한다. -->
	<form action="">
		국어 : <input type="text" name="kor"><br>
		영어 : <input type="text" name="eng"><br>
		수학 : <input type="text" name="math">	<br>
		<button>학점구하기</button><br>
	</form>
	<!-- 동일한 페이지가 다시 요청되어 form 태그 안에 요소를 출력 -->
	
	<br>
	<c:if test="${not (empty param.kor or empty param.eng or empty param.math) }">
		<c:set var="sum" value="${param.kor + param.eng + param.math}"></c:set>
		<c:set var="avg" value="${sum / 3 }"></c:set>
			국어점수 : ${param.kor }<br>
			영어첨수 : ${param.eng }<br>
			수학점수 : ${param.math }<br>
			총점 : ${sum }<br>
			평균 : ${avg }<br>
		<br>
		<c:choose>
			<c:when test="${avg ge 90 }">학점은 A학점 입니다.</c:when>
			<c:when test="${avg ge 80 }">학점은 B학점 입니다.</c:when>
			<c:when test="${avg >= 70 }">학점은 C학점 입니다.</c:when>
			<c:when test="${avg >= 60 }">학점은 D학점 입니다.</c:when>
			<c:otherwise>학점은 F학점 입니다.</c:otherwise>
		</c:choose>
	</c:if>
	
</body>
</html>