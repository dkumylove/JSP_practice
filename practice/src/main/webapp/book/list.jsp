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
	// 화면에서 동적처리
	// 화면을 처리하고 실행하기위해
	window.onload = function(){
		
		console.log('onload event ====');
		let logoutBtn = document.querySelector("#logoutBtn");
		let loginBtn = document.querySelector("#loginBtn");
		
		if(logoutBtn != null){
			// 로그아웃
			logoutBtn.onclick = function(){
				loginForm.action = "/book/logout";
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
				loginForm.action = "/book/bookLoginForm.jsp";
				loginForm.submit();
			});
		}
				
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
	
            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <form class="form-inline">
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
                    </form>

                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <!-- Nav Item - Alerts -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                <!-- Counter - Alerts -->
                                <span class="badge badge-danger badge-counter">3+</span>
                            </a>
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                    Alerts Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 12, 2019</div>
                                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-success">
                                            <i class="fas fa-donate text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 7, 2019</div>
                                        $290.29 has been deposited into your account!
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-warning">
                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 2, 2019</div>
                                        Spending Alert: We've noticed unusually high spending for your account.
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                            </div>
                        </li>

                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i>
                                <!-- Counter - Messages -->
                                <span class="badge badge-danger badge-counter">7</span>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown">
                                <h6 class="dropdown-header">
                                    Message Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="/img/undraw_profile_1.svg"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div class="font-weight-bold">
                                        <div class="text-truncate">Hi there! I am wondering if you can help me with a
                                            problem I've been having.</div>
                                        <div class="small text-gray-500">Emily Fowler · 58m</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="/img/undraw_profile_2.svg"
                                            alt="...">
                                        <div class="status-indicator"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">I have the photos that you ordered last month, how
                                            would you like them sent to you?</div>
                                        <div class="small text-gray-500">Jae Chun · 1d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="/img/undraw_profile_3.svg"
                                            alt="...">
                                        <div class="status-indicator bg-warning"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Last month's report looks great, I am very happy with
                                            the progress so far, keep up the good work!</div>
                                        <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Am I a good boy? The reason I ask is because someone
                                            told me that people say this to all dogs, even if they aren't good...</div>
                                        <div class="small text-gray-500">Chicken the Dog · 2w</div>
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                            </div>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>



						<form name="loginForm">
							<c:if test="${empty user_id}">
								<!-- Nav Item - User Information -->
		                        <li class="nav-item dropdown no-arrow">
		                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
		                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">로그인해주세요</span>
		                                <img class="img-profile rounded-circle"
		                                    src="/img/undraw_profile.svg">
		                            </a>
		                            <!-- Dropdown - User Information -->
		                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
		                                aria-labelledby="userDropdown">
		                                <a class="dropdown-item" id="loginBtn" data-toggle="modal" data-target="#logoutModal">
		                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
		                                    Login
		                                </a>
		                            </div>
		                        </li>
							</c:if>
							
							<c:if test="${not empty user_id}">
								<!-- Nav Item - User Information -->
		                        <li class="nav-item dropdown no-arrow">
		                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
		                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${user_id }님 환영합니다</span>
		                                <img class="img-profile rounded-circle"
		                                    src="/img/undraw_profile.svg">
		                            </a>
		                            <!-- Dropdown - User Information -->
		                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
		                                aria-labelledby="userDropdown">
		                                <a class="dropdown-item" href="#">
		                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
		                                    Profile
		                                </a>
		                                <a class="dropdown-item" href="#">
		                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
		                                    Settings
		                                </a>
		                                <a class="dropdown-item" href="#">
		                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
		                                    Activity Log
		                                </a>
		                                <div class="dropdown-divider"></div>
		                                <a class="dropdown-item" id="logoutBtn" data-toggle="modal" data-target="#logoutModal">
		                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
		                                    Logout
		                                </a>
		                            </div>
		                        </li>
							</c:if>
						</form>
                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">☆☆도서관</h1>
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="https://datatables.net">official DataTables documentation</a>.</p>

					<!-- DataTales searchForm -->
					<form name="searchForm" action="/book/list">
					<div align="right">
						pageNo : <input type="text" name="pageNo" value="${pageDto.cri.pageNo }">
						num : <input type="text" name="num" value="">
						amount : <input type="text" name="amount" value="">
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
                         
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">도서목록</h6>
                        </div>
                        <div class="card-body">
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
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->	
	
	
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