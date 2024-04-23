<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>그린마켓 </title>
    <script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
	<!-- 부트스트랩 모달창 css -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/mypage_address.css" type="text/css">
    
    <style>
    	.shoping__cart__table table tbody tr td.shoping__cart__date {
    	width: 100px;
   		text-align: center;
    	padding: 20px;
}
    </style>
    
   <script>
  /*수정하는 모달창의 초기값*/
  function fetchAddressDetails(addrNo) {
    $.ajax({
      url: 'select_now_address.do', 
      method: 'POST',
      data: { addrNo: addrNo },
      success: function(data) {
        // data는 AddressVO 객체의 필드에 해당하는 키-값 쌍을 포함하는 것으로 가정합니다.
        $('#edit-name').val(data.name); // 이름
        $('#edit-addr').val(data.addr); // 주소
        $('#edit-addrDetail').val(data.addrDetail); // 상세 주소
        $('#edit-phone').val(data.phone); // 휴대폰 번호
        $('#edit-addrNo').val(addrNo); // 배송번호
        $('#edit-def').prop('checked', data.def === 'Y'); // 기본 배송지 여부 ('Y' or 'N')
        // 모달을 표시합니다.
        $('#editModal').modal('show');
      },
      error: function() {
        alert('데이터를 가져오는데 실패했습니다.');
      }
    });
  }
/*수정모달창에서 저장버튼 클릭시 입력한 정보들을 updatedInfo에 담아서 컨트롤러로 보냄.*/
$(document).on('click', '#save-changes', function() {
    var updatedInfo = {
        name: $('#edit-name').val(),
        addr: $('#edit-addr').val(),
        addrDetail: $('#edit-addrDetail').val(),
        phone: $('#edit-phone').val(),
        addrNo: $('#edit-addrNo').val(),
        def: $('#edit-def').is(':checked') ? 'Y' : 'N'
    };
    
    $.ajax({
        url: 'modify_address.do',
        method: 'POST',
        data: updatedInfo, // 객체를 직접 전달하면 jQuery가 쿼리 스트링으로 변환
        success: function() {
            $('#editModal').modal('hide');
            alert('배송지 정보가 성공적으로 업데이트되었습니다.');
            location.reload(); // 변경 사항을 반영하기 위해 페이지 새로고침
        },
        error: function() {
            alert('배송지 정보 업데이트에 실패했습니다.');
        }
    });
});

</script>
</head>

<body>
<!-- 부트스트랩 모달창 -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="editModalLabel">배송지 수정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- Form for editing -->
        <form id="edit-form">
          <div class="form-group">
            <label for="edit-addr">주소</label>
            <input type="text" class="form-control" id="edit-addr" readonly>
          </div>
          <div class="form-group">
            <label for="edit-addrDetail">상세 주소</label>
            <input type="text" class="form-control" id="edit-addrDetail" name="addrDetail">
          </div>
          <div class="form-group">
            <label for="edit-recipient">받으실 분</label>
            <input type="text" class="form-control" id="edit-name"  name="name">
          </div>
          <div class="form-group">
            <label for="edit-phone">휴대폰 번호</label>
            <input type="text" class="form-control" id="edit-phone" name="phone">
          </div>
          <div class="form-group">
            <label for="def">기본배송지로 저장</label>
            <input type="checkBox" name="def" id="edit-def" value="N"> 예
          </div>
          <input type="hidden" name="addrNo" id="edit-addrNo">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="save-changes">저장하기</button>
      </div>
    </div>
  </div>
</div>
<!-- 부트스트랩 모달창 끝 -->
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
							<h2 style="font-weight: bold; font-size: 24px; letter-spacing: 2px; color: rgb(51, 51, 51);">배송지 관리</h2>
							<!-- 연도별 주문내역 선택버튼-->
                            <div class="blog__sidebar__item__tags" style="display: flex; justify-content: flex-end;">
                                <button >+ 새 배송지 추가</button>
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
                                    <th>기본</th>
                                    <th>주소</th>
                                    <th  style="white-space: nowrap;">받으실분</th>
                                    <th>연락처</th>
                                    <th  style="padding-right: 40px;">수정/삭제</th> 
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${addr}">
            <!--------------------------------- 주문내역 건수를 반복해서 출력할 부분 시작---------------------------------- -->
                                <tr>
                                    <td class="shoping__cart__item">
                                        <span><h5>${item.def}</h5></span>
                                        
                                    </td>
                                    <td class="shoping__cart__price">
                                            <!-- 새로운 child 테이블 추가 시작 -->
								             <table>
											        <tr>
											            <td><h5><span>${item.addr}</span>&nbsp;&nbsp;<span>${item.addrDetail}</span></h5></td>
											        </tr>
											       
											    </table>
         							   <!-- 새로운 child 테이블 추가 끝 -->
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <h5 style="color:black;">${item.name}</h5>
                                        </div>
                                    </td>
                                     <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                         <span>${item.phone}</span>     
										<!-- 새로운 child 테이블 추가 시작 -->
					  
									        <!-- 새로운 child 테이블 추가 끝 -->
                                        </div>
                                    </td>
                                  
                                   <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                          <table class="table-container">
										    <tr>
										        <td>
										            <button type="button" class="btn" data-toggle="modal" data-target="#editModal" onclick="fetchAddressDetails(${item.addrNo})">수정</button>
										        </td>
										    </tr>
										    <tr>
										        <td>
										            <button type="button" class="btn" onclick="deleteAddr(${item.addrNo})">삭제</button>
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