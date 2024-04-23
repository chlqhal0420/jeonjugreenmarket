<!-- 유효성검사, 휴대폰인증 완료 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>그린마켓</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main/elegant-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main/nice-select.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main/slicknav.min.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main/style.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main/sign_up.css"
	type="text/css">
<style>
.input-field-container {
	display: flex;
	flex-direction: column;
}

#id-validation-msg {
	margin-top: 5px;
	font-size: 15px;
}
</style>
<script>
	let signIn = false;
	let checkId = false;
	let checkIdFlag = false;
	function idCheck(obj){
	    let regex = /^[a-z]+[a-z0-9]{5,15}$/g;
	    let regRs = regex.test(obj.value);
	    let checkRs = document.getElementById('id-validation-msg');
	    
	    if(signIn){
	        return true;
	    }
	    checkIdFlag = false;
	    
	    if(obj.value == ""){
	        checkRs.innerHTML = '필수입력';
	        checkRs.style.color = 'red';
	        checkId = false;
	        return false;
	    }else if(!regRs || obj.value.length > 16){
	        checkRs.innerHTML = '6자이상 16자 이하의 영문 혹은 영문과 숫자를 조합';
	        checkRs.style.color = 'red';
	        checkId = false;
	        return false;
	    }else{
	        checkRs.innerHTML = '중복확인 필수';
	        checkRs.style.color = 'red';
	        checkId = true;
	        return true;
	    }
	}
	
	function duplicate(obj){
		 var userid = $('#userid').val();
		 let checkRs = document.getElementById('id-validation-msg');
		if(!checkId){
			alert("아이디 유효성 검사를 먼저 통과하세요.");
		}else{
			
	            $.ajax({
	                url: '<%=request.getContextPath()%>/check-username', // 서버의 URL
				type : 'GET',
				data : {
					userid : userid
				},
				success : function(data) {
					if (data.isUserIdAvailable) {
						alert('사용 가능합니다.');
						checkRs.innerHTML = '';
					} else {
						alert('이미 사용 중인 아이디 입니다.');
					}
				},
				error : function(xhr, status, error) {
					alert('오류가 발생했습니다. 다시 시도해주세요.');
				}
			});
		}
	}

	function passCheck(obj) {
		let regex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;
		let regRs = regex.test(obj.value)
		let checkRs = obj.nextElementSibling;
		if (obj.value == "") {
			checkRs.innerHTML = '필수입력.';
			checkRs.style.color = 'red';
			return false;
		} else if (!regRs) {
			checkRs.innerHTML = '8자 이상, 영문/숫자/특수문자(공백제외) 조합';
			checkRs.style.color = 'red';
			return false;
		} else {
			checkRs.innerHTML = '사용 가능.';
			checkRs.style.color = 'green';
			return true;
		}
	}

	function rePassCheck(obj) {
		let confirmPass = document.getElementById("password").value == obj.value;
		let checkRs = obj.nextElementSibling;
		if (obj.value == "") {
			checkRs.innerHTML = '필수입력';
			checkRs.style.color = 'red';
			return false;
		} else if (!confirmPass) {
			checkRs.innerHTML = '동일한 비밀번호를 입력';
			checkRs.style.color = 'red';
			return false;
		} else {
			checkRs.innerHTML = '사용 가능';
			checkRs.style.color = 'green';
			return true;
		}
	}

	function NameCheck(obj) {
		let regex = /^[가-힣a-zA-Z]+$/;
		let regRs = regex.test(obj.value);
		let checkRs = obj.nextElementSibling;
		if (obj.value == "") {
			checkRs.innerHTML = '필수입력';
			checkRs.style.color = 'red';
			return false;
		} else if (regRs) {
			checkRs.innerHTML = '사용 가능.';
			checkRs.style.color = 'green';
			return true;
		} else {
			checkRs.innerHTML = '한글과 영어만 입력가능';
			checkRs.style.color = 'red';
			return false;
		}
	}

	function emailCheck(obj) {
		let regex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		let regRs = regex.test(obj.value);
		let checkRs = obj.nextElementSibling;
		if (obj.value == "") {
			checkRs.innerHTML = '필수입력';
			checkRs.style.color = 'red';
			return false;
		} else if (!regRs) {
			checkRs.innerHTML = '올바른 형식의 이메일을 입력';
			checkRs.style.color = 'red';
			return false;
		} else {
			checkRs.innerHTML = '사용 가능';
			checkRs.style.color = 'green';
			return true;
		}
	}

	// Phone number validation function
	function phoneCheck(obj) {
		let regex = /^01([0-9])([0-9]{3,4})([0-9]{4})$/;
		let checkRs = obj.nextElementSibling;
		if (obj.value == "") {
			checkRs.innerHTML = '필수입력';
			checkRs.style.color = 'red';
			return false;
		} else if (!regex.test(obj.value)) {
			checkRs.innerHTML = '잘못된 휴대폰 번호';
			checkRs.style.color = 'red';
			return false;
		} else {
			checkRs.innerHTML = '사용 가능';
			checkRs.style.color = 'green';
			return true;
		}
	}

	function confirmCodefn(obj) {
		let regex = /^[0-9]{6}$/;
		let checkRs = obj.nextElementSibling;
		
		if (obj.value == "") {
			checkRs.innerHTML = '필수입력';
			checkRs.style.color = 'red';
			return false;
		} else if (!regex.test(obj.value)) {
			checkRs.innerHTML = '6자리 숫자만 입력';
			checkRs.style.color = 'red';
			return false;
		} else {
			checkRs.innerHTML = '';
			return true;
		}	
	}

	//휴대폰 중복확인 성공결과 저장
	let confirmPhone = false;

	function validation() {
		// 유효성 검사 결과를 저장할 변수
		let isFormValid = true;

		// 아이디 검사
		let userId = document.getElementById('userid');
		if (!idCheck(userId)) {
			isFormValid = false;
		}

		// 비밀번호 검사
		let password = document.getElementById('password');
		if (!passCheck(password)) {
			isFormValid = false;
		}

		// 비밀번호 확인 검사
		let rePassword = document.getElementById('repassword');
		if (!rePassCheck(rePassword)) {
			isFormValid = false;
		}

		// 이름 검사
		let name = document.getElementsByName('name')[0]; // name으로 가져오기 때문에 배열의 첫 번째 요소 사용
		if (!NameCheck(name)) {
			isFormValid = false;
		}

		// 이메일 검사
		let email = document.getElementsByName('email')[0]; // name으로 가져오기 때문에 배열의 첫 번째 요소 사용
		if (!emailCheck(email)) {
			isFormValid = false;
		}

		// 휴대폰번호 검사
		let phone = document.getElementsByName('phone')[0]; // name으로 가져오기 때문에 배열의 첫 번째 요소 사용
		if (!phoneCheck(phone)) {
			isFormValid = false;
		}

		// Check phone verification status
		if (!confirmPhone) {
			isFormValid = false;
		}

		// 폼 유효성 검사 결과에 따라 메시지 출력
		if (!isFormValid) {
			alert("입력 정보를 확인해주세요.");
		}

		return isFormValid; // 폼 유효성 검사 결과 반환
	}
</script>

</head>


<body>
	<%@ include file="../include/header.jsp"%>
	<!-- 헤더 -->

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="<%=request.getContextPath()%>/resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>회원가입</h2>
						<div class="breadcrumb__option">
							<a href="./index.html">Home</a> <span>Checkout</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-10">
					<div class="col-lg-12">
						<h6 style="text-align: right;">
							<span style="color: lightgrey;">01 약관동의</span> <span
								style="color: #7fad39; font-weight: bold;"> > </span> <span
								style="color: black;">02 정보입력</span> <span
								style="color: #7fad39; font-weight: bold;"> > </span> <span
								style="color: lightgrey;">03 가입완료</span>
						</h6>
					</div>
				</div>

				<div class="checkout__form register-form">
					<h4>회원가입</h4>
					<form action="joinOk.do" method="post" onsubmit="return validation()">
						<div class="input-group">
							<label>아이디<span class="required">*</span></label>
							<div class="input-field-container">
								<input type="text" name="userid" id="userid"
									placeholder="아이디를 입력해주세요" onblur="idCheck(this)" maxlength="16">
								<div id="id-validation-msg"></div>
							</div>
							<button type="button" id="check-username-btn"
								onclick="duplicate(this)">중복확인</button>
						</div>
						<div class="input-group">
							<label>비밀번호<span class="required">*</span></label>
							<div class="input-field-container">
								<input type="password" name="password" id="password"
									placeholder="비밀번호를 입력해주세요" onblur="passCheck(this)"
									maxlength="17">
								<div id="id-validation-msg"></div>
							</div>
						</div>
						<div class="input-group">
							<label>비밀번호 확인<span class="required">*</span></label>
							<div class="input-field-container">
								<input type="password" placeholder="비밀번호를  한번 더 입력해주세요"
									id="repassword" onblur="rePassCheck(this)" maxlength="17">
								<div id="id-validation-msg"></div>
							</div>
						</div>
						<div class="input-group">
							<label>이름<span class="required">*</span></label>
							<div class="input-field-container">
								<input type="text" name="name" placeholder="이름을 입력해주세요"
									onblur="NameCheck(this)" maxlength="20">
								<div id="id-validation-msg"></div>
							</div>
						</div>
						<div class="input-group">
							<label>이메일<span class="required">*</span></label>
							<div class="input-field-container">
								<input type="email" name="email"
									placeholder="예: greenmarket@green.com"
									onblur="emailCheck(this)">
								<div id="id-validation-msg"></div>
							</div>
						</div>
						<div class="input-group">
							<label>휴대폰번호<span class="required">*</span></label>
							<div class="input-field-container">
								<input type="tel" name="phone" placeholder="숫자만 입력해주세요"
									onblur="phoneCheck(this)" maxlength="11" id="phoneNumber">
								<div id="id-validation-msg"></div>
							</div>
							<button type="button" id="phoneNumberButton">인증번호 받기</button>
						</div>
						<div class="input-group">
							<label><span class="required"></span></label>
							<div class="input-field-container">
								<input type="tel" id="confirmCode" onblur="confirmCodefn(this)"
									maxlength="6">
								<div id="id-validation-msg"></div>
							</div>
							<button type="button" id="confirmCodeButton">인증번호 확인</button>

						</div>
						<!-- <div class="input-group">
							<label>권한<span class="required">*</span></label>
							<input type="radio" name="authority" value="ROLE_USER">일반
							<input type="radio" name="authority" value="ROLE_ADMIN">관리자 
						</div> -->

						<div class="submit-btn-container">
							<button type="submit" class="submit-btn">가입하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- Checkout Section End -->

	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp"%>

	<!-- 파이어베이스 -->
	<script type="module">
  import { initializeApp } from "https://www.gstatic.com/firebasejs/10.10.0/firebase-app.js";
  import { getAnalytics } from "https://www.gstatic.com/firebasejs/10.10.0/firebase-analytics.js";
  import { getAuth, signInWithPhoneNumber, RecaptchaVerifier } from "https://www.gstatic.com/firebasejs/10.10.0/firebase-auth.js";

  const firebaseConfig = {
    apiKey: "AIzaSyDkFq9HGBhrup7GwwhqM6oPkFjEKTBN0eg",
    authDomain: "jeonjugreenmarket.firebaseapp.com",
    projectId: "jeonjugreenmarket",
    storageBucket: "jeonjugreenmarket.appspot.com",
    messagingSenderId: "128508474047",
    appId: "1:128508474047:web:dd62378a1cad0bca55cc0a",
    measurementId: "G-H8N4CPC50J"
  };

  const app = initializeApp(firebaseConfig);
  const analytics = getAnalytics(app);
  const auth = getAuth(app); // 수정된 부분: 'app' 인스턴스를 명시적으로 전달
  auth.languageCode = 'ko';
	


		/*보이지 않는 리캡처*/
        window.recaptchaVerifier = new RecaptchaVerifier
        (auth, 'phoneNumberButton', {
            'size': 'invisible',
            'callback': (response) => {
                // reCAPTCHA solved, allow signInWithPhoneNumber.
                onSignInSubmit();
            }
            },auth);

		document.getElementById('phoneNumberButton')
			.addEventListener('click', (event)=>{
				event.preventDefault()
			
		

	        /*사용자 휴대전화로 인증코드 전송*/
	        const phoneNumber = document.getElementById('phoneNumber').value;
	        const appVerifier = window.recaptchaVerifier;

	        const auth = getAuth();
	        if(phoneNumber !=''){

			/*인증번호 전송클릭시 입력양식을 readonly로 변경*/
 			var phoneNumberInput = document.getElementById('phoneNumber');
   			 // 해당 input 요소를 읽기 전용으로 설정
   			 phoneNumberInput.readOnly = true;

	        signInWithPhoneNumber(auth,'+82'+phoneNumber, appVerifier)
	            .then((confirmationResult) => {
	            // SMS sent. Prompt user to type the code from the message, then sign the
	            // user in with confirmationResult.confirm(code).
	            window.confirmationResult = confirmationResult;
	            // ...
	            }).catch((error) => {
	            // Error; SMS not sent
	            // ...
	            }); 
			}   
		})


/*인증코드로 사용자 로그인처리*/
  document.getElementById('confirmCodeButton').addEventListener('click', (event) => {
    event.preventDefault();
const code = document.getElementById('confirmCode').value;

if(code != ''){
			confirmationResult.confirm(code).then((result) => {
			  // User signed in successfully.t
			  const user = result.user;
			  // ...
			  alert("인증에 성공하였습니다.");
			  confirmPhone=true;
			
			}).catch((error) => {
			  // User couldn't sign in (bad verification code?)
			 alert("잘못된 인증코드입니다.");
			});
	}
  })




	
</script>

	<!-- Js Plugins -->
	<script
		src="<%=request.getContextPath()%>/resources/js/main/jquery-3.3.1.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/main/bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/main/jquery.nice-select.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/main/jquery-ui.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/main/jquery.slicknav.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/main/mixitup.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/main/owl.carousel.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/main/main.js"></script>



</body>

</html>