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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/login.css" type="text/css">
</head>

<body>
<script>
    // 페이지 로드 시 URL에서 'error' 쿼리 파라미터 확인
    window.onload = function() {
        var urlParams = new URLSearchParams(window.location.search);
        if(urlParams.get('error') === 'true') {
            alert('아이디와 비밀번호를 확인해주세요');
        }
    }
</script>
	 <%@ include file="../include/header.jsp"%> <!-- 헤더 -->

  <!-- 회원 로그인 베너 시작 (토마토)-->
    <section class="breadcrumb-section set-bg" data-setbg="<%=request.getContextPath()%>/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>회원 로그인</h2>
                        <div class="breadcrumb__option">
                         
                            <span>전주그린마켓에 오신 것을 환영합니다.</span>
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
                    <form action="<%=request.getContextPath()%>/security/loginOk.do" method="post">
                     <!-- 아이디, 비밀번호 입력-->
                        <div class="mb-3">
                            <input type="text" class="form-control custom-style" name="username" placeholder="아이디를 입력해주세요">
                        </div>
                        <div class="mb-3">
                            <input type="password" name="password" class="form-control custom-style" placeholder="비밀번호를 입력해주세요">
                        </div>
                        <!-- 아이디, 비밀번호 찾기-->
                        <div class="find-info-links">
                            <a href="<%=request.getContextPath()%>/user/find_id.do" style="margin-right: 10px;">아이디 찾기</a>|
                            <a href="<%=request.getContextPath()%>/user/find_password.do" style="margin-left: 10px;">비밀번호 찾기</a>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn custom-style custom-button-style">로그인</button>
                        </div>
                        <div class="text-center">
                            <button type="button" class="btn custom-style custom-signup-button-style" onclick="location.href='<%=request.getContextPath()%>/user/sign_up_terms.do'">회원가입</button>
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