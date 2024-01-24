<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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

	<script type="text/javascript">
		$(document).ready(function () {

			$("#headers").load("component/header.html");
			$("#footer").load("component/footer.html");
		});
	</script>

	<style>
		#jcl-demo {
			text-align: center;
		}

		.custom-container.main,
		.custom-container.main1,
		.custom-container.main2 {
			display: flex;
			justify-content: center;
			align-items: center;
		}

		.prev,
		.next,
		.prev1,
		.next1,
		.prev2,
		.next2 {
			margin: 0 10px;
		}

		.carousel ul li,
		.carousel1 ul li {
			margin-right: 10px;
		}

		.carousel ul li:last-child,
		.carousel1 ul li:last-child {
			margin-right: 0;
		}

		.carousel img,
		.carousel1 img {
			max-width: 100%;
		}

		section#scroll *,
		section#scroll *::before,
		section#scroll *::after {
			box-sizing: content-box;
		}

		.divider:after,
		.divider:before {
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
	</style>

</head>

<body id="page-top">
	<!-- 메뉴바 -->
	<c:import url="/WEB-INF/views/include/header.jsp"/>


	<!--로그인 부분-->
	<section>
		<div class="container py-5 h-100">
			<div class="row d-flex align-items-center justify-content-center h-100">
				<div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1" style="margin-top: 100px;">
					<div class="text-center mb-4">
						<img src="assets/img/ARTMEE.png" alt="Artmee Logo" style="width: 250px; height: 100px;">
					</div>
					<form>

						<div class="form-outline mb-4">
							<input type="email" id="email" class="form-control form-control-lg" name="email"
								placeholder="이메일주소" />
						</div>

						<div class="form-outline mb-4">
							<input type="password" id="password" class="form-control form-control-lg" name="password"
								placeholder="비밀번호" />
						</div>

						<div class="d-flex justify-content-around align-items-center mb-4">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="form1Example3" checked />
								<label class="form-check-label" for="form1Example3"> 아이디 기억하기 </label>
							</div>
							<a href="#!" style="color: black;">비밀번호 찾기</a>
						</div>

						<button type="submit" class="btn btn-primary btn-lg btn-block w-100"
							style="background-color: #000; color: #fff; border:none;">로그인</button>

						<button type="button" class="btn btn-primary btn-lg btn-block w-100"
							style="margin-top: 30px; background-color: #000; color: #fff;border:none;">회원가입</button>

						<div class="divider d-flex align-items-center my-4">
							<p class="text-center fw-bold mx-3 mb-0 text-muted">OR</p>
						</div>

						<a class="btn btn-primary btn-lg d-flex align-items-center justify-content-center"
							style="background-color:#ffeb3b; border: black; color: #fff;" onclick="kakaoLogin()"
							role="button">
							<img src="assets/img/kakaotalk.png" alt="카카오톡"
								style="width: 20px; height: 20px; margin-right: 15px;" />
							<span style="color: black;">카카오 로그인</span>

						</a>

						<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
						<script>
							Kakao.init('7b2cf06203fb94dc8e07b3948ec6405a'); //발급받은 키 중 javascript키를 사용해준다.
							console.log(Kakao.isInitialized()); // sdk초기화여부판단
							//카카오로그인
							function kakaoLogin() {
								Kakao.Auth.login({
									success: function (response) {
										Kakao.API.request({
											url: '/v2/user/me',
											success: function (response) {
												console.log(response)
											},
											fail: function (error) {
												console.log(error)
											},
										})
									},
									fail: function (error) {
										console.log(error)
									},
								})
							}  
						</script>

					</form>

					<!--밑부분 배너-->
					<section style="margin-top: 100px;">
						<div class="container px-1">
							<div class="d-flex justify-content-center">
								<img src="assets/img/banner1.png" alt="banner1" style="border: 1px solid black;">
							</div>
						</div>
					</section>

				</div>
			</div>
		</div>
	</section>





	<!-- 푸터-->
	<c:import url="/WEB-INF/views/include/footer.jsp"/>


</body>

</html>