<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<link rel="icon" type="image/x-icon" href="assets/ARTMEE_PAGELOGO.png" />
	<title>관리자 페이지</title>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
	<link href="css/styles_manager.css" rel="stylesheet" />
	<!--부트스트랩 아이콘 사용-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet">

	<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

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
		<a class="navbar-brand ps-3" href="index.html" style="margin-left: 20px;"><img src="assets/img/ARTMEE.png"
				alt="artmee로고" style="width: 150px; height: 60px;" /></a>
		<!-- 사이드바 토글 버튼-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
				class="fas fa-bars" style="color: white;"></i></button>
		<!-- 사용자 아이콘 우측 정렬-->
		<div class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0" />
		<!-- 네비바-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" id="navbarDropdown" style="color: white;" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"
						style="color: white;"></i></a>
				<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="#!">로그아웃</a></li>
				</ul>
			</li>
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
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4 mb-4">대시보드</h1>
					<div class="row">
						<div class="col-xl-6">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-chart-area me-1"></i>
									일별 판매 금액
								</div>
								<div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
							</div>
						</div>
						<div class="col-xl-6">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-chart-bar me-1"></i>
									월별 이용자 차트
								</div>
								<div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
							</div>
						</div>
					</div>
				</div>

			</main>

			
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>

	<!--차트 라이브러리-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>

</body>

</html>