<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>ARTMEE</title>
<link rel="icon" type="image/x-icon" href="../img/ARTMEE_PAGELOGO.png" />

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>

<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
	rel="stylesheet" />

<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>

<!-- JQuery 자바스크립트-->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- sweet alert 2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- CSS -->
<link href="../css/styles.css" rel="stylesheet" />

<!-- Carousel 자바스크립트-->
<script src='https://www.gmarwaha.com/script/lib/jquery-1.11.1.js'></script>
<script src="https://www.gmarwaha.com/script/lib/jquery.easing-1.3.js"></script>
<script
	src="https://www.gmarwaha.com/script/lib/jquery.easing.compatibility.js"></script>
<script
	src="https://www.gmarwaha.com/script/lib/jquery.mousewheel-3.1.12.js"></script>
<script
	src="https://www.gmarwaha.com/jquery/jcarousellite/script/jquery.jcarousellite.js"></script>

<script>
	$(document).ready(function() {
		
		$("#come_back").click(function() {
			window.location.href = '${root}/view/index';
		});
	});
</script>

</head>

<body id="page-top">

	<c:import url="/WEB-INF/views/include/header.jsp" />

	<section style="margin-top: 150px;" id="enroll_fifth">
		<center>
			<img src="../img/ARTMEE.png" alt="아트미 로고" style="width: 300px; height: 140px;" />
			<br /><br />
			<img src="../img/enroll/enroll_fifthimg.png" alt="등록 다섯번째" style="width: 450px; height: 110px;" />
			<br /><br />
			<div style="width: 700px; height: 400px; border: 1px solid lightgray; border-radius: 5%;">
				<b style="float: left; margin-left: 40px; margin-top: 50px; font-size: 30px;">5. 완료</b>
				<br /><br /><br /><br /><br /><br />
				<b style=" margin-top: 300px; font-size: 25px;">전시회 등록이 완료되었습니다!</b>

				<div style="margin-top: 70px;">
					<button type="button" style="width: 400px; border: 0.5px solid lightgray;" id="come_back" onclick=""
						class="btn btn-light">홈</button>
				</div>
			</div>
		</center>
	</section>

	<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>

</html>