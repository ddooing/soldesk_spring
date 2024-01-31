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
	<link href="../css/styles_manager.css" rel="stylesheet" />
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

	<!-- 푸터-->
	<c:import url="/WEB-INF/views/include/sidemanager.jsp"/>

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