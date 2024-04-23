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
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
thead {
	background-color: lightgray;
}
a {
    color: black;  /* 글자 색깔을 검은색으로 설정 */
    text-decoration: none;  /* 밑줄을 없앰 */
}
a:hover {
    text-decoration: underline;  /* 마우스를 갖다대면 밑줄이 생김 */
    color: blue;  /* 마우스를 갖다대면 글자 색깔이 파란색으로 변경 */
}
</style>
</head>
<body class="sb-nav-fixed">
	<div id="layoutSidenav">
		<%@ include file="../include/header.jsp"%>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h3 class="mt-4">회원관리</h3>
					<br>
					<!------------------------------------ 검색 기능 영역 ------------------------------------------>
					<form action="user.do" method="get">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th style="background-color: lightgray">검색어</th>
									<td>
									<select name="searchType">
											<option value="name" <c:if test="${param.searchType eq 'name'}">selected</c:if>>회원명</option>
											<option value="userid" <c:if test="${param.searchType eq 'userid'}">selected</c:if>>아이디</option>
									</select> 
									<input type="text" name="searchValue" value='${param.searchValue}' size="40"></td>
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
							<i class="bi bi-people-fill"></i> 총 회원수 : 100 명
						</div>


						<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr>
										<th>번호</th>
										<th>회원명</th>
										<th>아이디</th>
										<th>핸드폰</th>
										<th>이메일</th>
										<th>가입일시</th>
										<th>상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${list}">
										<tr>
											<td>${item.createdBy}</td>
											<td><a href="modify.do?createdBy=${item.createdBy}">${item.name}</a></td>
											<td>${item.userid}</td>
											<td>${item.phone}</td>
											<td>${item.email}</td>
											<td>${item.createdAt}</td>
											<td>${item.status}</td>
										</tr>
									</c:forEach>


								</tbody>
							</table>
						</div>

						<!-- Modal -->
						<div class="modal fade" id="statusChangeModal" tabindex="-1"
							role="dialog" aria-labelledby="statusChangeModalLabel"
							aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="statusChangeModalLabel">상태 변경</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<!-- Form for status change -->
										<form id="statusChangeForm">
											<div class="form-group">
												<label for="newStatus">새로운 상태 선택</label> 
												<select
													class="form-control" id="newStatus">
													<option value="활동">활동</option>
													<option value="탈퇴">탈퇴</option>
													<option value="차단">차단</option>
												</select>
											</div>
											<div class="text-center">
												<button type="submit" class="btn btn-primary">저장</button>
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">취소</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>

						 <script>
						 $(document).ready(function() {
							    $('#datatablesSimple tbody tr').click(function() {
							        var $row = $(this);
							        var createdBy = $row.find('td:first').text();

							        $('#statusChangeModal').modal('show').find('.btn-primary').off('click').on('click', function(event) {
							            event.preventDefault();

							            var status = $('#newStatus option:selected').val();
							            var data = JSON.stringify({
							                'createdBy': createdBy,
							                'status': status
							            });

							            $.ajax({
							                url: 'updateStatus.do',
							                type: 'POST',
							                data: data,
							                contentType: 'application/json',
							                success: function(data) {
							                	
							                    $('#statusChangeModal').modal('hide');
							                    alert('상태 변경에 성공했습니다');

							                    // AJAX 요청이 성공한 후에 해당 행의 상태 열을 업데이트합니다.
							                    $row.find('td:last').text(status);
							                },
							                error: function(jqXHR, textStatus, errorThrown) {
							                    alert('상태 변경에 실패했습니다: ' + errorThrown);
							                }
							            });
							        });
							    });
							});
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
	<script src="<%=request.getContextPath()%>/resources/js/datatables-simple-demo.js"></script>
</body>
</html>
