<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="" />
<meta name="author" content="" />
<title>관리자 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link href="<%=request.getContextPath()%>/resources/css/styles.css"
	rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body class="sb-nav-fixed">
	
	<div id="layoutSidenav">
		<%@ include file="../include/header.jsp"%>
		<div id="layoutSidenav_content">
			<div class="container-fluid px-4">
				<h3 class="mt-4">상품등록 수정</h3>
				<br>
				<!-- 카테고리 영역 -->
				<!-- <h5><i class="bi bi-caret-right-fill"></i>카테고리</h5>
				<form action="registerCategory.do" method="post">
					<section>
						<table class="table table-bordered">
							<tr>
								<th style="width: 160px; background-color: lightgray;">카테고리
									선택</th>
								<td><select id="firstCategory" name="categoryNo" style="width: 200px;" required>
										<option value="">= 1차 카테고리 선택 =</option>
										<option value="001">신선식품</option>
										<option value="002">가공식품</option>
										<option value="003">반찬/장류</option>
										<option value="004">선물세트</option>
								</select> 
								<select id="secondCategory" name="categoryNo2" style="width: 200px;" required>
										<option value="">= 2차 카테고리 선택 =</option>

								</select></td>
							</tr>
							<tr>
								<th style="width: 160px; background-color: lightgray;">선택된
									카테고리</th>
								<td>
								<select id="selectedCategory" name="categoryName" style="width: 200px;">
										<option value=""></option>
								</select></td>
							</tr>
						</table>
					</section>
					<div class="text-center">
						<input type="submit" value="저장" class="btn btn-dark btn-sm" id="saveButton">
					</div>
				</form> -->

				<!-- 기본정보 영역 -->
				<h5><i class="bi bi-caret-right-fill"></i>기본정보</h5>		
				<form action="itemModify.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="itemNo" value="${vo.itemNo}">
					<section>
						<table class="table table-bordered">

							<tr>
								<th style="background-color: lightgray;">상품코드</th>
								<td>${vo.itemNo}</td>
							</tr>
							<tr>
								<th style="width: 293px; background-color: lightgray;">상품명</th>
								<td><input type="text" name="name" value="${vo.name}"></td>
							</tr>
							<tr>
								<th style="background-color: lightgray;">판매가격</th>
								<td><input type="text" name="price" value="${vo.price}">&nbsp;원</td>
							</tr>
							<tr>
								<th style="background-color: lightgray;">제조사</th>
								<td><input type="text" name="manufacturer" value="${vo.manufacturer}" ></td>
							</tr>
							<tr>
								<th style="background-color: lightgray;">원산지</th>
								<td><input type="text" name="itemOrigin" value="${vo.itemOrigin}" ></td>
							</tr>
							<tr>
								<th style="background-color: lightgray;">재고수량</th>
								<td><input type="text" name="stock" value="${vo.stock}" >&nbsp;개</td>
							</tr>
							
							<c:set var="savedTaxationType" value="${vo.taxationType}" />
							<tr>
								<th style="background-color: lightgray;">과세유형</th>
								<td>
								<label> 
									<input type="radio" name="taxationType" value="과세" <c:if test="${savedTaxationType eq '과세'}">checked</c:if>>과세
								</label> 
								<label> 
									<input type="radio" name="taxationType" value="비과세" <c:if test="${savedTaxationType eq '비과세'}">checked</c:if>>비과세
								</label>
								</td>
							</tr>
							<c:set var="savedValue" value="${vo.salesStatus}" />
							<tr>
								<th style="background-color: lightgray;">판매여부</th>
								<td>
								<label>
									<input type="radio" name="salesStatus" value="진열" <c:if test="${savedValue eq '진열'}">checked</c:if>>진열
								</label> 
								<label>
									<input type="radio" name="salesStatus" value="품절" <c:if test="${savedValue eq '품절'}">checked</c:if>>품절
								</label> 
								<label>
										<input type="radio" name="salesStatus" value="단종" <c:if test="${savedValue eq '단종'}">checked</c:if>>단종
								</label> 
								<label>
										<input type="radio" name="salesStatus" value="중지" <c:if test="${savedValue eq '중지'}">checked</c:if>>중지
								</label>
								</td>
							</tr>
						<tr>
							<th style="background-color: lightgray;">삭제여부</th>
							<td>
								<input type="text" name="delyn" value="${vo.delyn}">
							</td>
						</tr>
						</table>
					</section>
					<div class="text-center">
						<button type="submit" class="btn btn-dark btn-sm">저장</button>
						<input type="button" class="btn btn-secondary btn-sm"
						onclick="location.href='item.do'" value="목록"></input>					
					</div>
				</form>


				<!-- 배송비 영역 -->
				<!--  <h5>
					<i class="bi bi-caret-right-fill"></i>배송비
				</h5>
				<form action="#" method="post">
					<section>
						<table class="table table-bordered">
							<tr>
								<th style="width: 293px; background-color: lightgray;">배송비 유형</th>
								<td><select id="deliveryTypeSelect">
										<option value="0" selected="selected">쇼핑몰 기본설정 사용</option>
										<option value="1">무료배송</option>
										<option value="2">조건부 무료배송</option>
										<option value="3">유료배송</option>
								</select></td>
							</tr>

							<tr id="deliveryPayment" style="display: none;">
								<th style="width: 293px; background-color: lightgray;">배송비
									결제</th>
								<td><select>
										<option value="선불" selected="selected">선불</option>
										<option value="착불">착불</option>
										<option value="사용자선택">사용자선택</option>
								</select></td>
							</tr>
							<tr id="defaultShippingCost" style="display: none;">
								<th style="background-color: lightgray;">기본배송비</th>
								<td><input type="text" name="shippingBasic" value="0">&nbsp;원</td>
							</tr>
							<tr id="shippingCostConditions" style="display: none;">
								<th style="background-color: lightgray;">배송비 상세조건</th>
								<td>주문금액 <input type="text" name="shippingPrice" value="0">
									원 이상 무료 배송
								</td>
							</tr>
						</table>

					</section>
				<div class="text-center">
						<button type="submit" class="btn btn-dark btn-sm">저장</button>
				</div>
				</form>  -->
				
				
		</div>
<script>
function checkDuplicateCode() {
    var productCode = $('#productCode').val();
    console.log("test:", productCode);

    // AJAX 요청
    $.ajax({
        url: 'checkDuplicate.do',
        type: 'POST',
        data: {
            productCode: productCode 
        },
        success: function(response) {
            console.log('서버로부터 응답 받음:', response);
            if (response === 1) {
                alert('상품코드가 중복됩니다.');
            } else if (response === 0) {
                alert('사용가능한 상품코드입니다.');
            } else {
                // 예외적인 경우 처리
                console.error('서버 응답 오류: 예상치 못한 값 반환');
                alert('서버 응답 오류');
            }
        },
        error: function(xhr, status, error) {
            // 오류가 발생했을 때 실행되는 코드
            console.error('서버 요청 오류:', error);
            // 오류 처리 로직을 추가하세요
        }
    });
}

</script>	
	
<!-- 상품코드 자동생성 -->		
<script> 
    // "자동생성" 버튼 클릭 시 실행되는 함수
    function generateProductCode() {
        var code = '';
        var digits = '123456789'; // 상품 코드에 사용될 숫자
        var length = 10; // 상품 코드의 길이

        for (var i = 0; i < length; i++) {
            // digits 문자열에서 무작위로 한 글자를 선택하여 코드에 추가
            code += digits.charAt(Math.floor(Math.random() * digits.length));
        }

        // 생성된 상품 코드를 상품 코드 입력란에 표시
        document.getElementById('productCode').value = code;

    }
</script>


<!-- 조건부 무료배송, 유료배송 화면표시  제어 -->
<!-- <script>
// JavaScript를 사용하여 배송비 유형 선택 상자의 변경 사항을 감지합니다.
document.addEventListener("DOMContentLoaded", function() {
    var deliveryTypeSelect = document.getElementById('deliveryTypeSelect'); // 배송비 유형 선택 상자를 찾습니다.
    var deliveryPaymentRow = document.getElementById('deliveryPayment'); // 배송비 결제 행을 찾습니다.
    var defaultShippingCostRow = document.getElementById('defaultShippingCost'); // 기본배송비 행을 찾습니다.
    var shippingCostConditionsRow = document.getElementById('shippingCostConditions'); // 배송비 상세조건 행을 찾습니다.

    deliveryTypeSelect.addEventListener('change', function() { // 배송비 유형이 변경될 때마다 실행되는 함수를 등록합니다.
        var selectedOption = deliveryTypeSelect.value; // 선택한 옵션의 값을 가져옵니다.

        if (selectedOption == "2") { // 조건부 무료배송이 선택된 경우
            deliveryPaymentRow.style.display = ''; // 배송비 결제 행을 표시합니다.
            defaultShippingCostRow.style.display = ''; // 기본배송비 행을 표시합니다.
            shippingCostConditionsRow.style.display = ''; // 배송비 상세조건 행을 표시합니다.
        } else if (selectedOption == "3") { // 유료배송이 선택된 경우
            deliveryPaymentRow.style.display = ''; // 배송비 결제 행을 표시합니다.
            defaultShippingCostRow.style.display = ''; // 기본배송비 행을 표시합니다.
            shippingCostConditionsRow.style.display = 'none'; // 배송비 상세조건 행을 숨깁니다.
        } else { // 그 외의 경우
            deliveryPaymentRow.style.display = 'none'; // 배송비 결제 행을 숨깁니다.
            defaultShippingCostRow.style.display = 'none'; // 기본배송비 행을 숨깁니다.
            shippingCostConditionsRow.style.display = 'none'; // 배송비 상세조건 행을 숨깁니다.
        }
    });
});
</script> -->

<!-- 카테고리 선택 -->
<!-- <script>
document.addEventListener("DOMContentLoaded", function() {
    var firstCategory = document.getElementById("firstCategory");
    var secondCategory = document.getElementById("secondCategory");
    var selectedCategory = document.getElementById("selectedCategory");
    var saveButton = document.getElementById("saveButton"); // 저장 버튼 요소

    firstCategory.addEventListener("change", function() {
        var selectedFirstCategory = firstCategory.value;

        // Clear existing options
        secondCategory.innerHTML = '<option value="">= 2차 카테고리 선택 =</option>';
        
        if (selectedFirstCategory === "") {
            selectedCategory.innerHTML = '<option value=""></option>';
        } else {
            updateSelectedCategory(selectedFirstCategory, "");
        }

        if (selectedFirstCategory === "001") { // If 신선식품 is selected
            addOption(secondCategory, "001", "채소");
            addOption(secondCategory, "002", "곡류");
            addOption(secondCategory, "003", "과일");
            addOption(secondCategory, "004", "버섯");
            addOption(secondCategory, "005", "계란");
        } else if (selectedFirstCategory === "002") { // If 가공식품 is selected
            addOption(secondCategory, "001", "건조식품");
            addOption(secondCategory, "002", "분말/가루");
            addOption(secondCategory, "003", "육가공품");
            addOption(secondCategory, "004", "치즈류");
            addOption(secondCategory, "005", "소스/기름류");
        } else if (selectedFirstCategory === "003") { // If 반찬/장류 is selected
            addOption(secondCategory, "001", "김치류");
            addOption(secondCategory, "002", "장아찌");
            addOption(secondCategory, "003", "찌개류");
            addOption(secondCategory, "004", "두부/김");
            addOption(secondCategory, "005", "간장/장류");
        } else if (selectedFirstCategory === "004") { // If 선물세트 is selected
            addOption(secondCategory, "001", "10만원 이하");
            addOption(secondCategory, "002", "20만원대");
            addOption(secondCategory, "003", "30만원대");
        }
    });

    secondCategory.addEventListener("change", function() {
        var selectedFirstCategory = firstCategory.value;
        var selectedSecondCategory = secondCategory.value;
        updateSelectedCategory(selectedFirstCategory, selectedSecondCategory);
    });

    saveButton.addEventListener("click", function(event) { // 저장 버튼 클릭 이벤트 핸들러
        var selectedSecondCategory = secondCategory.value;
        if (selectedSecondCategory === "") {
            alert("2차 카테고리를 선택해주세요.");
            event.preventDefault(); // 폼의 기본 동작을 막음
        }
    });

    function addOption(selectElement, value, text) {
        var option = document.createElement("option");
        option.value = value;
        option.textContent = text;
        selectElement.appendChild(option);
    }

    function updateSelectedCategory(firstCategoryValue, secondCategoryValue) {
        var firstCategoryText = firstCategory.options[firstCategory.selectedIndex].text;
        var secondCategoryText = secondCategory.options[secondCategory.selectedIndex].text;

        if (firstCategoryValue === "") {
            selectedCategory.innerHTML = '<option value=""></option>';
        } else if (secondCategoryValue !== "" && secondCategoryText !== "= 2차 카테고리 선택 =") {
            selectedCategory.innerHTML = '<option value="' + firstCategoryText + ' > ' + secondCategoryText + '">' + firstCategoryText + ' > ' + secondCategoryText + '</option>';
        } else {
            selectedCategory.innerHTML = '<option value="' + firstCategoryText + '">' + firstCategoryText + '</option>';
        }
    }
});
</script> -->


		<footer class="py-4 bg-light mt-auto">
			<div class="container-fluid px-4">
				<div class="d-flex align-items-center justify-content-between small">
					<div class="text-muted">Copyright &copy; Your GreenMarket
						2024</div>

				</div>
			</div>
		</footer>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/resources/js/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/datatables-simple-demo.js"></script>
</body>
</html>
