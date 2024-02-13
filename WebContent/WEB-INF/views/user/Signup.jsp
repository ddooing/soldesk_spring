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
	
<!-- sweetalert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>		

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
	width: 100px; 
	height: 40px; 
	cursor: pointer;
	font-weight: 300;
	color: #757575;
	background-color: #fff;
	border: 1px solid #E7E7E7;
	height: 40px;
	cursor: pointer;
	font-weight: 300;
	color: #757575;
	border: 2px solid transparent;
	transition: background-color 0.3s ease-in-out;
	border-radius: 5px; 
}

.age_btn.on {
	background-color: #E7E7E7;
	border-radius: 5px; 
}

#readg {
	transform-origin: top;
}


.asdf tr {
	height: 50px;
}
</style>

</head>
<script>
	function checkIdExist() {
		var id = $("#id").val();

		if (id.length == 0) {
			Swal.fire({
				  icon: "error",
				  title: "아이디를 입력해주세요!",
				});
			return;
		}

		$.ajax({
			url : '${root}/user/checkIdExist/' + id,
			type : 'get',
			dataType : 'text',
			success : function(result) {
				if (result.trim() == 'true') {
					Swal.fire({
						  icon: "success",
						  title: "사용할 수 있는 아이디 입니다!",
						});
					$("#IdExist").val('true');
				} else if (result.trim() == 'false') {
					Swal.fire({
						  icon: "error",
						  title: "사용할 수 없는 아이디 입니다!",
						});
					$("#IdExist").val('false');
				}
			}
		});
	}

	function resetIdExist() {
		$("#IdExist").val('false');
	}

	function checkNickExist() {
		var nickname = $("#nickname").val();

		if (nickname.length == 0) {
			Swal.fire({
				  icon: "error",
				  title: "닉네임을 입력해 주세요!",
				});
			return;
		}

		$.ajax({
			url : '${root}/user/checkNickExist/' + nickname,
			type : 'get',
			dataType : 'text',
			success : function(result) {
				if (result.trim() == 'true') {
					Swal.fire({
						  icon: "success",
						  title: "사용할 수 있는 닉네임 입니다",
						});
					$("#NickExist").val('true');
				} else if (result.trim() == 'false') {
					Swal.fire({
						  icon: "error",
						  title: "사용할 수 없는 닉네임 입니다",
						});
					$("#NickExist").val('false');
				}
			}
		});
	}

	function resetNickExist() {
		$("#NickExist").val('false');
	}
</script>

<body id="page-top">

	<!-- 메뉴바 -->
	<c:import url="/WEB-INF/views/include/header.jsp" />

	<!--로그인 부분-->
	<section id="readg" class="text-center" style="margin-top: 100px;">

		<h2>회원가입</h2>
		<hr style="margin: auto; margin-top: 50px; width: 1000px;" />

		<form:form action="${root}/user/Signup_pro" method="post" id="signupForm"
			modelAttribute="joinUserBean">
			<form:hidden path="IdExist" />
			<form:hidden path="NickExist" />

			<div
				style="display: flex; justify-content: center; align-content: center; text-align: left;">
				<table class="asdf" style="margin-top: 50px;">
					<tr>
						<th style="width:200px;"><form:label path="name" style="font-size: 20px;">성함</form:label>
						</th>

						<td><form:input path="name" class="form-control" /> <form:errors
								path="name" style="color:red" /></td>


					</tr>

					<tr>
						<th style="width:200px;"><form:label path="id" style="font-size: 20px;">아이디</form:label>
						</th>

						<td><form:input path="id" onkeypress="resetIdExist()" 
								class="form-control" /> <form:errors path="id"
								style="color:red" /></td>

						<td>
							<button type="button" class="btn btn-dark" style="margin-left:15px;"
								onclick="checkIdExist()">중복확인</button>
						</td>
					</tr>

					<tr>
						<th style="width:200px;"><form:label path="email" style="font-size: 20px;">이메일</form:label>
						</th>

						<td><form:input path="email" class="form-control" /> <form:errors
								path="email" style="color:red" /></td>
					</tr>



					<tr>
						<th style="width:200px;"><form:label path="birth" style="font-size: 20px;">생년월일</form:label>
						</th>

						<td><input type="date" id="birth" name="birth" style="width:100%;"
							pattern="yyyy-MM-dd" required="required" /></td>
					</tr>

					<tr>
						<th style="width:200px;"><form:label path="password" style="font-size: 20px;">비밀번호</form:label>
						</th>

						<td><form:password path="password" class="form-control" /> <form:errors
								path="password" style="color:red" /></td>
					</tr>

					<tr>
						<th style="width:200px;"><form:label path="password2" style="font-size: 20px;">비밀번호 확인</form:label>
						</th>

						<td><form:password path="password2" class="form-control" />
							<form:errors path="password2" style="color:red" /></td>
					</tr>

					<tr>
						<th style="width:200px;"><form:label path="nickname" style="font-size: 20px;">닉네임</form:label>
						</th>

						<td><form:input path="nickname" class="form-control"
								onkeypress="resetNickExist()" /> <form:errors path="nickname"
								style="color:red" /></td>

						<td>
							<button type="button" class="btn btn-dark" style="margin-left:15px;"
								onclick="checkNickExist()">중복확인</button>
						</td>
					</tr>

					<tr>
						<th style="width:200px;"><form:label path="gender" style="font-size: 20px;">성별</form:label>
						</th>

						<td>
							<div style="display: flex; justify-content: center;">

								<div style="margin-right: 80px;">
									<form:radiobutton path="gender" value="male" id="male" />
									<form:label path="gender" for="male" style="margin-left:10px;">남</form:label>
								</div>

								<div>
									<form:radiobutton path="gender" value="female" id="female" />
									<form:label path="gender" for="female" style="margin-left:10px;">여</form:label>
								</div>
							</div> <form:errors path="gender" style="color:red" />
						</td>

					</tr>

					<tr>
						<th style="width:200px;"><form:label path="telephone" style="font-size: 20px;">전화번호</form:label>
						</th>

						<td><form:input path="telephone" class="form-control" /> <form:errors
								path="telephone" style="color:red;" /></td>
					</tr>


				</table>
			</div>
			<!-- 확인 버튼 -->
			<div style="display:flex; justify-content: center; align-items: center;">
				<a href="${root}/view/index" class="btn btn-danger" style="margin-top:30px; margin-right:15px;">취소</a>
				<button type="button" onclick="submitForm();" class="btn btn-dark" style="margin-top:30px;">확인</button>
			</div>
		</form:form>



	</section>

	<script>
		function age_chg(age) {
			var buttons = document.querySelectorAll('.age_btn');
			buttons.forEach(function(button) {
				button.classList.remove('on');
			});

			var selectedButton = document.getElementById('age_' + age);
			selectedButton.classList.add('on');
		}
	</script>



	<!-- 푸터-->

	<c:import url="/WEB-INF/views/include/footer.jsp" />

<script>
    function submitForm() {
        Swal.fire({
            title: '회원가입 하시겠습니까?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '확인',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: '회원가입이 완료되었습니다!',
                    icon: 'success',
                    confirmButtonText: '확인'
                }).then(() => {
                    document.getElementById("signupForm").submit();
                });
            }
        });
    }
</script>



</body>

</html>