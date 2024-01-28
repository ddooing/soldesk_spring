<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>회원탈퇴</title>

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


<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap"
	rel="stylesheet">
<style>
button {
	border: none;
	background: transparent;
}

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

.custom-container.main {
	margin-top: 50px;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 90vh;
}

#withdrawForm {
	border: 2px solid #ccc;
	padding: 20px;
	border-radius: 8px;
	width: 800px;
	margin: 0 auto;
	box-sizing: border-box;
	text-align: center;
}

#withdrawForm h3 {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 20px;
	text-align: center;
}

#withdrawForm label {
	font-size: 16px;
	font-weight: bold;
	margin-bottom: 8px;
	margin-left: 12px;
}

#withdrawForm input {
	width: calc(50% - 10px); /* 각 요소가 가로로 나열되도록 너비 조절 */
	padding: 12px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	display: inline-block; /* 인라인 블록 요소로 설정하여 가로로 나열 */
}

#withdrawForm button {
	background-color: #dc3545;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	display: inline-block;
	margin-bottom: 15px;
		padding: 12px;
}
 .custom-message {
	color: black;
}

</style>
</head>
<body id="page-top">
	<!-- 메뉴바 -->
	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div class="custom-container main">
		<div>
			<form id="withdrawForm">
				<h3>회원 탈퇴</h3>
				<div class="mb-3 text-center">
					<div class="mb-3 text-center">
						<p class="custom-message">
							회원 정보를 <span class="highlight-text" style="color: red;">안전하게
								보관</span>하기 위해<br>비밀번호를 다시 확인합니다.
						</p>

					</div>
				</div>
				<div class="mb-3 text-center">
					<div class="form-label-group">
						<input type="text" class="form-control" placeholder="아이디"
							id="userId" required>
					</div>
				</div>

				<div class="mb-3 text-center">
					<div class="form-label-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							id="password" required>
					</div>
				</div>

				<div class="mb-3 text-center">
					<div class="form-label-group">
						<input type="password" class="form-control" placeholder="비밀번호 확인"
							id="confirmPassword" required>
					</div>
				</div>
				<button type="submit" class="btn btn-danger">회원 탈퇴</button>
			</form>
		</div>
	</div>
	<!-- 푸터-->
	<c:import url="/WEB-INF/views/include/footer.jsp"/>

	<script>
		$(document).ready(function() {
			// 회원 탈퇴 폼 제출
			$("#withdrawForm").submit(function(event) {
				event.preventDefault();

				// 입력값 가져오기
				var userId = $("#userId").val();
				var password = $("#password").val();
				var confirmPassword = $("#confirmPassword").val();

				// 비밀번호 확인
				if (password !== confirmPassword) {
					alert("비밀번호가 일치하지 않습니다.");
					return;
				}

				// 여기서 서버로 회원 탈퇴 요청을 보낼 수 있습니다.
				// 실제 서버 사이드 코드와 연동하여 사용해야 합니다.
				// 예를 들면, $.ajax 또는 fetch를 사용하여 서버에 요청을 보낼 수 있습니다.

				// $.ajax 예제:
				/*
				$.ajax({
				    type: "POST",
				    url: "서버 사이드 URL",  // 실제 서버 URL로 변경해야 합니다.
				    data: { userId: userId, password: password },
				    success: function (response) {
				        // 성공 시 처리
				        alert("회원 탈퇴가 완료되었습니다.");
				        window.location.href = "index.html";  // 회원 탈퇴 후 이동할 페이지로 변경
				    },
				    error: function (error) {
				        // 실패 시 처리
				        alert("회원 탈퇴에 실패했습니다. 다시 시도해주세요.");
				    }
				});
				 */
			});
		});
	</script>
</body>
</html>