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

</head>

<body id="page-top">

	<c:import url="/WEB-INF/views/include/header.jsp" />

	<!--등록 페이지 1 ~ 5 단계-->

	<section style="margin-top: 150px;" id="enroll_first">
	  <div style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
	    <div style="margin-bottom: 50px;">
	      <img src="../img/ARTMEE.png" alt="아트미 로고" style="width: 300px; height: 140px;" /> 
	    </div>
	    <div style="margin:auto; text-align: center; margin-bottom:100px;">
	      <h4>배너 등록을 환영합니다!</h4>
	      <h4>아트미 배너 등록은 검토를 거쳐 아트미 웹페이지에 게시됩니다.</h4>
	    </div>
	  </div>
	  
	  <div style="display: flex; justify-content: center; align-items: center; width: 500px; height: 300px; margin:auto; border: 1px solid lightgray; border-radius: 5%;">
	    <div style="display: flex; flex-direction: column; justify-content: space-evenly; align-items: center; height: 100%;">
	      <button onclick="window.location.href='${root}/banner/mainbannerapplyform'" class="btn btn-light" style="width:250px; border: 0.5px solid lightgray; font-size: 20px;">메인배너 신청</button>
	      <button onclick="window.location.href='${root}/banner/subbannerapplyform'" class="btn btn-light" style="width:250px; border: 0.5px solid lightgray; font-size: 20px;">서브배너 신청</button>
	    </div>
	  </div>
	</section>



	<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>

</html>