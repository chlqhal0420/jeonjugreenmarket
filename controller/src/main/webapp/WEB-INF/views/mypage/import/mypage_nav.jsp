<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
 <div class="col-lg-3 col-md-5">
                    <div class="blog__sidebar">
                       
                        <div class="blog__sidebar__item">
                            <h4>MY 쇼핑</h4>
                            <ul>
                                <li><a href="<%=request.getContextPath()%>/mypage/mypage_order.do">주문내역</a></li>
                                <li><a href="<%=request.getContextPath()%>/mypage/mypage_cancle_order.do">취소/반품/교환내역</a></li>
                                <li><a href="#">환불/입금내역</a></li>
                             </ul>
                            
                             <h4>MY 활동</h4>
                             <ul>
                             	<li><a href="<%=request.getContextPath()%>/mypage/mypage_dibs.do">찜리스트</a></li>
                                <li><a href="<%=request.getContextPath()%>/mypage/mypage_review.do">리뷰관리</a></li>
                                <li><a href="<%=request.getContextPath()%>/mypage/mypage_inquery_product.do">상품문의</a></li>
                             </ul>
                             
                              <h4>MY 정보</h4>
                             <ul>
                               	<li><a href="<%=request.getContextPath()%>/mypage/mypage_address.do">배송지관리</a></li>
                                <li><a href="<%=request.getContextPath()%>/mypage/mypage_info.do">회원정보수정</a></li>
                             </ul>
                             
                        </div>
						   <div class="blog__sidebar__item">
						    <h4>고객센터</h4>
						    <ul>
						        <li>
						            <a href="<%=request.getContextPath()%>/mypage/mypage_inquery.do"">
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
</body>
</html>