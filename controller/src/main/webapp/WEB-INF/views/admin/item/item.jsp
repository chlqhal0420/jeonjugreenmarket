<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<!-- jQuery 라이브러리를 로드합니다. -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
thead {
	background-color: lightgray;
}
</style>
</head>
<body class="sb-nav-fixed">
	<div id="layoutSidenav">
		<%@ include file="../include/header.jsp"%>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<p>HOME > 상품관리 > 전체 상품관리</p>
					<h3 class="mt-4">전체 상품관리</h3>
					<br>
					
					<form action="item.do" method="get">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th style="background-color: lightgray">검색어</th>
									<td>
									<select name="searchType">
											<option value="itemNo" <c:if test="${param.searchType eq 'itemNo'}">selected</c:if>>상품코드</option>
											<option value="name" <c:if test="${param.searchType eq 'name'}">selected</c:if>>상품명</option>
									</select> 
									<input type="text" name="searchValue" value='' size="40"></td>
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
									<i class="bi bi-cart-fill"></i> 등록된 상품 : 100 건 &nbsp;&nbsp;&nbsp;
								전체선택: <input type="checkbox" id="selectAllCheckbox"
									onclick="toggleAllCheckboxes()">
								<button class="btn btn-secondary btn-sm"
									onclick="deleteSelectedRows()">선택삭제</button>
								</div>																				
								<div class="col text-end">
									<button class="btn btn-primary btn-sm" onclick="location.href='register.do'">상품등록</button>
								</div>
							</div>
						</div>

						<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr>
										<th>선택</th>
										<th>이미지</th>
										<th>상품코드</th>
										<th>상품명</th>
										<th>상품가격</th>
										<th>재고</th>
										<th>등록일</th>
										<th>판매여부</th>
										<th>삭제여부</th>
										<th>과세유형</th>
										<th>관리</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="item" items="${list}">
									<tr>
										<td>
											<input type="checkbox" name="rowCheckbox" value="">
										</td>
										<td><img src="<%=request.getContextPath()%>/resources/upload/${item.image}" width="100" height="100"></td>
										<td>${item.itemNo}</td>
										<td>${item.name}</td>
									    <td class="price">${item.price}</td>
               						    <td class="stock">${item.stock}</td>
										<td>${item.createdAt}</td>									
										<td>${item.salesStatus}</td>									
										<td>${item.delyn}</td>									
										<td>${item.taxationType}</td>									
										<td>
											<button class="btn btn-dark btn-sm" onclick="location.href='itemModify.do?itemNo=${item.itemNo}'">수정</button>
										</td>
									</tr>
									
								</c:forEach>
									
								</tbody>
							</table>
						</div>
					</div>
					
					
					<script>
						// 페이지가 로드된 후 실행되는 함수
						document
								.addEventListener(
										"DOMContentLoaded",
										function() {
											// 가격과 재고 열에 대한 요소를 선택하여 처리
											var priceCells = document
													.querySelectorAll(".price");
											var stockCells = document
													.querySelectorAll(".stock");

											// 가격과 재고 각각에 대해 포맷 함수 호출
											priceCells
													.forEach(function(cell) {
														cell.textContent = formatNumber(cell.textContent);
													});

											stockCells
													.forEach(function(cell) {
														cell.textContent = formatNumber(cell.textContent);
													});
										});

						// 숫자를 천 단위로 포맷하는 함수
						function formatNumber(number) {
							return Number(number).toLocaleString();
						}
					</script>

					<script>
						function toggleAllCheckboxes() {
							var checkboxes = document
									.querySelectorAll('input[name="rowCheckbox"]');
							var selectAllCheckbox = document
									.getElementById('selectAllCheckbox');

							checkboxes.forEach(function(checkbox) {
								checkbox.checked = selectAllCheckbox.checked;
							});
						}

						function deleteSelectedRows() {
							var selectedItems = [];
							$('input[name="rowCheckbox"]:checked').each(
									function() {
										selectedItems.push($(this)
												.closest('tr').find(
														'td:nth-child(3)')
												.text()); // 상품코드를 배열에 추가
									});

							if (selectedItems.length === 0) {
								alert("삭제할 항목을 선택해주세요.");
								return;
							}

							// Ajax를 이용하여 선택된 항목을 삭제
							$.ajax({
								url : 'deleteItems.do',
								type : 'POST',
								traditional : true, // 배열 형태의 데이터 전달을 위해 필요
								data : {
									itemNo : selectedItems
								}, // 선택된 상품코드들을 서버로 전달
								success : function(response) {
									console.log('서버로부터 응답 받음:', response);
									if (response === 1) {
										alert("선택된 항목이 성공적으로 삭제되었습니다.");
										location.reload();
									} else if (response === 0) {
										alert("선택된 항목이 삭제되지 않았습니다.");
									} else {
										alert("삭제 중 오류가 발생했습니다.");
									}
								},
								error : function() {
									alert("서버와의 통신 중 오류가 발생했습니다.");
								}
							});
						}
					</script>















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
