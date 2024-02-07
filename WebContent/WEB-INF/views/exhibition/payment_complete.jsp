<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>ARTMEE</title>

	<link rel="icon" type="image/x-icon" href="../img/ARTMEE_PAGELOGO.png" />

	<!-- Font Awesome icons (free version)-->
	<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

	<!-- Google fonts-->
	<link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900"
		rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
		rel="stylesheet" />

	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>

	<!-- JQuery 자바스크립트-->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>


	<!-- CSS -->
	<link href="css/styles.css" rel="stylesheet" />

	<!-- Carousel 자바스크립트-->
	<script src='https://www.gmarwaha.com/script/lib/jquery-1.11.1.js'></script>
	<script src="https://www.gmarwaha.com/script/lib/jquery.easing-1.3.js"></script>
	<script src="https://www.gmarwaha.com/script/lib/jquery.easing.compatibility.js"></script>
	<script src="https://www.gmarwaha.com/script/lib/jquery.mousewheel-3.1.12.js"></script>
	<script src="https://www.gmarwaha.com/jquery/jcarousellite/script/jquery.jcarousellite.js"></script>


	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">

</head>

<body id="page-top">
	<!-- 메뉴바 -->
	<c:import url="/WEB-INF/views/include/header.jsp"/>

	<section style="margin-top: 150px;">
		<div class="container mb-1">
			<h1 style="margin-left: 180px;">결제 완료</h1>
			<hr style="margin:auto; margin-top: 50px; width: 1000px;" />
			<!--전시회 정보 부분-->
			<div>
				<h3 style="margin-left: 180px; margin-top: 50px;">전시회 정보</h3>
			</div>
			<div style="display: flex; align-items: center; flex-direction: row;">
				<img src="${ExhibitionBean.main_poster_path}${ExhibitionBean.main_poster_name} " alt="예약포스터"
					style="width: 200px; height: 280px; margin-left: 300px; margin-top: 40px;" />

				<div style="margin-left: 200px;">
					<h3>${ExhibitionBean.title}</h3>

					<div style="display: flex; margin-top: 40px;">
						<div style="margin-right: 10px; width: 200px;">
							<a style="font-size: 20px;">예약 날짜</a>
						</div>
						<div style="margin-left: auto;">
							<a style="font-size: 20px; ">${reserveBean.reserve_date} </a>
						</div>
					</div>
					

					<div style="display: flex; margin-top: 10px;">
						<div style="margin-right: 10px;  width: 200px;">
							<a style="font-size: 20px;">티켓 수량</a>
						</div>
						<div style="margin-left: auto;">
							<a style="font-size: 20px;">${reserveBean.ticket_count} 매</a>
						</div>
					</div>
					
					<div style="display: flex; margin-top: 10px;">
						<div style="margin-right: 10px;  width: 200px;">
							<a style="font-size: 20px;">포인트 결제 금액</a>
						</div>
						<div style="margin-left: auto;">
							<a style="font-size: 20px;">${reserveBean.point_deduction} p</a>
						</div>
					</div>

					<div style="display: flex; margin-top: 10px;">
						<div style="margin-right: 10px;  width: 200px;">
							<a style="font-size: 20px;">결제 금액</a>
						</div>
						<div style="margin-left: auto;">
							<a style="font-size: 20px;">${reserveBean.payment} 원</a>
						</div>
					</div>
				</div>
			</div>

			<hr style="margin:auto; margin-top: 50px; width: 1000px;" />
			<div style="display: flex; align-items: baseline; margin-top: 50px; margin-left: 800px;">
				<h3>총 결제 금액 : </h3>
				<a style="font-size: 30px; margin-left: 10px;">${reserveBean.total_price} 원</a>
			</div>

			<div class="text-center" style="margin-top: 50px;">
				<button onclick="window.location.href = '${root}/view/index'" class="btn btn-dark"
					style="margin-right: 20px; width:150px; height: 50px;">메인페이지</button>
				<button onclick="window.location.href = '${root}/mypage/reservelist?user_id=${reserveBean.user_id }'" class="btn btn-dark" style="width: 150px; height: 50px;">마이페이지</button>
			</div>
		</div>
	</section>

	<!-- 푸터-->
	<c:import url="/WEB-INF/views/include/footer.jsp"/>

</body>

</html>