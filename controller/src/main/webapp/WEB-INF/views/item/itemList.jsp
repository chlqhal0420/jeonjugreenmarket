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
    <title>그린마켓</title>

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
    <style>
    	.categoty_title{
    		text-decoration-line: underline;
    		text-decoration-color: yellowgreen;
    		text-decoration-thickness: 10px;
    	}
    </style>
</head>

<body>
   <%@ include file="../include/header.jsp"%>

	 <section class="featured spad">
        <div class="container">
			 <div>
           		<h4 class="categoty_title"><b>채소</b></h4>
           </div> <br>
           <div class="row featured__filter">
           
           <!-- 신선식품 > 채소 상품 목록 조회 -->
				<c:forEach var="item" items="${itemList}">
					<div class="col-lg-3 col-md-4 col-sm-6 mix fresh-food">
						<div class="featured__item">
							 <!-- 이미지를 클릭하면 상세 페이지로 이동 -->
							<a href="itemDetail.do?itemNo=${item.itemNo}"><div class="featured__item__pic set-bg" data-setbg="<%=request.getContextPath()%>/resources/upload/${item.image}"></div></a>
							
							<div class="featured__item__text">
								<h6>
									${item.name}
								</h6>
								<!-- jstl 사용하여 가격 천단위 표시 -->
								<strong><fmt:formatNumber value="${item.price}" pattern="#,##0" />원</strong>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
        </div>
    </section>

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



</body>
</html>