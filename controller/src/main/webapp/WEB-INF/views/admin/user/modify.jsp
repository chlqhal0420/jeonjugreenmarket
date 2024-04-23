<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<!-- jQuery 라이브러리를 로드합니다. -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
    th {
        width: 15%;
    }
</style>
</head>
<body class="sb-nav-fixed">	
	<div id="layoutSidenav">
		<%@ include file="../include/header.jsp"%>
		<div id="layoutSidenav_content">
			<main>
				<div class="container px-4">
					<h3 class="mt-4">회원 정보 수정</h3>
					<br>

					<div class="card mb-6">
						<div class="card-body">
							<div class="table-responsive">
								<form action="modify.do" method="post">
								<input type="hidden" name="createdBy" value="${vo.createdBy }">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th style="background-color: lightgray">회원명</th>
												<td><input type="text" class="form-control" name="name"
													value="${vo.name}"></td>
											</tr>
											<tr>
												<th style="background-color: lightgray">아이디</th>
												<td><input type="text" class="form-control" name="userid"
													value="${vo.userid}"></td>
											</tr>
											<tr>
												<th style="background-color: lightgray">핸드폰</th>
												<td><input type="text" class="form-control"
													name="phone" value="${vo.phone}"></td>
											</tr>
											<tr>
												<th style="background-color: lightgray">이메일</th>
												<td><input type="text" class="form-control"
													name="email" value="${vo.email}"></td>
											</tr>
											<tr>
												<th style="background-color: lightgray">가입일시</th>
												<td>${vo.createdAt}</td>
											</tr>
											<tr>
												<th style="background-color: lightgray">수정일시</th>
												<td>${vo.modifiedAt}</td>
											</tr>
										</thead>
										<tbody>

										</tbody>
									</table>
									<div class="text-center">
										<button class="btn btn-dark btn-sm">저장</button>
											<input type="button" class="btn btn-secondary btn-sm"
											onclick="location.href='user.do'" value="목록"></input>
									</div>
								</form>
														
										
							</div>
						</div>
					</div>



				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your GreenMarket
							2024</div>
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
	<script src="<%=request.getContextPath()%>/resources/js/datatables-simple-demo.js"></script>
</body>
</html>
