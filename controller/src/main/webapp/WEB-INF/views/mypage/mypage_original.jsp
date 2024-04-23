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
    <title>그린마켓 | 회원가입</title>

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
    
    <style>
    .blog__sidebar__recent__item__pic {
    float: left;
    margin-right: 0;
	}
	
	.blog__sidebar__item h4 {
    color: #1c1c1c;
    font-weight: 700;
    margin-top: 25px;
	}
	
	 .blog__sidebar__item {
        width: 90%;
        margin: auto;
    }

    .blog__sidebar__item h4 {
        background-color: #7fad39;
        color: white;
        font-weight: bold;
        padding: 10px;
        margin: 0;
        border: 1px solid #ddd;
    }

    .blog__sidebar__item ul {
        list-style: none;
        margin: 0;
        padding: 0;
        border: 1px solid #ddd;
    }

    .blog__sidebar__item ul li {
        padding: 10px;
        border-bottom: 1px solid #ddd;
    }

    .blog__sidebar__item ul li:last-child {
        border-bottom: none;
    }

    .blog__sidebar__item ul li a {
        text-decoration: none;
        color: #333;
        display: block;
    }

    .blog__sidebar__item ul li a:hover {
        background-color: #f2f2f2;
    }

    /* 추가된 스타일 */
   .blog__sidebar__recent__item__text h6 {
        margin: 0; /* 기본 마진 제거 */
        color: #333; /* 기존 텍스트 색상과 동일하게 설정 */
        font-size: 17px; /* 적절한 폰트 크기 설정 */
        padding: 10px 0; /* 위아래 패딩으로 텍스트가 있는 영역을 넓힘 */
    } 
     /* 전체 컨테이너의 하단 간격 조정 */
    .col-lg-12.text-center {
        margin-bottom: 5px;
    }

    /* "주문목록/배송조회"와 검색창 사이의 간격 조정 */
    .col-lg-12.text-center h2 {
        margin-bottom: 30px;
    }

    /* 검색창 너비 조정 및 가운데 정렬 */
    .blog__sidebar__search {
        width: 50%;
        margin: 0 auto;
    }

    /* 검색창 내부 폼 스타일 조정 */
    .blog__sidebar__search form {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    /* 검색 입력 필드 너비 조정 */
    .blog__sidebar__search input[type="text"] {
        width:75%;
    }

	.breadcrumb-section {
	display: flex;
	align-items: center;
	padding: 30px 0 10px;
}

.breadcrumb__text h2 {
    font-size: 30px;
    color: #ffffff;
    font-weight: 700;
}
 .blog__sidebar__recent__item__pic {
        display: flex; /* Flexbox 사용 */
        justify-content: center; /* 가로축 중앙 정렬 */
        align-items: center; /* 세로축 중앙 정렬 */
        height: 100%; /* div의 높이를 조정해 이미지에 맞게 설정 */
    }

    .blog__sidebar__recent__item__pic img {
        max-width: 100%; /* 이미지가 div를 넘어가지 않도록 최대 너비 설정 */
        height: auto; /* 이미지 비율 유지 */
        padding-left: 20px;
    	padding-top: 10px 
    }

.blog__sidebar__item__tags button {
    font-size: 16px;
    color: #6f6f6f;
    background: #f5f5f5;
    display: inline-block;
    padding: 7px 26px 5px;
    margin-right: 6px;
    margin-bottom: 10px;
    margin-top: 30px;
    border: 1px solid #f5f5f5; /* 테두리 색상 설정 */
}


</style>
</head>

<body>
	 <%@ include file="../include/header.jsp"%> <!-- 헤더 -->

 		 <!-- Breadcrumb Section Begin -->
  <section class="breadcrumb-section set-bg" data-setbg="<%=request.getContextPath()%>/resources/img/repolho.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2> 마이 그린</h2>
                        <div class="breadcrumb__option">
                            <!-- <a href="./index.html">Home</a>
                            <span>Blog</span> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> 
    <!-- Breadcrumb Section End -->

    <!-- Blog Section Begin -->
    <section class="blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="blog__sidebar">
                       
                        <div class="blog__sidebar__item">
                            <h4>MY 쇼핑</h4>
                            <ul>
                                <li><a href="#">주문내역</a></li>
                                <li><a href="#">취소/반품/교환내역</a></li>
                                <li><a href="#">환불/입금내역</a></li>
                             </ul>
                            
                             <h4>MY 활동</h4>
                             <ul>
                             	<li><a href="#">찜리스트</a></li>
                                <li><a href="#">리뷰관리</a></li>
                                <li><a href="#">문의내역확인</a></li>
                             </ul>
                             
                              <h4>MY 정보</h4>
                             <ul>
                               	<li><a href="#">배송지관리</a></li>
                                <li><a href="#">회원정보수정</a></li>
                             </ul>
                             
                        </div>
						   <div class="blog__sidebar__item">
						    <h4>고객센터</h4>
						    <ul>
						        <li>
						            <a href="#">
						                <div class="blog__sidebar__recent__item">
						                    <div class="blog__sidebar__recent__item__pic">
						                        <img src="<%=request.getContextPath()%>/resources/img/cscenter.gif" alt="">
						                    </div>
						                    
						                </div>
						            </a>
						        </li>
						    </ul>
						</div>
                        
                    </div>
                </div>
                
                
                <div class="main col-lg-9 col-md-7" >
                
                    <div class="row">

						<!-- 작업할 공간 -->
						<div class="col-lg-12 text-left">
							<h2 style="font-weight: bold; font-size: 24px; letter-spacing: 2px; color: rgb(51, 51, 51);">주문내역</h2>
							<!-- 검색창 시작 -->
							<div class="blog__sidebar__search">
								<form action="#">
									<input type="text" placeholder="주문한 상품을 검색할 수 있어요!">
									<button type="submit">
										<span class="icon_search"></span>
									</button>
								</form>
							</div>
							<!-- 검색창 끝 -->
							<!-- 연도별 주문내역 선택버튼-->
                            <div class="blog__sidebar__item__tags">
                                <button >3개월</button>
                                <button >6개월</button>
                                <button>1년</button>
                                <button >3년</button>
                            </div>
							<!-- 연도별 주문내역 선택버튼 끝 -->
					
				    <div style="margin-top: 20px; height: 2px; background-color: black;"></div>
						</div>

						<!--  주문내역 시작 -->
                       
    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">Products</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="<%=request.getContextPath()%>/resources/img/cart/cart-1.jpg" alt="">
                                        <h5>Vegetable’s Package</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        $55.00
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value="1">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                        $110.00
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="<%=request.getContextPath()%>/resources/img/cart/cart-2.jpg" alt="">
                                        <h5>Fresh Garden Vegetable</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        $39.00
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value="1">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                        $39.99
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="<%=request.getContextPath()%>/resources/img/cart/cart-3.jpg" alt="">
                                        <h5>Organic Bananas</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        $69.00
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value="1">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                        $69.99
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"></span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="#" class="primary-btn cart-btn">CONTINUE SHOPPING</a>
                        <a href="#" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                            Upadate Cart</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__continue">
                        <div class="shoping__discount">
                            <h5>Discount Codes</h5>
                            <form action="#">
                                <input type="text" placeholder="Enter your coupon code">
                                <button type="submit" class="site-btn">APPLY COUPON</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                            <li>Subtotal <span>$454.98</span></li>
                            <li>Total <span>$454.98</span></li>
                        </ul>
                        <a href="#" class="primary-btn">PROCEED TO CHECKOUT</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->
         <!-- 주문내역 끝 -->              
                       
                       
                        
                       	<!--  
                       		페이징
                       	<div class="col-lg-12">
                            <div class="product__pagination blog__pagination">
                                <a href="#">1</a>
                                <a href="#">2</a>
                                <a href="#">3</a>
                                <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                            </div>
                        </div> 
                     -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->

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