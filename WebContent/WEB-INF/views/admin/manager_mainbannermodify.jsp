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

<!-- sweetalert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- JQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 부트스트랩 아이콘 CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

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
	height: 80px;
	padding: 0 10px;
	vertical-align: middle;
	border: 1px solid #dddddd;
	
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
</style>

</head>

<body class="sb-nav-fixed">
	<c:import url="/WEB-INF/views/include/admin_header.jsp" />

	<!--실제 내용(대시보드) 부분-->
	<div id="layoutSidenav_content">
		<main style="background-color: ivory;">
			<div class="container-fluid px-4">
				<div style="margin-top: 30px;">
					<h3>배너 수정</h3>
				</div>
				<div
					style="position: relative; display: flex; justify-content: start; height: 80px; align-items: center; border: 0.2px solid black; background-color: white; margin-top: 20px;">
					<div
						style="position: flex; margin-right: 60px; width: 450px; float: left;">
						<span class="badge text-bg-success rounded-pill"
							style="font-size: 15px; margin-right: 10px; margin-left: 50px;">노출배너
							${BadgeCnt.banner_show_Cnt }건</span> <span
							class="badge text-bg-danger rounded-pill"
							style="font-size: 15px; margin-right: 10px;">숨김배너
							${BadgeCnt.banner_hide_Cnt }건</span> <span
							class="badge bg-success-subtle text-success-emphasis rounded-pill"
							style="background-color: black; font-size: 15px;">배너
							총${BadgeCnt.banner_all_Cnt}건</span>
					</div>

					<form action="${root }/admin/manager_mainbannershowlist"
						method="get">
						<select name="bannercombo" id="bannercombo"
							style="width: 150px; height: 40px; margin-right: 30px;">
							<option value="title" selected>제목</option>
						</select>
						<c:choose>
							<c:when test="${bannersearch != null }">
								<input type="text" name="bannersearch" id="bannersearch"
									style="width: 500px; height: 40px; margin-right: 30px;"
									value="${bannersearch }" />
							</c:when>
							<c:otherwise>
								<input type="text" name="bannersearch" id="bannersearch"
									style="width: 500px; height: 40px; margin-right: 30px;"
									placeholder="검색어를 입력해주세요" />
							</c:otherwise>
						</c:choose>

						<button class="btn btn-dark" style="width: 80px; height: 40px;">검색</button>
					</form>

				</div>

				<form:form action="${root }/admin/manager_mainbannermodify_pro" method="post" modelAttribute="getOneMainBannerInfoBean"
					enctype="multipart/form-data" id="myForm">
					<form:hidden path="main_banner_id"/>
					<form:hidden path="banner_file_id"/>
					<form:hidden path="expose_order"/>
					<div style="display: flex; width: 100%;">
						<div
							style="flex: 1; margin: 10px; border: 1px solid black; background-color: white;">
							<div
								style="align-items: center; margin: 30px; border: 0.2px solid black; width: 600px; margin-left: auto; margin-right: auto;">
								<h3 style="margin-top: 20px; margin-left: 15px;">배너 이미지 변경</h3>
								<img src="${getOneMainBannerInfoBean.main_banner_path }${getOneMainBannerInfoBean.main_banner_name }" id="poster" alt="포스터" style="margin-left: auto; margin-right: auto; display: block; margin-top: 30px; margin-bottom: 10px; width: 500px; height: 200px;" />
								<div class="filebox"
									style="margin-top: 25px; margin-left: auto; margin-right: auto; text-align: center; margin-bottom: 20px;">
									<input class="upload-name"
										value="${getOneMainBannerInfoBean.main_banner_name }"> <label
										for="file">파일찾기</label>
									<form:input type="file" id="file" path="main_banner_file"
										value="${getOneMainBannerInfoBean.main_banner_path }${getOneMainBannerInfoBean.main_banner_name }"
										onchange="updateImage(event)" accept="image/*" />
								</div>
							</div>

							<script>
								function updateImage(event) {
									var input = event.target;
									if (input.files && input.files[0]) {
										var reader = new FileReader();
										reader.onload = function(e) {
											var imgElement = document
													.getElementById("poster");
											imgElement.setAttribute("src",
													e.target.result);
										}
										reader.readAsDataURL(input.files[0]);
									}
								}

								$("#file").on(
										'change',
										function() {
											var fileName = $(this).val().split(
													'\\').pop();
											$(".upload-name").val(fileName);
										});
							</script>

							<div style="margin-top: 50px; text-align: center; margin-bottom:20px;">
								<h3 style="margin-left: 100px; margin-top: 35px; text-align: left;">신청인</h3>
								<form:input path="user_name"
									style="background-color: transparent; border: none; border-bottom: 1px solid black; width: 600px; margin-top: 20px; font-size:20px;"
									readonly="true" disabled="true" />
								<h3 style="margin-left: 100px; margin-top: 35px; text-align: left;">전화번호</h3>
								<form:input id="telephone" path="telephone"
									style="background-color: transparent; border: none; border-bottom: 1px solid black; width: 600px; margin-top: 20px; font-size:20px;"
									readonly="true" disabled="true" />
							</div>



						</div>


						<div style="flex: 1; margin: 10px; border: 1px solid black; background-color: white;">
							<div
								style="margin-left: 50px; margin-top: 30px; display: flex; align-items: baseline;">
								<h3>배너 상세정보</h3>
								
							</div>
							<table class="table table-hover table-borderless"
								style="margin-top: 50px; width: 700px; margin-left: auto; margin-right: auto; vertical-align: middle;">
								
								<tr style="height: 80px;">
									<th style="width: 200px; text-align: center; font-size: 20px;">전시회 제목</th>
									<td style="width: 400px;"><form:input id="regdate"
											path="title"
											style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;" readonly="true" disabled="true"/></td>
								</tr>
								
								<tr style="height: 80px;">
									<th style="width: 200px; text-align: center; font-size: 20px;">등록일자</th>
									<td style="width: 400px;"><form:input id="regdate"
											path="regdate"
											style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;"
											readonly="true" disabled="true" /></td>
								</tr>
								<tr style="height: 80px;">
									<th style="width: 200px; text-align: center; font-size: 20px;">결제금액</th>
									<td style="width: 400px;"><form:input path="pay_money"
											style="border:none; border-bottom: 1px solid black; width:95%; text-align: right; font-size: 20px;" readonly="true" disabled="true" />원
									</td>
								</tr>
								<tr style="height: 80px;">
									<th style="width: 200px; text-align: center; font-size: 20px;">노출순서</th>
									<td style="width: 400px;">
										<c:choose>
											<c:when test="${getOneMainBannerInfoBean.state == 1 }">
												<form:input path="expose_order" style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;" disabled="true" readonly="true"/>	
											</c:when>
											<c:when test="${getOneMainBannerInfoBean.state == 2 }">
												<input type="text" value="0" style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;" readonly="readonly" disabled="disabled"/>
											</c:when>
										</c:choose>
									</td>
								</tr>
								<tr style="height: 80px;">
									<th style="width: 200px; text-align: center; font-size: 20px;">노출여부*</th>
									<td style="width: 400px;">
										<div style="text-align: center;">
											<c:choose>
												<c:when test="${getOneMainBannerInfoBean.state == 1 }">
													<form:radiobutton path="state" id="view" value="1"
														style="width: 15px; height: 15px;" checked="checked"
														required="required" />
													<label for="view"
														style="margin-right: 50px; font-size: 20px; margin-left: 20px;">노출</label>
													<form:radiobutton path="state" id="noview" value="2"
														style="width: 15px; height: 15px;" required="required" />
													<label for="noview"
														style="font-size: 20px; margin-left: 20px;">숨김</label>
												</c:when>

												<c:when test="${getOneMainBannerInfoBean.state == 2 }">
													<form:radiobutton path="state" id="view" value="1"
														style="width: 15px; height: 15px;" required="required" />
													<label for="view"
														style="margin-right: 50px; font-size: 20px; margin-left: 20px;">노출</label>
													<form:radiobutton path="state" id="noview" value="2"
														style="width: 15px; height: 15px;" checked="checked"
														required="required" />
													<label for="noview"
														style="font-size: 20px; margin-left: 20px;">숨김</label>
												</c:when>

												<c:otherwise>
													<form:radiobutton path="state" id="view" value="1"
														style="width: 15px; height: 15px;" required="required" />
													<label for="view"
														style="margin-right: 50px; font-size: 20px; margin-left: 20px;">노출</label>
													<form:radiobutton path="state" id="noview" value="2"
														style="width: 15px; height: 15px;" required="required" />
													<label for="noview"
														style="font-size: 20px; margin-left: 20px;">숨김</label>
												</c:otherwise>
											</c:choose>

										</div>
									</td>
								</tr>
								
								<tr style="height: 80px;">
									<th style="width: 200px; text-align: center; font-size: 20px;">노출기간*</th>
									<td style="width: 400px;">
										<div style="display: flex;">
											<form:input type="date" id="exhibition_start"
												path="start_date" onchange="validateDate()"
												style="border:none; border-bottom: 1px solid black; width:200px; text-align: center; font-size: 20px; margin-right:35px;"
												required="required" />
											~
											<form:input type="date" id="exhibition_end"
												path="end_date" onchange="validateDate()"
												style="border:none; border-bottom: 1px solid black; width:200px; text-align: center; font-size: 20px;margin-left:35px;"
												required="required" />
										</div>
									</td>
								</tr>

							</table>

						</div>
					</div>
					<div
						style="float: right; margin-right: 30px; margin-top: 20px; margin-bottom: 50px;">
						<a href="${root }/admin/manager_mainbannershowlist"
							class="btn btn-danger" style="width: 70px; margin-right: 10px;">취소</a>
						<button type="button" class="btn btn-dark" style="width: 70px;"
							onclick="updateConfirm();">수정</button>
					</div>
				</form:form>




			</div>


		</main>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>


	<script>
	function validateDate() {
	    var startDate = document.getElementById('exhibition_start').value;
	    var endDate = document.getElementById('exhibition_end').value;
	    
	    // 날짜가 모두 입력된 경우에만 검증
	    if(startDate && endDate) {
	        // 날짜 객체로 변환하여 비교합니다.
	        var start = new Date(startDate);
	        var end = new Date(endDate);
	        
	        // 종료 날짜가 시작 날짜보다 이를 경우
	        if(end < start) {
	            Swal.fire({
	                icon: "error",
	                title: "오류",
	                text: "종료 날짜는 시작 날짜보다 빠를 수 없습니다.",
	            });
	            document.getElementById('exhibition_end').value = startDate; // 종료 날짜 초기화
	        }
	    }
	}
	
	
	function updateConfirm() {
	    Swal.fire({
	        title: '수정하시겠습니까?',
	        text: "수정을 완료하시려면 '수정' 버튼을 클릭하세요.",
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonColor: '#3085d6',
	        cancelButtonColor: '#d33',
	        confirmButtonText: '수정',
	        cancelButtonText: '취소'
	    }).then((result) => {
	        if (result.isConfirmed) {
	            Swal.fire(
	                '수정되었습니다!',
	                '메인 배너가 성공적으로 수정되었습니다.',
	                'success'
	            ).then((result) => {
	                if (result.isConfirmed) {
	                    document.getElementById('myForm').submit(); // 폼 제출
	                }
	            });
	        }
	    });
	}


	</script>
</body>

</html>