<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>전주그린마켓</title>

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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
    	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<style>
		.carousel-inner img{width:100% !important;
							 height:50vh !important;
						}
	</style>
</head>

<body>

	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	 <!-- Categories Section Begin -->
    <section class="categories">
        
                <div id="carouselExample" class="carousel slide" style="height: auto">
                  <div class="carousel-indicators">
				    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
				    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
				  </div>
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img src="<%=request.getContextPath()%>/resources/slide/slide01.png" class="d-block" alt="">
				    </div>
				    <div class="carousel-item ">
				      <img src="<%=request.getContextPath()%>/resources/slide/slide02.png" class="d-block" alt="">
				    </div>
				    <div class="carousel-item">
				      <img src="<%=request.getContextPath()%>/resources/slide/slide03.png" class="d-block" alt="">
				    </div>
				  </div>
				  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Previous</span>
				  </button>
				  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Next</span>
				  </button>
				</div>
    </section>
    
	          	<script>
			        // 캐러셀 자동 슬라이딩을 위한 JavaScript 코드
			        window.onload = function() {
			            var carousel = document.getElementById('carouselExample');
			            var carouselInstance = new bootstrap.Carousel(carousel, {
			                interval: 6000 // 3초마다 슬라이드 변경
			            });
			        };
			    </script>
    
    
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous">
	</script>

	<!-- Featured Section Begin -->
	<section class="featured spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h2>전체 상품</h2>
					</div>
				</div>
			</div>
			<div class="row featured__filter">
				<c:forEach var="item" items="${items}">
					<div class="col-lg-3 col-md-4 col-sm-6 mix fresh-food">
						<div class="featured__item">
							<a href="itemDetail.do?itemNo=${item.itemNo}"> <c:set
									var="url"
									value="${ pageContext.request.contextPath }/resources/img/product/NoImage.png" />
								<div class="featured__item__pic set-bg"
									data-setbg="${item.imagePath}">
									</div>
							</a>
							<div class="featured__item__text">
								<h6>${item.name}</h6>
							   <strong>판매가&nbsp;&nbsp;<fmt:formatNumber value="${item.price}" pattern="#,##0" />원</strong>   
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- Featured Section End -->




	<%@ include file="/WEB-INF/views/include/footer.jsp" %>    
    
    <!-- Js Plugins -->
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