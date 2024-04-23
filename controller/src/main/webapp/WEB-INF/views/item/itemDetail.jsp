<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>그린마켓 | 상품리스트</title>
	<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
	<!-- 찜하기 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Css Styles -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/nice-select.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/style.css" type="text/css">

<style>
.product__details__pic__item--large {
    max-width: 100%; /* 이미지가 부모 요소의 너비에 맞게 조정됩니다. */
    height: auto; /* 이미지 비율을 유지하면서 가로세로 크기를 조정합니다. */
}

 .like-btn {
            background: none;
            border: none;
            color: black;
        }
        .like-btn:focus {
            outline: none;
        }
</style>
<script>
/* 장바구니에 상품 담기 */
$(document).on('click', '#setBasket', function() {
    var basketProduct = {
        itemNo: $('#itemNo').val(),
        itemCnt: $('#quantity').val(),
    };
    
    $.ajax({
        url: 'add_basket.do',
        method: 'POST',
        data: basketProduct, 
        success: function(data, textStatus) {
            data = data.trim();
            if(data == 'add_success'){
                alert('장바구니에 상품이 추가되었습니다.');
            } else if(data == "already_existed"){
                alert("이미 장바구니에 등록된 제품입니다.");
            } else if(data == "not_logged_in") {
                alert("로그인이 필요합니다.");
                location.href = "<%=request.getContextPath()%>/user/login.do"; // Redirecting to login
            }
        },
        error: function() {
            alert('오류입니다.');
            location.href = "<%=request.getContextPath()%>/user/login.do";
        }
    });
});


/* 좋아요 기능 */
function toggleLike(itemNo) {
    $.ajax({
        url: 'toggleLike.do', // 서버의 URL 경로
        type: 'POST', // HTTP 요청 방식
        data: { 
            itemNo: itemNo,
        },
        success: function(response) { // 서버로부터 응답을 받았을 때 실행
            updateLikeButton(response.liked, itemNo);
        },
        error: function(xhr) { // 오류 발생 시 실행
            // 서버에서 응답한 HTTP 상태 코드에 따라 다른 처리를 할 수 있음
            if (xhr.status === 401) { // 401 Unauthorized 응답을 받은 경우
                alert("로그인 후 이용해주세요.");
            } else { // 그 외 다른 종류의 오류 처리
                alert("처리 중 오류가 발생했습니다. 관리자에게 문의하세요.");
            }
        }
    });
}

	function updateLikeButton(liked, itemNo) {
	    const icon = $('#like-icon');
	    if (liked) {
	        icon.removeClass('far').addClass('fas').css('color', 'red'); // 찜 상태일 때
	    } else {
	        icon.removeClass('fas').addClass('far').css('color', ''); // 찜 해제 상태일 때
	    }
	}
</script>
</head>

<body>
   <%@ include file="../include/header.jsp"%>
 


    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                
            	<c:forEach var="item" items="${itemDetail}">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="<%=request.getContextPath()%>/resources/upload/${item.image}" alt="">
                        </div>                  
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        	<h3
								style="display: flex; justify-content: space-between; align-items: center;">
								${item.name}
								<!-- 상품명 -->
								
								<!-- 찜 버튼 -->
								<div style="display: inline-block; text-align: right;">
								    <button id="like-btn" class="like-btn"
								            onclick="toggleLike(${item.itemNo})">
								        <i id="like-icon" class="${isLiked ? 'fas fa-heart' : 'far fa-heart'}" 
								           style="${isLiked ? 'color: red;' : ''}"></i>
								    </button>
								</div>
								<!-- 찜 버튼 -->
							</h3>
                        	<div class="product__details__price">
                        	<strong>판매가&nbsp;&nbsp;<fmt:formatNumber value="${item.price}" pattern="#,##0" />원</strong>                   
                        	
                        	</div>
                        <ul>
                            <li>
                            <div>
                            	<b>배송비</b> 
                            	<div>
                            	
                            	<span>3,000원  / 주문시결제(선결제)</span>&nbsp;&nbsp;
                            	<p class="d-inline-flex gap-1">
										<a class="btn btn-secondary btn-sm" data-bs-toggle="collapse"
											href="#multiCollapseExample1" role="button"
											aria-expanded="false" aria-controls="multiCollapseExample1">조건별배송</a>
										<button class="btn btn-secondary btn-sm" type="button"
											data-bs-toggle="collapse"
											data-bs-target="#multiCollapseExample2" aria-expanded="false"
											aria-controls="multiCollapseExample2">지역별추가배송비</button>
										
									</p>
									<div class="row">
										<div class="col">
											<div class="collapse multi-collapse"
												id="multiCollapseExample1">
												<div class="card card-body" style="width:300px;">
													<p><strong>0원 이상 ~ 50,000원 미만</strong>&nbsp;3,000원</p>
													<p><strong>50,000원 이상</strong>&nbsp;0원</p>
												</div>
											</div>
										</div>
										<div class="col">
											<div class="collapse multi-collapse"
												id="multiCollapseExample2">
												<div class="card card-body" style="width:290px;">
													<p><strong>경상북도 울릉군</strong>&nbsp; 5,000원</p>
													<p><strong>제주특별자치도 서귀포시</strong>&nbsp; 5,000원</p>
													<p><strong>제주특별자치도 제주시</strong>&nbsp; 5,000원</p>
												</div>
											</div>
										</div>
									</div>
                            	</div>
								</div>
								</li>
									
                            <li><b>상품코드</b> <span>${item.itemNo}</span></li>
                            <li><b>제조사</b> <span>${item.manufacturer}</span></li>
                            <li><b>원산지</b> <span>${item.itemOrigin}</span></li>
                        </ul>
                    </div>


					
						<div class="container mt-5">
							<form id="cartForm" class="row" action="itemOrder.do" method="post">
							<input type="hidden" name="itemNo" value="${item.itemNo}" id="itemNo">	
								<div class="col-md-3">
									<div class="mb-3">
										<label for="quantity" class="form-label"></label> <input
											type="number" class="form-control" id="quantity"
											name="itemCnt" min="1" value="1" onchange="calculateTotal()"
											style="width: 80px">
									</div>
								</div>
								<div class="col-md-6">
									<div class="mb-3">
										<label for="total" class="form-label"></label> <input
											type="text" class="form-control" id="total" name="price"
											readonly style="width: 200px" value="">
									</div>
								</div>
								
										<input type="hidden" name="name" value="${item.name}">
								
								<div class="col-md-12">
									<button type="submit" class="btn btn-primary">바로 구매</button>&nbsp;&nbsp;
									<input type="button" name="" value="장바구니" id="setBasket" class="btn btn-secondary">&nbsp;&nbsp;
								</div>
							</form>
						</div>
									<input type="hidden" class="form-control" id="price"
										name="price" min="0.01" step="0.01" value="${item.price}"
										onchange="calculateTotal()">
					</div>
                </c:forEach>
                
                <!-- 상품 개수에 따른 합계 금액 계산 영역 -->
				<script>
				// 페이지 로드 시 초기 합계금액 설정
			    window.onload = function() {
			        calculateTotal();
			    };

			    function calculateTotal() {
			        var quantity = parseFloat(document.getElementById('quantity').value);
			        var price = parseFloat(document.getElementById('price').value); // 여기서는 ${item.price}를 사용하지 않고, hidden input의 값을 가져옵니다.
			        var total = quantity * price;
			        document.getElementById('total').value = total
			    }
				</script>



				<div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">상세정보</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                    aria-selected="false">배송안내</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="false">교환 및 반품</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-4" role="tab"
                                    aria-selected="false">상품후기</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-5" role="tab"
                                    aria-selected="false">상품문의</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h4>상세정보</h4>
                                    <img src="<%=request.getContextPath()%>/resources/img/product/itemdetail.jpg" alt="Item Detail Image">
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>배송안내</h6>
                                    <p style="color: red;"><b>주문마감 : 평일 오전 10시</b></p>
									<p>배송요금 : 기존 3000원</p>
									<p>추가요금 : 제주, 도서산간지역은 별도의 추가요금이 발생할 수 있습니다.</p>
									<p>무료배송조건 : 40,000원 이상 (배송비 제외)</p>
									<p>순차발송 : 상품의 재고수량보다 초과주문된 경우 순차 발송됩니다.</p>
									<p>배송기간 : 토,일요일, 공휴일을 제외한 평균 배송은 2일~3일입니다.</p>
									<p>배송지연1 : 생산 농가의 부득이한 사정으로 예고없이 출고일이 변경될 수 있습니다.</p>
									<p>배송지연2 : 신선식품의 경우 발송 다음날이 일요일, 공휴일인 경우 휴일 다음날 발송됩니다.</p>
									<p>도착일 문의 : 배송중인 경우 해당 택배사에 문의해주시기 바랍니다.</p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>교환 및 반품안내</h6>
                                    <p><b style="color: red;">소비자분쟁해결기준(공정거래위원회 고시) 및 관계법령에 따릅니다.</b><br>
										농산물, 신선식품의 경우 상품의 특성상 반품 및 교환이 어려우니 신중하게 구매해주세요. <br>
										농산물의 경우 일부 불량(벌레먹음, 손상, 깨짐 등)이 있을 수 있습니다.<br>
										교환 및 반품, 환불은 반드시 상담 이후에 가능합니다.<br>
										상담 내용에 따라 문자, 카톡, 이메일 등으로 관련 증빙자료를 요청할 수 있습니다.<br>
										교환 및 반품, 환불은 7일 이내에 가능합니다.<br>
										7일 이후 상품이상으로 인한 반품/교환은 제조사와 상담해주세요.</p>
									<p style="color: blue;">[교환/반품 및 환불이 가능한 예시]<br>
										- 상품의 불량 및 오배송으로 인한 교환 및 반품<br>
										- 주문한 내역과 다른 상품이 배송되는 경우<br>
										- 상품이 불량인 경우<br>
										- 배송중 상품이 파손된 경우<br>
										- 농산물의 불량(벌레먹음, 손상, 깨짐 등)이 확연한(10% 이상) 경우</p>
									<p style="color: orange;">[교환/반품 및 환불이 불가능한 예시]<br>
										- 농산물 및 신선식품을 단순변심으로 반품하는 경우<br>
										- 본인의 과실로 인한 상품이 회손된 경우<br>
										- 포장을 개봉한 경우<br>
										- 구입 후 7일이 지난 경우<br>
										- 적절한 보관방법(실온,냉장,냉동)으로 보관 및 반송하지 아니 경우<br>
										- 상품불량, 파손 등의 증빙 자료가 부정확한 경우<br>
										- 농산물의 불량(벌레먹음, 손상, 깨짐 등)이 경미한(10% 이하) 경우<br>
										- 세척이 가능한 이물질(풀, 낙옆, 흙 등)이 농산물과 소량 혼입된 경우</p>
										
									<h6>환불안내</h6>
									<p>카드결제 : 취소 또는 해피스테이션 포인트으로 환불 가능합니다.<br>
										현금결제 : 전체 또는 부분 환불가능 합니다.<br>
										환불승인 이후 카드취소 및 계좌이체까지는 7~15일 소요될 수 있습니다.</p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-4" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h4>상품후기</h4>
                                    <p>상품후기</p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-5" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h4>상품문의</h4>
                                    <p>상품문의</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </section>
	 
    <!-- 푸터 -->
    <%@ include file="../include/footer.jsp"%> 

    <!-- Js Plugins -->
    <script src="<%=request.getContextPath()%>/resources/js/main/jquery-3.3.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/main/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/main/jquery.nice-select.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/main/jquery-ui.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/main/jquery.slicknav.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/main/mixitup.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/main/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/main/main.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>


</body>
</html>