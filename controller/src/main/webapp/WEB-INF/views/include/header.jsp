<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="#">
<style>
.sub-menu{display:none}
a {
    text-decoration: none;
}

.hero.hero-normal {
    border-top: 1px solid #000;
    border-bottom: 1px solid #000;
    padding-bottom: 0px;
}
ul {
	margin-bottom: 0rem;
	padding: 3px;
}
.hero_categories_all {
	padding: 9px 41px 10px 30px;
}
</style>

<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.1.min.js"></script>
<script>
let flag=false;
function chagemenufn(){
	flag = !flag;
	if(flag){
		console.log(2);
		$(".sub-menu").css({ display:'flex',overflowX: 'auto', width:'900px', height: '320px', justifyContent: 'center'})
	}else{
		$(".sub-menu").hide();
	}
}
</script>
</head>
<body>

	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="header__top__right">
					<div class="auth-links">
						<sec:authorize access="isAuthenticated()">
							<a
								href="<%=request.getContextPath()%>/mypage/mypage_order.do"
								class="admin-link"> 마이페이지</a>
							<span class="divider">|</span>

							<a href="<%=request.getContextPath()%>/basket/basket.do">장바구니</a>
							<span class="divider">|</span>

							<sec:authentication property="principal.username" var="username" />
							<c:if test="${username == 'admin'}">
								<a href="<%=request.getContextPath()%>/admin/index.do"
									class="admin-link">관리자</a>

								<span class="divider">|</span>
							</c:if>
							<a href="<%=request.getContextPath()%>/security/logout.do">로그아웃</a>
						</sec:authorize>

						<sec:authorize access="isAnonymous()">
							<a href="<%=request.getContextPath()%>/user/login.do"
								class="login-link">로그인</a>
						</sec:authorize>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row" style="justify-content: center;">
				<div class="col-lg-3">
					<div class="header__logo">
						<a href="<%=request.getContextPath()%>"> <img
							src="<%=request.getContextPath()%>/resources/img/logo.png" alt=""></a>
					</div>
				</div>
			</div>
			<div class="text-right"></div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>



	<section class="hero hero-normal">
		<div class="container text-center">
		    <div class="row justify-content-center">
		        <!-- 전체 카테고리 -->
		        <div class="col-lg-3 align-items-center">
		            <div class="hero__categories">
		                <div class="hero__categories__all" onclick="chagemenufn()">
		                    <i class="fa fa-bars"></i> <span>전체카테고리</span>
		                </div>
		                <ul class="sub-menu" style=" ">
		                    <li style="width:16.6%;">
		                    	<div class="all_menu_cont">
		                    		<a href="<%=request.getContextPath()%>/itemList.do"><b>신선식품</b></a>
			                    	<a href="<%=request.getContextPath()%>/itemList.do">채소</a>
			                        <a href="<%=request.getContextPath()%>/itemList1.do">곡류</a>
			                        <a href="./checkout.html">과일</a>
			                        <a href="./blog-details.html">버섯</a>
			                        <a href="./blog-details.html">계란</a>
		                            
		                    	</div>
		                    </li>
		                    <li style="width:16.6%">
		                    	<div class="all_menu_cont">
		                    		<a href="#"><b>가공식품</b></a>
		                    		<a href="./shop-details.html">건조식품</a>
		                    		<a href="./shoping-cart.html">분말/가루</a>
		                    		<a href="./checkout.html">육가공품</a>
		                    		<a href="./blog-details.html">치즈류</a>
		                    		<a href="./blog-details.html">소스/기름류</a>
		                    		<a href="./blog-details.html">조미료</a>
		                    	</div>
		                    </li>
		                    <li style="width:16.6%">
		                    	<div class="all_menu_cont">
		                    		<a href="#"><b>반찬 / 장류</b></a>
		                    		<a href="./shop-details.html">김치류</a>
		                    		<a href="./shoping-cart.html">절임/장아찌</a>
		                    		<a href="./checkout.html">찌개류</a>
		                    		<a href="./blog-details.html">두부/김</a>
		                    		<a href="./blog-details.html">간장/장류</a>
		                    		
		                    	</div>
		                    </li>
		                    <li style="width:16.6%">
		                    	<div class="all_menu_cont">
		                    		<a href="#"><b>선물세트</b></a>
		                    		<a href="./shop-details.html">10만원 이하</a>
		                    		<a href="./shoping-cart.html">20만원대</a>
		                    		<a href="./checkout.html">30만원대</a>
		                    	</div>
		                    </li>
		                </ul>
		            </div>
		        </div>
		        
		        <!-- 헤더 메뉴 -->
		        <div class="col-lg-6 align-items-center">
		            <nav class="header__menu" style="padding-bottom: 0px; padding-top: 0px;">
		                <ul>                       
		                    <li>
		                        <a href="#" style="font-size: 20px;">신선식품</a>
		                        <ul class="header__menu__dropdown">
		                            <li><a href="<%=request.getContextPath()%>/itemList.do">채소</a></li>
		                            <li><a href="<%=request.getContextPath()%>/itemList1.do">곡류</a></li>
		                            <li><a href="<%=request.getContextPath()%>/itemList.do">과일</a></li>
		                            <li><a href="<%=request.getContextPath()%>/itemList.do">버섯</a></li>
		                            <li><a href="<%=request.getContextPath()%>/itemList.do">계란</a></li>
		                        </ul>
		                    </li>                         
		                    <li><a href="#" style="font-size: 20px;">가공식품</a>
		                        <ul class="header__menu__dropdown">
		                            <li><a href="<%=request.getContextPath()%>/itemList.do">건조식품</a></li>
		                            <li><a href="<%=request.getContextPath()%>/itemList.do">분말/가루</a></li>
		                            <li><a href="<%=request.getContextPath()%>/itemList.do">육가공품</a></li>
		                            <li><a href="<%=request.getContextPath()%>/itemList.do">치즈류</a></li>
		                            <li><a href="<%=request.getContextPath()%>/itemList.do">소스/기름류</a></li>
		                            <li><a href="<%=request.getContextPath()%>/itemList.do">조미료</a></li>
		                        </ul>
		                    </li>
		                    <li><a href="#" style="font-size: 20px;">반찬/장류</a>
		                        <ul class="header__menu__dropdown">
		                            <li><a href="<%=request.getContextPath()%>/itemList.do">김치류</a></li>
		                            <li><a href="<%=request.getContextPath()%>/itemList.do">절임/장아찌</a></li>
		                            <li><a href="<%=request.getContextPath()%>/itemList.do">찌개류</a></li>
		                            <li><a href="<%=request.getContextPath()%>/itemList.do">두부/김</a></li>
		                            <li><a href="<%=request.getContextPath()%>/itemList.do">간장/장류</a></li>
		                        </ul>
		                    </li>
		                    <li><a href="#" style="font-size: 20px;">선물세트</a>
		                        <ul class="header__menu__dropdown">
		                            <li><a href="<%=request.getContextPath()%>/itemList.do">10만원 이하</a></li>
		                            <li><a href="<%=request.getContextPath()%>/itemList.do">20만원대</a></li>
		                            <li><a href="<%=request.getContextPath()%>/itemList.do">30만원대</a></li>
		                        </ul>
		                    </li>
		                </ul>
		            </nav>
		        </div>
		    </div>
		</div>
	</section>
</body>
</html>