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
							<h2 style="font-weight: bold; font-size: 24px; letter-spacing: 2px; color: rgb(51, 51, 51);">취소/반품/교환내역</h2>
							<!-- 검색창 시작 -->
							<div class="blog__sidebar__search">
								<form action="#">
									<input type="text" placeholder="취소한 상품을 검색할 수 있어요!">
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

					
                       
    <!-- 주문내역 가로 목차 -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th>주문일</th>
                                    <th></th>
                                    <th>상품</th>
                                    <th  style="white-space: nowrap;">주문상태</th>
                                    <th>확인</th>
                                    <th></th> 
                                </tr>
                            </thead>
                            <tbody>
            <!--------------------------------- 주문내역 건수를 반복해서 출력할 부분 시작---------------------------------- -->
                                <tr>
                                    <td class="shoping__cart__date">
                                        <h5>2024.03.22<br>(07시55분)</h5>
                                        
                                    </td>
                                    <td class="shoping__cart__item">
                                        <img src="<%=request.getContextPath()%>/resources/img/cart/cart-1.jpg" alt="">
                                        
                                    </td>
                                    <td class="shoping__cart__price">
                                            <!-- 새로운 child 테이블 추가 시작 -->
								             <table>
											        <tr>
											            <th>상품명</th>
											            <td>[연세우유 x 그린마켓]전용목장 우유 1.8L외 1건</td>
											        </tr>
											        <tr>
											            <th>주문번호</th>
											            <td>202403220724</td>
											        </tr>
											        <tr>
											            <th>결제금액</th>
											            <td>15000원</td>
											        </tr>
											    </table>
         							   <!-- 새로운 child 테이블 추가 끝 -->
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <h5 style="color:red;">환불완료</h5>
                                        </div>
                                    </td>
                                     <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                          <table class="table-container">
										    <tr>
										        <td>
										            <button type="button" class="btn">상품평쓰기</button>
										        </td>
										    </tr>
										    <tr>
										        <td>
										            <button type="button" class="btn">반품</button>
										        </td>
										    </tr>
										    <tr>
										        <td>
										            <button type="button" class="btn">교환</button>
										        </td>
										    </tr>
										</table>         
										<!-- 새로운 child 테이블 추가 시작 -->
					  
									        <!-- 새로운 child 테이블 추가 끝 -->
                                        </div>
                                    </td>
                                  
                                   <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                          <div class="blog__sidebar__item__tags">
                                				<button style="white-space: nowrap;">상세보기</button>
                                      		</div>
                                        </div>
                                   </td>    
                                </tr>
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