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
	
	<script
	src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js"
	referrerpolicy="origin"></script>
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
</style>

</head>

<body class="sb-nav-fixed">
		<c:import url="/WEB-INF/views/include/admin_header.jsp" />

		
		<!--실제 내용(대시보드) 부분-->
		<div id="layoutSidenav_content">
			<main style="background-color: ivory;">
				<div class="container-fluid px-4">
					<div style="margin-top: 30px;">
						<h3>전시회 수정</h3>
					</div>
					<div style="position: relative; display: flex; justify-content: center; margin:10px; height: 80px; align-items: center; border: 0.2px solid black; background-color: white; margin-top: 20px;">
						
						
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

					<form:form action="${root }/admin/exhibition_exhibitionmodify_pro" method="post" modelAttribute="DetailExhibitionBean" enctype="multipart/form-data">
					<div style="display: flex; width: 100%;">
						<div style="flex: 1; margin: 10px; border: 1px solid black;  background-color: white;">
							<div style="align-items: center; margin: 30px; border: 0.2px solid black; width: 600px; margin-left: auto; margin-right: auto;">
							<h3 style="margin-top:20px; margin-left:15px;">포스터 이미지 변경</h3>
							  <img src="${DetailExhibitionBean.main_poster_path }${DetailExhibitionBean.main_poster_name }" id="poster" alt="포스터" style="margin-left: auto; margin-right: auto; display: block; margin-top: 30px; margin-bottom: 10px; width: 250px; height: 350px;" />
								  <div class="filebox" style="margin-top: 25px; margin-left:auto; margin-right:auto; text-align: center; margin-bottom: 20px;">
								    <input class="upload-name" value="${DetailExhibitionBean.main_poster_name }">
								    <label for="file">파일찾기</label>
								    <form:input type="file" id="file" path="main_poster_file" value="${DetailExhibitionBean.main_poster_path }${DetailExhibitionBean.main_poster_name }" onchange="updateImage(event)" accept="image/*"/>
								  </div>
							</div>
							
							<script>
							  function updateImage(event) {
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
								});
							</script>

							<div style="margin-top: 50px; text-align: center;">
								<h3 style="margin-left: 100px; margin-top: 60px; text-align: left;">전시회 제목</h3>
								<form:input path="title"
									style="background-color: transparent; border: none; border-bottom: 1px solid black; width: 600px; margin-top: 20px; font-size:20px;" />
								<h3 style="margin-left: 100px; margin-top: 35px; text-align: left;">신청인</h3>
								<form:input path="apply_name"  style="background-color: transparent; border: none; border-bottom: 1px solid black; width: 600px; margin-top: 20px; font-size:20px;" readonly="true" disabled="true"/>		
								<h3 style="margin-left: 100px; margin-top: 35px; text-align: left;">이메일</h3>
								<form:input path="apply_email"  style="background-color: transparent; border: none; border-bottom: 1px solid black; width: 600px; margin-top: 20px; font-size:20px;" readonly="true" disabled="true"/>
								<h3 style="margin-left: 100px; margin-top: 35px; text-align: left;">전화번호</h3>
								<form:input id="apply_telephone" path="apply_telephone" style="background-color: transparent; border: none; border-bottom: 1px solid black; width: 600px; margin-top: 20px; font-size:20px;" readonly="true" disabled="true"/>		

								<h3 style="margin-left: 100px; margin-top: 35px; text-align: left;">내용 이미지</h3>
									<div class="filebox1" style="margin-top: 25px; margin-left:auto; margin-right:auto; text-align: center; margin-bottom: 20px;">
										<input class="upload-name1" value="${DetailExhibitionBean.detail_poster_name }">
										<label for="file1">파일찾기</label>
										<form:input path="detail_poster_file" value="${DetailExhibitionBean.detail_poster_path }${DetailExhibitionBean.detail_poster_name }" type="file" id="file1" accept="image/*"/>
									</div>
							</div>
							
							<script>
							 $("#file1").on('change', function() {
								    var fileName = $(this).val().split('\\').pop();
								    $(".upload-name1").val(fileName);
								});
							</script>
							
						</div>
						
							
							<div style="flex: 1; margin: 10px; border: 1px solid black;  background-color: white;">
								<div style="margin-left:50px; margin-top:30px;">
									<h3>전시회 상세정보</h3>
								</div>
									<table class="table table-hover table-borderless" style="margin-top:50px; width:700px; margin-left:auto; margin-right:auto; vertical-align:middle;" >
									<tr style="height: 80px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">등록일자</th>
  										<td style="width:400px;">
  											<form:input id="regdate" path="regdate" style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;" readonly="true" disabled="true" />
  										</td>
  									</tr>
  									<tr style="height: 80px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">공개여부</th>
  										<td style="width:400px;">
  											<div style="text-align: center;">
	  											<c:choose>
	  												<c:when test="${DetailExhibitionBean.state == 1 }">
	  													<form:radiobutton path="state" id="view" value="1" style="width: 15px; height: 15px;"  checked="checked"/>
													    <label for="view" style="margin-right: 50px; font-size: 20px; margin-left:20px;">공개</label>
													    <form:radiobutton path="state" id="noview" value="2" style="width: 15px; height: 15px;"/> 
													    <label for="noview" style="font-size: 20px; margin-left:20px;">비공개</label>
	  												</c:when>
	  												
	  												<c:when test="${DetailExhibitionBean.state == 2 }">
	  													<form:radiobutton path="state" id="view" value="1" style="width: 15px; height: 15px;"/> 
													    <label for="view" style="margin-right: 50px; font-size: 20px; margin-left:20px;">공개</label>
													    <form:radiobutton path="state" id="noview" value="2" style="width: 15px; height: 15px;"  checked="checked"/> 
													    <label for="noview" style="font-size: 20px; margin-left:20px;">비공개</label>
	  												</c:when>
	  												
	  												<c:otherwise>
	  													<form:radiobutton path="state" id="view" value="1" style="width: 15px; height: 15px;"/> 
													    <label for="view" style="margin-right: 50px; font-size: 20px; margin-left:20px;">공개</label>
													    <form:radiobutton path="state" id="noview" value="2" style="width: 15px; height: 15px;"/> 
													    <label for="noview" style="font-size: 20px; margin-left:20px;">비공개</label>
	  												</c:otherwise>
	  											</c:choose>
	  											
											</div>
  										</td>
  									</tr>
  									<tr style="height: 80px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">작가</th>
  										<td style="width:400px;">
  											<form:input path="author" style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;"/>
  										</td>
  									</tr>
  									<tr style="height: 80px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">예매 가격</th>
  										<td style="width:400px;">
  											<form:input path="price" style="border:none; border-bottom: 1px solid black; width:95%; text-align: right; font-size: 20px;"/>원
  										</td>
  									</tr>
  									<tr style="height: 80px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">전시시작일</th>
  										<td style="width:400px;">
  											<form:input type="date" id="exhibition_start" path="exhibition_start"  style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;"/>
  										</td>
  									</tr>
  									<tr style="height: 80px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">전시종료일</th>
  										<td style="width:400px;">
  											<form:input type="date" id="exhibition_end" path="exhibition_end" style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;"/>
  										</td>
  									</tr>
  									<tr style="height: 80px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">운영시간</th>
  										<td style="width:400px;">
  											<form:input path="open" style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;"/>
  										</td>
  									</tr>
  									<tr style="height: 80px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">휴무일</th>
  										<td style="width:400px;">
  											<form:input path="holiday" style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;"/>
  										</td>
  									</tr>
  									<tr style="height: 80px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">주소</th>
  										<td style="width:400px;">
  											<form:input path="address" style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;"/>
  										</td>
  									</tr>
  									<tr style="height: 80px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">전시관</th>
  										<td style="width:400px;">
  											<form:input path="place" style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;"/>
  										</td>
  									</tr>
  									<tr style="height: 80px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">사이트</th>
  										<td style="width:400px;">
  											<form:input path="open" style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;"/>
  										</td>
  									</tr>
  									<tr style="height: 80px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">위도</th>
  										<td style="width:400px;">
  											<form:input path="latitude" style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;"/>
  										</td>
  									</tr>
  									<tr style="height: 80px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">경도</th>
  										<td style="width:400px;">
  											<form:input path="longitude" style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;"/>
  										</td>
  									</tr>
								</table>
									
								
							</div>
						</div>
						<div style="float:right; margin-right:30px; margin-top:20px; margin-bottom:50px;">
						<a href="${root }/admin/manager_exhibitionlist" class="btn btn-danger" style="width:70px; margin-right:10px;">취소</a>
						<button type="submit" class="btn btn-dark" style="width:70px;">수정</button>
						</div>
						</form:form>
					</div>
						
						
			
				</div>
				
				
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>

</body>

</html>