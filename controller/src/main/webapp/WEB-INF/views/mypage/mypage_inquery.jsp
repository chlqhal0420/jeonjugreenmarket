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
    
    <style>
    .shoping__cart__table table tbody tr td.shoping__cart__item {
	width: 200px;
	text-align: center; 
}
    </style>
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
							<h2 style="font-weight: bold; font-size: 24px; letter-spacing: 2px; color: rgb(51, 51, 51);">상품 문의</h2>
						
						
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

					
                       
    <!-- 주문내역 가로 목차 -->
    <section class="shoping-cart spad" style="width:100%;">  
        <div class="container" style="max-width:100%; display: flex; justify-content: left;">
            <div class="row" style="width:100%;">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th>문의날짜</th>  
                                    <th >내용</th>
                                    <th style="padding-right: 30px;">상태</th>
                                </tr>
                            </thead>
                            <tbody>
            <!--------------------------------- 주문내역 건수를 반복해서 출력할 부분 시작---------------------------------- -->
                                <tr>
                                    <td class="shoping__cart__date">
                                        <h5>2024.03.22</h5>
                                    </td>                                                                 
                                   <td class="shoping__cart__price">
                                            <!-- 새로운 child 테이블 추가 시작 -->
								             <table>
											        <tr>
											            <td>배송이 얼마나 걸리나요?</td>
											        </tr>
											    </table>
         							   <!-- 새로운 child 테이블 추가 끝 -->
                                    </td>
                                   
                                     <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <h5 style="color:red;">답변대기</h5>
                                        </div>
                                    </td>
                                </tr>
              <!-- --------------------------------------주문내역을 반복해서 출력할 부분 끝---------------------------------------- -->
           
              
                            </tbody>
                        </table>
                       
                    </div>
                    <!-- 문의하기 버튼 -->
					<div style="text-align: right;">
   						 <button class="btn" onclick="location.href='#';" style="background-color: #7fad39; color: white; white-space: nowrap; width: 110px; height: 40px;">문의하기</button>
					</div>
            <!-- 문의하기 버튼 끝 -->
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