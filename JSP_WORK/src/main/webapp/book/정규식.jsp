<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.area1 {
		border: 1px solid;
		width: 500px;
		height: 300px;
		overflow: scroll;
	}
</style>
</head>
<body>

	<script type="text/javascript">
		window.onload = function() {
			btu1.addEventListener('click', function(){
				alert('test');
				// 생성자를 이용한 정규식 표현 객체 생성
				// 생성자의 매개값 : 패턴문자열을 지정
				let regExp = new RegExp('script');
				
				consolg.log(regExp, typeof(regExp), regExp instanceof RegExp) ;
			});
		}
	</script>
	
	
	<h1>정규 표현식</h1>
    <p>
        정규 표현식(Regular Expresison)이란, <br>
        특정 규칙을 가진 문자열을 검색하거나 치환할 때 사용하는 형식 언어이다. <br><br>

        정규 표식을 이용하면 입력된 문자열에 대해 특정 조건 검색이나 치환 시
        복잡한 조건을 제시할 필요 없이 간단하게 처리가 가능하다.
    </p> 
    
    <h2>1. 정규 표현식 객체 생성</h2>
    <p>
        정규 표현식 객체를 생성하기 위해서는 정규 표현식 리터럴과 RegExp 생성자 함수를 사용한다. <br>
        리터럴을 사용하는 것이 일반적이다. (/패턴/플래그)
    </p> 
    
    <button id="but1">실행</button>
    <div id="area1" class="area1"></div>

</body>
</html>