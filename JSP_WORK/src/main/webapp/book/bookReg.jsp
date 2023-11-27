<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.w-15{width: 15%; justify-content: center}
</style>

<script type="text/javascript">

	function regBook(){
		//location.href = "/book/bookRegProcess";
		document.regForm.submit();
	}
	
	
</script>

</head>
<body>

	
	<!-- header 외부파일 인클루드 -->
	<%@ include file="../header.jsp" %>
	
	
	<!-- 도서 등록 화면 -->
	
	<!-- 메인컨텐트 영역 시작 -->
	<!-- Begin Page Content -->
	<div class="container-fluid">
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">도서등록</h6>
			</div>
			<div class="card-body">
			
			<!-- 등록폼 -->
				<form name="regForm" method="post" action="/book/bookRegProcess">
					<div class="input-group mb-3">
					
						<span class="w-15 input-group-text" id="basic-addon1">도서명</span>
						<!-- 서버에 값을 넘길 요소 -->
						<input type="text" class="form-control"   name="title"
								aria-label="Username" aria-describedby="basic-addon1">
					</div>

					<div class="input-group mb-3">
						<span class="w-15 input-group-text" id="basic-addon1">작가명</span>
						<!-- 서버에 값을 넘길 요소 -->
						<input type="text" class="form-control"   name="author"
								aria-label="Username" aria-describedby="basic-addon1">
					</div>
					
					<div class="input-group mb-3">
						<span class="w-15 input-group-text" id="basic-addon1">도서소개</span>
						<!-- 서버에 값을 넘길 요소 -->
						<input type="text" class="form-control"   -name="content"
								aria-label="Username" aria-describedby="basic-addon1">
					</div>
			
					<div class="input-group mb-3">
						<span class="w-15 input-group-text" id="basic-addon1">표지이미지</span>
						<!-- 서버에 값을 넘길 요소 -->
						<input type="file" class="form-control" id="inputGroupFile01" name="imgFile">
						<%-- <label class="input-group-text" for="inputGroupFile01">Upload</label>--%>
					</div>							
					<p><button type="button" class="btn btn-primary" id="regBtn" onclick="regBook()">도서등록</button></p>
				</form>
			</div>
		</div>
	</div>
	<!-- 메인컨텐츠 여역 끝 -->
	
	<!-- footer 외부파일 인클루드 -->
	<%@ include file="../footer.jsp" %>
</body>
</html>