<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>그린마켓</title>
<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main/elegant-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main/nice-select.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main/slicknav.min.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main/style.css"
	type="text/css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<style>
th {
	background-color: lightgray;
}
</style>
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<section class="product-details spad">
		<div class="container">
			<div class="row">
				<h4>
					<i class="bi bi-caret-right-fill"></i> 주문상세내역
				</h4>
				<br> <br>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>상품명</th>
							<th>수량</th>
							<th>합계금액</th>
							<th>배송비</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${name}</td>
							<td>${itemCnt}개</td>
							<td><fmt:formatNumber value="${price}" pattern="#,##0" />원</td>
							<td><div id="shippingcost">기본-금액별배송비(일반)<br>3,000원(택배-선결제)</div></td>
						</tr>

					</tbody>
				</table>
				
				</div>
			<br>
			<br>
			<!-- 총합계 영역 -->
			<div class="card row">
    <div class="card-body text-right">
        <div>
            <dl style="display: inline-block;" class="text-right">
                <dt>총 ${itemCnt} 개의 상품금액</dt>
                <dd>
                    <strong><fmt:formatNumber value="${price}" pattern="#,##0" />원</strong>
                </dd>
            </dl>
            &nbsp;&nbsp;&nbsp;<span style="display: inline-block;"><img src="https://cdn-pro-web-213-28.cdn-nhncommerce.com/wjlocalfood2_godomall_com/data/skin/front/dcoms_supermarket_C/img/order/order_price_plus.png"></span>
            &nbsp;&nbsp;&nbsp;
            <dl style="display: inline-block;" class="text-right">
                <dt>배송비</dt>
                <dd>
                    <strong id="shippingCost">원</strong>
                </dd>
            </dl>
            &nbsp;&nbsp;&nbsp; <span style="display: inline-block;"><img src="https://cdn-pro-web-213-28.cdn-nhncommerce.com/wjlocalfood2_godomall_com/data/skin/front/dcoms_supermarket_C/img/order/order_price_total.png"></span>
            &nbsp;&nbsp;&nbsp;
            <dl style="display: inline-block;" class="text-right">
                <dt>합계</dt>
                <dd>
                    <strong id="totalPrice">${price}원</strong>
                </dd>
            </dl>
        </div>
    </div>
</div>

<script>
// 합계금액 가져오기
var totalPrice = ${price};

// 배송비 설정
var shippingCost = 3000;

// 합계금액이 50000원 이상인 경우 배송비와 합계금액을 각각 설정
if (totalPrice >= 50000) {
    shippingCost = 0;
} else {
    // 합계금액이 50000원 미만인 경우 배송비를 추가하고 합계금액에도 배송비를 더함
    shippingCost = 3000;
    totalPrice += shippingCost;
}

// 배송비와 합계금액을 화면에 표시
var formattedShippingCost = new Intl.NumberFormat('ko-KR').format(shippingCost);
document.getElementById('shippingCost').innerText = formattedShippingCost + "원";
var formattedTotalPrice = new Intl.NumberFormat('ko-KR').format(totalPrice);
document.getElementById('totalPrice').innerText = formattedTotalPrice + "원";
</script>
			<br>
			<br>
			<!-- 주문자 정보 영역 -->
			<div class="row">
				<h4>
					<i class="bi bi-caret-right-fill"></i> 주문자 정보
				</h4>
				<br> <br>
				<sec:authorize access="isAuthenticated()">
					<!-- 주문자 기본키  -->
					<input type="hidden" name="createdBy"
									value="<sec:authentication property="principal.createdBy"/>"
									style="width: 300px;">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th style="width: 200px;"><i class="bi bi-stop-fill" style="color:red"></i>주문하시는 분</th>
								<td><input type="text" name=""
									value="<sec:authentication property="principal.name"/>"
									style="width: 300px;" required></td>
									
							</tr>
							<tr>
								<th><i class="bi bi-stop-fill" style="color:red"></i>휴대폰 번호</th>
								<td><input type="text" name=""
									value="<sec:authentication property="principal.phone"/>"
									style="width: 300px;" required></td>
							</tr>
							<tr>
								<th><i class="bi bi-stop-fill" style="color:red"></i>이메일</th>
								<td><input type="text" name=""
									value="<sec:authentication property="principal.email"/>"
									style="width: 300px;" required></td>
							</tr>
						</thead>
					</table>
				</sec:authorize>
			</div>
			<br>
			<br>
			<form name="frm" action="orderInsert.do" method="post">
				<!-- 주문상세내역 영역 -->
				<input type="hidden" name="orderNo" id="orderNoInput" value="">
				<!-- 배송 정보 영역 -->
				<div class="row">
					<h4>
						<i class="bi bi-caret-right-fill"></i> 배송정보
					</h4>
					<br> <br>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th style="width: 200px;">배송지 확인</th>
								<td><label><input type="radio" name="shipping"
										value="basic">기본배송지</label>&nbsp;&nbsp;&nbsp; <label><input
										type="radio" name="shipping" value="self" checked>직접입력</label>&nbsp;&nbsp;&nbsp;
									<label><input type="radio" name="shipping"
										value="sameinfo">주문자정보와 동일</label>&nbsp;&nbsp;&nbsp;</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th><i class="bi bi-stop-fill" style="color: red"></i>받으실분</th>
								<td><input type="text" name="name" value=""
									style="width: 300px;" required></td>
							</tr>
							<tr>
								<th><i class="bi bi-stop-fill" style="color: red"></i>받으실 곳</th>
								<td><input type="text" id="sample3_postcode"
									name="addrPost" placeholder="우편번호" style="width: 180px;"
									required> <input type="button"
									onclick="sample3_execDaumPostcode()" value="우편번호 찾기"> <br>
									<input type="text" id="sample3_address" name="addr"
									placeholder="주소" style="width: 400px;" required> <br>
									<input type="text" id="sample3_detailAddress" name="addrDetail"
									placeholder="상세주소" style="width: 300px;" required> <br>
									<input type="text" id="sample3_extraAddress" name=""
									placeholder="참고항목" style="width: 300px;">
									<p>
									<div id="wrap"
										style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
										<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
											id="btnFoldWrap"
											style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
											onclick="foldDaumPostcode()" alt="접기 버튼">
									</div></td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td><input type="text" name="tel" value=""
									style="width: 300px;"></td>
							</tr>
							<tr>
								<th><i class="bi bi-stop-fill" style="color: red"></i>휴대폰번호</th>
								<td><input type="text" name="phone" value=""
									style="width: 300px;" required></td>
							</tr>
							<tr>
								<th>남기실 말씀</th>
								<td><input type="text" name="req" value=""
									style="width: 300px;"></td>
							</tr>
						</tbody>
					</table>
				</div>

				<script
					src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				<script>
					// 우편번호 찾기 찾기 화면을 넣을 element
					var element_wrap = document.getElementById('wrap');

					function foldDaumPostcode() {
						// iframe을 넣은 element를 안보이게 한다.
						element_wrap.style.display = 'none';
					}

					function sample3_execDaumPostcode() {
						// 현재 scroll 위치를 저장해놓는다.
						var currentScroll = Math.max(document.body.scrollTop,
								document.documentElement.scrollTop);
						new daum.Postcode(
								{
									oncomplete : function(data) {
										// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

										// 각 주소의 노출 규칙에 따라 주소를 조합한다.
										// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
										var addr = ''; // 주소 변수
										var extraAddr = ''; // 참고항목 변수

										//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
										if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
											addr = data.roadAddress;
										} else { // 사용자가 지번 주소를 선택했을 경우(J)
											addr = data.jibunAddress;
										}

										// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
										if (data.userSelectedType === 'R') {
											// 법정동명이 있을 경우 추가한다. (법정리는 제외)
											// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
											if (data.bname !== ''
													&& /[동|로|가]$/g
															.test(data.bname)) {
												extraAddr += data.bname;
											}
											// 건물명이 있고, 공동주택일 경우 추가한다.
											if (data.buildingName !== ''
													&& data.apartment === 'Y') {
												extraAddr += (extraAddr !== '' ? ', '
														+ data.buildingName
														: data.buildingName);
											}
											// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
											if (extraAddr !== '') {
												extraAddr = extraAddr;
											}
											// 조합된 참고항목을 해당 필드에 넣는다.
											document
													.getElementById("sample3_extraAddress").value = extraAddr;

										} else {
											document
													.getElementById("sample3_extraAddress").value = '';
										}

										// 우편번호와 주소 정보를 해당 필드에 넣는다.
										document
												.getElementById('sample3_postcode').value = data.zonecode;
										document
												.getElementById("sample3_address").value = addr;
										// 커서를 상세주소 필드로 이동한다.
										document.getElementById(
												"sample3_detailAddress")
												.focus();

										// iframe을 넣은 element를 안보이게 한다.
										// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
										element_wrap.style.display = 'none';

										// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
										document.body.scrollTop = currentScroll;
									},
									// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
									onresize : function(size) {
										element_wrap.style.height = size.height
												+ 'px';
									},
									width : '100%',
									height : '100%'
								}).embed(element_wrap);

						// iframe을 넣은 element를 보이게 한다.
						element_wrap.style.display = 'block';
					}

					function saveAddressToServer() {
						var postcode = document
								.getElementById('sample3_postcode').value;
						var address = document
								.getElementById('sample3_address').value;
						var detailAddress = document
								.getElementById('sample3_detailAddress').value;
						var extraAddress = document
								.getElementById('sample3_extraAddress').value;

						// extraAddress 값이 띄어쓰기가 되어 있는지 확인
						var extraAddressWithoutSpaces = extraAddress.replace(
								/\s/g, '');
						if (extraAddressWithoutSpaces.length !== extraAddress.length) {
							alert('띄어쓰기는 허용되지 않습니다.');
							return;
						}

						var data = {
							postcode : postcode,
							address : address,
							detailAddress : detailAddress,
							extraAddress : extraAddressWithoutSpaces
						};
					}
				</script>
				<br> <br>

				<!-- 결제정보 영역 -->
				<div class="row">
					<h4>
						<i class="bi bi-caret-right-fill"></i> 결제정보
					</h4>
					<br> <br>
					<table class="table table-bordered">
						<tr>
							<th style="width: 200px;">상품 합계 금액</th>
							<td><strong><fmt:formatNumber value="${price}"
										pattern="#,##0" />원</strong></td>
						</tr>
						<tr>
							<th>총 배송비</th>
							<td id="shippingCost1">원 
							</td>
						</tr>
						<tr>
							<th>최종 결제 금액</th>
							<td><strong id="totalOrderAmount1"><fmt:formatNumber
										value="${price}" pattern="#,##0" />원</strong> 
								<!-- 서버에 보내는 실제 최종 결제 금액, 총 배송비-->
								<input type="hidden" name="totalOrderAmount" value="${price}">
								<input type="hidden" name="totalShippingCost" value="">
							</td>
						</tr>
					</table>



					<script>
				// 합계금액 가져오기
				var totalPrice = ${price};

				// 배송비 설정
				var shippingCost = 3000;

				// 합계금액이 50000원 이상인 경우 배송비와 합계금액을 각각 설정
				if (totalPrice >= 50000) {
				    shippingCost = 0;
				} else {
				    // 합계금액이 40000원 미만인 경우 배송비를 추가하고 합계금액에도 배송비를 더함
				    shippingCost = 3000;
				    totalPrice += shippingCost;
				}

				// 배송비와 합계금액을 화면에 표시
				var formattedShippingCost = new Intl.NumberFormat('ko-KR').format(shippingCost);
				document.getElementById('shippingCost1').innerText = formattedShippingCost + "원";
				var formattedTotalPrice = new Intl.NumberFormat('ko-KR').format(totalPrice);
				document.getElementById('totalOrderAmount1').innerText = formattedTotalPrice + "원";
				// 최종 결제 금액을 hidden input에 설정
				document.getElementsByName('totalOrderAmount')[0].value = totalPrice;
				document.getElementsByName('totalShippingCost')[0].value = shippingCost;
				</script>

				</div>
				<br> <br>

				<!-- 결제수단 선택/결제 영역 -->
				<div class="row">
					<h4>
						<i class="bi bi-caret-right-fill"></i> 결제수단 선택 / 결제
					</h4>
					<br> <br>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th style="width: 200px;">일반결제</th>
								<td><label><input type="radio" name="paymentMethod"
										value="무통장입금" checked onclick="togglePaymentFields()">무통장
										입금</label>&nbsp;&nbsp;&nbsp; <label><input type="radio"
										name="paymentMethod" value="신용카드"
										onclick="togglePaymentFields()">신용카드</label>&nbsp;&nbsp;&nbsp;
									<label><input type="radio" name="paymentMethod"
										value="계좌이체" onclick="togglePaymentFields()">계좌이체</label>&nbsp;&nbsp;&nbsp;

								</td>
							</tr>
						</thead>
						<tbody id="paymentFields" style="display: none;">
							<tr>
								<th>입금자명</th>
								<td><input type="text" name="depositorName" value=""
									style="width: 300px;"></td>
							</tr>
							<tr>
								<th>입금은행</th>
								<td><input type="text" name="bankName" value=""
									style="width: 300px;"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="text-center">
					<button type="button" class="btn btn-dark" onclick="requestPay()">결제하기</button>
				</div>
			</form>
		</div>
	</section>
	
	 <!-- 결제 포트원 API 적용 영역 -->
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<script>
	function requestPay() {
	    // 주문번호 생성 코드
	    var today = new Date();
	    var year = today.getFullYear();
	    var month = ('0' + (today.getMonth() + 1)).slice(-2);
	    var day = ('0' + today.getDate()).slice(-2);
	    var randomNumber = Math.floor(Math.random() * 900000) + 100000;
	    var orderNo = year + month + day + randomNumber;
	    document.getElementById("orderNoInput").value = orderNo;

	    // 결제 API 호출
	    var item_name = '${name}'; // 상품명
	    var totalPaymentAmount = document.getElementsByName("totalOrderAmount")[0].value; // 최종결제금액
		console.log(totalPaymentAmount);
	    
	    IMP.init("imp35503241");
	    IMP.request_pay({
	        pg: "kakaopay",
	        pay_method: "card",
	        merchant_uid: orderNo,
	        name: item_name,
	        amount: totalPaymentAmount,
	    }, function (rsp) {
	        if (rsp.success) {
	        	document.frm.submit(); 	  // 주문
	            savePaymentInfo(orderNo); // 결제 
	        } else {
	            alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
	        }
	    });
	}

	function savePaymentInfo(orderNo) {
	    // 결제 정보 서버에 저장
	    var createdBy = document.getElementsByName("createdBy")[0].value;
	    var paymentMethod = $('input[name="paymentMethod"]:checked').val();
	    var totalPaymentAmount = document.getElementsByName("totalOrderAmount")[0].value; // 최종결제금액

	    $.ajax({
	        type: "POST",
	        url: "paymentInsert.do",
	        data: {
	            orderNo: orderNo,
	            createdBy: createdBy,
	            paymentMethod: paymentMethod,
	            totalPaymentAmount: totalPaymentAmount
	        },
	        success: function (response) {
	        		alert("주문 및 결제가 정상적으로 처리되었습니다.");
	        		saveOrderDetail(orderNo); //주문상품상세
	        	
	        },
	        error: function (xhr, status, error) {
	            console.error("Failed to submit payment: " + error);
	        }
	    });
	}

</script>
<script>
	function saveOrderDetail(orderNoParam) { // orderNoParam으로 변경
	    // 주문상품 상세 정보 서버에 저장
	    var createdBy = document.getElementsByName("createdBy")[0].value;
	    var price = '${price}'; // 상품금액
	    console.log("상품금액: "+price);
	    var itemCnt = '${itemCnt}'; // 개수
	    var name = '${name}'; // 상품명
	   
	    $.ajax({
	        type: "POST",
	        url: "orderDetailInsert.do",
	        data: {
	            orderNo: orderNoParam, // orderNoParam로 변경
	            createdBy: createdBy,
	            price: price,
	            itemCnt: itemCnt,
	            name: name
	        },
	        success: function (response) {
	            console.log("주문상품상세정보 서버저장 성공");
	        },
	        error: function (xhr, status, error) {
	            console.error("Failed to submit order detail: " + error);
	        }
	    });
	}

</script>
    
	<!-- 무통장 입금만 입력 폼 보여주기 -->
	<script>
    // 페이지 로딩 시 무통장 입금이 선택되어 있는 경우에도 입력 폼을 보이도록 설정
    window.onload = function() {
        togglePaymentFields();
    }
    function togglePaymentFields() {
        var paymentRadio = document.getElementsByName("paymentMethod");
        var paymentFields = document.getElementById("paymentFields");

        // 무통장 입금이 선택된 경우에만 입력 폼을 보이도록 설정
        if (paymentRadio[0].checked) {
            paymentFields.style.display = "table-row-group";
        } else {
            paymentFields.style.display = "none";
        }
    }
    </script>
	
	

	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp"%>

	<!-- Js Plugins -->
	<script
		src="<%=request.getContextPath()%>/resources/js/main/jquery-3.3.1.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/main/bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/main/jquery.nice-select.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/main/jquery-ui.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/main/jquery.slicknav.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/main/mixitup.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/main/owl.carousel.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/main/main.js"></script>

</body>
</html>