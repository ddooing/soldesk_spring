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

	<script>
		$(document).ready(function () {
			// enroll_second, enroll_third, enroll_forth, enroll_fifth 숨김
			$("#enroll_second, #enroll_third, #enroll_forth, #enroll_fifth").hide();

			function scrollToTop() {
				window.scrollTo(0, 0);
			}

			$("#first_nextButton").click(function () {
				if ($("#name").val() && $("#email").val() && $("#phone").val() && $("#agree").is(":checked")) {
					$("#enroll_first").hide();
					$("#enroll_second").show();
					scrollToTop();
				} else {
					alert("필수 부분을 작성해 주세요");
				}
			});

			$("#second_nextButton").click(function () {
				if ($("#exhibition_name").val() && $("#exhibition_place").val() && $("#exhibition_start").val() && $("#exhibition_end").val() && $("#exhibition_start_time").val() && $("#exhibition_end_time").val()) {
					$("#enroll_second").hide();
					$("#enroll_third").show();
					scrollToTop();
				} else {
					alert("필수 부분을 작성해 주세요");
				}
			});

			$("#third_nextButton").click(function () {
				$("#enroll_third").hide();
				$("#enroll_forth").show();
				scrollToTop();
			});

			$("#forth_nextButton").click(function () {
				$("#enroll_forth").hide();
				$("#enroll_fifth").show();
				scrollToTop();
			});

			$("#re_check").click(function () {
				$("#enroll_forth").hide();
				$("#enroll_first").show();
				scrollToTop();
			});

			$("#come_back").click(function () {
				window.location.href = 'index.html';
			});
		});
	</script>

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

		.filebox .upload-name1,
		.filebox .upload-name2 {
			display: inline-block;
			height: 40px;
			padding: 0 10px;
			vertical-align: middle;
			border: 1px solid #dddddd;
			width: 78%;
			color: #999999;
			width: 300px;
		}

		.filebox label {
			display: inline-block;
			padding: 10px 20px;
			color: #fff;
			vertical-align: middle;
			background-color: #999999;
			cursor: pointer;
			height: 40px;
			margin-left: 10px;
		}

		.filebox input[type="file"] {
			position: absolute;
			width: 0;
			height: 0;
			padding: 0;
			overflow: hidden;
			border: 0;
		}
	</style>

</head>

<body id="page-top">

<c:import url="/WEB-INF/views/include/header.jsp"/>

	<!--등록 페이지 1 ~ 5 단계-->
	<form action="#" method="post"> <!--폼 여기서 열었음!!!!!!!!!!!!!!!!!!!!!-->
		<section style="margin-top: 150px;" id="enroll_first">
			<center>
				<img src="./assets/img/ARTMEE.png" alt="아트미 로고" style="width: 300px; height: 140px;" />
				<br /><br />
				<h4>전시회 등록을 환영합니다!</h4>
				<h4>아트미 전시회 등록은 검토를 거쳐 아트미 웹페이지에 게시됩니다.</h4>
				<br /><br />
				<img src="./assets/img/enroll_firstimg.png" alt="등록 첫번째" style="width: 450px; height: 110px;" />
				<br /><br />
				<div style="width: 700px; height: 700px; border: 1px solid lightgray; border-radius: 5%;">

					<b style="float: left; margin-left: 40px; margin-top: 50px; font-size: 30px;">1. 신청인 정보</b>


					<div class="form-group" style="margin-top: 140px;">
						<label for="name" style="width: 150px; display: inline-block; font-size: 20px;">이름*</label>
						<input id="name" name="name" type="text" style="width: 400px;" />
					</div>
					<div class="form-group" style="margin-top: 30px;">
						<label for="email" style="width: 150px; display: inline-block; font-size: 20px;">이메일*</label>
						<input id="email" name="email" type="email" style="width: 400px;" />
					</div>
					<div class="form-group" style="margin-top: 30px;">
						<label for="phone" style="width: 150px; display: inline-block; font-size: 20px;">전화번호*</label>
						<input id="phone" name="phone" type="tel" style="width: 400px;" />
					</div>

					<b style="float: left; margin-left: 40px; margin-top: 50px; font-size: 20px;">1-2. 약관 동의*</b>

					<br /><br /><br /><br /><br />
					<a style="font-size: 20px;">견적 제공을 위해 약관을 동의해 주세요! <a
							style="margin-left: 30px; font-size: 20px; color: blue; cursor: pointer;"
							data-bs-toggle="modal" data-bs-target="#termsModal">약관 확인</a></a>
					<br /><br /><br />

					<div class="form-check">
						<input type="checkbox" id="agree" style="width: 17px; height: 17px; margin-right: 15px;"
							required />
						<label for="agree" style="font-size: 20px;">개인정보 취급 방침에 동의합니다.</label>
					</div>

					<div style="margin-top: 90px;">
						<button type="button" style="width: 400px; border: 0.5px solid lightgray; font-size: 20px;"
							id="first_nextButton" class="btn btn-light">다음</button>
					</div>

				</div>
			</center>
		</section>

		<script>		// 개인정보 동의 안할시 버튼 활성화 x
			$(document).ready(function () {
				$("#first_nextButton").prop('disabled', true);

				$("#agree").change(function () {
					if (this.checked) {
						$("#first_nextButton").prop('disabled', false);
					} else {
						$("#first_nextButton").prop('disabled', true);
					}
				});
			});
		</script>



		<section style="margin-top: 150px;" id="enroll_second">
			<center>
				<img src="./assets/img/ARTMEE.png" alt="아트미 로고" style="width: 300px; height: 140px;" />
				<br /><br />
				<img src="./assets/img/enroll_secondimg.png" alt="등록 두번째" style="width: 450px; height: 110px;" />
				<br /><br />
				<div style="width: 700px; height: 800px; border: 1px solid lightgray; border-radius: 5%;">

					<b style="float: left; margin-left: 40px; margin-top: 50px; font-size: 30px;">2. 전시회 등록</b>

					<div class="form-group" style="margin-top: 140px;">
						<label for="exhibition_name"
							style="width: 150px; display: inline-block;  font-size: 20px;">전시명*</label>
						<input id="exhibition_name" name="exhibition_name" type="text" style="width: 400px;" />
					</div>
					<div class="form-group" style="margin-top: 30px;">
						<label for="exhibition_place"
							style="width: 150px; display: inline-block;  font-size: 20px;">전시관*</label>
						<input id="exhibition_place" name="exhibition_place" type="text" style="width: 400px;"
							required />
					</div>
					<div class="form-group" style="margin-top: 30px;">
						<label for="exhibition_author"
							style="width: 150px; display: inline-block; font-size: 20px;">주소</label>
						<input id="exhibition_author" name="exhibition_address" type="text" style="width: 400px;" />
					</div>
					<div class="form-group" style="margin-top: 30px;">
						<label for="exhibition_author"
							style="width: 150px; display: inline-block; font-size: 20px;">가격</label>
						<input id="exhibition_author" name="exhibition_fee" type="text" style="width: 400px;" />
					</div>
					<div class="form-group" style="margin-top: 30px;">
						<label for="exhibition_start"
							style="width: 150px; display: inline-block;  font-size: 20px;">전시기간*</label>
						<input id="exhibition_start" name="exhibition_start" type="date"
							style="width: 180px; margin-right: 10px;" required /> ~
						<input id="exhibition_end" name="exhibition_end" type="date"
							style="width: 180px; margin-left: 10px;" required />
					</div>

					<div class="form-group"
						style="margin-top: 30px; display: flex; justify-content: center; align-items: center;">
						<label for="exhibition_start_time"
							style="width: 150px; display: inline-block; font-size: 20px;">운영시간*</label>
						<div style="display: flex;">
							<select class="form-select" style="width: 180px; margin-right: 10px; margin-left: 5px;" name="start_time">
								<option selected>옵션 선택</option>
								<option value="option1">09:00</option>
								<option value="option2">09:30</option>
								<option value="option3">10:00</option>
								<option value="option4">10:30</option>
							</select>
							<a>~</a>
							<select class="form-select" style="width: 180px; margin-left: 10px;" name="end_time">
								<option selected>옵션 선택</option>
								<option value="option1">16:30</option>
								<option value="option2">17:00</option>
								<option value="option3">17:30</option>
								<option value="option4">18:00</option>
							</select>
						</div>
					</div>


					<div class="form-group"
						style="margin-top: 30px; display: flex; justify-content: center; align-items: center;">
						<div style="display:flex">
							<label for="holiday_week"
								style="width: 150px; display: inline-block; font-size: 20px;">휴무일*</label>
							<select class="form-select" style="width:85px; margin-right: 20px;" name="holiday_week"
								id="holiday_week">
								<option selected>옵션</option>
								<option value="option1">매주</option>
								<option value="option2">매달</option>
								<option value="option3">없음</option>
							</select>
							<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
								<input type="checkbox" class="btn-check" id="monday" name="holiday" autocomplete="off">
								<label class="btn btn-outline-dark" for="monday">월</label>

								<input type="checkbox" class="btn-check" id="tuesday" name="holiday" autocomplete="off">
								<label class="btn btn-outline-dark" for="tuesday">화</label>

								<input type="checkbox" class="btn-check" id="wednesday" name="holiday"
									autocomplete="off">
								<label class="btn btn-outline-dark" for="wednesday">수</label>

								<input type="checkbox" class="btn-check" id="thursday" name="holiday"
									autocomplete="off">
								<label class="btn btn-outline-dark" for="thursday">목</label>

								<input type="checkbox" class="btn-check" id="friday" name="holiday" autocomplete="off">
								<label class="btn btn-outline-dark" for="friday">금</label>

								<input type="checkbox" class="btn-check" id="saturday" name="holiday"
									autocomplete="off">
								<label class="btn btn-outline-dark" for="saturday">토</label>

								<input type="checkbox" class="btn-check" id="sunday" name="holiday" autocomplete="off">
								<label class="btn btn-outline-dark" for="sunday">일</label>
							</div>
						</div>
					</div>


					<div class="form-group" style="margin-top: 30px;">
						<label for="exhibition_author"
							style="width: 150px; display: inline-block; font-size: 20px;">작가</label>
						<input id="exhibition_author" name="exhibition_author" type="text" style="width: 400px;" />
					</div>

					<div style="margin-top: 90px;">
						<button type="button" style="width: 400px; border: 0.5px solid lightgray;  font-size: 20px;"
							id="second_nextButton" class="btn btn-light">다음</button>
					</div>
				</div>
			</center>
		</section>

		<script>
			var start = document.getElementById('exhibition_start');
			var end = document.getElementById('exhibition_end');

			// 종료 날짜 변경될때마다 실행
			end.addEventListener('change', function () {
				if (end.value < start.value) {
					alert("종료 날짜는 시작 날짜보다 이후일 수 없습니다.");
					end.value = start.value;
				}
			});
		</script>

		<section style="margin-top: 150px;" id="enroll_third">
			<center>
				<img src="./assets/img/ARTMEE.png" alt="아트미 로고" style="width: 300px; height: 140px;" />
				<br /><br />
				<img src="./assets/img/enroll_thirdimg.png" alt="등록 세번째" style="width: 450px; height: 110px;" />
				<br /><br />
				<div style="width: 700px; height: 500px; border: 1px solid lightgray; border-radius: 5%;">

					<b style="float: left; margin-left: 40px; margin-top: 50px; font-size: 30px;">3. 첨부파일 업로드</b>
					<br /><br /><br /><br />

					<b style="float: left; margin-left: 140px; margin-top: 30px; font-size: 20px;">메인 포스터</b>
					<br /><br /><br />
					<div class="filebox" style="margin-top: 15px;">
						<input class="upload-name1" value="첨부파일" placeholder="첨부파일">
						<label for="file1">파일찾기</label>
						<input type="file" id="file1" name="main_poster">
					</div>
					<b style="float: left; margin-left: 140px; margin-top: 30px; font-size: 20px;">설명 포스터</b>
					<br /><br /><br />
					<div class="filebox" style="margin-top: 15px;">
						<input class="upload-name2" value="첨부파일" placeholder="첨부파일">
						<label for="file2">파일찾기</label>
						<input type="file" id="file2" name="detail_poster">
					</div>

					<div style="margin-top: 90px;">
						<button type="button" style="width: 400px; border: 0.5px solid lightgray;" id="third_nextButton"
							class="btn btn-light">다음</button>
					</div>
				</div>
			</center>
		</section>


		<script>	// input="file" 부분 파일이름으로 변경되게 하는 스크립트
			$("#file1").on('change', function () {
				var filePath = $("#file1").val();
				var fileName = filePath.substring(filePath.lastIndexOf("\\") + 1);
				$(".upload-name1").val(fileName);
			});

			$("#file2").on('change', function () {
				var filePath = $("#file2").val();
				var fileName = filePath.substring(filePath.lastIndexOf("\\") + 1);
				$(".upload-name2").val(fileName);
			});
		</script>



		<section style="margin-top: 150px;" id="enroll_forth">
			<center>
				<img src="./assets/img/ARTMEE.png" alt="아트미 로고" style="width: 300px; height: 140px;" />
				<br /><br />
				<img src="./assets/img/enroll_forthimg.png" alt="등록 네번째" style="width: 450px; height: 110px;" />
				<br /><br />
				<div style="width: 700px; height: 400px; border: 1px solid lightgray; border-radius: 5%;">

					<b style="float: left; margin-left: 40px; margin-top: 50px; font-size: 30px;">4. 확인</b>
					<br /><br /><br /><br /><br /><br />
					<b style=" margin-top: 400px; font-size: 25px;">입력하신 정보로 전시회가 등록됩니다</b>

					<div style="margin-top: 70px;">
						<button type="button" style="width: 400px; border: 0.5px solid lightgray;" id="re_check"
							class="btn btn-light">한번 더 확인해 볼게요</button>
					</div>

					<div style="margin-top: 40px;">
						<button type="submit" style="width: 400px; border: 0.5px solid lightgray;" id="forth_nextButton"
							class="btn btn-light">등록</button>
					</div>
				</div>
			</center>
		</section>
	</form> <!--폼여기서 닫았음!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->

	<section style="margin-top: 150px;" id="enroll_fifth">
		<center>
			<img src="./assets/img/ARTMEE.png" alt="아트미 로고" style="width: 300px; height: 140px;" />
			<br /><br />
			<img src="./assets/img/enroll_fifthimg.png" alt="등록 다섯번째" style="width: 450px; height: 110px;" />
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




	<!-- 모달 창 -->
	<div class="modal fade" id="termsModal" tabindex="-1" aria-labelledby="termsModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="termsModalLabel">개인정보 취급 방침</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					1. 개인정보 취급 내용 <br />
					2. 개인정보 취급 내용 <br />
					3. 개인정보 취급 내용 <br />
					4. 개인정보 취급 내용 <br />
					5. 개인정보 취급 내용
				</div>
			</div>
		</div>
	</div>
	
	<c:import url="/WEB-INF/views/include/footer.jsp"/>

</body>

</html>