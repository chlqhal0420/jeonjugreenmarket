<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/login.css" type="text/css">
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/mypage_info.css" type="text/css"> 
 	
 	<script type="text/javascript">
	    var errorMessage = "<c:out value='${errorMessage}'/>";
	    console.log(errorMessage); // 콘솔에서 errorMessage의 값을 확인
	    $(document).ready(function() {
	        if(errorMessage) {
	            alert(errorMessage);
	        }
	    });
	</script>
</head>

<body>
	 <%@ include file="../include/header.jsp"%> <!-- 헤더 -->

 		 <!-- 마이그린 베너 -->
  <section class="breadcrumb-section set-bg" data-setbg="<%=request.getContextPath()%>/resources/img/repolho.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2> 마이 그린</h2>
                        <div class="breadcrumb__option">
                        </div>
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
								<!-- 비밀번호 재확인 섹션 시작 -->
            				<h5  style="font-size: 18px; font-weight: bold; margin-top: 20px; text-align: left;">비밀번호 재확인</h5>
           					 <p style="font-size: 15px; text-align: left;">회원정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.</p>
            <!-- 비밀번호 재확인 섹션 끝 -->
							<div style="margin-top: 20px; height: 2px; background-color: black;"></div>
							 
						</div>
					</div>
    <!-- 개인정보 수정을 위한 비밀번호 확인-->
  <section class="checkout spad">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-4">
                <div class="checkout__form">
                    <form action="mypage_confirmPass.do" method="post">
                     <!-- 아이디, 비밀번호 찾기-->
                       <!--  <div class="find-info-links">
                            <h5>비밀번호 재확인</h5>
               				<p>회원정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.</p>
                        </div> -->
                     <!-- 아이디, 비밀번호 입력-->
                        <div class="mb-3">
                            <input type="text" class="form-control custom-style" id="userid" value="<sec:authentication
								property="principal.username" />" readonly>
                        </div>
                        <div class="mb-3">
                            <input type="password" name="password" id="password" class="form-control custom-style" placeholder="현재 비밀번호를 입력해주세요">
                        </div>
                       
                        <div class="text-center">
                            <button type="submit" class="btn custom-style custom-button-style">확인</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
    <!-- 로그인 영역 마침 -->
				</div>
			</div>
		</div>
	
	</section>
	
	
    <!-- 페이징 끝 -->

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