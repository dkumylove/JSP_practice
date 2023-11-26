<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>숫자 포맷 설정</h2>
     <c:set var="num" value="12345"/>
    <!-- 세자리컴마출력 -->	
    콤마 출력 :<fmt:formatNumber value="${num }"></fmt:formatNumber><br>
    콤마 출력 안함 :<fmt:formatNumber value="${num }" groupingUsed="false"></fmt:formatNumber><br>
     
    <!-- 변수에 저장/ currency 	: 통화 - 원화기호를 붙여줌 -->
    <fmt:formatNumber var="saveVar" value="${num }" type="currency"></fmt:formatNumber><br>
    변수에 저장된 값을 출력 : ${saveVar }<br>
     
    <!-- 변수에 저장/ percent -->
    타입지정 : <fmt:formatNumber value="0.3" type="percent"></fmt:formatNumber><br>
    <hr>
     
    <h2>패턴을 지정해서 숫자를 활용</h2>
    0, # : 자릿수를 의미함<br>
    0 : 자리수를 지정했는데 해당자시수가 없으면 0을 출력<br>
    # : 자리수를 지정했는데 해당자리수가 없으면 출력하지 않음 <br>
    300<br>
    00000 - 00300 - 자리수를 맞추고 싶을떄 (코드값을 출력)<br>
	##### - 300 - 그냥 숫자 출력할 떄 사용<br>
	<br>

	<c:set var="num1" value="12345.0111"/>
	
	형식없음 :<fmt:formatNumber value="${num1 }"/><br>
	0,000.0 : <fmt:formatNumber value="${num1 }" pattern="0,000.0"/><br>
	0,000,000.0 : <fmt:formatNumber value="${num1 }" pattern="0,000,000.0"/><br>
	#,###.## : <fmt:formatNumber value="${num1 }" pattern="#,###.##"/><br>
	###,###.000000 : <fmt:formatNumber value="${num1 }" pattern="###,###.000000"/><br>
    
    <fmt:formatNumber value="${num1 }" integerOnly="true" var="savaVar1"></fmt:formatNumber>
    정수부분만 : ${savaVar1 }<br>
    <hr>
    
    <h2>날짜 시간 활용</h2>
    
    <c:set var="today" value="<%= new java.util.Date() %>" />
    오늘날짜 : ${today }<br>
    
    <h4>날짜 포맷</h4>
    full : <fmt:formatDate value="${ today }" type="date" dateStyle="full"/> <br /> 
    short : <fmt:formatDate value="${ today }" type="date" dateStyle="short"/> <br />
    long : <fmt:formatDate value="${ today }" type="date" dateStyle="long"/> <br />
    default : <fmt:formatDate value="${ today }" type="date" dateStyle="default"/>
    medium : <fmt:formatDate value="${today }" type="date" dateStyle="medium"/><br>

    <h4>시간 포맷</h4> 
    full : <fmt:formatDate value="${ today }" type="time" timeStyle="full"/> <br /> 
    short : <fmt:formatDate value="${ today }" type="time" timeStyle="short"/> <br />
    long : <fmt:formatDate value="${ today }" type="time" timeStyle="long"/> <br />
    default : <fmt:formatDate value="${ today }" type="time" timeStyle="default"/>
    medium : <fmt:formatDate value="${today }" type="time" timeStyle="medium"/><br>
    
    <h4>날짜/시간 표시</h4>    
    <fmt:formatDate value="${ today }" type="both" dateStyle="full" timeStyle="full"/> 
    <br />
    <h4>pattern 지정후 출력</h4>
    <fmt:formatDate value="${ today }" type="both" pattern="yyyy-MM-dd hh:mm:ss"/> 
    
    <h4>타임존 설정</h4>
    <!-- 세계현정시(GMT, 대한민국보다 9시간 빠름 -->
    <fmt:timeZone value="GMT"> 
        <fmt:formatDate value="${ today }" type="both" dateStyle="full" timeStyle="full"/>
        <br />    
    </fmt:timeZone>
    <fmt:timeZone value="America/Chicago">
        <fmt:formatDate value="${ today }" type="both" dateStyle="full" timeStyle="full"/>
    </fmt:timeZone>
    <hr>
    
    <h2>글자 활용</h2>
    
    <h4>로케일 설정</h4>    
    <c:set var="today" value="<%=  new java.util.Date() %>"/>
    
    한글로 설정 : <fmt:setLocale value="ko_kr" />
    <fmt:formatNumber value="10000" type="currency" /> /
    <fmt:formatDate value="${ today }" /><br />

    일어로 설정 : <fmt:setLocale value="ja_JP" />
    <fmt:formatNumber value="10000" type="currency" /> /
    <fmt:formatDate value="${ today }" /><br />
    
    영어로 설정 : <fmt:setLocale value="en_US" />
    <fmt:formatNumber value="10000" type="currency" /> /
    <fmt:formatDate value="${ today }" /><br /> 
</body>
</html>