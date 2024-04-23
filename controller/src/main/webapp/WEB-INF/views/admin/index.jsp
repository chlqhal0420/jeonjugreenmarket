<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
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
	
<style>
	li {
		font-size:20px;
	}
	
</style>

</head>
<body class="sb-nav-fixed">
	<div id="layoutSidenav">
		<%@ include file="include/header.jsp"%>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h3 class="mt-4">관리자 메인</h3>
					<br>
					<div class="card mb-4 mr-2">
						<div class="card-body text-center">
							<h5 class="card-title">전체 주문 현황</h5>
							<div class="d-flex flex-row justify-content-center">
								<div class="card mr-3" style="width: 10rem;">
									<div class="card-header">총 주문건수</div>
									<ul class="list-group list-group-flush">
										<li class="list-group-item">31</li>
									</ul>
								</div>
								&nbsp;
								<div class="card" style="width: 10rem;">
									<div class="card-header">총 주문액(오늘)</div>
									<ul class="list-group list-group-flush">
										<li class="list-group-item">200,000</li>
									</ul>
								</div>
								&nbsp;
								<div class="card" style="width: 11rem;">
									<div class="card-header">총 주문액(이번달)</div>
									<ul class="list-group list-group-flush">
										<li class="list-group-item">3,200,000</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="card-body text-center">
							<h5 class="card-title">주문상태 현황</h5>
							<div class="d-flex flex-row justify-content-center">
								<div class="card mr-3" style="width: 10rem;">
									<div class="card-header">입금대기</div>
									<ul class="list-group list-group-flush">
										<li class="list-group-item">0</li>
									</ul>
								</div>
								&nbsp;
								<div class="card" style="width: 10rem;">
									<div class="card-header">입금완료</div>
									<ul class="list-group list-group-flush">
										<li class="list-group-item">0</li>
									</ul>
								</div>
								&nbsp;
								<div class="card" style="width: 10rem;">
									<div class="card-header">상품준비중</div>
									<ul class="list-group list-group-flush">
										<li class="list-group-item">0</li>
									</ul>
								</div>
								&nbsp;
								<div class="card" style="width: 10rem;">
									<div class="card-header">배송준비중</div>
									<ul class="list-group list-group-flush">
										<li class="list-group-item">0</li>
									</ul>
								</div>
								&nbsp;
								<div class="card" style="width: 10rem;">
									<div class="card-header">배송중</div>
									<ul class="list-group list-group-flush">
										<li class="list-group-item">0</li>
									</ul>
								</div>
								&nbsp;
								<div class="card" style="width: 10rem;">
									<div class="card-header">배송완료</div>
									<ul class="list-group list-group-flush">
										<li class="list-group-item">1</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="card-body text-center">
							<h5 class="card-title">구매확정/클레임 현황</h5>
							<div class="d-flex flex-row justify-content-center">
								<div class="card mr-3" style="width: 10rem;">
									<div class="card-header">구매확정</div>
									<ul class="list-group list-group-flush">
										<li class="list-group-item">0</li>
									</ul>
								</div>
								&nbsp;
								<div class="card mr-3" style="width: 10rem;">
									<div class="card-header">구매미확정</div>
									<ul class="list-group list-group-flush">
										<li class="list-group-item">0</li>
									</ul>
								</div>
								&nbsp;
								<div class="card" style="width: 10rem;">
									<div class="card-header">취소</div>
									<ul class="list-group list-group-flush">
										<li class="list-group-item"><span
											class="${countCancel == 0 ? '' : 'badge text-bg-warning'}">
												<a href="cancel.do"
												style="color: black; text-decoration: none;">${countCancel != 0 ? countCancel : '0'}</a>
										</span></li>
									</ul>
								</div>

								&nbsp;
								<div class="card" style="width: 10rem;">
									<div class="card-header">환불</div>
									<ul class="list-group list-group-flush">
										<li class="list-group-item">0</li>
									</ul>
								</div>
								&nbsp;
								<div class="card" style="width: 10rem;">
									<div class="card-header">반품</div>
									<ul class="list-group list-group-flush">
										<li class="list-group-item">0</li>
									</ul>
								</div>
								&nbsp;
								<div class="card" style="width: 10rem;">
									<div class="card-header">교환</div>
									<ul class="list-group list-group-flush">
										<li class="list-group-item">0</li>
									</ul>
								</div>
							</div>
						</div>
					</div>


					<br>
					<h5>고객관리</h5>
					<table class="table border-dark">
						<thead class="table-secondary">
							<tr>
								<th>신규회원(오늘 기준으로 가입한 회원 수)</th>
								<th>방문회원(오늘 기준으로 쇼핑몰에 로그인한 회원 수)</th>
								<th>탈퇴회원(최근 일주일 동안 탈퇴한 회원 수 )</th>
								<th>총회원</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>0명</td>
								<td>0명</td>
								<td>0명</td>
								<td>0명</td>
							</tr>
						</tbody>
					</table>
					<br>
					<h5>최근 가입 회원</h5>
					<table class="table border-dark">
						<thead class="table-secondary">
							<tr>
								<th>가입일시</th>
								<th>아이디</th>
								<th>이름</th>
								<th>이메일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>2024-10-23</td>
								<td>goodcode</td>
								<td>홍길동</td>
								<td>test@test.com</td>
							</tr>
							<tr>
								<td>2024-10-23</td>
								<td>goodcode</td>
								<td>홍길동</td>
								<td>test@test.com</td>
							</tr>
							<tr>
								<td>2024-10-23</td>
								<td>goodcode</td>
								<td>홍길동</td>
								<td>test@test.com</td>
							</tr>
						</tbody>
					</table>
				</div>
			</main>
			
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; GreenMarket 2024</div>
					</div>
				</div>
			</footer>
		</div>
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
