<%@page import="com.momo.dto.Criteria"%>
<%@page import="com.momo.dto.PageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<% 
	// Controller에서 request영역에 저장한 pageDto를 화면에서 사용할수 있도록 변수에 저장
	PageDto pageDto = null;
	if(request.getAttribute("pageDto") != null && !"".equals(request.getAttribute("pageDto"))){
		pageDto = (PageDto)request.getAttribute("pageDto");
	} else {
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
%>

</head>
<body>

	<!-- 페이지네이션 -->
	<nav aria-label="...">
	  <ul class="pagination">
	  
	  	<!-- 앞으로 가기 버튼 시작/ disabled : 비활성화 -->
	    <li class="page-item <%= pageDto.isPrev() ? "" : "disabled"%>">
	      <a class="page-link" onclick="goPage(<%=pageDto.getStartNo()-1 %>)">Previous</a>
	    </li>
	    <!-- 앞으로가기 버튼 끝 -->
	    
	    <%
	    	for(int i = pageDto.getStartNo(); i <= pageDto.getEndNo(); i++){
	    %>
			    <li class="page-item">
			    	<!-- href ="..." 링크로 이동할경우, 검색어가 유지되지 않음 -->
			    	<!-- 검색어 유지하기 위해 searchForm을 전송하는 goPage()를 생성 -->
			    	<!-- 링크를 함수 호출로 변경 onClick 이벤트가 발생하면 gopage() 호출 
			    			함수의 파리메터로 페이지번호를 넣어 주어야 한다.
			    	-->
			    	<a class="page-link <%=	pageDto.getCri().getPageNo() == i ? "active" : ""%>"
			    			 onclick="goPage(<%=i %>)"><%=i %></a>
			    </li>
	    <% 	} %>
	    
<!-- 	    active : 현제 피이지 번호 활성화
	    <li class="page-item active" aria-current="page">
	      <a class="page-link" href="#">2</a>
	    </li>
	    
	    <li class="page-item">
	    	<a class="page-link" href="#">3</a>
	    </li> -->
	    
	    <!-- 뒤로가기버튼 시작 -->
	    <li class="page-item <%= pageDto.isNext() ? "" : "disabled"%>">
	      <a class="page-link" onclick="goPage(<%= pageDto.getEndNo()+1%>)">Next</a>
	    </li>
	    <!-- 뒤로가기버튼 시작 -->
	  </ul>
	</nav>
	
	
	
	<!-- 부트스트랩 JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

</body>
</html>