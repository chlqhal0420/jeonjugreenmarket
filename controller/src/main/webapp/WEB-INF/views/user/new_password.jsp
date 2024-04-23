<!-- 화면완성-->
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

<script>
let signIn = false;
let checkId = false;
let checkIdFlag = false;


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
	// 폼 유효성 검사 결과에 따라 메시지 출력
	if (!isFormValid) {
		alert("입력 정보를 확인해주세요.");
	}

	return isFormValid; // 폼 유효성 검사 결과 반환
}
</script>

</head>

<body>
	 <%@ include file="../include/header.jsp"%> <!-- 헤더 -->

  <!-- 비밀번호 재설정 (토마토)-->
    <section class="breadcrumb-section set-bg" data-setbg="<%=request.getContextPath()%>/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>비밀번호 재설정</h2>
                        <div class="breadcrumb__option">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 비밀번호 재설정  끝 --> 

    <!-- 비밀번호 변경-->
  <section class="checkout spad">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-4">
                <div class="checkout__form">
                    <form action="newPasswordOK.do" method="post" onsubmit="return validation()">
                   
                        <!-- 새 비밀번호 입력 -->
                         <div class="text-left find-info-links">
                            <span style="margin-right: 12px;">새 비밀번호 등록</span>
                        </div>
                        <div class="mb-3">
	                        <div class="input-field-container">
	                            <input type="password" name="password" class="form-control custom-style" placeholder="새 비밀번호를 입력해주세요"
	                           onblur="passCheck(this)" maxlength="17" id="password">
	                        	<div id="id-validation-msg"></div>
	                        </div>
                        </div>
                         <!-- 새 비밀번호 재 입력 -->
                         <div class="text-left find-info-links">
                            <span style="margin-right: 12px;">새 비밀번호 확인</span>
                        </div>
                        <div class="mb-3">
	                        <div class="input-field-container">
	                            <input type="password" id="repassword" class="form-control custom-style" 
	                            placeholder="새 비밀번호를 한번 더 입력해주세요" onblur="rePassCheck(this)">
	                        	<div id="id-validation-msg"></div>
	                        </div>
                        </div>
                        
                      <!-- 확인 -->
                        <div class="text-center">
                            <button type="submit" class="btn custom-style custom-button-style">확인</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
    <!-- 비밀번호 변경 영역 마침 -->

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