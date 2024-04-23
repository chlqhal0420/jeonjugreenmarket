<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body class="sb-nav-fixed">
	<div id="layoutSidenav">
		<%@ include file="../include/header.jsp"%>
		<div id="layoutSidenav_content">
			<div class="container-fluid px-4">
				<h3 class="mt-4">상품등록</h3>
				<br>
				<!-- 카테고리 영역 -->
				<h5>
					<i class="bi bi-caret-right-fill"></i>카테고리
				</h5>
				<form action="registerCategory.do" method="post">
					<section>
						<table class="table table-bordered">
							<tr>
								<th style="width: 200px; background-color: lightgray;">카테고리
									선택</th>
								<td><select id="firstCategory" name="categoryNo2"
									style="width: 200px;" required>
										<option value="">= 1차 카테고리 선택 =</option>
										<option value="001">신선식품</option>
										<option value="002">가공식품</option>
										<option value="003">반찬/장류</option>
										<option value="004">선물세트</option>
								</select> 
								<select id="secondCategory" name="categoryName"
									style="width: 200px;" required>
										<option value="">= 2차 카테고리 선택 =</option>

								</select></td>
							</tr>
							<tr>
								<th style="background-color: lightgray;">선택된 카테고리</th>
								<td><select id="selectedCategory" name=""
									style="width: 200px;">
										<option value=""></option>
								</select></td>
							</tr>
						</table>
					</section>
					<div class="text-center">
						<input type="submit" value="저장" class="btn btn-dark btn-sm"
							id="saveButton">
					</div>
				</form>

				<!-- 기본정보 영역 -->
				<h5>
					<i class="bi bi-caret-right-fill"></i>기본정보
				</h5>
				<form action="register.do" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
						<!-- 카테고리 기본키 -->
						<input type="hidden" name="categoryNo" value="${param.recentCategoryNo}">
					<section>
						<table class="table table-bordered">

							<tr>
								<th style="background-color: lightgray;">상품코드</th>
								<td><span> 상품의 코드는 10자리 숫자로 자동생성합니다.</span> <br> <input
									type="text" name="itemNo" value="" maxlength="10"
									id="productCode" required>&nbsp;
									<button type="button" onclick="checkDuplicateCode()"
										class="btn btn-success btn-sm">중복확인</button>
									<button type="button" onclick="generateProductCode()"
										class="btn btn-secondary btn-sm">자동생성</button></td>
							</tr>

							<tr>
								<th style="width: 200px; background-color: lightgray;">상품명</th>
								<td><input type="text" name="name" style="width: 370px;"
									required></td>
							</tr>
							<tr>
								<th style="background-color: lightgray;">판매가격</th>
								<td><input type="text" name="price" value="0" required>&nbsp;원</td>
							</tr>


							<tr>
								<th style="background-color: lightgray;">제조사</th>
								<td><input type="text" name="manufacturer" required></td>
							</tr>
							<tr>
								<th style="background-color: lightgray;">원산지</th>
								<td><input type="text" name="itemOrigin" required></td>
							</tr>
							<tr>
								<th style="background-color: lightgray;">재고수량</th>
								<td><input type="text" name="stock" value="0" required>&nbsp;개</td>
							</tr>
							<tr>
								<th style="background-color: lightgray;">과세유형</th>
								<td><label> <input type="radio" name="taxationType"
										value="비과세" checked="checked" required>비과세
								</label> <label> <input type="radio" name="taxationType"
										value="과세" required>과세
								</label></td>
							</tr>
							<tr>
								<th style="background-color: lightgray;">판매여부</th>
								<td><label> <input type="radio" name="salesStatus"
										value="진열" checked="checked" required>진열
								</label> <label> <input type="radio" name="salesStatus"
										value="품절" required>품절
								</label> <label> <input type="radio" name="salesStatus"
										value="단종" required>단종
								</label> <label> <input type="radio" name="salesStatus"
										value="중지" required>중지
								</label></td>
							</tr>
							<tr>
								<th style="background-color: lightgray;">상품이미지</th>
								<td>
									<div class="input-group mb-3" style="width: 450px;">
										<input type="file" class="form-control" id="inputGroupFile02"
											name="uploadFile" required> <label
											class="input-group-text" for="inputGroupFile02">Upload</label>
									</div> <input type="hidden" name="image" value="">
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
			</div>

<script>
	// 이지 업로드명 서버에 보내기
    // 파일 input 요소
    var fileInput = document.getElementById('inputGroupFile02');
    // 텍스트 input 요소
    var imageTextInput = document.querySelector('input[name="image"]');

    // 파일이 선택되었을 때의 이벤트 핸들러
    fileInput.addEventListener('change', function(event) {
        // 선택된 파일이 있는지 확인
        if (event.target.files.length > 0) {
            // 첫 번째 선택된 파일의 이름을 가져와서 "001"을 추가한 새 파일명 생성
            var originalFileName = event.target.files[0].name;
            var fileNMArr = originalFileName.split(".");
            var ext = fileNMArr[fileNMArr.length - 1];
            var newFileName = fileNMArr[0] + "001." + ext;

            // 새 파일명을 텍스트 input 요소의 value에 설정
            imageTextInput.value = newFileName;
        } else {
            // 파일이 선택되지 않았을 경우, 텍스트 input 요소의 value를 비움
            imageTextInput.value = '';
        }
    });
</script>



			<script>
// 상품 코드 중복 확인
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
// 페이지 로드 시 실행되는 함수
window.onload = function() {
    generateProductCode(); // 페이지 로드 시마다 새로운 상품 코드 생성
};

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

    // 생성된 상품 코드를 로컬 스토리지에 저장
    localStorage.setItem('productCode', code);
}
</script>



<!-- 카테고리 선택 -->
<script>
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
            addOption(secondCategory, "채소", "채소");
            addOption(secondCategory, "곡류", "곡류");
            addOption(secondCategory, "과일", "과일");
            addOption(secondCategory, "버섯", "버섯");
            addOption(secondCategory, "계란", "계란");
        } else if (selectedFirstCategory === "002") { // If 가공식품 is selected
            addOption(secondCategory, "건조식품", "건조식품");
            addOption(secondCategory, "분말/가루", "분말/가루");
            addOption(secondCategory, "육가공품", "육가공품");
            addOption(secondCategory, "치즈류", "치즈류");
            addOption(secondCategory, "소스/기름류", "소스/기름류");
        } else if (selectedFirstCategory === "003") { // If 반찬/장류 is selected
            addOption(secondCategory, "김치류", "김치류");
            addOption(secondCategory, "장아찌", "장아찌");
            addOption(secondCategory, "찌개류", "찌개류");
            addOption(secondCategory, "두부/김", "두부/김");
            addOption(secondCategory, "간장/장류", "간장/장류");
        } else if (selectedFirstCategory === "004") { // If 선물세트 is selected
            addOption(secondCategory, "10만원 이하", "10만원 이하");
            addOption(secondCategory, "20만원대", "20만원대");
            addOption(secondCategory, "30만원대", "30만원대");
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
</script>
<script>
    // 폼 제출 전 확인
    function validateForm() {
        // 카테고리 선택 여부 확인
        var recentCategoryNo = '${param.recentCategoryNo}';
        if (recentCategoryNo === '') {
            // 카테고리가 선택되지 않은 경우
            alert("카테고리를 선택하고 저장버튼을 눌러주세요.");
            return false; // 폼 전송 취소
        }

        // 카테고리가 선택된 경우
        return true; // 폼 전송 허용
    }
</script>



			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
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
