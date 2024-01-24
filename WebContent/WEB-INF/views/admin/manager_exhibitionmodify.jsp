<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="icon" type="image/x-icon" href="assets/ARTMEE_PAGELOGO.png" />
<title>관리자 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="css/styles_manager.css" rel="stylesheet" />
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
$(document).ready(function(){
    $("#allcheck").click(function(){
        if($(this).is(":checked")) {
            $("tbody tr th input[type='checkbox']").prop("checked", true);
        } else {
            $("tbody tr th input[type='checkbox']").prop("checked", false);
        }
    });
});

</script>

<script>	// 사이드바 토글
		window.addEventListener('DOMContentLoaded', event => {
			const sidebarToggle = document.body.querySelector('#sidebarToggle');
			if (sidebarToggle) {
				sidebarToggle.addEventListener('click', event => {
					event.preventDefault();
					document.body.classList.toggle('sb-sidenav-toggled');
					localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
				});
			}
		});
	</script>
	
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
	<nav class="sb-topnav navbar navbar-expand navbar-custom">
		<!-- 아트미 로고-->
		<a class="navbar-brand ps-3" href="index.html"
			style="margin-left: 20px;"><img src="assets/img/ARTMEE.png"
			alt="artmee로고" style="width: 150px; height: 60px;" /></a>
		<!-- 사이드바 토글 버튼-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars" style="color: white;"></i>
		</button>
		<!-- 사용자 아이콘 우측 정렬-->
		<div
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0" />
		<!-- 네비바-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown"
				style="color: white;" href="#" role="button"
				data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw" style="color: white;"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="#!">로그아웃</a></li>
				</ul></li>
		</ul>
	</nav>

	<!--사이드 메뉴 바-->
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion navbar-custom" id="sidenavAccordion"
				style="border-right: 1px solid black;">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">대시보드</div>
						<a class="nav-link" href="manager_dashboard.jsp">
							<div class="sb-nav-link-icon">
								<i class="bi bi-speedometer2"></i>
							</div> 대시보드
						</a>
						<div class="sb-sidenav-menu-heading">카테고리</div>

						<a class="nav-link" href="manager_accountmanager.jsp">
							<div class="sb-nav-link-icon">
								<i class="bi bi-person-circle"></i>
							</div> 사용자 관리
						</a> <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="bi bi-ticket-perforated"></i>
							</div> 예매 관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="#">예매 리스트(변경)</a> <a class="nav-link"
									href="#">예매 기본설정(변경)</a> <a class="nav-link" href="#">예매
									항목설정(변경)</a>
							</nav>
						</div>

						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseReserve" aria-expanded="false"
							aria-controls="collapseReserve">
							<div class="sb-nav-link-icon">
								<i class="bi bi-calendar-check"></i>
							</div> 컨텐츠
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseReserve"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="manager_noticemanage.jsp">공지사항 관리</a> <a class="nav-link"
									href="manager_boardlist.jsp">게시물 관리</a> <a class="nav-link" href="manager_QnAlist.jsp">QnA 관리</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsecontents" aria-expanded="false"
							aria-controls="collapsecontents">
							<div class="sb-nav-link-icon">
								<i class="bi bi-easel2"></i>
							</div> 전시회
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsecontents"
							aria-labelledby="headingThree" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="manager_exhibitionlist.jsp">전시회 관리</a> 
								<a class="nav-link" href="manager_exhibitionapplylist.jsp">전시회 신청내역</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseexhibition" aria-expanded="false"
							aria-controls="collapseexhibition">
							<div class="sb-nav-link-icon">
								<i class="bi bi-tv"></i>
							</div> 배너
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseexhibition"
							aria-labelledby="headingFour" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="#">배너 관리</a> <a class="nav-link"
									href="#">배너 신청내역</a>
							</nav>
						</div>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div style="font-size: 0.8em; color: white;">
						Copyright &copy; 2023 개발해드림 <br /> ALL RIGHTS RESERVED
					</div>
				</div>
			</nav>
		</div>

		<!--실제 내용(대시보드) 부분-->
		<div id="layoutSidenav_content">
			<main style="background-color: ivory;">
				<div class="container-fluid px-4">
					<div style="margin-top: 30px;">
						<h3>전시회 수정</h3>
					</div>
					<div style="position: relative; display: flex; justify-content: center; margin:10px; height: 80px; align-items: center; border: 0.2px solid black; background-color: white; margin-top: 20px;">
						<div style="position: absolute; left: 100px;">
							<span class="badge bg-success-subtle text-success-emphasis rounded-pill" style="background-color: black; font-size:15px;">전시회 수 20건</span>
						</div>
						<select name="usercombo" id="usercombo"
							style="width: 150px; height: 40px; margin-right: 30px; ">
							<option value="" disabled selected>검색조건선택</option>
							<option value="option1">제목</option>
							<option value="option2">작가</option>
						</select> <input type="text" name="usersearch" id="usersearch"
							style="width: 500px; height: 40px; margin-right: 30px;"
							placeholder="검색어를 입력해주세요" />
						<button class="btn btn-dark" style="width: 80px; height: 40px;">검색</button>
					</div>


					<div style="display: flex; width: 100%;">
						<div style="flex: 1; margin: 10px; border: 1px solid black;  background-color: white;">
							<div style="align-items: center; margin: 30px; border: 0.2px solid black; width: 600px; margin-left: auto; margin-right: auto;">
							<h3 style="margin-top:20px; margin-left:15px;">포스터 이미지 변경</h3>
							  <img src="./assets/img/poster1.png" id="poster" alt="포스터" style="margin-left: auto; margin-right: auto; display: block; margin-top: 30px; margin-bottom: 10px; width: 250px; height: 350px;" />
								  <div class="filebox" style="margin-top: 25px; margin-left:auto; margin-right:auto; text-align: center; margin-bottom: 20px;">
								    <input class="upload-name" value="첨부파일" placeholder="첨부파일">
								    <label for="file">파일찾기</label>
								    <input type="file" id="file" name="file" onchange="updateImage(event)">
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
								<h3
									style="margin-left: 100px; margin-top: 60px; text-align: left;">전시회 제목</h3>
								<input type="text" value="세르주 블로크 'kiss'"
									style="background-color: transparent; border: none; border-bottom: 1px solid black; width: 600px; margin-top: 20px; font-size:20px;" />
								<h3
									style="margin-left: 100px; margin-top: 35px; text-align: left;">신청인</h3>
								<input type="text" value="soldesk801"
									style="background-color: transparent; border: none; border-bottom: 1px solid black; width: 600px; margin-top: 20px; font-size:20px;" />
								<h3
									style="margin-left: 100px; margin-top: 35px; text-align: left;">이메일</h3>
								<input type="text" value="soldesk801@naver.com"
									style="background-color: transparent; border: none; border-bottom: 1px solid black; width: 600px; margin-top: 20px; font-size:20px;" />
								<h3
									style="margin-left: 100px; margin-top: 35px; text-align: left;">전화번호</h3>
								<input type="text" value="010-1111-2222"
									style="background-color: transparent; border: none; border-bottom: 1px solid black; width: 600px; margin-top: 20px; font-size:20px;" />
								<h3
									style="margin-left: 100px; margin-top: 35px; text-align: left;">내용 이미지</h3>
									<div class="filebox1" style="margin-top: 25px; margin-left:auto; margin-right:auto; text-align: center; margin-bottom: 20px;">
								    <input class="upload-name1" value="첨부파일" placeholder="첨부파일">
								    <label for="file1">파일찾기</label>
								    <input type="file" id="file1" name="file1">
								  </div>
							</div>
							
							<script>
							 $("#file1").on('change', function() {
								    var fileName = $(this).val().split('\\').pop();
								    $(".upload-name1").val(fileName);
								});
							</script>
							
						</div>
						<div
							style="display: flex; flex-direction: column; flex: 1; margin: 10px;">
							<div style=" border: 1px solid black; background-color: white;">
								<div style="margin-left:50px; margin-top:30px;">
									<h3>전시회 상세정보 1</h3>
								</div>
								
								<table class="table table-hover table-borderless" style="margin-top:30px; width:700px; margin-left:auto; margin-right:auto; vertical-align:middle;" >
  									<tr style="height: 70px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">등록일자</th>
  										<td style="width:400px;">
  											<input type="text" value="2024.01.19" style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;"/>
  										</td>
  									</tr>
  									<tr style="height: 70px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">노출기간</th>
  										<td style="width:400px;">
  											<input type="date" name="look_start" style="width:40%; margin-right:30px;" /> ~ <input type="date" name="look_end" style="width:40%; margin-left:30px;" />
  										</td>
  									</tr>
  									<tr style="height: 70px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">결제된 금액</th>
  										<td style="width:400px;">
  											<h3 style="width:100%; text-align: right; font-size: 20px;">220,000원</h3>
  										</td>
  									</tr>
  									<tr style="height: 70px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">공개여부</th>
  										<td style="width:400px;">
  											<div style="text-align: center;">
	  											<input type="radio" id="view" name="open" value="view" style="width: 15px; height: 15px;"> 
												<label for="view" style="margin-right: 50px; font-size: 20px; margin-left:20px;">공개</label> 
												<input type="radio" id="noview" name="open" value="noview" style="width: 15px; height: 15px;"> 
												<label for="noview" style="font-size: 20px; margin-left:20px;">비공개</label>
											</div>
  										</td>
  									</tr>
  									<tr style="height: 70px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">노출 순서</th>
  										<td style="width:400px;">
  											<input type="text" value="1" style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;"/>
  										</td>
  									</tr>
								</table>
							</div>
							
							<div style="flex: 1; margin-top: 10px; border: 1px solid black;  background-color: white;">
								<div style="margin-left:50px; margin-top:30px;">
									<h3>전시회 상세정보 2</h3>
								</div>
									<table class="table table-hover table-borderless" style="margin-top:30px; width:700px; margin-left:auto; margin-right:auto; vertical-align:middle;" >
  									<tr style="height: 70px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">작가</th>
  										<td style="width:400px;">
  											<input type="text" value="Serge Bloch" style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;"/>
  										</td>
  									</tr>
  									<tr style="height: 70px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">예매 가격</th>
  										<td style="width:400px;">
  											<input type="text" value="20,000" style="border:none; border-bottom: 1px solid black; width:95%; text-align: right; font-size: 20px;"/>원
  										</td>
  									</tr>
  									<tr style="height: 70px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">전시기간</th>
  										<td style="width:400px;">
  											<input type="date" name="exhibition_start" style="width:40%; margin-right:30px;" /> ~ <input type="date" name="exhibition_end" style="width:40%; margin-left:30px;" />
  										</td>
  									</tr>
  									<tr style="height: 70px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">운영시간</th>
  										<td style="width:400px;">
  											<div style="display:flex;">
  											<select class="form-select" style="width:40%; margin-right:34px;" name="start_time">
		  										<option selected>옵션 선택</option>
		  										<option value="option1">09:00</option>
		  										<option value="option2">09:30</option>
		  										<option value="option3">10:00</option>
		  										<option value="option3">10:30</option>
											</select>
											~
											<select class="form-select" style="width:40%; margin-left:34px;" name="end_time">
		  										<option selected>옵션 선택</option>
		  										<option value="option1">16:30</option>
		  										<option value="option1">17:00</option>
		  										<option value="option2">17:30</option>
		  										<option value="option3">18:00</option>
											</select>
											</div>
  										</td>
  									</tr>
  									<tr style="height: 70px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">휴무일</th>
  										<td style="width:400px;">
  											<div style="display:flex">
												<select class="form-select" style="width:30%;" name="holiday_week">
			  										<option selected>옵션 선택</option>
			  										<option value="option1">매주</option>
			  										<option value="option1">매달</option>
												</select>
												<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group" style="margin-left: 50px;">
													  <input type="checkbox" class="btn-check" id="monday" name="monday" autocomplete="off">
													  <label class="btn btn-outline-dark" for="monday">월</label>
													
													  <input type="checkbox" class="btn-check" id="tuesday" name="tuesday" autocomplete="off">
													  <label class="btn btn-outline-dark" for="tuesday">화</label>
													
													  <input type="checkbox" class="btn-check" id="wednesday" name="wednesday" autocomplete="off">
													  <label class="btn btn-outline-dark" for="wednesday">수</label>
													
													  <input type="checkbox" class="btn-check" id="thursday" name="thursday" autocomplete="off">
													  <label class="btn btn-outline-dark" for="thursday">목</label>
													
													  <input type="checkbox" class="btn-check" id="friday" name="friday" autocomplete="off">
													  <label class="btn btn-outline-dark" for="friday">금</label>
													
													  <input type="checkbox" class="btn-check" id="saturday" name="saturday" autocomplete="off">
													  <label class="btn btn-outline-dark" for="saturday">토</label>
													
													  <input type="checkbox" class="btn-check" id="sunday" name="sunday" autocomplete="off">
													  <label class="btn btn-outline-dark" for="sunday">일</label>
												</div>
											</div>
  										</td>
  									</tr>
  									<tr style="height: 70px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">주소</th>
  										<td style="width:400px;">
  											<input type="text" value="서울특별시 서대문구 연희로 11가길 48-10" style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;"/>
  										</td>
  									</tr>
  									<tr style="height: 70px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">전시관</th>
  										<td style="width:400px;">
  											<input type="text" value="뉴스뮤지엄 연희" style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;"/>
  										</td>
  									</tr>
  									<tr style="height: 70px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">사이트</th>
  										<td style="width:400px;">
  											<input type="text" value="www.naver.com" style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;"/>
  										</td>
  									</tr>
  									<tr style="height: 70px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">위도</th>
  										<td style="width:400px;">
  											<input type="text" value="37.566945" style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;"/>
  										</td>
  									</tr>
  									<tr style="height: 70px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">경도</th>
  										<td style="width:400px;">
  											<input type="text" value="126.927544" style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;"/>
  										</td>
  									</tr>
								</table>
									
								
							</div>
						</div>
					</div>
						<div style="float:right; margin-right:30px; margin-top:20px; margin-bottom:50px;">
						<button class="btn btn-danger" style="width:70px; margin-right:10px;">취소</button>					
						<button type="submit" class="btn btn-dark" style="width:70px;">수정</button>
						</div>
				</div>
			</main>

			
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>

</body>

</html>