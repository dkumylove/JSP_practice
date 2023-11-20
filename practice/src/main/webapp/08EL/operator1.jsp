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
		// 변수선언 및 값할당
		int num1 =3;
	
		// 페이지 영역에 값을 저장
		pageContext.setAttribute("num2", 4);
		pageContext.setAttribute("num3", "5");
		pageContext.setAttribute("num4", "8");
	%>
	
	<h3>변수 선언 및 할당</h3>
	<!-- num1은 영역(page, request, session, application)에 저장되지 않았으므로 출력되지 않음 -->
	<p>스클립츨릿에서 선언한 변수 : ${num1 }</p>
	<p>페이지영역에 저장한 변수 : ${num2 }, ${num3 }, ${num4 }</p>
	<p></p>
	<!-- 3.0버전 부터 대입연산자(=)를 이용하여 값을 대입 할 수 있다. -->
	<p>변수 할당 및 즉시 출력 : ${num1=7 }</p>
	<p>변수 할당 : ${num2=8; "" }</p>
	<p>할당된 값 출력 : ${num2 }</p>
	
	<hr>
	<p>num1=${num1 }, num2=${num2 }, num3=${num3 }, num4=${num4 }</p>
	
	<br>num1 + num2 = ${num1 + num2 }
	<br>num1 - num2 = ${num1 - num2 }
	<br>num1 * num2 = ${num1 * num2 }
	<br>num1 / num2 = ${num1 / num2 }
	<br>
	
	<!-- 표현언어를 이용하면 산술연산시 자동으로 숫자로 변환(문자형대의 숫자를 숫자로 변환하여 연산 -->
	<br>num3 / num4 = ${num3 / num4 }
	<br>num3 % num4 = ${num3 % num4 }
	<br>
	
	<!-- 문자형태의 연산자
		/ = div
		% = mod -->
	<br>num3 div num4 = ${num3 div num4 }
	<br>num3 mod num4 = ${num3 mod num4 }		
	<br>	
	
	<!-- + 연산자 : 문자열의 연결
		el표현언어 에서 + 엱샂자는 숫자와의 연산만 가능 -->
	<br>\${num1 + "str" }
	<br>${num1 + "35" }
	<br>
	
	<hr>
	<h3>비교연산자</h3>
	<!-- 문자 형대의 연산자 -->
	<!-- 문자형태의 연산자를 사용하면 코드를 좀더 직관적으로 작성 할 수 있다. -->
	<br>num1 == num4 : ${ num1 eq nun4 }
	<br>num4 > num3 : ${ num4 gt nun3 }
	<br>num1 < num3 : ${ num1 lt nun3 }
	<br>num2 >= num4 : ${ num2 ge nun4 }
	<br>
	<br>${num1 > num4 }
	
	<hr>
	<h3>논리연산자</h3>
	<br>num3 =< num4 && num3 == num4 : ${ num3 le num4 and num3 eq num4 }
	<br>num3 <= num4 || num3 != num4 : ${ num3 ge num4 or num3 ne num4 }
	
	<br>
	<p></p>
</body>
</html>