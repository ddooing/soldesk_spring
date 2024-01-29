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
<link rel="icon" type="image/x-icon" href="img/ARTMEE_PAGELOGO.png" />

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
<script src="../js/scripts.js"></script>

<!-- JQuery 자바스크립트-->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

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

<style>
#jcl-demo {
	text-align: center;
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

.btn_go {
	display: none;
	position: fixed;
	bottom: 30px;
	right: 30px;
	z-index: 999;
	outline: none;
	cursor: pointer;
	border-radius: 100%;
	border: none;
}

.fixed-navbar {
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 1000;
	background-color: white;
	box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
}

/* 모달 창 */
.modal {
	display: none;
	justify-content: center;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 300px;
	text-align: center;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	cursor: pointer;
	width: 25px;
	margin-left: auto;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
}
</style>



</head>

<body id="page-top">
	<c:import url="/WEB-INF/views/include/header.jsp" />



	<section id="exhibition_info" style="margin-top: 150px;">
		<div class="container mb-1">
			<!--전시회 부분-->
			<div style="display: flex; align-items: center; flex-direction: row;">
				<img src="${exhibitionBean.main_poster_filepath }" alt="포스터"
					style="width: 280px; height: 400px; margin-left: 200px; margin-top: 40px;" />

				<div style="margin-left: 50px;">
					<h1>${exhibitionBean.title}</h1>

					<div style="display: flex; margin-top: 40px;">
						<div style="margin-right: 20px;">
							<a style="font-size: 25px;">${exhibitionBean.place }</a>
						</div>
					</div>

					<div style="display: flex; margin-top: 10px;">
						<div style="margin-right: 20px;">
							<a style="font-size: 25px;">${exhibitionBean.exhibition_start.substring(0, 10) }~${exhibitionBean.exhibition_end.substring(0, 10) }</a>
						</div>
					</div>

					<div style="display: flex; margin-top: 10px;">
						<div style="margin-right: 10px;">
							<a style="font-size: 20px;">관람 시간</a style="font-size: 20px;">
						</div>
						<div style="">
							<a style="font-size: 20px;">${exhibitionBean.open}</a>
						</div>
					</div>

					<div style="display: flex; margin-top: 10px;">
						<div style="margin-right: 10px;">
							<a style="font-size: 20px;">입장료</a style="font-size: 20px;">
						</div>
						<div style="">
							<a style="font-size: 20px;">${exhibitionBean.price}원</a>
						</div>
					</div>

					<div style="display: flex; margin-top: 10px;">
						<div style="margin-right: 10px;">
							<a style="font-size: 20px;">주소</a style="font-size: 20px;">
						</div>
						<div style="">
							<a style="font-size: 20px;">${exhibitionBean.address}</a>
						</div>
					</div>

					<div style="display: flex; margin-top: 50px;">
						<div style="margin-right: 10px;">
							<form:form
								action="payment?exhibition_idx=${exhibitionBean.exhibition_idx}"
								method="post" modelAttribute="tempReserveBean">
								<form:input path="ticket_count" />
								<input type="date" id="birth" name="reserve_date" value="<fmt:formatDate value="${reserve_date}" pattern="yyyy-MM-dd" "/>
								<c:choose>
									<c:when test="${loginUserBean.userLogin == false}">
										<button class="btn btn-dark"
											onclick="location.href='${root}/user/not_login'">예매하기</button>
									</c:when>
									<c:otherwise>
										<button type="submit" class="btn btn-dark">예매하기</button>
									</c:otherwise>
								</c:choose>

							</form:form>

						</div>

						<div style="margin-left: auto;">
							<button id="shareButton"
								style="background: none; border: none; margin-right: 20px;">
								<img src="../img/shareicon.svg"
									style="width: 30px; height: 30px;" alt="공유아이콘" />
							</button>
							<button id="heartButton" style="background: none; border: none;">
								<svg id="empty_heart" xmlns="http://www.w3.org/2000/svg"
									width="30" height="30" fill="currentColor" class="bi bi-heart"
									viewBox="0 0 16 16">
									<path
										d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15" />
								</svg>

								<svg id="fill_heart" xmlns="http://www.w3.org/2000/svg"
									width="30" height="30" fill="currentColor"
									class="bi bi-heart-fill" viewBox="0 0 16 16"
									style="fill: red; display: none;">
									<path fill-rule="evenodd"
										d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314" />
								</svg>
							</button>
						</div>
					</div>

				</div>
			</div>

			<!-- 모달 창 -->
			<div id="shareModal" class="modal">
				<div class="modal-content" style="width: 20%;">
					<div class="close">&times;</div>
					<!-- 이미지를 표시하는 부분입니다 -->
					<div
						style="display: flex; text-align: center; justify-content: center; margin: 20px;">
						<div
							style="display: inline-block; margin-right: 50px; cursor: pointer;"
							onclick="shareInsta()">
							<!--인스타그램 클릭 -->
							<div>
								<img src="../img/insta_share.png"
									style="width: 45px; height: 45px;" />
							</div>
							<div style="margin-top: 10px;">
								<p3>인스타그램</p3>
							</div>
						</div>

						<div style="display: inline-block; cursor: pointer;"
							onclick="shareKakao()">
							<!--카카오톡 클릭 -->
							<div>
								<img src="../img/kakao_share.png" alt="카카오톡"
									style="width: 45px; height: 45px;" />
							</div>
							<div style="margin-top: 10px;">
								<p3>카카오톡</p3>
							</div>
						</div>

					</div>

					<button class="btn btn-dark"
						style="width: 150px; height: 50px; margin: auto;"
						onclick="copyLink()">링크 복사</button>
				</div>
			</div>

			<script>
				// 공유 버튼 클릭 이벤트
				document.getElementById('shareButton').onclick = function() {
					document.getElementById('shareModal').style.display = "block";
				}

				// 모달창 닫기 버튼 클릭 이벤트
				document.getElementsByClassName('close')[0].onclick = function() {
					document.getElementById('shareModal').style.display = "none";
				}

				// 모달창 외부 클릭 시 모달창 닫기
				window.onclick = function(event) {
					if (event.target == document.getElementById('shareModal')) {
						document.getElementById('shareModal').style.display = "none";
					}
				}

				// 링크 복사 버튼 클릭 이벤트
				function copyLink() {
					var copyText = document.getElementById("shareLink");
					copyText.select();
					document.execCommand("copy");
					alert("링크가 복사되었습니다.");
				}

				function shareKakao() {
					alert('카카오톡 공유');
				}

				function shareInsta() {
					alert('인스타 공유');
				}

				document
						.addEventListener(
								'DOMContentLoaded',
								function() { // 현재 페이지 링크 따서 공유창에 넣기
									var currentPageUrl = window.location.href; // 현재 페이지의 URL을 가져옵니다.
									document.getElementById('shareLink').value = currentPageUrl; // input 태그의 value 속성에 URL을 설정합니다.
								});
			</script>

			<script>
				//  하트 토글 버튼
				// 변수 선언
				let isHeartFilled = false;
				const heartButton = document.getElementById('heartButton');
				const fillHeartIcon = document.getElementById('fill_heart');
				const emptyHeartIcon = document.getElementById('empty_heart');

				// 하트 버튼 클릭 시 토글 함수
				function toggleHeart() {
					isHeartFilled = !isHeartFilled;

					if (isHeartFilled) {
						// 하트가 채워진 아이콘 표시, 빈 하트 아이콘 숨김
						fillHeartIcon.style.display = 'inline-block';
						emptyHeartIcon.style.display = 'none';
					} else {
						// 빈 하트 아이콘 표시, 하트가 채워진 아이콘 숨김
						fillHeartIcon.style.display = 'none';
						emptyHeartIcon.style.display = 'inline-block';
					}
				}

				// 하트 버튼에 클릭 이벤트 리스너 추가
				heartButton.addEventListener('click', toggleHeart);
			</script>


			<hr style="margin: auto; margin-top: 50px; width: 1000px;" />
	</section>

	<section id="exhibition_navbar">
		<div
			style="margin-top: 30px; text-align: center; margin-bottom: 15px;">
			<button id="exhibition_info_button"
				style="color: black; font-size: 25px; text-decoration: none; border: none; background-color: transparent;">전시회
				정보</button>
			<button id="exhibition_detail_button"
				style="color: lightgray; font-size: 25px; text-decoration: none; border: none; background-color: transparent; margin-left: 150px;">전시회
				상세</button>
			<button id="exhibition_map_button"
				style="color: lightgray; font-size: 25px; text-decoration: none; border: none; background-color: transparent; margin-left: 150px;">지도</button>
			<button id="exhibition_review_button"
				style="color: lightgray; font-size: 25px; text-decoration: none; border: none; background-color: transparent; margin-left: 150px;">후기</button>

		</div>

	</section>

	<script>
		$(window).scroll(function() {
			var scroll = $(window).scrollTop();
			var navbar = $("#exhibition_navbar");
			var detailSection = $("#exhibition_detail").offset().top; // #exhibition_detail의 위치

			// 스크롤 위치에 따라 navbar의 스타일 변경
			if (scroll >= detailSection) {
				navbar.addClass('fixed-navbar');
			} else {
				navbar.removeClass('fixed-navbar');
			}
		});
	</script>

	<script>
		$(window).scroll(function() {
			var scroll = $(window).scrollTop();

			var infoPosition = $('#exhibition_info').offset().top;
			var detailPosition = $('#exhibition_detail').offset().top;
			var mapPosition = $('#exhibition_map').offset().top;
			var reviewPosition = $('#exhibition_review').offset().top;

			// 버튼 색상 초기화 함수
			function resetButtonColors() {
				$('#exhibition_info_button').css('color', 'lightgray');
				$('#exhibition_detail_button').css('color', 'lightgray');
				$('#exhibition_map_button').css('color', 'lightgray');
				$('#exhibition_review_button').css('color', 'lightgray');
			}

			resetButtonColors(); // 기본적으로 모든 버튼 색상을 초기화

			// 스크롤 위치에 따라 각 버튼의 색상 변경
			if (scroll >= infoPosition && scroll < detailPosition) {
				$('#exhibition_info_button').css('color', 'black');
			} else if (scroll >= detailPosition && scroll < mapPosition) {
				$('#exhibition_detail_button').css('color', 'black');
			} else if (scroll >= mapPosition && scroll < reviewPosition) {
				$('#exhibition_map_button').css('color', 'black');
			} else if (scroll >= reviewPosition) {
				$('#exhibition_review_button').css('color', 'black');
			}
		});
	</script>



	<script>
		// 버튼 클릭시 위치 변경

		document.getElementById('exhibition_detail_button').addEventListener(
				'click',
				function() {
					document.getElementById('exhibition_detail')
							.scrollIntoView({
								behavior : 'smooth'
							});
				});

		document.getElementById('exhibition_info_button').addEventListener(
				'click', function() {
					document.getElementById('exhibition_info').scrollIntoView({
						behavior : 'smooth'
					});
				});

		document.getElementById('exhibition_review_button').addEventListener(
				'click',
				function() {
					document.getElementById('exhibition_review')
							.scrollIntoView({
								behavior : 'smooth'
							});
				});

		document.getElementById('exhibition_map_button').addEventListener(
				'click', function() {
					document.getElementById('exhibition_map').scrollIntoView({
						behavior : 'smooth'
					});
				});
	</script>




	<section id="exhibition_detail" style="margin-top: 20px;">
		<!--전시회 상세-->
		<hr style="margin: auto; margin-top: 50px; width: 800px;" />
		<div class="text-center">
			<img src="${exhibitionBean.detail_poster_filepath }"
				style="width: 800px;" alt="전시회 이미지" />
		</div>

	</section>

	<section id="exhibition_map" style="margin-top: 20px;">
		<!--지도-->
		<hr style="margin: auto; margin-top: 100px; width: 1000px;" />
		<div class="container mb-1">
			<h3 style="margin-left: 180px; margin-top: 50px;">지도</h3>
			<div id="map"
				style="width: 800px; height: 600px; margin: auto; margin-top: 30px; border: 1px black solid;">
			</div>
		</div>
	</section>

	<!--후기-->
	<section id="exhibition_review"
		style="margin-top: 20px; justify-content: center; display: flex; align-items: center; flex-direction: column;">


		<!--후기 -->
		<hr style="margin: auto; margin-top: 100px; width: 1000px;" />
		<h3
			style="margin-right: auto; margin-left: 450px; margin-top: 50px; margin-bottom: 50px;">후기</h3>
		<!-- 차트 ... 별점 평균 넣을지 말지-->
		<div style="padding: 10px; margin: 30px;">
			<img style="width: 800px; height: 375px;" src="../img/chart_ex.PNG" />

		</div>
		<!--후기 댓-->
		<div style="width: 800px; padding: 20px;">


			<!-- 1뎃 -->
			<div
				style="padding: 25px; display: flex; flex-direction: column; background-color: white; border-radius: 20px; box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 5px 0px, rgba(0, 0, 0, 0.1) 0px 0px 1px 0px; margin-bottom: 25px;">
				<div
					style="display: flex; flex-direction: row; align-items: center;">
					<img src="../img/level/profile_Lv1.png"
						style="width: 45px; height: 45px;" />
					<div style="margin-left: 8px;">
						<div style="font-size: 20px;">박지예</div>
					</div>
				</div>

				<div>

					<div style="margin-bottom: 8px; margin-top: 14px;">
						<!-- 후에 별점 구현-->
						<span style="color: gold; font-size: 25px;">★★★</span><span
							style="color: #ddd; font-size: 25px;">★★</span>
					</div>
					<div id="review">
						<p class="short-text">과학자가 주인공이고 내용이 과학에 관련된거라 이해를 못하면 어쩌지 하는
							걱정이...</p>

						<p class="full-text" style="display: none;">과학자가 주인공이고 내용이 과학에
							관련된거라 이해를 못하면 어쩌지 하는 걱정이 있었지만! 넘버와 대사들로 인해 술술 넘어갈 수 있었던 것 같아요! 또
							다른 후기에서도 봤지만 앙상블 무대가 많은것도 참 좋더라구요~ 그리고 무대! 무대 정말 맘에들었어요. 처음 마리퀴리를
							보는거라 이전 무대는 모르겠지만.. 무대 연출? 너무 좋았어요!</p>
						<button class="toggle-button"
							style="background: transparent; border: none; float: right;">더보기</button>
					</div>


				</div>
			</div>




			<!-- 2뎃 -->
			<div
				style="padding: 25px; display: flex; flex-direction: column; background-color: white; border-radius: 20px; box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 5px 0px, rgba(0, 0, 0, 0.1) 0px 0px 1px 0px; margin-bottom: 25px;">
				<div
					style="display: flex; flex-direction: row; align-items: center;">
					<img src="../img/level/profile_Lv1.png"
						style="width: 45px; height: 45px;" />
					<div style="margin-left: 8px;">
						<div style="font-size: 20px;">또잉</div>
					</div>
				</div>

				<div>

					<div style="margin-bottom: 8px; margin-top: 14px;">
						<!-- 후에 별점 구현-->
						<span style="color: gold; font-size: 25px;">★★★</span><span
							style="color: #ddd; font-size: 25px;">★★</span>
					</div>
					<div id="review">
						<p class="short-text">과학자가 주인공이고 내용이 과학에 관련된거라 이해를 못하면 어쩌지 하는
							걱정이...</p>

						<p class="full-text" style="display: none;">과학자가 주인공이고 내용이 과학에
							관련된거라 이해를 못하면 어쩌지 하는 걱정이 있었지만! 넘버와 대사들로 인해 술술 넘어갈 수 있었던 것 같아요! 또
							다른 후기에서도 봤지만 앙상블 무대가 많은것도 참 좋더라구요~ 그리고 무대! 무대 정말 맘에들었어요. 처음 마리퀴리를
							보는거라 이전 무대는 모르겠지만.. 무대 연출? 너무 좋았어요!</p>
						<button class="toggle-button"
							style="background: transparent; border: none; float: right;">더보기</button>
					</div>


				</div>
			</div>


			<!-- 3뎃 -->
			<div
				style="padding: 25px; display: flex; flex-direction: column; background-color: white; border-radius: 20px; box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 5px 0px, rgba(0, 0, 0, 0.1) 0px 0px 1px 0px; margin-bottom: 25px;">
				<div
					style="display: flex; flex-direction: row; align-items: center;">
					<img src="../img/level/profile_Lv1.png"
						style="width: 45px; height: 45px;" />
					<div style="margin-left: 8px;">
						<div style="font-size: 20px;">므엉</div>
					</div>
				</div>

				<div>

					<div style="margin-bottom: 8px; margin-top: 14px;">
						<!-- 후에 별점 구현-->
						<span style="color: gold; font-size: 25px;">★★★</span><span
							style="color: #ddd; font-size: 25px;">★★</span>
					</div>
					<div id="review">
						<p class="short-text">과학자가 주인공이고 내용이 과학에 관련된거라 이해를 못하면 어쩌지 하는
							걱정이...</p>

						<p class="full-text" style="display: none;">과학자가 주인공이고 내용이 과학에
							관련된거라 이해를 못하면 어쩌지 하는 걱정이 있었지만! 넘버와 대사들로 인해 술술 넘어갈 수 있었던 것 같아요! 또
							다른 후기에서도 봤지만 앙상블 무대가 많은것도 참 좋더라구요~ 그리고 무대! 무대 정말 맘에들었어요. 처음 마리퀴리를
							보는거라 이전 무대는 모르겠지만.. 무대 연출? 너무 좋았어요!</p>
						<button class="toggle-button"
							style="background: transparent; border: none; float: right;">더보기</button>
					</div>


				</div>
			</div>
		</div>
	</section>

	<script>
		// '더보기' 버튼에 대한 모든 인스턴스를 선택합니다.
		var toggleButtons = document.querySelectorAll(".toggle-button");

		toggleButtons.forEach(function(button) {
			button.addEventListener("click", function() {
				// 이 버튼과 관련된 텍스트 요소들을 찾습니다.
				var fullText = this.parentNode.querySelector(".full-text");
				var shortText = this.parentNode.querySelector(".short-text");

				// 텍스트 요소들의 표시 상태를 전환합니다.
				if (fullText.style.display === "none") {
					fullText.style.display = "block";
					shortText.style.display = "none";
					this.textContent = "접기";
				} else {
					fullText.style.display = "none";
					shortText.style.display = "block";
					this.textContent = "더보기";
				}
			});
		});
	</script>


	<!--지도api 자바스크립트 건드리지말기!-->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b2cf06203fb94dc8e07b3948ec6405a&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'); // 지도를 표시할 div 

		var X = parseFloat('${exhibitionBean.x}');
		var Y = parseFloat('${exhibitionBean.y}');

		var mapOption = {
			center : new kakao.maps.LatLng(X, Y), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		var art_title = '${exhibitionBean.title}';

		var iwContent = '<div style="width:180px; padding:5px;">' + art_title
				+ '</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		var iwPosition = new kakao.maps.LatLng(X, Y); //인포윈도우 표시 위치입니다
		var iwRemoveable = true; // removeable 속성을 true로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

		// 인포윈도우를 생성하고 지도에 표시합니다
		var infowindow = new kakao.maps.InfoWindow({
			map : map, // 인포윈도우가 표시될 지도
			position : iwPosition,
			content : iwContent,
			removable : iwRemoveable
		});

		// 아래 코드는 인포윈도우를 지도에서 제거합니다
		// infowindow.close();
	</script>



	<!-- 푸터-->
	<c:import url="/WEB-INF/views/include/footer.jsp" />


	<div class="btn_go">
		<div style="display: inline-block;">
			<div class="btn_gotop">
				<a href="#doz_header"> <svg xmlns="http://www.w3.org/2000/svg"
						width="50" height="50" fill="black"
						class="bi bi-arrow-up-circle-fill" viewBox="0 0 16 16">
							<path
							d="M16 8A8 8 0 1 0 0 8a8 8 0 0 0 16 0m-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707z" />
						</svg>
				</a>
			</div>
			<div class="btn_godown" style="margin-top: 15px;">
				<a href="#doz_header"> <svg xmlns="http://www.w3.org/2000/svg"
						width="50" height="50" fill="black"
						class="bi bi-arrow-down-circle-fill" viewBox="0 0 16 16">
							<path
							d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M8.5 4.5a.5.5 0 0 0-1 0v5.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293z" />
						</svg>
				</a>
			</div>
		</div>
	</div>
	<script>
		// 일정 부분 스크롤 할경우 우측 하단 top down 버튼 생성
		$(window).scroll(function() {
			if ($(this).scrollTop() > 300) {
				$('.btn_go').show();
			} else {
				$('.btn_go').hide();
			}
		});
		$('.btn_gotop').click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 100);
			return false;
		});
		$('.btn_godown').click(function() {
			$('html, body').animate({
				scrollTop : $(document).height()
			}, 100);
			return false;
		});
	</script>


</body>

</html>