<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="" />
<meta name="author" content="" />
<title>관리자 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link href="<%=request.getContextPath()%>/resources/css/styles.css"
	rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body class="sb-nav-fixed">
	<div id="layoutSidenav">
		<%@ include file="../include/header.jsp"%>
		<div id="layoutSidenav_content">

			<div class="container-fluid px-4">
				<h3 class="mt-4">주문 내역 수정</h3>
				<br>
				<form action="#">
					<section>
						<h5><i class="bi bi-caret-right-fill"></i>주문상품 목록</h5>
						<h5><i class="bi bi-caret-right-fill"></i>주문결제 내역</h5>
						<h5><i class="bi bi-caret-right-fill"></i>주문자/배송지 정보</h5>
						<h5><i class="bi bi-caret-right-fill"></i>택배사/운송장번호</h5>
						
						
						
					</section>
					<div class="text-center">
						<button type="button" class="btn btn-dark btn-sm">저장</button>
				</form>
				<button type="button" class="btn btn-secondary btn-sm"
					onclick="location.href='order.do'">목록</button>
			</div>
		</div>



	



		<footer class="py-4 bg-light mt-auto">
			<div class="container-fluid px-4">
				<div class="d-flex align-items-center justify-content-between small">
					<div class="text-muted">Copyright &copy; Your GreenMarket
						2024</div>

				</div>
			</div>
		</footer>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/resources/js/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/datatables-simple-demo.js"></script>
</body>
</html>
