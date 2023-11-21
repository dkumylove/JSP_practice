<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	window.onload = function() {
		submitBtn.addEventListener('click', function(){
			// 콘솔에서 로그를 찍을때, 로 연결
			// 'event' + event = 문자열연결이라 로그홧인안됨
			// 스크립트는 이벤트에 의해서 동작되는 경우가 많다.
			console.log('event', event);
			console.log('event' + event);
			console.log('=============');
			//alert('버튼이 클릭되었습니다.');
			// 기본이벤트를 제거하는 함수
			event.preventDefault();
			console.log('기본이벤트를 제거 하였습니다.');
			
			// 유효성검사
			let res = validateForm(testForm);
			if(res) {
				// 폼 전송
				testForm.submit();
			}
			
		});
	}
	/*
		유효성검사 validation check
		form 요소를 매개변수로 받아서, form이 가지고 있는 요소의 값을 체크
		
		함수정의
		type 매개변수명
		function 함수이름(type){
		
		}
		form : 변수이름
	*/
	function validateForm(form) {
		// 유효성검사 결과 testForm울 submit
		// 체크로직을 모두 통과했다면 서버에 요청, 체크로직을 통과하지 못했다면 메시지 처리
		console.log(form.kor.value);
		if(form.kor.value == ''){
			alert('국어점수를 입력해주세요');
			form.kor.focus();
			return false;
		}
		console.log(form.eng.value);
		if(form.eng.value == ''){
			alert('영어점수를 입력해주세요');
			form.kor.focus();
			return false;
		}
		console.log(form.math.value);
		if(form.math.value == ''){
			alert('수학점수를 입력해주세요');
			form.kor.focus();
			return false;
		}
		return true;
	}
	
</script>
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
	
	<!-- form에 actiond을 주지 않은 경우, 동일한 페이지를 다시 한다. -->
	<h2>국, 영, 수 점수를 입력하면 평균을 내어 학점을 출력</h2>
	<form name="testForm">
		이름 : <input type="text" name="name" value="momo"><br>
		국어 : <input type="text" name="kor" value="90"><br>
		영어 : <input type="text" name="eng" value="80"><br>
		수학 : <input type="text" name="math" value="70">	<br>
		<!-- 
			폼에 버튼이 하나만 있다면 이 버튼은 서브밋 버튼
			서브밋버트은 폼을 전송하는 기본이벤트가 정의되어있다.
			
			유효성검사(validation 체크)를 진행하기 위해서는 기본이벤트를 제거하는 작업 필요
		 -->
		<button id="submitBtn">학점구하기</button><br>
	</form>
	<!-- 동일한 페이지가 다시 요청되어 form 태그 안에 요소를 출력 -->
	
	<br>
	<!-- 국, 영, 수 점수가 모두 입력되었을때만 출력 : if문 -->
	<c:if test="${not (empty param.kor or empty param.eng or empty param.math) }">
		<!-- 변수로 저장후 사용 -->
		<c:set var="sum" value="${param.kor + param.eng + param.math}"></c:set>
		<c:set var="avg" value="${sum / 3 }"></c:set>
			<!-- 입력받은 값 출력 -->
			<h2>입력받은 값</h2>
			이름 : ${param.name }<br>
			국어점수 : ${param.kor }<br>
			영어첨수 : ${param.eng }<br>
			수학점수 : ${param.math }<br>
			총점 : ${sum }<br>
			평균 : ${avg }<br>
		<br>
		<p>>=90 : A학점, >=80 : B학점, >=70 : C학점, >=60 : D학점 </p>
		<!-- 학점 계산하기 -->
		${param.name }의 학점은 
		<c:choose>
			<c:when test="${avg ge 90 }">A학점</c:when>
			<c:when test="${avg ge 80 }">B학점</c:when>
			<c:when test="${avg >= 70 }">C학점</c:when>
			<c:when test="${avg >= 60 }">D학점</c:when>
			<c:otherwise>F학점</c:otherwise>
		</c:choose>
		 입니다.
	</c:if>
	<hr>
	<!-- 추천하는 방식은 아님/ 알고있음 좋은 2가지 -->
	<form name="testForm1">
		국어 : <input type="text" name="kor" value=""><br>
		영어 : <input type="text" name="eng" value="80"><br>
		수학 : <input type="text" name="math" value="70">	<br>
		<button onclick="return validateForm(testForm1);">전송</button>
	</form>
	<hr>
	<form name="testForm2" onsubmit="return validateForm(testForm2);">
		국어 : <input type="text" name="kor" value=""><br>
		영어 : <input type="text" name="eng" value="80"><br>
		수학 : <input type="text" name="math" value="70">	<br>
		<button>전송</button>
	</form>
	
</body>
</html>