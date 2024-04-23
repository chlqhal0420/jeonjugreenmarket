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
thead {
	background-color: lightgray;
}
</style>
</head>
<body class="sb-nav-fixed">
	<%@ include file="../include/nav.jsp"%>
	<div id="layoutSidenav">
		<%@ include file="../include/header.jsp"%>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
				<p>HOME > 고객지원 > 1:1 상담문의</p>
					<h3 class="mt-4">고객지원</h3>
					<br>
					<form>
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th style="background-color: lightgray">검색어</th>
									<td><select>
											<option value="">작성자</option>
											<option value="">제목</option>
									</select> <input type="text" name="" size="40"></td>
								</tr>
							</tbody>
						</table>
						<div class="text-center">
							<input type="submit" value="검색" class="btn btn-dark btn-sm">
							<input type="reset" value="초기화" class="btn btn-secondary btn-sm">
						</div>
					</form>
					<br>

					<div class="card mb-4">
						<div class="card-header">
							<div class="row align-items-center">
								<div class="col">
									<i class="bi bi-cart-fill"></i> 등록된 상품 : 100 건
									&nbsp;&nbsp;&nbsp; 전체선택: <input type="checkbox"
										id="selectAllCheckbox" onclick="toggleAllCheckboxes()">
									<button class="btn btn-secondary btn-sm"
										onclick="deleteSelectedRows()">선택삭제</button>
								</div>
								
							</div>
						</div>

						<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr>
										<th>선택</th>
										<th>번호</th>										
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>상태</th>
										<th>관리</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<input type="checkbox" name="rowCheckbox" value="">
										</td>
										<td>1</td>										
										<td style="width:200px;">상품문의드립니다.</td>
										<td>김길동</td>
										<td>2024-03-31</td>
										<td>답변완료</td>
										<td><button class="btn btn-dark btn-sm">답변하기</button></td>
										
									</tr>
									<tr>
										<td>
											<input type="checkbox" name="rowCheckbox" value="">
										</td>
										<td>2</td>										
										<td style="width:200px;">상품문의드립니다.</td>
										<td>홍길동</td>
										<td>2024-03-31</td>
										<td>접수</td>
										<td><button class="btn btn-dark btn-sm">답변하기</button></td>
										
									</tr>
								</tbody>
							</table>
						</div>
						
						<script>
							function toggleAllCheckboxes() {
								var checkboxes = document
										.querySelectorAll('input[name="rowCheckbox"]');
								var selectAllCheckbox = document
										.getElementById('selectAllCheckbox');

								checkboxes
										.forEach(function(checkbox) {
											checkbox.checked = selectAllCheckbox.checked;
										});
							}

							function deleteSelectedRows() {
								var checkboxes = document
										.querySelectorAll('input[name="rowCheckbox"]:checked');
								if (checkboxes.length > 0) {
									var confirmation = confirm("정말로 삭제하시겠습니까?");
									if (confirmation) {
										checkboxes.forEach(function(checkbox) {
											var row = checkbox.closest('tr');
											row.remove();
										});

										// Uncheck the select all checkbox after deletion
										var selectAllCheckbox = document
												.getElementById('selectAllCheckbox');
										selectAllCheckbox.checked = false;
									}
								} else {
									alert("선택된 항목이 없습니다.");
								}
							}
						</script>
										
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
	<script
		src="<%=request.getContextPath()%>/resources/js/datatables-simple-demo.js"></script>
</body>
</html>
