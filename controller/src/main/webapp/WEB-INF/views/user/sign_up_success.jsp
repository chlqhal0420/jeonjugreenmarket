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

<style>


  
    /* 로그인하기 버튼 스타일 */
    .login-button {
        width: 200px;
        height: 46px;
        font-size: 16px;
        color: white;
        background-color: #7fad39;
        border: 1px solid #7fad39;
        cursor: pointer;
        border-radius: 4px;
        margin-top:50px;
    }
    .checkout {
    padding-top: 80px;
    padding-bottom: 150px;
}
</style>

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
								style="color: lightgrey;">02 정보입력</span> <span
								style="color: #7fad39; font-weight: bold;"> > </span> <span
								style="color: black;">03 가입완료</span>
						</h6>
					</div>
				</div>
					
					
					<!-- 작업할 곳 -->	
					<div class="text-center" style="font-weight: bold; font-size: 20px;">
    					<span style="color: orange;">회원가입이 정상적으로 처리</span>
   						<span style="color: black;">가 완료되었습니다. 감사합니다.</span>
					</div>				
				
				
				

				<!-- 작업할 곳 -->	
				
			</div>
		
			<div class="text-center">
					<button type="button" class="login-button" onclick="location.href='login.do'">로그인하기</button>
			
			</div>
		</div>
	</section>
	<!-- Checkout Section End -->

	<%@ include file="../include/footer.jsp"%>
	<!-- 푸터 -->

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