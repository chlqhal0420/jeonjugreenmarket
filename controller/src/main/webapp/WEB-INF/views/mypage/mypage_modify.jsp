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
	href="<%=request.getContextPath()%>/resources/css/main/mypage_info.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main/mypage_modify.css"
	type="text/css">
	<style>
		#changeNumberButton{
			    color: white;
   	 			background-color: #7fad39;
			    border: 1px solid #7fad39;
			    cursor: pointer;		
		}
	</style>
<script>
	let signIn = false;
	let checkPassFlag = false;
	
	function passCheckByAjax(obj) {
	    var password = $('#nowPassword').val();
	    let checkRs = document.getElementById('password-validation-msg');
	    
	    $.ajax({
	        url: '<%=request.getContextPath()%>/mypage/check_nowPassword',
	        type: 'POST', // 변경된 부분
	        contentType: "application/json", // 요청 본문의 타입을 지정
	        data: JSON.stringify({ password: password }), // JSON 형식으로 데이터 전송
	        success: function(data) {
	            if(data) {
	                checkRs.innerHTML = '';
	                checkPassFlag = true;
	            } else {
	                checkRs.innerHTML = "비밀번호가 일치하지 않습니다.";
	                checkRs.style.color = 'red';
	                checkPassFlag = false;
	            }
	        },
	        error: function(xhr, status, error) {
	            alert('오류가 발생했습니다. 다시 시도해주세요.');
	        }
	    });
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
			checkRs.innerHTML = '';
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
	/* let confirmPhone = false; */

	function validation() {
		// 유효성 검사 결과를 저장할 변수
		let isFormValid = true;

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
		/*  if (!confirmPhone) {
			isFormValid = false;
		}  */
		
		if(!checkPassFlag) {
			isFormValid = false;
		}

		// 폼 유효성 검사 결과에 따라 메시지 출력
		if (!isFormValid) {
			alert("입력 정보를 확인해주세요.");
		}

		return isFormValid; // 폼 유효성 검사 결과 반환
	}
	
	
	document.addEventListener('DOMContentLoaded', function() {
	    // "다른번호 인증" 버튼 클릭 이벤트
	    document.getElementById('changeNumberButton').addEventListener('click', function() {
	        var phoneNumberInput = document.getElementById('phoneNumber');
	        phoneNumberInput.readOnly = false;
	        phoneNumberInput.value = '';
	        document.getElementById('phoneNumberButton').style.display = 'block';
	        this.style.display = 'none';
	    });

	    // "인증번호 받기" 버튼 클릭 이벤트
	    document.getElementById('phoneNumberButton').addEventListener('click', function() {
	        // 인증 섹션을 보이게 합니다.
	        document.getElementById('verifySection').style.display = 'block';
	    });
	});
	
	//탈퇴하기
  function deleteUser(createdBy) {
    $.ajax({
      url: 'deleteUser.do', 
      method: 'POST',
      data: { createdBy: createdBy },
      success: function(data) {
    	  console.log(data);
    	  if(data==0){
    		  alert("탈퇴되지 않았습니다.");
    	  }else{
    		  alert("탈퇴 되었습니다.");
    		  window.location.href = "<%=request.getContextPath()%>/security/logout.do"; 
    	  }
      },
      error: function() {
        alert('데이터를 가져오는데 실패했습니다.');
      }
    });
  }
</script>

</head>

<body>
	<%@ include file="../include/header.jsp"%>
	<!-- 헤더 -->

	<!-- 마이그린 베너 -->
	<section class="breadcrumb-section set-bg"
		data-setbg="<%=request.getContextPath()%>/resources/img/repolho.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>마이 그린</h2>
						<div class="breadcrumb__option"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 마이그린 베너 끝 -->

	<!-- 마이페이지 목차 시작 -->
	<section class="blog spad">
		<div class="container">
			<div class="order row">
				<!-- 마이페이지 네비게이션 시작 -->
				<%@ include file="./import/mypage_nav.jsp"%>
				<!-- 마이페이지 네비게이션 끝-->
				<!-- 마이페이지 목차 끝 -->

				<!-- 주문내역 시작  -->
				<div class="main col-lg-9 col-md-7">
					<div class=" row">
						<div class="col-lg-12 text-left">
							<h2
								style="font-weight: bold; font-size: 24px; letter-spacing: 2px; color: rgb(51, 51, 51);">개인
								정보 수정</h2>

							<div
								style="margin-top: 20px; height: 2px; background-color: black;"></div>

						</div>
					</div>
					<!-- 개인정보 수정 영역 -->
					<div class="checkout__form register-form"
						style="margin-top: 70px; width: 80%; margin-left: auto; margin-right: auto;">
						<form action="mypage_modifyOk.do" method="post" onsubmit="return validation()">
							<div class="input-group">
								<label>아이디<span class="required">*</span></label> <input
									type="text" name="userid" value="${userVO.userid}" readonly>

							</div>
							<div class="input-group">
								<label>현재 비밀번호<span class="required">*</span></label>
								<div class="input-field-container">
									<input type="password" id="nowPassword" placeholder="비밀번호를 입력해주세요"  onblur="passCheckByAjax(this)">
									<div id="password-validation-msg"></div>
								</div>
							</div>
							<div class="input-group">
								<label>새 비밀번호<span class="required">*</span></label>
								<div class="input-field-container">
									<input type="password" id="password" name="password"
										placeholder="새 비밀번호를 입력해주세요" onblur="passCheck(this)"
									maxlength="17">
									<div id="id-validation-msg"></div>
								</div>
							</div>
							<div class="input-group">
								<label>새 비밀번호 확인<span class="required">*</span></label>
								<div class="input-field-container">
									<input type="password" id="repassword" onblur="rePassCheck(this)" maxlength="17"
										placeholder="새 비밀번호를  다시 입력해주세요">
									<div id="id-validation-msg"></div>
								</div>
							</div>
							<div class="input-group">
								<label>이름<span class="required">*</span></label> 
								<div class="input-field-container">								
								<input type="text" name="name" value="${userVO.name}" onblur="NameCheck(this)" maxlength="20">
								<div id="id-validation-msg"></div>
							</div>
							</div>
							<div class="input-group">
								<label>이메일<span class="required">*</span></label>
								<div class="input-field-container">
									<input type="email" name="email" onblur="emailCheck(this)" value="${userVO.email}">
									<div id="id-validation-msg"></div>
								</div>
							</div>
							<div class="input-group">
								<label>휴대폰번호<span class="required">*</span></label>
								<div class="input-field-container">
									<input type="tel" name="phone" value="${userVO.phone}"
										onblur="phoneCheck(this)" maxlength="11" id="phoneNumber"
										readonly>
									<div id="id-validation-msg"></div>
								</div>
								<!-- 초기에 보여지는 "다른번호 인증" 버튼 -->
								<button type="button" id="changeNumberButton">다른번호 인증</button>
								<!-- 초기에 숨겨진 "인증번호 받기" 버튼 -->
								<button type="button" id="phoneNumberButton"
									style="display: none;">인증번호 받기</button>
							</div>
						<div id="verifySection" style="display:none;">	
							<div class="input-group">
								<label><span class="required"></span></label>
								<div class="input-field-container">
									<input type="tel" id="confirmCode" onblur="confirmCodefn(this)"
										maxlength="6">
									<div id="id-validation-msg"></div>
								</div>
								<button type="button" id="confirmCodeButton">인증번호 확인</button>
							</div>
						</div>
							<div class="submit-btn-container">
								<button type="submit" class="submit-btn">회원정보수정</button>
								<button type="button" class="withdraw-btn" onclick="deleteUser(${userVO.createdBy})">탈퇴하기</button>
							</div>
						</form>
					</div>
					<!-- 개인정보 수정 영역 마침 -->
				</div>
			</div>
		</div>

	</section>
	<!-- 페이징 끝 -->

	<%@ include file="../include/footer.jsp"%>
	<!-- 푸터 -->

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
			 
			
			}).catch((error) => {
			  // User couldn't sign in (bad verification code?)
			 alert("잘못된 인증코드입니다.");
			});
	}
  })




	
</script>
	<!-- 파이어베이스 휴대폰 인증 끝 -->
	<!-- 자바스크립트 -->
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