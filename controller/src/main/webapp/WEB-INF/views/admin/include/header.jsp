<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3"
			href="<%=request.getContextPath()%>/admin/index.do">ADMINISTRATOR</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<%@ include file="../include/nav.jsp"%>
	</nav>
	<div id="layoutSidenav_nav">
		<nav class="sb-sidenav accordion sb-sidenav-dark"
			id="sidenavAccordion">
			<div class="sb-sidenav-menu">
				<div class="nav">

					<a class="nav-link" href="user.do">
						<div class="sb-nav-link-icon">
							<i class="bi bi-person"></i>
						</div> 회원관리
					</a> 
					
					<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
						data-bs-target="#collapseLayouts" aria-expanded="false"
						aria-controls="collapseLayouts">
						<div class="sb-nav-link-icon">
							<i class="bi bi-cart3"></i>
						</div> 상품관리
						<div class="sb-sidenav-collapse-arrow">
							<i class="fas fa-angle-down"></i>
						</div>
					</a>
					<div class="collapse" id="collapseLayouts"
						aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
						<nav class="sb-sidenav-menu-nested nav">
							<a class="nav-link" href="item.do">전체 상품관리</a> 
							<a class="nav-link" href="shippingcost.do">배송비 관리</a> 
						</nav>
					</div>
					<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
						data-bs-target="#order" aria-expanded="false"
						aria-controls="order">
						<div class="sb-nav-link-icon">
								<i class="bi bi-clipboard2-check"></i>
						</div> 주문관리
						<div class="sb-sidenav-collapse-arrow">
							<i class="fas fa-angle-down"></i>
						</div>
					</a>
					<div class="collapse" id="order"
						aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
						<nav class="sb-sidenav-menu-nested nav">
							<a class="nav-link" href="order.do">주문리스트(전체)</a> 
							<a class="nav-link" href="cancel.do">취소 관리</a> 
						</nav>
					</div>									
					<a class="nav-link" href="category.do">
						<div class="sb-nav-link-icon">
							<i class="bi bi-tags"></i>
						</div> 카테고리관리
					</a> 								
					
					<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
						data-bs-target="#collapseLayout" aria-expanded="false"
						aria-controls="collapseLayout">
						<div class="sb-nav-link-icon">
							<i class="fas fa-chart-area"></i>
						</div> 통계분석
						<div class="sb-sidenav-collapse-arrow">
							<i class="fas fa-angle-down"></i>
						</div>
					</a>
					<div class="collapse" id="collapseLayout"
						aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
						<nav class="sb-sidenav-menu-nested nav">
							<a class="nav-link" href="dailyOrderStatistics.do">일별주문통계</a> 
							<a class="nav-link" href="#">일별접속자통계</a> 
						</nav>
					</div>				
					<a class="nav-link" href="customer.do">
						<div class="sb-nav-link-icon">
							<i class="bi bi-chat-text"></i>
						</div> 고객지원
					</a>
					<a class="nav-link" href="calculate.do">
						<div class="sb-nav-link-icon">
						<i class="bi bi-bar-chart-line"></i>
						</div> 정산관리
					</a>
				</div>
			</div>

		</nav>
	</div>
</body>
</html>