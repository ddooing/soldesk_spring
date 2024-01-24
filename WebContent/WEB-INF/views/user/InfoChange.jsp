<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>ARTMEE</title>
<link rel="icon" type="image/x-icon" href="assets/ARTMEE_PAGELOGO.png" />

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


<!-- CSS -->
<link href="css/styles.css" rel="stylesheet" />

<!-- Carousel 자바스크립트-->
<script src='https://www.gmarwaha.com/script/lib/jquery-1.11.1.js'></script>
<script src="https://www.gmarwaha.com/script/lib/jquery.easing-1.3.js"></script>
<script
	src="https://www.gmarwaha.com/script/lib/jquery.easing.compatibility.js"></script>
<script
	src="https://www.gmarwaha.com/script/lib/jquery.mousewheel-3.1.12.js"></script>
<script
	src="https://www.gmarwaha.com/jquery/jcarousellite/script/jquery.jcarousellite.js"></script>

<style>
#jcl-demo {
	text-align: center;
}

.custom-container.main, .custom-container.main1, .custom-container.main2
	{
	display: flex;
	justify-content: center;
	align-items: center;
}

.prev, .next, .prev1, .next1, .prev2, .next2 {
	margin: 0 10px;
}

.carousel ul li, .carousel1 ul li {
	margin-right: 10px;
}

.carousel ul li:last-child, .carousel1 ul li:last-child {
	margin-right: 0;
}

.carousel img, .carousel1 img {
	max-width: 100%;
}

section#scroll *, section#scroll *::before, section#scroll *::after {
	box-sizing: content-box;
}

.divider:after, .divider:before {
	content: "";
	flex: 1;
	height: 1px;
	background: #eee;
}

.form-check-input[type="checkbox"] {
	background-color: #fff;
	border: 1px solid #000;
	border-radius: 4px;
}

.form-check-input[type="checkbox"]:checked {
	background-color: #000;
	border: 1px solid #000;
	color: #fff;
}

.age_btn {
	float: left;
	width: 100px; /* 원하는 너비로 조절 */
	height: 40px; /* 원하는 높이로 조절 */
	cursor: pointer;
	font-weight: 300;
	color: #757575;
	background-color: #fff;
	border: 1px solid #E7E7E7;
	height: 40px; /* 원하는 높이로 조절 */
	cursor: pointer;
	font-weight: 300;
	color: #757575;
}
</style>

<script type="text/javascript">
      $(document).ready(function () {

         $("#headers").load("component/header.html");
         $("#footer").load("component/footer.html");
      });
   </script>

</head>

<body id="page-top">
	<!-- 메뉴바 -->
	
	<c:import url="/WEB-INF/views/include/header.jsp"/>

	<!--로그인 부분-->
	<section class="text-center" style="margin-top: 200px;">
		<form action="login.html" method="post">
			<div
				class="container h-100 align-items-center justify-content-center">
				<h2>회원정보 변경</h2>
				
				<hr style="margin:auto; margin-top: 50px; width: 1000px;" />

				<div class="d-flex align-items-center justify-content-center"
					style="margin-top: 50px;">
					<div style="width: 150px; text-align: left;">
						<label for="nickname" style="font-size: 20px;">닉네임</label>
					</div>
					<div style="margin-left: 20px;">
						<input type="text" name="nickname" />
					</div>
					<div style="margin-left: 20px; width: 100px;">
						<input type="button" class="btn btn-dark" value="중복확인" />
					</div>
				</div>

				<div class="d-flex align-items-center justify-content-center"
					style="margin-top: 20px;">
					<div style="width: 150px; text-align: left;">
						<label for="id" style="font-size: 20px;">현재 비밀번호</label>
					</div>
					<div style="margin-left: 20px;">
						<input type="text" name="id" />
					</div>
					<div style="margin-left: 20px; width: 100px;"></div>
				</div>

				<div class="d-flex align-items-center justify-content-center"
					style="margin-top: 20px;">
					<div style="width: 150px; text-align: left;">
						<label for="pw" style="font-size: 20px;">새 비밀번호</label>
					</div>
					<div style="margin-left: 20px;">
						<input type="password" name="pw" />
					</div>
					<div style="margin-left: 20px; width: 100px;"></div>
				</div>

				<div class="d-flex align-items-center justify-content-center"
					style="margin-top: 20px;">
					<div style="width: 150px; text-align: left;">
						<label for="pw1" style="font-size: 20px;">비밀번호 확인</label>
					</div>
					<div style="margin-left: 20px;">
						<input type="password" name="pw1" />
					</div>
					<div style="margin-left: 20px; width: 100px;"></div>
				</div>

				<div class="d-flex align-items-center justify-content-center"
					style="margin-top: 20px;">
					<div style="width: 150px; text-align: left;">
						<label for="email" style="font-size: 20px;">이메일</label>
					</div>
					<div style="margin-left: 20px;">
						<input type="email" name="email" />
					</div>
					<div style="margin-left: 20px; width: 100px;"></div>
				</div>

				<div align="center" style="margin-top: 50px;">
						<input type="submit" class="btn btn-dark" value="확인" style="margin-right: 80px;" />

						<input type="button" onclick="mypage.html" class="btn btn-dark" value="취소" />
				</div>
			</div>
		</form>
	</section>
	<!-- 푸터-->
	<c:import url="/WEB-INF/views/include/footer.jsp"/>

</body>

</html>