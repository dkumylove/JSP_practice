<%@page import="com.momo.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.none{
		display: none
	}
</style>
</head>

<body>

	<%
		String none = "none";
		String str = "안녕하세요";
	%>
	
	<script type="text/javascript">
		// 세가지 같은 결과
		//alert("none");
		//alert("<%=none%>");
		//alert('<%="none"%>');
		
		//alert("안녕하세요");
		//alert("<%=str%>");
		
		// popup
		/*
		document.querySelector("선택자");
		선택자 : #id, .클래스, 태그명
		*/
		// 한번 로그하고 실행
		window.onload = function(){
			// popupCookie 쿠키가 없으면 팝업을 화면에 출력
			<%
				String display = "none";
				// popupCookie가 없으면 
				if(!CookieManager.readCookie(request, "popupCookie").equals("Y")){
					display = "block";
				}
			%>
			
			// 화면에 출력
			document.querySelector("#popup").style.display="<%=display%>";
			
			// 체크박스에 체크되어있을때
			closeBtn.onclick = function(){
				// 닫기를 클릭하면 체크박스에 체크되었는지 확인
				if(document.querySelector('input[id=inactiveToday]').checked){
					// 서버에 연결 요청 방법(전송): 다른 페이지를 요청
					// 1. herf : queryStringd을 이용해서 파라미터를 전달
					// 2. form submit : form안에 요소들을 가지고 이동
					popupForm.submit();
				} else {
					// 팝업창 닫기
					document.querySelector("#popup").style.display="none";
				}
			}
		}
	</script>
	

	<h2 class="none">쿠키 - 팝업 연습</h2>
	
	<!-- 
		<%= none%> : 변수 선언후 사용
		<%="none"%>
		태그에 속성을 정의할때, 따움표와 쌍따옴표로 감싸주는 것 : 해당 속석의 값이 어디까지인지를 정의하는 것
		
		class 속성에 값을 여러개의 값으로 정의할수 있다.
		ex) class="none w30" -> 공백을 사용할수 있기때문에 꼭 속성을 "" 묶어줘야함.
	 -->
	<form action="cookieAcition.jsp" name="popupForm">
	<div id="popup" class="none">
        <h2 align="center">공지사항 팝업입니다.</h2>
        <div align="right">
	    <input type="checkbox" id="inactiveToday" name="inactiveToday" value="Y" checked/> 
	            하루 동안 열지 않음
	    <input type="button" value="닫기" id="closeBtn" /> 
        </div>
   	</div>
   	</form>

</body>
</html>