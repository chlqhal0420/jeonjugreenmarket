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
    <title>그린마켓 </title>
	<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/nice-select.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/style.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/find_id.css" type="text/css">
<script type="module">
import { initializeApp } from "https://www.gstatic.com/firebasejs/10.10.0/firebase-app.js";
import { getAnalytics } from "https://www.gstatic.com/firebasejs/10.10.0/firebase-analytics.js";
import { getAuth, signInWithPhoneNumber, RecaptchaVerifier } from "https://www.gstatic.com/firebasejs/10.10.0/firebase-auth.js";

// Initialize Firebase
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
const auth = getAuth(app);
auth.languageCode = 'ko';

/*보이지 않는 리캡처*/
window.recaptchaVerifier = new RecaptchaVerifier(auth, 'phoneNumberButton', {
  'size': 'invisible',
  'callback': (response) => {
      onSignInSubmit();
  }
}, auth);

function sendVerificationCode(phoneNumber) {
  const appVerifier = window.recaptchaVerifier;
  signInWithPhoneNumber(auth, '+82'+phoneNumber, appVerifier)
    .then((confirmationResult) => {
      window.confirmationResult = confirmationResult;
      alert('인증번호 전송했습니다.');
      $("#getVerificationCode").hide(); // "인증번호 받기" 버튼 숨기기
      $("#verifySection").show(); // "인증번호 확인" 섹션 보이기
      $("#confirmNumber").show(); // "인증번호 확인" 섹션 보이기
    }).catch((error) => {
      console.error("Error during signInWithPhoneNumber", error);
      alert("인증번호 전송에 실패했습니다.");
    });
}

function duplicate() {
  var name = $("input[name='name']").val();
  var phone = $("input[name='phone']").val();

  $.ajax({
    url: '<%=request.getContextPath()%>/find_user', // 서버로 보낼 URL
    type: 'POST', // HTTP 요청 방식
    data: {
      name: name,
      phone: phone
    }, // 서버로 보낼 데이터
    success: function(response) {
      if (response.userExists) {
        // User exists, now send the verification code
        sendVerificationCode(phone);
      } else {
        alert('일치하는 회원이 없습니다');
      }
    },
    error: function(xhr, status, error) {
      // 요청이 실패했을 때 실행할 코드
      alert("오류가 발생했습니다: " + error);
    }
  });
}

$(document).ready(function() {
  $("#phoneNumberButton").click(function() {
    duplicate(); // Call duplicate when the relevant button is clicked
  });
});



/*인증코드로 사용자 로그인처리*/
  document.getElementById('confirmCodeButton').addEventListener('click', (event) => {
    event.preventDefault();
const code = document.getElementById('confirmCode').value;

			confirmationResult.confirm(code).then((result) => {
			  // User signed in successfully.t
			  const user = result.user;
			  // ...
			  alert("인증에 성공하였습니다.");
			 document.getElementById('frm').submit();
			
			}).catch((error) => {
			  // User couldn't sign in (bad verification code?)
			 alert("잘못된 인증코드입니다.");
			});
	
  })
</script>

</head>

<body>
	 <%@ include file="../include/header.jsp"%> <!-- 헤더 -->

  <!-- 회원 로그인 베너 시작 (토마토)-->
    <section class="breadcrumb-section set-bg" data-setbg="<%=request.getContextPath()%>/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>아이디찾기</h2>
                        <div class="breadcrumb__option">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 회원 로그인 베너 끝 --> 

    <!-- 로그인 영역 -->
  <section class="checkout spad">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-4">
                <div class="checkout__form">
                    <form action="find_id.do" method="post" id="frm">
                     <!-- 이름입력-->
                      	<div class="text-left find-info-links">
                            <span style="margin-right: 12px;">이름</span>
                        </div>
                        <div class="mb-3">
	                        <div class="input-field-container">
	                            <input type="text" class="form-control custom-style" name="name" placeholder="이름을 입력해주세요" maxlength="20">
	                        	<div id="id-validation-msg"></div>
	                        </div>
                       	</div>
                        <!-- 휴대폰번호 입력 -->
                         <div class="text-left find-info-links">
                            <span style="margin-right: 12px;">휴대폰번호</span>
                        </div>
                        <div class="mb-3">
	                        <div class="input-field-container">
	                            <input type="text" name="phone" class="form-control custom-style" placeholder="휴대폰번호를 입력해주세요"
	                           maxlength="11" id="phoneNumber">
	                        	<div id="id-validation-msg"></div>
	                        </div>
                        </div>
                        <div style="display: none;" id="confirmNumber">
	                         <!-- 인증번호 입력 -->
	                         <div class="text-left find-info-links" >
	                            <span style="margin-right: 12px;">인증번호</span>
	                        </div>
	                        <div class="mb-3">
		                        <div class="input-field-container">
		                            <input type="text" id="confirmCode" class="form-control custom-style" placeholder="인증번호 6자리">
		                        	<div id="id-validation-msg"></div>
		                        </div>
	                        </div>
                       </div>
                      <!-- 인증번호 받기버튼 -->
                        <div class="text-center"  id="getVerificationCode" >
                            <button type="button" class="btn custom-style custom-button-style"  id="phoneNumberButton">인증번호 받기</button>
                        </div>
                        
                        <!-- 인증번호 확인버튼 -->
                        <div class="text-center" style="display: none;" id="verifySection">
                            <button type="button" id="confirmCodeButton" class="btn custom-style custom-signup-button-style">확인</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
    <!-- 로그인 영역 마침 -->

     <%@ include file="../include/footer.jsp"%> <!-- 푸터 -->

    <!-- 자바스크립트 -->
    <script src="<%=request.getContextPath()%>/resources/js/main/jquery-3.3.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/main/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/main/jquery.nice-select.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/main/jquery-ui.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/main/jquery.slicknav.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/main/mixitup.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/main/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/main/main.js"></script>

 

</body>

</html>