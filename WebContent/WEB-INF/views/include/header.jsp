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
	<script src="../js/scripts.js"></script>

	<!-- JQuery 자바스크립트-->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>


	<!-- CSS -->
	<link href="../css/styles.css" rel="stylesheet" />

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
	<nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
		<div class="container px-5">
			<a class="navbar-brand" href="${root}/view/index"><img src="../img/ARTMEE.png"
					style="width: 160px; height: 60px;" /></a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav me-auto">
					<li class="nav-item mr-5">
						<a class="nav-link" href="${root}/notice/main" style="margin-right: 20px; margin-left: 50px;">공지사항</a>
					</li>
					<li class="nav-item mr-5">
						<a class="nav-link" href="${root }/exhibition/exhibition" style="margin-right: 20px; margin-left: 20px;">전시회</a>
					</li>
					
					<li class="nav-item mr-5">
						<a class="nav-link" href="${root}/board/main" style="margin-right: 20px; margin-left: 20px;">게시판</a>
					</li>
				</ul>

				<ul class="navbar-nav ms-auto">

					<li class="nav-item mr-5">
						<a class="nav-link" href="${root }/user/basket"><img src="../img/cart.png"
								style="width: 30px; height: 30px; margin-right: 30px;" /></a>
					</li>
					<c:choose>
					
		               <c:when test="${loginUserBean.userLogin == false}">
		                  <li class="nav-item"><a href="${root}/user/login" class="nav-link">로그인</a>
		                  </li>
		                  <li class="nav-item"><a href="${root}/user/Signup" class="nav-link">회원가입</a>
		                  </li>
		               </c:when>
		               
		               <c:otherwise>
		                  <li class="nav-item"><a href="${root}/user/mypage"
		                     class="nav-link">마이페이지</a></li>
		                  <li class="nav-item"><a href="${root }/user/logout" class="nav-link">로그아웃</a>
		                  </li>
		               </c:otherwise>
		           </c:choose>
				</ul>
			</div>
		</div>
	</nav>

	
</body>
</html>