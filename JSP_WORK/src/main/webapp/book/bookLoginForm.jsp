<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Login</title>

    <!-- Custom fonts for this template-->
    <link href="../vendorfontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../css/sb-admin-2.min.css" rel="stylesheet">
    
    <script type="text/javascript">
		window.onload = function() {
			loginBtn.addEventListener('click', function(){
				// 콘솔에서 로그를 찍을때, 로 연결
				// 'event' + event = 문자열연결이라 로그홧인안됨
				// 스크립트는 이벤트에 의해서 동작되는 경우가 많다.
				console.log('event', event);
				console.log('event' + event);
				console.log('=============');
				//alert('버튼이 클릭되었습니다.');
				// 기본이벤트를 제거하는 함수
				event.preventDefault();
				console.log('기본이벤트를 제거 하였습니다.');
				
				// 유효성검사
				let res = validationCheck(loginFrm);
				if(res) {
					// 등록요청
					loginFrm.action = "/book/login"; // 요청URL설정
					loginFrm.method = "post";
					
					// 폼 전송 -> 새로운페이지 요청
					loginFrm.submit();
				}
				
			});
		}
		/*
			유효성검사 validation check
			form 요소를 매개변수로 받아서, form이 가지고 있는 요소의 값을 체크
			
			함수정의
			type 매개변수명
			function 함수이름(type){
			
			}
			form : 변수이름
		*/
		function validationCheck(form) {
			// 유효성검사 결과 testForm울 submit
			// 체크로직을 모두 통과했다면 서버에 요청, 체크로직을 통과하지 못했다면 메시지 처리
			console.log(form.id.value);
			if(form.id.value == ''){
				alert('id를 입력해주세요');
				form.id.focus();
				return false;
			}
			if(form.id.value.length > 10){
				alert('id의 길이는 10자를 초과 할 수 없어요');
				form.id.focus();
				return false;
			}

			console.log(form.pw.value);
			if(form.pw.value == ''){
				alert('패스워드를 입력해주세요');
				form.pw.focus();
				return false;
			}
			return true;
		}
			
	</script>

</head>

<body class="bg-gradient-primary">

	<%
		// 로그인 실패시 출력
		String isError = request.getParameter("isError");
		if("1".equals(isError)){
	%>
			<script type="text/javascript">
			alert("아이디, 비밀번호를 확인해 주세요.");
			</script>
	<% 	}
	%>
    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome!</h1>
                                    </div>
                                    <form class="user" name="loginFrm" onsubmit="return validateForm(this);">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                id="id" type="text" name="user_id" required="required" placeholder="id" value="test">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="pw" type="password" name="user_pw" required="required" placeholder="Password" value="1234">
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">Remember
                                                    Me</label>
                                            </div>
                                        </div>
                                        <a id="loginBtn" class="btn btn-primary btn-user btn-block">
                                            Login
                                        </a>
                                        <hr>
                                        <a href="index.html" class="btn btn-google btn-user btn-block">
                                            <i class="fab fa-google fa-fw"></i> Login with Google
                                        </a>
                                        <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                            <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
                                        </a>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="forgot-password.html">Forgot Password?</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="register.html">Create an Account!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="../vendorjquery/jquery.min.js"></script>
    <script src="../vendorbootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../vendorjquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../js/sb-admin-2.min.js"></script>

</body>

</html>