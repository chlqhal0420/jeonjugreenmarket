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
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/nice-select.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/slicknav.min.css" type="text/css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/style.css" type="text/css"> 
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/login.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/mypage_order.css" type="text/css">
</head>

<body>
	 <%@ include file="../include/header.jsp"%> <!-- 헤더 -->

 		 <!-- 마이그린 베너 -->
  <section class="breadcrumb-section set-bg" data-setbg="<%=request.getContextPath()%>/resources/img/repolho.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>마이페이지</h2>
                        <div class="breadcrumb__option">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> 
    <!-- 마이그린 베너 끝 -->

    <!-- 마이페이지 목차 시작 -->
	<section class="blog spad">
		<div class="container">
			<div class="order row">
				<!-- 마이페이지 네비게이션 시작 -->
				<%@ include file="./import/mypage_nav.jsp"%>
				<!-- 마이페이지 네비게이션 끝-->
				<!-- 마이페이지 목차 끝 -->

				<!-- 주문내역 시작  -->
				<div class="main col-lg-9 col-md-7">
					<div class=" row">
						<div class="col-lg-12 text-left">
							<h2
								style="font-weight: bold; font-size: 24px; letter-spacing: 2px; color: rgb(51, 51, 51);">주문내역</h2>

							<div
								style="margin-top: 20px; height: 2px; background-color: black;"></div>
						</div>

						<!-- 주문내역 조회 -->
						<section class="shoping-cart spad">
							<div class="container">
								<div class="row">
									<div class="col-lg-12">
										<div class="shoping__cart__table">
											<table style="width: 1000px;">
												<thead>
													<tr>
														<th>날짜</th>
														<th>주문번호</th>
														<th>상품명</th>
														<th>상품금액</th>
														<th>수량</th>
														<th>최종결제금액</th>
														<th style="white-space: nowrap;">주문상태</th>
														<th>관리</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="order" items="${myPageOrder}">
														<c:if test="${not empty order}">
															<c:choose>
																<c:when test="${order.orderNo ne previousOrderNo}">
																	<tr id="orderRow_${order.orderNo}">
																		<td style="width: 200px;">${order.createdAt}</td>
																		<td style="width: 200px;">${order.orderNo}</td>
																		<td style="width: 200px;">${order.name}</td>
																		<td style="width: 200px;">${order.price}원</td>
																		<td style="width: 200px;">${order.itemCnt}개</td>
																		<td style="width: 210px;">${order.totalOrderAmount}원</td>
																		<td style="width: 200px;"><h5 style="color: red;"
																				id="orderStatus_${order.orderNo}">${order.orderStatus}</h5></td>
																		<td style="width: 200px;">
																			<button id="cancelButton_${order.orderNo}"
																				class="btn btn-primary btn-sm"
																				onclick="showCancelConfirmation(${order.orderNo})">주문취소</button>
																		</td>
																	</tr>
																</c:when>
																<c:otherwise>
																	<td style="width: 200px;">-</td>
																	<td style="width: 200px;">-</td>
																	<td style="width: 200px;">${order.name}</td>
																	<td style="width: 200px;">${order.price}원</td>
																	<td style="width: 200px;">${order.itemCnt}개</td>
																	<td style="width: 210px;">-</td>
																	<td style="width: 200px;">-</td>
																	<td style="width: 200px;">-</td>
																</c:otherwise>
															</c:choose>
															<script>
      													 	 $(document).ready(function() {
           												 	 var orderStatus = "${order.orderStatus}";
           													 if (orderStatus === "고객요청취소") {
               												 $("#cancelButton_${order.orderNo}").hide();
            												 }
        													 });
        													</script>
														</c:if>
														<c:set var="previousOrderNo" value="${order.orderNo}" />
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</section>
					</div>
				</div>
			</div>
		</div>
	</section>


	<script>
function showCancelConfirmation(orderNo) {
    // confirm 대화상자 표시
    var isConfirmed = confirm("주문을 취소하시겠습니까?");
    if (isConfirmed) {
        // 사용자가 확인을 누르면 AJAX 요청 보내기
        $.ajax({
            type: "POST",
            url: "cancelOrder.do",
            data: {
                orderNo: orderNo
            },
            success: function(response){
                // 성공 시 실행할 코드
                alert("주문이 취소되었습니다.");
                // 주문 상태 변경
                $("#orderStatus_" + orderNo).text("고객요청취소");
                // 주문 취소 버튼 숨기기
                $("#cancelButton_" + orderNo).hide();
            },
            error: function(xhr, status, error){
                // 오류 발생 시 실행할 코드
                alert("오류가 발생했습니다: " + error);
                // 오류 처리 및 추가 작업 수행 가능
            }
        });
    }
}
</script>
	
	<!-- 푸터 -->
     <%@ include file="../include/footer.jsp"%>

    <!-- 자바스크립트 -->
    <script src="<%=request.getContextPath()%>/resources/js/main/jquery-3.3.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/main/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/main/jquery.nice-select.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/main/jquery-ui.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/main/jquery.slicknav.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/main/mixitup.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/main/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/main/main.js"></script>
 
</body>
</html>