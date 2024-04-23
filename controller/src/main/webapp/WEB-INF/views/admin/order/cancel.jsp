<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<style>
thead {
	background-color: lightgray;
}
</style>
<!-- 데이터피커 날짜 UI -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<script>
	$.datepicker.setDefaults({
		dateFormat : 'yy-mm-dd',
		prevText : '이전 달',
		nextText : '다음 달',
		monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
				'10월', '11월', '12월' ],
		monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
				'9월', '10월', '11월', '12월' ],
		dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
		showMonthAfterYear : true,
		yearSuffix : '년'
	});

	$(function() {
		$('.datepicker').datepicker();
	});
</script>
</head>
<body class="sb-nav-fixed">
	<div id="layoutSidenav">
		<%@ include file="../include/header.jsp"%>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<p>HOME > 주문관리 > 취소 관리</p>
					<h3 class="mt-4">취소 관리</h3>
					<br>

					<form>
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th style="background-color: lightgray; width: 130px;">검색어</th>
									<td><select>
											<option value="">주문번호</option>
											<option value="">주문자</option>
									</select> <input type="text" name="" size="40"></td>
								</tr>
								<tr>
									<th style="background-color: lightgray">기간검색</th>
									<td>시작일자: <input type="text" name="fr_date" id="fr_date"
										size="10" maxlength="10" class="datepicker"> ~ 종료일자: <input
										type="text" name="to_date" id="to_date" size="10"
										maxlength="10" class="datepicker"> <span> <input
											type="button" onclick="setDate('today')" class="" value="오늘">
											<input type="button" onclick="setDate('yesterday')" class=""
											value="어제"> <input type="button"
											onclick="setDate('lastWeek')" class="" value="일주일"> <input
											type="button" onclick="setDate('lastMonth')" class=""
											value="지난달"> <input type="button"
											onclick="setDate('lastMonthStart')" class="" value="1개월">
											<input type="button" onclick="setDate('threeMonthsAgo')"
											class="" value="3개월"> <input type="button"
											onclick="setDate('all')" class="" value="전체">
									</span>
									</td>
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
									전체선택: <input type="checkbox" id="selectAllCheckbox"
										onclick="toggleAllCheckboxes()">
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
										<th>주문일시</th>
										<th>취소일시</th>
										<th>주문번호</th>
										<th>주문상품</th>
										<th>주문상태</th>
										<th>주문자</th>
										<th>총주문액</th>
										<th>취소금액</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="order" items="${cancel}">
										<tr>
											<td><input type="checkbox" name="rowCheckbox" value=""></td>
											<td>${order.createdAt}</td>
											<td>${order.modifiedAt}</td>
											<td>${order.orderNo}</td>
											<td class="productName">${order.productName}</td>
											<td>${order.orderStatus}</td>
											<td>${order.name}</td>
											<td>${order.totalOrderAmount}</td>
											<td>${order.totalOrderAmount}</td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
							<script>
							  var previousOrderNo = null;
							    var productNameCells = document.getElementsByClassName("productName");

							    // 중복된 주문 번호인 경우 productName을 제외한 열은 모두 "-"로 변경
							    for (var i = 0; i < productNameCells.length; i++) {
							        var currentOrderNo = productNameCells[i].previousElementSibling.innerText;
							        if (previousOrderNo === currentOrderNo) {
							            var currentRow = productNameCells[i].parentNode;
							            for (var j = 0; j < currentRow.cells.length; j++) {
							                if (currentRow.cells[j].className !== "productName") {
							                    currentRow.cells[j].innerText = "-";
							                }
							            }
							        }
							        previousOrderNo = currentOrderNo;
							    }
							</script>


						</div>


						<script>
							function setDate(range) {
								var toDate = new Date(); // 오늘 날짜를 가져옴
								var frDate = new Date(); // 시작일 기본값은 오늘

								// 시작일을 설정
								if (range === 'yesterday') {
									frDate.setDate(frDate.getDate() - 1); // 어제 날짜
								} else if (range === 'lastWeek') {
									frDate.setDate(frDate.getDate() - 7); // 일주일 전
								} else if (range === 'lastMonth') {
									frDate.setMonth(frDate.getMonth() - 1); // 지난달
								} else if (range === 'lastMonthStart') {
									frDate.setDate(1); // 이번 달 1일
								} else if (range === 'threeMonthsAgo') {
									frDate.setMonth(frDate.getMonth() - 3); // 3개월 전
								} else if (range === 'all') {
									// 시작일과 종료일을 모두 초기화
									document.getElementById('fr_date').value = '';
									document.getElementById('to_date').value = '';
									return; // 함수 종료
								}

								// 시작일과 종료일을 화면에 출력
								document.getElementById('fr_date').value = formatDate(frDate);
								document.getElementById('to_date').value = formatDate(toDate);
							}

							// 날짜 형식을 'YYYY-MM-DD'로 변환하는 함수
							function formatDate(date) {
								var year = date.getFullYear();
								var month = ('0' + (date.getMonth() + 1))
										.slice(-2);
								var day = ('0' + date.getDate()).slice(-2);
								return year + '-' + month + '-' + day;
							}
						</script>

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
