<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>영역을 통해 전달된 객제 읽기</h3>
	
	<%
		/*
			표현언어(EL)를 이용한 형변화이 필요 없이 파리미터를 읽어 올수 있다.
			별도의 null처리를 하기 않아도 오류가 발생하지 않는다.
			객체를 사용하기 위해 임포트만 해주면 된다.
		*/
	
	%>
	
	<ul>
		<li>Person객체(parsonObj)
			<p>이름 : ${parsonObj.name}/ 나이 : ${parsonObj.age}</p>
		</li>
		<li>문자열
			<p>${requestScope.str }</p>
		</li>
		<li>숫자
			<p>${integer }</p>
		</li>		
	</ul>
</body>
</html>