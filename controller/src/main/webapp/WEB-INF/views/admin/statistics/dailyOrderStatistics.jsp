<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>관리자 페이지</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="<%=request.getContextPath()%>/resources/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    </head>
    <body class="sb-nav-fixed">
	<div id="layoutSidenav">
		<%@ include file="../include/header.jsp"%>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<p>HOME > 통계분석 > 일별주문통계</p>
					<h3 class="mt-4">일별주문통계</h3>
					<br> <i class="bi bi-caret-right-fill"></i><strong>통계검색</strong>

					<table class="table table-bordered">
						<tbody>
							<tr>
								<th style="background-color: lightgray; width: 130px;">기간검색</th>
								<td><select id="yearSelect">
										<option value="2021">2021년</option>
										<option value="2022">2022년</option>
										<option value="2023">2023년</option>
										<option value="2024" selected="selected">2024년</option>
									</select> 
									<select id="monthSelect">
										<option value="01" selected="selected">1월</option>
										<option value="02">2월</option>
										<option value="03">3월</option>
										<option value="04">4월</option>
										<option value="05">5월</option>
										<option value="06">6월</option>
										<option value="07">7월</option>
										<option value="08">8월</option>
										<option value="09">9월</option>
										<option value="10">10월</option>
										<option value="11">11월</option>
										<option value="12">12월</option>
								</select> <input type="submit" value="검색" class="btn btn-dark btn-sm"
									onclick="searchStatistics()" /></td>
							</tr>
						</tbody>
					</table>
					<br> <i class="fas fa-chart-area"></i><strong id="totalItems">총
						판매상품수 : 0건</strong>
					<table class="table table-hover table table-bordered text-center"
						id="resultTable">
						<thead style="background-color: lightgray;">
							<tr>
								<th>날짜</th>
								<th style="width: 1000px;">그래프</th>
								<th>비율%</th>
								<th>판매상품수</th>
								<th>주문액</th>
							</tr>
						</thead>
						<tbody id="resultBody">
							<!-- 여기에 검색 결과가 들어갈 것입니다. -->
						</tbody>
						<tfoot style="background-color: lightgray;">
							<tr>
								<td colspan="2">합계</td>
								<td>100</td>
								<td id="totalSales"></td>
								<td id="totalOrder"></td>
							</tr>
						</tfoot>
					</table>

					<script>
						// 검색 결과를 가져오는 함수
						function searchStatistics() {
							var year = document.getElementById("yearSelect").value;
							var month = document.getElementById("monthSelect").value;
							// 이 부분에서 서버로 해당 기간의 통계를 요청하고 결과를 받아옵니다.
							// 여기서는 임시로 더미 데이터를 사용합니다.
							var dummyData = [ {						
								date : "2024-02-01",
								graph : "100%",
								percentage : "100%",
								items : 15,
								order : 5000
							}, {
								date : "2024-03-01",
								graph : "30%",
								percentage : "30%",
								items : 15,
								order : 5000
							}, {
								date : "2024-03-02",
								graph : "50%",
								percentage : "50%",
								items : 25,
								order : 8000
							}, {
								date : "2024-03-03",
								graph : "20%",
								percentage : "20%",
								items : 10,
								order : 3000
							} ];

							var totalItems = 0;
							var totalOrder = 0;

							var resultBody = document
									.getElementById("resultBody");
							resultBody.innerHTML = ""; // 이전 결과를 초기화

							dummyData
									.forEach(function(data) {
										if (data.date.startsWith(year + '-'
												+ month)) {
											var row = document
													.createElement("tr");
											var dateCell = document
													.createElement("td");
											dateCell.textContent = data.date;
											var graphCell = document
													.createElement("td");
											graphCell.innerHTML = '<div class="progress" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"><div class="progress-bar" style="width: ' + data.graph + '"></div></div>';
											var percentageCell = document
													.createElement("td");
											percentageCell.textContent = data.percentage;
											var itemsCell = document
													.createElement("td");
											itemsCell.textContent = data.items.toLocaleString(); // 천자리 구분 추가
											var orderCell = document
													.createElement("td");
										    orderCell.textContent = data.order.toLocaleString(); // 천자리 구분 추가

											row.appendChild(dateCell);
											row.appendChild(graphCell);
											row.appendChild(percentageCell);
											row.appendChild(itemsCell);
											row.appendChild(orderCell);

											resultBody.appendChild(row);

											totalItems += data.items;
											totalOrder += data.order;
										}
									});

							// 총 판매상품수 업데이트
							document.getElementById("totalItems").textContent = " 총 판매상품수 : "
									+ totalItems + "건";
							// 합계 업데이트
							document.getElementById("totalSales").textContent = totalItems.toLocaleString();
							document.getElementById("totalOrder").textContent = totalOrder.toLocaleString();
						}

						// 현재 날짜를 가져오는 함수
						function getCurrentDate() {
							var today = new Date();
							var year = today.getFullYear();
							var month = today.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줍니다.
							return {
								year : year,
								month : month
							};
						}

						// 초기화 함수
						function initialize() {
							var currentDate = getCurrentDate();
							document.getElementById("yearSelect").value = currentDate.year
									.toString();
							document.getElementById("monthSelect").value = ("0" + currentDate.month)
									.slice(-2); // 두 자리 숫자로 표시되도록 함
						}

						// 페이지 로드 시 초기화 실행
						window.onload = function() {
							initialize();
							searchStatistics(); // 초기화 후 통계 검색 실행
						}
					</script>





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
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
			integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="<%=request.getContextPath()%>/resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="<%=request.getContextPath()%>/resources/js/datatables-simple-demo.js"></script>
    </body>
</html>
