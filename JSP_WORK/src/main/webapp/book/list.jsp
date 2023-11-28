<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 부트스트랩 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<style type="text/css">
	.pointer {
		cursor : pointer;
	}
</style>	


<script type="text/javascript">

			
	// select 요소의 옵션을 선택하는 방법
	var searchField = '${pageDto.cri.searchField }';
		console.log("searchField : ", searchField);
	var options = searchForm.searchField.options;
	
	// select 요소의 옵션의 selected 속성을 제거
	for(let i = 0; i < options.length; i++){
		options[i].removeAttribute("selected");
	}
	// select 요소의 옵션의 selected 속성을 부여
	for(var i = 0; i < options.length; i++){
		console.log(options[i].value);
		if(options[i].value == searchField){
			options[i].setAttribute("selected", "selected");
		}
	}	
	
	/*
		스크립트에서 함수를 정의 하는 방법
	function 함수명(파람0, 파람1, ...){	
	}
	
	함수의 호출
	함수명(파람0, 파람1, ...);	
	*/
	
	function msg(str){
		alert(str);
	}
	
	function view(no) {
		location.href = "/book/view?no=" + no;
	}
	
	function regBook(){
		location.href = "/book/bookReg.jsp";
	}


// 화면 요청
// location.href = "/book/view?no=1"; 
</script>

</head>

<body>

	<!-- header 외부파일 인클루드 -->
	<%@ include file="../header.jsp" %>
	
	<!-- 도서목록을 출력합니다. -->
	<!-- 도서목록을 출력<br>
	${list } -->
	
	
				<!-- 메인컨텐트 영역 시작 -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">☆☆도서관</h1>
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="https://datatables.net">official DataTables documentation</a>.</p>

					<!-- DataTales searchForm -->

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">도서목록</h6>
                        </div>
                        <div class="card-body">
                       		<!-- 검색폼시작 -->
							<form name="searchForm" action="/book/list">
							<div align="right">
								<!-- pageNo : --> <input type="text" name="pageNo" value="${pageDto.cri.pageNo }" style="display: none;">
								<!-- num : --> <input type="text" name="num" value="" style="display: none;">
								<!-- amount : --> <input type="text" name="amount" value="" style="display: none;">
							</div>
							<div class="input-group">
							  <select class="form-select" name="searchField" id="inputGroupSelect04" aria-label="Example select with button addon">
							    
							    <!-- 선택된 요소의 value 값이 서버로 넘어감 -->
							    <option value="title" 
							    		${pageDto.cri.searchField eq 'title' ? 'selected' : '' }>도서명</option>
								<option value="author" 
										${pageDto.cri.searchField eq 'author' ? 'selected' : '' }>작가</option>
							  
							  </select>
							  <input type="text" name="searchWord" value="${pageDto.cri.searchWord }" placeholder="검색어를 입력하세요" class="form-control" aria-label="Text input with dropdown button">
							  <button class="btn btn-outline-secondary" type="submit">검색</button>
							</div>
							</form>
							<!-- 검색폼 끝 -->
							<br>
					 
                            <div class="table-responsive">
                                <table class="table table-bordered" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                      		<th>도서번호</th>
											<th>제목</th>
											<th>작가</th>
											<th>대여여부</th>
                                        </tr>
                                    </thead>
                                    <tbody>
										<!-- 리스트가 비어있으면 메시지 출력/ 데이터가 없는경우, empty/ 만약 리스트의 사이즈가 0이라면 조회된 데이터가 없습니다를 출력 -->
										<c:if test="${empty list }" var="res">
										<tr>
											<td colspan="4" align="center">목록이 존재하지 않습니다.</td>
										</tr>
										</c:if>
										<!-- 리스트가 있으면 도서록록 출력/ 데이터가 있는경우, 만약 리스트의 사이즈가 0이 아니라면 목록을 출력-->
										<c:if test="${not res }">
										<c:forEach items="${list }" var="dto">
										<tr>
											<th scope="row">${dto.no }</th>
											<th class = "pointer" onclick="view(${dto.no})">${dto.title }</th>
											<th>${dto.author }</th>
											<!-- Y/N -> 대여/대여중 -->
											<th>${dto.rentynStr }</th>
										</tr>
										</c:forEach>	
										</c:if> 
                                    </tbody>
                                </table>
								<!-- page navi -->
								<!-- pageDto가 request영역에 저장되어 있으면 페이지 블럭을 출력 -->
								<%@ include file="../06session/servletEx/PageNavi.jsp" %>	
                            </div>
                            <form action="/book/bookReg.jsp" name="regForm" method="post">
                            	<p><button type="button" onclick="regBook()" class="btn btn-primary" id="regBtn">도서등록</button></p>  
                            </form>   
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->
                <!-- 메인 컨텐츠 영역 끝 -->


	
	
	<%-- 
	<h2>도서목록 출력</h2>
	
	<form name="searchForm" action="/book/list">
	pageNo : <input type="text" name="pageNo" value="${pageDto.cri.pageNo }">
	num : <input type="text" name="num" value="">
	amount : <input type="text" name="amount" value="">
	<div class="input-group">
	  <select class="form-select" name="searchField" id="inputGroupSelect04" aria-label="Example select with button addon">
	    
	    <!-- 선택된 요소의 value 값이 서버로 넘어감 -->
	    <option value="title" 
	    		${pageDto.cri.searchField eq 'title' ? 'selected' : '' }>도서명</option>
		<option value="author" 
				${pageDto.cri.searchField eq 'author' ? 'selected' : '' }>작가</option>
	  
	  </select>
	  <input type="text" name="searchWord" value="${pageDto.cri.searchWord }" placeholder="검색어를 입력하세요" class="form-control" aria-label="Text input with dropdown button">
	  <button class="btn btn-outline-secondary" type="submit">검색</button>
	</div>
	</form>
	
	<table class="table">
		<thead>
		<tr>
			<th scope="col">도서번호</th>
			<th scope="col">제목</th>
			<th scope="col">작가</th>
			<th scope="col">대여여부</th>
		</tr>
		</thead>
		<tbody>
		<!-- 리스트가 비어있으면 메시지 출력/ 데이터가 없는경우, empty/ 만약 리스트의 사이즈가 0이라면 조회된 데이터가 없습니다를 출력 -->
		<c:if test="${empty list }" var="res">
		<tr>
			<td colspan="4" align="center">목록이 존재하지 않습니다.</td>
		</tr>
		</c:if>
		<!-- 리스트가 있으면 도서록록 출력/ 데이터가 있는경우, 만약 리스트의 사이즈가 0이 아니라면 목록을 출력-->
		<c:if test="${not res }">
		<c:forEach items="${list }" var="dto">
		<tr>
			<th scope="row">${dto.no }</th>
			<th class = "pointer" onclick="view(${dto.no})">${dto.title }</th>
			<th>${dto.author }</th>
			<!-- Y/N -> 대여/대여중 -->
			<th>${dto.rentynStr }</th>
		</tr>
		</c:forEach>	
		</c:if>
		</tbody>
	</table>
	<!-- page navi -->
	<!-- pageDto가 request영역에 저장되어 있으면 페이지 블럭을 출력 -->
	<%@ include file="../06session/servletEx/PageNavi.jsp" %>	
	--%>
	
	<!-- footer 외부파일 인클루드 -->
	<%@ include file="../footer.jsp" %>
	
<!-- 부트스트랩 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>