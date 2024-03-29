<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.ParseException"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:set var="root" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>ARTMEE</title>

	<link rel="icon" type="image/x-icon" href="assets/ARTMEE_PAGELOGO.png" />

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
	
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</head>

<body id="page-top">
	<!-- 메뉴바 -->
	<c:import url="/WEB-INF/views/include/header.jsp"/>

	<section style="margin-top: 150px;">
		<div class="container mb-1">
			<h1 style="margin-left: 180px;">결제 정보</h1>
			<div style="color: gray; margin-left: 180px; margin-top: 20px;">
			    ${bannerPaymentInfoBean.requested_at }
			</div>

			<hr style="margin:auto; margin-top: 10px; width: 1000px;" />
			<!--전시회 정보 부분-->
			
			<div style="display: flex; align-items: center; flex-direction: row; margin-top:50px;">
				<img src="${getfileinfo.path }${getfileinfo.name} " alt="배너이미지"
					style="width: 400px; height: 150px; margin-left: 200px;" />

				<div style="margin-left: 100px;">
					<h3>${exhibition_title}</h3>

					<div style="display: flex; margin-top: 40px;">
						<div style="margin-right: 10px; width: 200px;">
							<a style="font-size: 20px;">신청 기간</a>
						</div>
						<div style="margin-left: auto;">
							<a style="font-size: 15px; ">${bannerPaymentInfoBean.start_date } ~ ${bannerPaymentInfoBean.end_date } </a>
						</div>
					</div>
					
					<div style="display: flex; margin-top: 10px;">
						<div style="margin-right: 10px;  width: 200px;">
							<a style="font-size: 20px;">결제 방법</a>
						</div>
						<div style="margin-left: auto;">
							<a style="font-size: 20px;">${bannerPaymentInfoBean.payment_method }</a>
						</div>
					</div>
					<div style="display: flex; margin-top: 20px;">
						<div style="margin-right: 10px;  width: 200px;">
							<h3>총 결제 금액 : </h3>
						</div>
						<div style="margin-left: auto;">
							<a style="font-size: 30px; margin-left: 10px;">${bannerPaymentInfoBean.payment } 원</a>
						</div>
					</div>
				</div>
			</div>
			
			<hr style="margin: auto; margin-top: 50px; width: 1000px;" />

			<div class="text-center" style="margin-top: 50px; margin-left:800px;">
				<button onclick="window.location.href = '${root}/view/index'" class="btn btn-dark" style="margin-right: 20px; width:150px; height: 50px;">메인페이지</button>
			</div>
			
			
	        <script>
		      Swal.fire({
		          title: "결제 완료",
		          text: "결제가 성공적으로 되었습니다",
		          icon: "success",
		          showConfirmButton: false,
		          timer: 2000
		      });
		  	</script>
		</div>
	</section>

	<!-- 푸터-->
	<c:import url="/WEB-INF/views/include/footer.jsp"/>
	
</body>

</html>