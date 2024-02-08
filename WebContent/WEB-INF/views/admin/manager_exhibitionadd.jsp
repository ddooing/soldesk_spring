<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="icon" type="image/x-icon" href="../img/ARTMEE_PAGELOGO.png" />
<title>관리자 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="../css/styles_manager.css" rel="stylesheet" />
<!--부트스트랩 아이콘 사용-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"
	rel="stylesheet">

<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>


<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- JQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
	function previewImage(event) {
		var reader = new FileReader();
		reader.onload = function() {
			var preview = document.getElementById('preview');
			preview.src = reader.result;
			preview.style.display = 'block';
		}
		reader.readAsDataURL(event.target.files[0]);
	}
</script>

<style>
.filebox .upload-name {
	display: inline-block;
	height: 40px;
	padding: 0 10px;
	vertical-align: middle;
	border: 1px solid #dddddd;
	width: 40%;
	color: #999999;
}

.filebox label {
	display: inline-block;
	padding: 10px 20px;
	color: #fff;
	vertical-align: middle;
	background-color: #999999;
	cursor: pointer;
	height: 40px;
	margin-left: 10px;
}

.filebox input[type="file"] {
	position: absolute;
	width: 0;
	height: 0;
	padding: 0;
	overflow: hidden;
	border: 0;
}

.filebox1 .upload-name1 {
	display: inline-block;
	height: 40px;
	padding: 0 10px;
	vertical-align: middle;
	border: 1px solid #dddddd;
	width: 40%;
	color: #999999;
}

.filebox1 label {
	display: inline-block;
	padding: 10px 20px;
	color: #fff;
	vertical-align: middle;
	background-color: #999999;
	cursor: pointer;
	height: 40px;
	margin-left: 10px;
}

.filebox1 input[type="file"] {
	position: absolute;
	width: 0;
	height: 0;
	padding: 0;
	overflow: hidden;
	border: 0;
}

input[type="number"]::-webkit-inner-spin-button, input[type="number"]::-webkit-outer-spin-button
	{
	-webkit-appearance: none;
	appearance: none;
	margin: 0;
}

#poster svg {
	width: 100px; /* SVG 이미지의 너비를 조정하세요 */
	height: 100px; /* 높이를 자동으로 조정하여 가로세로 비율을 유지합니다 */
}
</style>

</head>

<body class="sb-nav-fixed">
	<c:import url="/WEB-INF/views/include/admin_header.jsp" />


	<!--실제 내용(대시보드) 부분-->
	<div id="layoutSidenav_content">
		<main style="background-color: ivory;">
			<div class="container-fluid px-4">
				<div style="margin-top: 30px;">
					<h3>전시회 추가</h3>
				</div>
				<div
					style="position: relative; display: flex; justify-content: center; margin: 10px; height: 80px; align-items: center; border: 0.2px solid black; background-color: white; margin-top: 20px;">


					<form action="${root }/admin/manager_exhibitionlist" method="get">
						<select name="exhibitioncombo" id="exhibitioncombo"
							style="width: 150px; height: 40px; margin-right: 30px;">
							<option value="" disabled selected>검색조건선택</option>
							<option value="author">작가</option>
							<option value="title">제목</option>
						</select> <input type="text" name="exhibitionsearch" id="exhibitionsearch"
							style="width: 500px; height: 40px; margin-right: 30px;"
							placeholder="검색어를 입력해주세요" />
						<button class="btn btn-dark" style="width: 80px; height: 40px;">검색</button>
					</form>
				</div>

				<form:form action="${root }/admin/exhibition_exhibitionadd_pro" id="myForm"
					method="post" modelAttribute="AddDetailExhibitionBean"
					enctype="multipart/form-data">

					<div style="display: flex; width: 100%;">
						<div
							style="flex: 1; margin: 10px; border: 1px solid black; background-color: white;">
							<div
								style="margin-left: 50px; margin-top: 30px; display: flex; align-items: baseline;">
								<h3>전시회 기본정보</h3>
								<p style="margin-left: 20px; color: #888888">* 표시는 필수항목입니다</p>
							</div>
							<table class="table table-hover table-borderless"
								style="margin-top: 50px; width: 700px; margin-left: auto; margin-right: auto; vertical-align: middle;">
								<tr style="height: 80px;">
									<th style="width: 200px; text-align: center; font-size: 20px;">전시회
										제목 *</th>
									<td><form:input path="title"
											style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;"
											required="required" /></td>
								</tr>
								<tr style="height: 80px;">
									<th style="width: 200px; text-align: center; font-size: 20px;">작가
										*</th>
									<td style="width: 400px;"><form:input path="author"
											style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;"
											required="required" /></td>
								</tr>
								<tr style="height: 80px;">
									<th style="width: 200px; text-align: center; font-size: 20px;">전시관
										*</th>
									<td style="width: 400px;"><form:input path="place"
											style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;"
											required="required" /></td>
								</tr>
								<tr style="height: 80px;">
									<th style="width: 200px; text-align: center; font-size: 20px;">전시일
										*</th>
									<td style="width: 400px;">
										<div style="display: flex;">
											<form:input type="date" id="exhibition_start"
												path="exhibition_start"
												style="border:none; border-bottom: 1px solid black; width:200px; text-align: center; font-size: 20px; margin-right:35px;"
												required="required" />
											~
											<form:input type="date" id="exhibition_end"
												path="exhibition_end"
												style="border:none; border-bottom: 1px solid black; width:200px; text-align: center; font-size: 20px;margin-left:35px;"
												required="required" />
										</div>
									</td>
								</tr>
								<tr style="height: 80px;">
									<th style="width: 200px; text-align: center; font-size: 20px;">운영시간
										*</th>
									<td style="width: 400px;">
										<div style="display: flex;">
											<form:input type="time" id="open_time" path="open_time"
												style="border:none; border-bottom: 1px solid black; width:200px; text-align: center; font-size: 20px; margin-right:35px;"
												onchange="validateTime()" required="required" />
											~
											<form:input type="time" id="close_time" path="close_time"
												style="border:none; border-bottom: 1px solid black; width:200px; text-align: center; font-size: 20px;margin-left:35px;"
												onchange="validateTime()" required="required" />
										</div>
									</td>
								</tr>
								<tr style="height: 80px;">
									<th style="width: 200px; text-align: center; font-size: 20px;">예매
										가격 *</th>
									<td style="width: 400px;"><form:input path="price"
											type="number"
											style="border:none; border-bottom: 1px solid black; width:95%; text-align: right; font-size: 20px;"
											required="required" />원</td>
								</tr>
							</table>


						</div>


						<div
							style="flex: 1; margin: 10px; border: 1px solid black; background-color: white;">
							<div style="margin-left: 50px; margin-top: 30px;">
								<h3>전시회 상세정보</h3>
							</div>
							<table class="table table-hover table-borderless"
								style="margin-top: 50px; width: 700px; margin-left: auto; margin-right: auto; vertical-align: middle;">
								<tr style="height: 80px;">
									<th style="width: 200px; text-align: center; font-size: 20px;">공개여부
										*</th>
									<td style="width: 400px;">
										<div style="text-align: center;">
											<form:radiobutton path="state" id="view" value="1"
												style="width: 15px; height: 15px;" required="required" />
											<label for="view"
												style="margin-right: 50px; font-size: 20px; margin-left: 20px;">공개</label>
											<form:radiobutton path="state" id="noview" value="2"
												style="width: 15px; height: 15px;" required="required" />
											<label for="noview"
												style="font-size: 20px; margin-left: 20px;">비공개</label>
										</div>
									</td>
								</tr>
								<tr style="height: 80px;">
									<th style="width: 200px; text-align: center; font-size: 20px;">휴무일</th>
									<td style="width: 400px;"><form:input path="holiday"
											style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;" />
									</td>
								</tr>
								<tr style="height: 80px;">
									<th style="width: 200px; text-align: center; font-size: 20px;">주소</th>
									<td style="width: 400px;"><form:input path="address"
											style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;" />
									</td>
								</tr>
								<tr style="height: 80px;">
									<th style="width: 200px; text-align: center; font-size: 20px;">사이트</th>
									<td style="width: 400px;"><form:input path="site"
											style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;" />
									</td>
								</tr>
								<tr style="height: 80px;">
									<th style="width: 200px; text-align: center; font-size: 20px;">위도</th>
									<td style="width: 400px;"><form:input path="latitude"
											style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;" />
									</td>
								</tr>
								<tr style="height: 80px;">
									<th style="width: 200px; text-align: center; font-size: 20px;">경도</th>
									<td style="width: 400px;"><form:input path="longitude"
											style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;" />
									</td>
								</tr>
							</table>


						</div>
					</div>

					<div style="display: flex; width: 100%;">
						<div
							style="flex: 1; margin: 10px; border: 1px solid black; background-color: white;">
							<div style="margin-left: 50px; margin-top: 30px;">
								<h3>전시회 메인 포스터 *</h3>
							</div>

							<div
								style="align-items: center; margin: 30px; border: 0.2px solid black; width: 600px; margin-left: auto; margin-right: auto;">
								<img src="../img/white.png" id="poster" alt="포스터"
									style="margin-left: auto; border: 1px solid black; margin-right: auto; display: block; margin-top: 30px; margin-bottom: 10px; width: 250px; height: 350px;" />
								<div class="filebox"
									style="margin-top: 25px; margin-left: auto; margin-right: auto; text-align: center; margin-bottom: 20px;">
									<input class="upload-name" value=""> <label for="file">파일찾기</label>
									<form:input type="file" id="file" path="main_poster_file"
										value="" onchange="updateImage(event)" accept="image/*"
										required="required" />
								</div>
							</div>
						</div>


						<div
							style="flex: 1; margin: 10px; border: 1px solid black; background-color: white;">
							<div style="margin-left: 50px; margin-top: 30px;">
								<h3>전시회 상세 포스터 *</h3>
							</div>

							<div
								style="align-items: center; margin: 30px; border: 0.2px solid black; width: 600px; margin-left: auto; margin-right: auto;">
								<img src="../img/white.png" id="detail-poster" alt="포스터"
									style="margin-left: auto; border: 1px solid black; margin-right: auto; display: block; margin-top: 30px; margin-bottom: 10px; width: 250px; height: 350px;" />
								<div class="filebox1"
									style="margin-top: 25px; margin-left: auto; margin-right: auto; text-align: center; margin-bottom: 20px;">
									<input class="upload-name1" value=""> <label
										for="file1">파일찾기</label>
									<form:input path="detail_poster_file" value="" type="file"
										id="file1" accept="image/*" required="required" />
								</div>
							</div>



						</div>
					</div>


					<div
						style="float: right; margin-right: 30px; margin-top: 20px; margin-bottom: 50px;">
						<a href="${root }/admin/manager_exhibitionlist"
							class="btn btn-danger" style="width: 70px; margin-right: 10px;">취소</a>
						<button type="button" class="btn btn-dark" style="width: 70px;" onclick="showConfirmation();">추가</button>
					</div>
				</form:form>
			</div>
	</div>

	<script>
		// 메인 포스터 미리보기 함수
		function updateMainImage(event) {
			var input = event.target;
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					var imgElement = document.getElementById("poster");
					imgElement.setAttribute("src", e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#file").on('change', function() {
			var fileName = $(this).val().split('\\').pop();
			$(".upload-name").val(fileName);
			updateMainImage(event);
		});

		// 상세 포스터 미리보기 함수
		function updateDetailImage(event) {
			var input = event.target;
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					var imgElement = document.getElementById("detail-poster");
					imgElement.setAttribute("src", e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#file1").on('change', function() {
			var fileName = $(this).val().split('\\').pop();
			$(".upload-name1").val(fileName);
			updateDetailImage(event);
		});
	</script>

<script>
function validateTime() {
    var openTime = document.getElementById('open_time').value;
    var closeTime = document.getElementById('close_time').value;
    
    // 시간이 모두 입력된 경우에만 검증
    if(openTime && closeTime) {
        // Date 객체를 사용하여 시간을 비교합니다.
        var startTime = new Date('1970-01-01T' + openTime + 'Z');
        var endTime = new Date('1970-01-01T' + closeTime + 'Z');
        
        // 종료 시간이 시작 시간보다 이를 경우
        if(endTime <= startTime) {
            Swal.fire({
            	  icon: "error",
            	  title: "오류",
            	  text: "종료 시간은 시작 시간보다 빠를 수 없습니다.",
            	});
            document.getElementById('close_time').value = ''; // 종료 시간 초기화
        }
    }
}
</script>

<script>
function showConfirmation() {
  // 폼 요소를 가져옵니다.
 var form = document.getElementById("myForm");
  
  Swal.fire({
    title: "전시회를 저장하시겠습니까?",
    showDenyButton: true,
    showCancelButton: true,
    icon: "warning",
    confirmButtonText: "저장",
    denyButtonText: "저장하지 않기",
    cancelButtonText: "취소"
  }).then((result) => {
    if (result.isConfirmed) {
      // 폼의 유효성을 체크합니다.
      if (form.checkValidity()) {
        Swal.fire("저장되었습니다!", "", "success").then(() => {
          form.submit(); // 알림이 닫힌 후 폼을 제출합니다.
        });
      } else {
        // 유효성 검사에 실패했을 경우, 오류 메시지를 브라우저가 표시하도록 합니다.
        form.reportValidity();
      }
    } else if (result.isDenied) {
      window.location.href = "${root}/admin/manager_exhibitionlist";
    }
    // '취소'를 선택한 경우 아무것도 하지 않습니다.
  });
}
</script>




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	

</body>

</html>
