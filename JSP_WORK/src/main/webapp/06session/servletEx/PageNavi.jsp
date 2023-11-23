<%@page import="com.momo.dto.Criteria"%>
<%@page import="com.momo.dto.PageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		// 함수는 onload함수 외부에 작성해야 한다.
		/**
		 * 입력받은 페이지로 이동
		 */
		function goPage(pageNo) {
			// 파라미터로 넘어온 페이지번호를 searchFormdp pageNo에 입력
			searchForm.pageNo.value = pageNo;
			searchForm.submit();
		}
	</script>

<!-- 부트스트랩 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<%-- 
	// Controller에서 request영역에 저장한 pageDto를 화면에서 사용할수 있도록 변수에 저장
	PageDto pageDto = null;
	if(request.getAttribute("pageDto") != null && !"".equals(request.getAttribute("pageDto"))){
		pageDto = (PageDto)request.getAttribute("pageDto");
	} else {
		// 게시글의 총 건수를 넣어 페이지 내비게이션을 생성
		pageDto = new PageDto(0, new Criteria());
	}
	
	/*
	int totalCnt = 160;
	Criteria cri = new Criteria(); // pageNo =1, amount =10
	cri.setPageNo(13);
	PageDto pageDto	= new PageDto(totalCnt, cri);
	
	/*
	int pageNo = 12;
	int startNo = 11;
	int endNo = 15;
	
	boolean prev = (startNo ==1)? false : true;
	boolean next = true;
	*/
--%>

</head>
<body>
pageDto : ${pageDto }<br>
startNo : ${pageDto.startNo }<br>
endNo : ${pageDto.endNo }<br>
prev : ${pageDto.prev ? "" : "disabled" }<br>
next : ${pageDto.next ? "" : "disabled" }
	<!-- 페이지네이션 -->
	<nav aria-label="...">
	  <ul class="pagination">
	  
	  	<!-- 앞으로 가기 버튼 시작/ disabled : 비활성화 -->
	    <li class='page-item ${pageDto.prev ? "" : "disabled" }'>
	      <a class="page-link" onclick="goPage(${pageDto.startNo - 1 })">Previous</a>
	    </li>
	    <!-- 앞으로가기 버튼 끝 -->
	    
	    
	    <c:forEach begin="${pageDto.startNo }" end="${pageDto.endNo }" var="i">
	        <li class="page-item">
		   	<!-- href ="..." 링크로 이동할경우, 검색어가 유지되지 않음 -->
		   	<!-- 검색어 유지하기 위해 searchForm을 전송하는 goPage()를 생성 -->
		   	<!-- 링크를 함수 호출로 변경 onClick 이벤트가 발생하면 gopage() 호출 
		   			함수의 파리메터로 페이지번호를 넣어 주어야 한다.
		   	-->
			   	<a class='page-link ${pageDto.cri.pageNo eq i ? "active" : "" }'
		   			 onclick="goPage(${i })">${i }</a>
			</li>
	    </c:forEach>
	    
	<%-- <%for(int i=pageDto.getStartNo(); i<=pageDto.getEndNo(); i++){ %>
	    <li class="page-item">
	    	<a class="page-link <%= pageDto.getCri().getPageNo() == i ? "active" : ""%>" 
	    		onclick="goPage(<%=i %>)"><%=i %></a>
	    </li>
    <%}%> --%>	    
<!-- 	    active : 현제 피이지 번호 활성화
	    <li class="page-item active" aria-current="page">
	      <a class="page-link" href="#">2</a>
	    </li>
	    
	    <li class="page-item">
	    	<a class="page-link" href="#">3</a>
	    </li> -->
	    
	    
	    
	    <!-- 뒤로가기버튼 시작 -->
	    <li class='page-item ${pageDto.next ? "" : "disabled" }'>
	      <a class="page-link" onclick="goPage(${pageDto.endNo +1 })">Next</a>
	    </li>
	    <!-- 뒤로가기버튼 시작 -->
	  </ul>
	</nav>
	
	
	
	<!-- 부트스트랩 JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

</body>
</html>