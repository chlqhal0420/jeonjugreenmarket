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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/mypage_dibs.css" type="text/css">
<style>
.shoping__cart__table table tbody tr td.shoping__cart__item img {
	display: inline-block;
	margin-left:100px;
	width:100px;
	height:100px;
}
</style> 
<script>


/*찜 상품 삭제*/
function deleteLikedItem(wishNo) {
  $.ajax({
    url: 'deletewishNo.do', 
    method: 'POST',
    data: { wishNo: wishNo },
    success: function(data) {
     alert("삭제 되었습니다.")
     location.reload(); // 변경 사항을 반영하기 위해 페이지 새로고침
    },
    error: function() {
      alert('데이터를 가져오는데 실패했습니다.');
    }
  });
}

/*찜 상품 장바구니에 추가*/
function addLikedItemToBasket(itemNo) {
  $.ajax({
    url: 'add_liked_item_to_basket.do', 
    method: 'POST',
    data: { itemNo: itemNo }, 
    success: function(data,textStatus) {
    	if(data.trim()=='add_success'){
    		 alert('장바구니에 상품이 추가되었습니다.');
    	}else if(data.trim()=="already_existed"){
    		alert("이미 장바구니에 등록된 제품입니다.")
    	}	          
       
    },
    error: function() {
        alert('에러가 발생했습니다.');
    }
  });
}


</script>
</head>

<body>
	 <%@ include file="../include/header.jsp"%> <!-- 헤더 -->

 		 <!-- 마이그린 베너 -->
  <section class="breadcrumb-section set-bg" data-setbg="<%=request.getContextPath()%>/resources/img/repolho.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2> 마이 그린</h2>
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
                <div class="main col-lg-9 col-md-7" >
                    <div class=" row">
						<div class="col-lg-12 text-left">
							<h2 style="font-weight: bold; font-size: 24px; letter-spacing: 2px; color: rgb(51, 51, 51);">찜한 상품</h2>
							
					
				    <div style="margin-top: 20px; height: 2px; background-color: black;"></div>
						</div>
                       
    <!-- 주문내역 가로 목차 -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table style="width:1000px;">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th> 
                                </tr>
                            </thead>
                            <tbody>
				 <c:forEach var="item" items="${likedItem}">
              <!--------------------------------- 주문내역 건수를 반복해서 출력할 부분 시작---------------------------------- -->
                                <tr>
                                  
                                    <td class="shoping__cart__item">
                                        <img src="<%=request.getContextPath()%>/resources/upload/${item.image}" alt="" >
                                        
                                    </td>
															<td class="shoping__cart__price">
																<!-- 새로운 child 테이블 추가 시작 -->
																<table>
																	<tr>
																		<td
																			style="text-align: center; vertical-align: middle;"><h5><strong>${item.name}</strong></h5></td>
																	</tr>
																</table> <!-- 새로운 child 테이블 추가 끝 -->
															</td>

															<td class="shoping__cart__total">
                                        ${item.price}
                                    </td>
                                     <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                          <table class="table-container">
										    <tr>
										        <td>
										            <button type="button" class="btn" onclick="addLikedItemToBasket(${item.itemNo})">장바구니</button>
										        </td>
										    </tr>
										    <tr>
										        <td class="shoping__cart__quantity">
										            <button type="button" class="btn delete-btn" onclick="deleteLikedItem(${item.wishNo})">삭제</button>
										        </td>
										    </tr>
										   
										</table>         
										<!-- 새로운 child 테이블 추가 시작 -->
					  
									        <!-- 새로운 child 테이블 추가 끝 -->
                                        </div>
                                    </td>
                                  
                                  
                                </tr>
                  </c:forEach>
              <!-- --------------------------------------주문내역을 반복해서 출력할 부분 끝---------------------------------------- -->
              
              
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            
        </div>
    </section>
    
 
         <!-- 주문내역 끝 -->  
         
         			<!-- 페이징 -->            
                       	<div class="col-lg-12">
                            <div class="product__pagination blog__pagination">
                                <a href="#">1</a>
                                <a href="#">2</a>
                                <a href="#">3</a>
                                <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                            </div>
                        </div> 
                   
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 페이징 끝 -->

     <%@ include file="../include/footer.jsp"%> <!-- 푸터 -->

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