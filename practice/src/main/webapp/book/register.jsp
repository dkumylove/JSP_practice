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

    <title>회원가입</title>

    <!-- Custom fonts for this template-->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../css/sb-admin-2.min.css" rel="stylesheet">

	<script type="text/javascript">
		window.onload = function() {
			regBtn.addEventListener('click', function(){
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
				let res = validationCheck(regForm);
				if(res) {
					// 등록요청
					regForm.action = "/book/regProcess"; // 요청URL설정
					regForm.method = "post";
					
					// 폼 전송 -> 새로운페이지 요청
					regForm.submit();
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
			
			// id
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
			
			// name
			console.log(form.name.value);
			if(form.name.value == ''){
				alert('이름를 입력해주세요');
				form.name.focus();
				return false;
			}
			if(form.name.value.length > 15){
				alert('이름의 길이가 15자를 초과 할 수 없어요');
				form.name.focus();
				return false;
			}
			
			// email
			console.log(form.email.value);
			if(form.email.value == ''){
				alert('email를 입력해주세요');
				form.email.focus();
				return false;
			}
			if(form.email.value.length > 100){
				alert('email의 길이는 100자를 초과 할 수 없어요');
				form.email.focus();
				return false;
			}
			// 정규식 패턴 문장열 생성
			let email_reg = /^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$/;
			// 패턴과 일치하는 확인
			if(!email_reg.test(form.email.value)){
				alert('email형식이 일치하지 않습니다');
				form.email.focus();
				return false;
			}
			
			// pw
			console.log(form.pw.value);
			if(form.pw.value == ''){
				alert('패스워드를 입력해주세요');
				form.pw.focus();
				return false;
			}
			console.log(form.pwCheck.value);
			if(form.pwCheck.value != form.pw.value){
				alert('비밀번호가 일치하지 않습니다. 비밀번호를 확인하세요');
				form.pwCheck.focus();
				return false;
			}
			if(form.pw.value.length > 10){
				alert('id의 길이는 10자를 초과 할 수 없어요');
				form.pw.focus();
				return false;
			}
			return true;
		}
		
		/*
		function getByteLength(str) {
			  // TextEncoder 객체 생성 (UTF-8 사용) : 한글 3byte로 계산됨
			  var encoder = new TextEncoder('utf-8');
			  // 문자열을 바이트 배열로 인코딩
			  var encoded = encoder.encode(str);
			  // 바이트 배열의 길이 반환
			  return encoded.length;
		}*/ 		
	</script>

</head>

<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">회원가입</h1>
                            </div>
                            <form class="user" name="regForm" onsubmit="return validateForm(this);">
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="id"
                                            name="id" placeholder="id">
                                </div>
                       			<div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="name"
                                            name="name" placeholder="name">
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control form-control-user" id="email"
                                        name="email" placeholder="email">
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user"
                                            id="pw" name="pw" placeholder="password">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user"
                                            id="pwCheck" name="pwCheck" placeholder="repeat password">
                                    </div>
                                </div>
                                <a id="regBtn" class="btn btn-primary btn-user btn-block">
                                    회원가입
                                </a>
                                <hr>
                                <a href="index.html" class="btn btn-google btn-user btn-block">
                                    <i class="fab fa-google fa-fw"></i> Register with Google
                                </a>
                                <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                    <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                                </a>
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="forgot-password.html">Forgot Password?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="login.html">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../js/sb-admin-2.min.js"></script>

</body>

</html>