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
    thead {
   	 background-color: lightgray;
    
    }
</style>
</head>
<body class="sb-nav-fixed">
	<div id="layoutSidenav">
		<%@ include file="../include/header.jsp"%>
		<div id="layoutSidenav_content">
			<section>
    <div class="container px-4">
        <h3 class="mt-4">카테고리 관리</h3>
        <br>

        <div class="card mb-6">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>등록일</th>
                                <th>1차 카테고리명</th>
                                <th>2차 카테고리명</th>
                                <th>관리</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="vo" items="${categoryList}">
											<tr>
												<td>${vo.createdAt}</td>
												<td><c:choose>
														<c:when test="${vo.categoryNo2 == '001'}">
                   										 신선식품
                										</c:when>
														<c:otherwise>
                  										 ${vo.categoryNo2}
                										</c:otherwise>
													</c:choose></td>
												<td>${vo.categoryName}</td>
												<td>
													<button class="delete-btn"
														data-category="${vo.categoryName}">삭제</button>
												</td>
											</tr>
							</c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
    // 삭제 버튼 클릭 이벤트 처리
    $('.delete-btn').click(function() {
        var categoryName = $(this).data('category'); // 클릭한 버튼의 카테고리명 가져오기

        // 서버로 삭제 요청 보내기
        $.ajax({
            url: 'categoryDelete.do',
            method: 'POST',
            data: { categoryName: categoryName },
            success: function(response) {
            	console.log(response)
                if(response === 1) {
                    alert("선택하신 카테고리명이 정상적으로 삭제되었습니다.");
                    location.reload();
                } else if(response === 0) {
                    alert("선택하신 카테고리명이 삭제되지 않았습니다.");
                } else {
                    console.error('잘못된 응답입니다.');
                }
            },
            error: function(xhr, status, error) {
                console.error('AJAX 요청 실패: ' + status + ', ' + error);
            }
        });
    });
});
</script>
			
			
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
