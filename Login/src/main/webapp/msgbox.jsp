<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 메시지 출력후 다른페이로 이동 요청하거나 뒤로가기 -->
	<script type="text/javascript">
		alert('<%= request.getAttribute("msg")%>');
		// 만약 url의 값이 있다면 url 요청(location.href=null)
		let url = '<%= request.getAttribute("url")%>';
		if(url != ''){
			// url이 '' 아닐떄/ url로 이동
			location.href = url;
		} else {
			// url이 '' 일때/ 뒤로가기
			history.back();			
		}
	</script>
</body>
</html>