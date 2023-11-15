<%@page import="com.momo.dto.Criteria"%>
<%@page import="com.momo.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 로그인 여부를 체크
		로그인을 했을 때 = 세션에 userId가 저장되어 있으면
			- 로그아웃 버튼을 출력
		없으면
			- 로그인 버튼을 출력
	 -->
	 <!-- 
	 	submit : form의 요소들을 파라미터로 가지고 서버에 요청
	 	action : 서버에 요청할 url 주소
	 	method : 요청방식 (get : 조회용 파라미터/ post : 등록, 수정용 파라미터)
	 	* 버튼생성했더라도 form안에 버튼이 하나밖에 없다면 해당 버튼은 서브밋 버튼이 된다.
	  -->
	<%--= request.getAttribute("list") --%>
	<script type="text/javascript">
	// 화면에서 동적처리
	// 화면을 처리하고 실행하기위해
	window.onload = function(){
		
		console.log('onload event ====');
		let logoutBtn = document.querySelector("#logoutBtn");
		let loginBtn = document.querySelector("#loginBtn");
		if(logoutBtn != null){
			// 로그아웃
			logoutBtn.onclick = function(){
				loginForm.action = "/logout";
				loginForm.submit();
			}
		}
		if(loginBtn != null){
			// 로그인페이지로 이동
			loginBtn.addEventListener('click', function(){
				//alert('test');
				// 같은 경로에 있는 파일을 호출할때는 오류가 발생하지 않는다.
				// 하지만 루트경로가 바뀌면 오류발생
				// 본인 위치기준으로 본인 부분만 바뀌기 떄문에 경로를 찾지 못함.
				//loginForm.action = "loginForm.jsp";
				// 실제경로를 가지고 움직이기 떄문에 오류발생이 낮음
				// 여러곳에서 사용하는 경우, 경로 전체를 입력해줘야함.
				loginForm.action = "/06session/servletEx/loginForm.jsp";
				loginForm.submit();
			});
		}
	}
	</script>
	
	
	<!-- 로그인/ 로그아웃 링크 보여주기
		- 세션에 user_id가 null 이 아니면 로그아웃 링크
		- 아니면 로그인 링크를 화면에 출력	
	 -->
	 <form name="loginForm">
	<%
		// getAttribute의 반환 타입은 Object이므로 형변환이 필요합니다.
		// nullpointException을 방지하기 위해서 null체크진행
		// 로그인 버튼이 나오려면 : 개발자 도구에서 쿠키 삭제후 board.jsp 실행
		// 로그아웃 버튼이 나오려면 : loginForm.jsp 페이지로 가서 로그인후 board.jsp 실행
		Object user_id = session.getAttribute("user_id");
		if(user_id != null && !"".equals(user_id)){
		// 로그인한 사용자 -> 로그아웃 버튼 출력 -> 세션을 만료 시키고 로그인 페이지로 이동
	%>
		<%=session.getAttribute("user_id") %>님 환영합니다.
		<button id="logoutBtn">로그아웃</button>
		<!--<a href="logoutProcess">로그아웃</a> -->
	
	<%	} else { 
			// 로그인 하지 않은 사용자 -> 로그인버튼 출력 -> 로그인 페이지로 이동
	%>
		<!-- <a href="loginform.jsp">로그인</a> -->
		<button id="loginBtn">로그인</button>
	<%}%>
	</form>
	
	<h2>게시판</h2>
	<%=session.getAttribute("user_id") %>
	<table border="1">
		<tr>
			<th>일련변호</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		
		<%
			if(request.getAttribute("list") != null) {
				List<BoardDto> list = (List<BoardDto>)request.getAttribute("list");
				for(BoardDto dto : list){		
		%>
		
		<tr>
			<td><%= dto.getNum()%></td>
			<td><a href="/boardRead?num=<%=dto.getNum()%>"><%= dto.getTitle()%></a></td>
			<td><%= dto.getContent()%></td>
			<td><%= dto.getId()%></td>
			<td><%= dto.getPostdate()%></td>
			<td><%= dto.getVisitcount()%></td>
		</tr>
	
		<%		}
			} %>
	</table>
	
	
	<!--
		페이지네비게이션 작성
			- 페이지 번호
			- 페이블럭당 페이지 수 pagePerBlock
				페이지 블럭의 시작번호 ~ 페이지 블럭의 끝번호를 구할수 있음
			- 총 게시물의 수 totalCnt
			- 페이지당 게시물의 수 amount
				진짜 블럭의 끝번호
	 -->
	 <%
	 	out.print("<br>페이지블럭시작 =======================================================");

		int startNo = 0;
	 	int endNo = 0;

	 	// 하나의 블럭에 몇개의 페이지를 보여줄것인가
	 	// 연산을 위해서 (올림처리를 위해) double 타입으로 선언
	 	// java에서 int/int = int, int/double = double
	 	double pagePerBlock = 10.0;
	 	
	 	Criteria cri = new Criteria();
	 	int totalCnt = 0;
	 	if(request.getAttribute("cri") != null &&!"".equals(request.getAttribute("cri"))){
	 		cri = (Criteria)request.getAttribute("cri");
	 		out.print("<br>요청페이지번호 - pageNo : " + cri.getPageNo());
	 		out.print("<br>페이지당 게시물수 - amount : " + cri.getAmount());
	 	}
	 	if(request.getAttribute("totalCnt") != null &&!"".equals(request.getAttribute("totalCnt"))){
	 		totalCnt = Integer.parseInt(request.getAttribute("totalCnt").toString());
	 		out.print("<br>총게시물의 수 : " + totalCnt);
	 	}
	 	
	 	// 페이지 블럭의 시작번호와 끝번호 구하기
	 	// 끝번호 구하기
	 	// 7페이지 요청 : 올림(7/10.0) * 10
	 	// 11페이지 요청 : 올림(11/10.0) * 10
	 	endNo = (int)(Math.ceil(cri.getPageNo() / pagePerBlock) * pagePerBlock);
	 	// 시작번호 구하기
	 	startNo = endNo - ((int)pagePerBlock - 1);
	 	out.print("<br>");
	 	
	 	// 페이지 블럭을 생성
	 	for(int i = startNo; i<= endNo; i++){
	 		out.print("<a href= '/boardList?pageNo=" + i + "'>" + i + "</a> ");
	 	}
	 %>
	
</body>
</html>