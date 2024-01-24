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
<!-- JQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
    // thead의 checkbox 클릭 이벤트
    $("thead input[type='checkbox']").click(function(){
        // thead의 checkbox 상태를 tbody의 모든 checkbox에 적용
        $("tbody input[type='checkbox']").prop('checked', $(this).prop('checked'));
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
				<div style="margin-top: 30px; margin-left:20px;">
						<h3>사용자 정보</h3>
					</div>
				<div>
					<div style="display: flex; width: 100%;">
						<div style="flex: 1; margin: 10px; border: 1px solid black;  background-color: white;">
							<div style="text-align: center;">
								<img src="./assets/img/profile_Lv1.png"
									style="width: 85px; height: 85px; margin-top: 15px; border-radius: 4em; box-shadow: 5px 5px rgb(0, 0, 0, 0.1);" />
								<h4 style="margin-top: 15px;">회원정보</h4>
							</div>
							<div style="margin-top: 50px; text-align: center;">
								<h5
									style="margin-left: 100px; margin-top: 50px; text-align: left;">닉네임</h5>
								<input type="text"
									style="background-color: transparent; border: none; border-bottom: 1px solid black; width: 600px; margin-top: 20px;" />
								<h5
									style="margin-left: 100px; margin-top: 30px; text-align: left;">아이디</h5>
								<input type="text"
									style="background-color: transparent; border: none; border-bottom: 1px solid black; width: 600px; margin-top: 20px;" />
								<h5
									style="margin-left: 100px; margin-top: 30px; text-align: left;">이메일</h5>
								<input type="text"
									style="background-color: transparent; border: none; border-bottom: 1px solid black; width: 600px; margin-top: 20px; margin-bottom:20px;" />
							</div>
						</div>
						<div
							style="display: flex; flex-direction: column; flex: 1; margin: 10px;">
							<div style="flex: 2; border: 1px solid black; background-color: white;">
								<h3 style="margin-top:20px; margin-left:30px;">활동정보</h3>

								<div style="display: flex; justify-content: center;">
									<div>
										<div style="text-align:center;">
											<h5 style="color: #e2e2e2;">가입일</h5>
											<h5 style="margin-top:15px;">2024.01.15</h5>
										</div>
									</div>
									<div style="margin-left:150px;text-align:center;">
										<div>
											<h5 style="color: #e2e2e2;">로그인</h5>
											<h5 style="margin-top:15px;">1회</h5>
										</div>
									</div>
								</div>
								
								<div>
									<h5 style="color: #e2e2e2; text-align:center; margin-top:30px;">작성</h5>
									<div style="display: flex; justify-content: center;">
										<div style="margin-right:100px;">
											<h5>게시글</h5>
											<h5>댓글</h5>
											<h5>문의</h5>
											<h5>배너신청</h5>
											<h5>전시회신청</h5>
										</div>
										<div>
											<h5>0</h5>
											<h5>0</h5>
											<h5>0</h5>
											<h5>0</h5>
											<h5>0</h5>											
										</div>
									</div>
								</div>
							</div>
							<div style="flex: 1; margin-top: 10px; border: 1px solid black;  background-color: white;">
								<div style="margin-left:30px; margin-top:15px;">
									<h3>등급</h3>
									
									<input type="radio" name="grade" value="1" id="level1" style="margin-top:20px; width: 15px; height: 15px;">
									<label for="level1" style="font-size: 20px; margin-left: 30px;">1레벨</label> <br />
									<input type="radio" name="grade" value="2" id="level2" style="margin-top:20px; width: 15px; height: 15px;"> 
									<label for="level2" style="font-size: 20px; margin-left: 30px;">2레벨</label> <br />
									<input type="radio" name="grade" value="3" id="level3" style="margin-top:20px; width: 15px; height: 15px;">
									<label for="level3" style="font-size: 20px; margin-left: 30px;">3레벨</label>
									
								</div>
							</div>
						</div>
					</div>
						<div style="float:right; margin-right:30px; margin-top:20px;">
							<input type="submit" class="btn btn-dark" style="margin-right:20px;" value="저장"/>
							<input type="submit" class="btn btn-danger" value="취소"/>
						</div>
					</div>
					


				<div style="background-color:white;  border:1px solid black; margin:10px; margin-top:70px; margin-bottom:50px; ">
				<div style="margin:15px;">
					<h3 style="margin-left:20px; margin-top:30px;">포인트</h3>
					<div style="display: flex;">
						<div>
							<h5 style="color:#e2e2e2; margin-left:20px; margin-top:30px;">보유 포인트</h5>
						</div>
						<div>
							<h5 style="margin-left: 100px;  margin-top:30px;">62 p</h5>
						</div>
					</div>
					
					<h3 style="margin-left:20px; margin-top:30px;">포인트 지급 / 차감</h3>
					<div style="display: flex; align-items: center;">
						<div style="margin-left:20px;">
							<select name="pointcombo" id="pointcombo"
								style="width: 150px; height: 40px; margin-right: 30px; border:none; border-bottom:1px solid black;">
								<option value="give">지급</option>
								<option value="withdraw">회수</option>
							</select>
						</div>
						<div style="margin-left: 50px;">
							<input type="text" value="" name="point" style="border:none; border-bottom:1px solid black; width:200px;" placeholder="포인트"/>
						</div>
						<div style="margin-left: 50px;">
							<input type="text" value="" name="reason" style="border:none; border-bottom:1px solid black; width:200px;" placeholder="사유/내용 입력"/>
						</div>
						<div style="margin-left: 50px;">
							<input type="submit" class="btn btn-dark" value="수정" />
						</div>
					</div>
					
					<table class="table" style="text-align: center; width: 1000px; margin-top:30px;">
							<thead>
								<tr style="color:#e2e2e2;">
									<th scope="col">일자</th>
									<th scope="col">사유</th>
									<th scope="col">증감</th>
									<th scope="col">잔액</th>
								</tr>
							</thead>
							<tbody  class="table-group-divider">
								<tr>
									<td>1</td>
									<td>2</td>
									<td>3</td>
									<td>4</td>
								</tr>
								<tr>
									<td>1</td>
									<td>2</td>
									<td>3</td>
									<td>4</td>
								</tr>
								<tr>
									<td>1</td>
									<td>2</td>
									<td>3</td>
									<td>4</td>
								</tr>
							</tbody>
					</table>
					
				</div>
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