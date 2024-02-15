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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<!-- Core theme JS-->
<script src="../js/scripts.js"></script>

<!-- sweetalert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>	

<!-- JQuery 자바스크립트-->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- datepicker -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<!-- CSS -->
<link href="../css/styles.css" rel="stylesheet" />

<!-- Carousel 자바스크립트-->

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

/* 우측 예매 박스  */
#right-side-menu {
	position: absolute;
	top: 250px;
	right: 10px;
	width: 400px;
	transition: top 0.3s;
}

#sidebar_menu:hover {
	background-color: rgb(192, 192, 192);
}

input[type="number"]::-webkit-inner-spin-button, input[type="number"]::-webkit-outer-spin-button
	{
	-webkit-appearance: none;
	appearance: none;
	margin: 0;
}
</style>



</head>

<body id="page-top">
	<c:import url="/WEB-INF/views/include/header.jsp" />

	<section id="exhibition_info" style="margin-top: 150px;">
		<div class="container mb-1">
			<!--전시회 부분-->
			<div style="display: flex; align-items: center; flex-direction: row;">
				<img
					src="${exhibitionBean.main_poster_path}${exhibitionBean.main_poster_name}"
					alt="포스터"
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
							<a style="font-size: 25px;">${exhibitionBean.exhibition_start.substring(0, 10) }
								~ ${exhibitionBean.exhibition_end.substring(0, 10) }</a>
						</div>
					</div>

					<div style="display: flex; margin-top: 10px;">
						<div style="margin-right: 10px;">
							<a style="font-size: 20px;">관람 시간</a>
						</div>
						<div>
							<a style="font-size: 20px;">${exhibitionBean.open}</a>
						</div>
					</div>


					<div style="display: flex; margin-top: 10px;">
						<div style="margin-right: 10px;">
							<a style="font-size: 20px;">입장료</a>
						</div>
						<c:choose>
							<c:when test="${exhibitionBean.price == 0 }">
								<div>
									<a style="font-size: 20px;">무료</a>
								</div>
							</c:when>
							<c:otherwise>
								<div>
									<a style="font-size: 20px;">${exhibitionBean.price} 원</a>
								</div>
							</c:otherwise>
						</c:choose>

					</div>

					<div style="display: flex; margin-top: 10px;">
						<div style="margin-right: 10px;">
							<a style="font-size: 20px;">주소</a>
						</div>
						<div style="">
							<a style="font-size: 20px;">${exhibitionBean.address}</a>
						</div>
					</div>

					<div style="display: flex; margin-top: 50px;">
						<div style="margin-left: 400px;">
							<button id="shareButton"
								style="background: none; border: none; margin-right: 20px;">
								<img src="../img/shareicon.svg"
									style="width: 30px; height: 30px;" alt="공유아이콘" />
							</button>


							<c:choose>
								<c:when
									test="${loginUserBean.user_id != 0 && bookmarksure == 1}">
									<button type="button"
										onclick="removeBookmarkAlert();"
										id="heartButton" style="background: none; border: none;">
										<svg id="fill_heart" xmlns="http://www.w3.org/2000/svg"
											width="30" height="30" fill="currentColor"
											class="bi bi-heart-fill" viewBox="0 0 16 16"
											style="fill: red;">
							                <path fill-rule="evenodd"
												d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314" />
							            </svg>
									</button>
								</c:when>
								<c:when
									test="${loginUserBean.user_id != 0 && bookmarksure == 0}">
									<button type="button"
										onclick="bookmarkAlert();"
										id="heartButton" style="background: none; border: none;">
										<svg id="empty_heart" xmlns="http://www.w3.org/2000/svg"
											width="30" height="30" fill="currentColor"
											class="bi bi-heart" viewBox="0 0 16 16">
							                <path
												d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.920 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15" />
							            </svg>
									</button>
								</c:when>
								<c:otherwise>
									<button type="button"
										onclick="notLoggedInAlert();"
										id="heartButton" style="background: none; border: none;">
										<svg id="empty_heart" xmlns="http://www.w3.org/2000/svg"
											width="30" height="30" fill="currentColor"
											class="bi bi-heart" viewBox="0 0 16 16">
							                <path
												d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.920 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15" />
							            </svg>
									</button>
								</c:otherwise>
							</c:choose>



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
			<!-- 공유 모달창 끝 -->


			<!-- 우측 예매 -->
			<c:choose>
				<c:when
					test="${exhibitionBean.price != null and exhibitionBean.price == 0 }">

				</c:when>
				<c:otherwise>
					<form:form
						action="payment?exhibition_id=${exhibitionBean.exhibition_id}" id="reservationForm"
						method="post" modelAttribute="tempReserveBean">
						<form:hidden path="user_id" value="${loginUserBean.user_id }" />
						<form:hidden path="exhibition_id" value="${exhibitionBean.exhibition_id}"/>
						<div id="right-side-menu">
							<div
								style="display: inline-block; box-shadow: 0 3px 6px 0 rgba(0, 0, 0, 0.22); border-top: 10px solid black; border-top-left-radius: 5%; border-top-right-radius: 5%; border-bottom: 10px solid black; border-bottom-left-radius: 5%; border-bottom-right-radius: 5%; background-color: white;">
								<div id="sidebar_menu"
									style="border: 1px solid #e7e7e7; border-top-right-radius: 5%; border-top-left-radius: 5%; border-bottom: none; width: 400px; height: 350px; text-align: center; align-items: center; justify-content: center; display: flex;">
									<form:hidden path="reserve_date" id="hiddenDateField" value="" />
									<div id="datepicker11"></div>
								</div>
								<hr style="margin: auto; width: 400px; color: black;" />

								<div id="sidebar_menu"
									style="border: 1px solid #e7e7e7; border-top: none; border-bottom: none; border-radius: 5%; width: 400px; height: 80px; text-align: center; align-items: center; justify-content: center; display: flex;">
									<div
										style="justify-content: center; display: flex; margin-top: 10px; align-items: center;">
										<div style="margin-left: auto;">
											<div class="counter">
												<b style="margin-right: 30px; font-size: 25px;">매수 : </b>
												<button id="ticket_decrement" type="button"
													style="border: none; background-color: transparent; width: 30px; height: 30px; margin-right: 10px;">
													<i class="bi bi-dash-lg"
														style="vertical-align: middle; color: black; font-size: 20px; font-weight: bold;"></i>
												</button>
												<form:input type="number" path="ticket_count"
													id="ticket_count" style="width: 50px; text-align:center;"
													value="1" />
												<button id="ticket_increment" type="button"
													style="border: none; background-color: transparent; width: 30px; height: 30px; margin-left: 10px;">
													<i class="bi bi-plus-lg"
														style="vertical-align: middle; color: black; font-size: 20px; font-weight: bold;"></i>
												</button>
											</div>
										</div>
									</div>
								</div>

								<script>
									const decrementButton = document
											.getElementById("ticket_decrement");
									const incrementButton = document
											.getElementById("ticket_increment");
									const ticketCountInput = document
											.getElementById("ticket_count");

									decrementButton
											.addEventListener(
													"click",
													function() {
														const currentValue = parseInt(ticketCountInput.value) || 0;
														if (currentValue > 1) {
															ticketCountInput.value = currentValue - 1;
														} else {
															Swal.fire({
															    title: '알림',
															    text: '최소 수량은 1입니다.',
															    icon: 'warning',
															    confirmButtonText: '확인'
															});
														}
													});

									incrementButton
											.addEventListener(
													"click",
													function() {
														const currentValue = parseInt(ticketCountInput.value) || 0;
														ticketCountInput.value = currentValue + 1;
													});
								</script>


								<hr style="margin: auto; width: 400px; color: black;" />

								<div id="sidebar_menu"
									style="border: 1px solid #e7e7e7; border-top-right-radius: 5%; border-top-left-radius: 5%; border-bottom: none; width: 400px; height: 80px; text-align: center; align-items: center; justify-content: center; display: flex;">
									<div style="justify-content: center;">
										<c:choose>
											<c:when test="${loginUserBean.userLogin == false}">
												<!-- 로그인 안했을때 -->
												<a href="${root}/user/login"
													style="width: 120px; margin-right: 30px;"
													class="btn btn-dark">예매하기</a>
												<a href="${root}/user/login" style="width: 120px;"
													class="btn btn-dark">장바구니</a>
											</c:when>
											<c:otherwise>
												<form:button type="submit"
													style="width:120px; margin-right:30px;"
													class="btn btn-dark">예매하기</form:button>
												<button type="button" id="cartButton"  style="width:120px;"class="btn btn-dark">장바구니</button>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
								<hr style="margin: auto; width: 80px; color: black;" />


							</div>
						</div>

						<!--    보내기  -->
						<script>
							document.getElementById("cartButton").addEventListener("click", function() {
							    var form = document.getElementById("reservationForm");
							    form.action = "${root}/user/cart_insert"; // action 변경
							    form.method = "post"; // POST 메소드 설정
							    form.submit(); // 폼 제출
							});

						</script>
						
						<script>
							window.addEventListener('scroll', function() {
								var scrollPosition = window.pageYOffset
										|| document.documentElement.scrollTop;
								var menu = document
										.getElementById('right-side-menu');

								menu.style.top = (250 + scrollPosition) + 'px'; // 스크롤 위치에 따라 메뉴 위치 업데이트
							});
						</script>
					</form:form>
				</c:otherwise>
			</c:choose>




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
					var copyText = window.location.href; // 현재 주소창의 URL을 가져옵니다.
					var tempInput = document.createElement("input");
					document.body.appendChild(tempInput);
					tempInput.value = copyText;
					tempInput.select();
					document.execCommand("copy");
					document.body.removeChild(tempInput);
					alert("링크가 복사되었습니다.");
				}

				function shareKakao() {
					alert('카카오톡 공유');
				}

				function shareInsta() {
					alert('인스타 공유');
				}
			</script>

			<hr style="margin: auto; margin-top: 50px; width: 1000px;" />
	</section>

	
			<section id="exhibition_navbar">
				<div style="margin-top: 30px; text-align: center; margin-bottom: 15px;">
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
			<img
				src="${exhibitionBean.detail_poster_path }${exhibitionBean.detail_poster_name }"
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
		<!-- <div style="padding: 10px; margin: 30px;">
			<img style="width: 800px; height: 375px;" src="../img/chart_ex.PNG" />

		</div> -->
		<!--후기 댓-->
		<c:choose>
			<c:when test="${!empty exhibitionreviewBean}">
				<div style="width: 800px; padding: 20px;">
					<div style="margin-bottom:20px;">
					<c:choose>
						<c:when test="${empty exhibitionreviewBean}">
						
						</c:when>
						<c:when test="${reviewAVG >= 0 && reviewAVG < 1}">
							<span style="color: #ddd; font-size: 25px;">★★★★★</span>
							<span>평균 : ${String.format("%.1f", reviewAVG)}</span>
						</c:when>
					    <c:when test="${reviewAVG >= 1 && reviewAVG < 2}">
					    	<span style="color: gold; font-size: 25px;">★</span>
							<span style="color: #ddd; font-size: 25px;">★★★★</span>
							<span>평균 : ${String.format("%.1f", reviewAVG)}</span>
						</c:when>
					    <c:when test="${reviewAVG >= 2 && reviewAVG < 3}">
					    	<span style="color: gold; font-size: 25px;">★★</span>
							<span style="color: #ddd; font-size: 25px;">★★★</span>
							<span>평균 : ${String.format("%.1f", reviewAVG)}</span>
					    </c:when>
					    <c:when test="${reviewAVG >= 3 && reviewAVG < 4}">
					    	<span style="color: gold; font-size: 25px;">★★★</span>
							<span style="color: #ddd; font-size: 25px;">★★</span>
							<span>평균 : ${String.format("%.1f", reviewAVG)}</span>
					    </c:when>
					    <c:when test="${reviewAVG >= 4 && reviewAVG < 5}">
					    	<span style="color: gold; font-size: 25px;">★★★★</span>
							<span style="color: #ddd; font-size: 25px;">★</span>
							<span>평균 : ${String.format("%.1f", reviewAVG)}</span>
					    </c:when>
					    <c:when test="${reviewAVG >= 5}">
					    	<span style="color: gold; font-size: 25px;">★★★★★</span>
					    	<span>평균 : ${reviewAVG }</span>
					    </c:when>
					</c:choose>
					</div>
					<c:forEach items="${exhibitionreviewBean }" var="reviewBean">
						<div
							style="padding: 25px; display: flex; flex-direction: column; background-color: white; border-radius: 20px; box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 5px 0px, rgba(0, 0, 0, 0.1) 0px 0px 1px 0px; margin-bottom: 25px;">
							<div
								style="display: flex; flex-direction: row; align-items: center;">
								<c:choose>
									<c:when test="${reviewBean.grade == 'level1' }">
										<img src="../img/level/profile_Lv1.png"
											style="width: 45px; height: 45px;" />
									</c:when>
									<c:when test="${reviewBean.grade == 'level2' }">
										<img src="../img/level/profile_Lv2.png"
											style="width: 45px; height: 45px;" />
									</c:when>
									<c:when test="${reviewBean.grade == 'level3' }">
										<img src="../img/level/profile_Lv3.png"
											style="width: 45px; height: 45px;" />
									</c:when>
								</c:choose>

								<div style="margin-left: 8px;">
									<div style="font-size: 20px;">${reviewBean.nickname}</div>
								</div>
							</div>

							<div>

								<div style="margin-bottom: 8px; margin-top: 14px;">
									<c:choose>
										<c:when test="${reviewBean.rating == 1 }">
											<span style="color: gold; font-size: 25px;">★</span>
											<span style="color: #ddd; font-size: 25px;">★★★★</span>
										</c:when>
										<c:when test="${reviewBean.rating == 2 }">
											<span style="color: gold; font-size: 25px;">★★</span>
											<span style="color: #ddd; font-size: 25px;">★★★</span>
										</c:when>
										<c:when test="${reviewBean.rating == 3 }">
											<span style="color: gold; font-size: 25px;">★★★</span>
											<span style="color: #ddd; font-size: 25px;">★★</span>
										</c:when>
										<c:when test="${reviewBean.rating == 4 }">
											<span style="color: gold; font-size: 25px;">★★★★</span>
											<span style="color: #ddd; font-size: 25px;">★</span>
										</c:when>
										<c:when test="${reviewBean.rating == 5 }">
											<span style="color: gold; font-size: 25px;">★★★★★</span>
											<span style="color: #ddd; font-size: 25px;"></span>
										</c:when>
									</c:choose>
								</div>
								
								<div id="review">
									<p class="short-text">${reviewBean.short_contents}</p>
									
									<c:choose>
										<c:when test="${reviewBean.short_contents == reviewBean.contents}">
											
										</c:when>
										<c:otherwise>
											<p class="full-text" style="display: none;">${reviewBean.contents}</p>
											<button class="toggle-button"
												style="background: transparent; border: none; float: right;">더보기</button>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>

					</c:forEach>

				</div>

				<div class="d-none d-md-block" style="margin-top: 30px;">
					<ul class="pagination justify-content-center">
						<c:choose>
							<c:when test="${pageBean.prevPage <= 0 }">
								<li class="page-item disabled">
									<!-- 1페이지에 있으면 이전 버튼 비활성화 --> <a href="#" class="page-link">이전</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a
									href="${root }/exhibition/exhibition_click?exhibition_id=${exhibitionBean.exhibition_id }&user_id=${loginUserBean.user_id}&page=${pageBean.prevPage}#exhibition_review"
									class="page-link">이전</a></li>
							</c:otherwise>
						</c:choose>

						<c:forEach var="idx" begin="${pageBean.min}" end="${pageBean.max}">
							<!-- model로 가져온 pageBean의 최소페이지부터 최대페이지까지 반복 : idx 는 현재페이지-->
							<c:choose>
								<c:when test="${idx == pageBean.currentPage }">
									<li class="page-item active"><a
										href="${root }/exhibition/exhibition_click?exhibition_id=${exhibitionBean.exhibition_id }&user_id=${loginUserBean.user_id}&page=${idx}#exhibition_review"
										class="page-link"> ${idx } </a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a
										href="${root }/exhibition/exhibition_click?exhibition_id=${exhibitionBean.exhibition_id }&user_id=${loginUserBean.user_id}&page=${idx}#exhibition_review"
										class="page-link"> ${idx } </a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>


						<c:choose>
							<c:when test="${pageBean.max >= pageBean.pageCnt  }">
								<!-- max페이지 > 전체페이지개수 일때  -->
								<li class="page-item disabled">
									<!-- 1페이지에 있으면 이전 버튼 비활성화 --> <a href="#" class="page-link">다음</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a
									href="${root }/exhibition/exhibition_click?exhibition_id=${exhibitionBean.exhibition_id }&user_id=${loginUserBean.user_id}&page=${pageBean.nextPage}#exhibition_review"
									class="page-link">다음</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>

				<div class="d-block d-md-none">
					<ul class="pagination justify-content-center">
						<li class="page-item"><a href="#" class="page-link">이전</a></li>
						<li class="page-item"><a href="#" class="page-link">다음</a></li>
					</ul>
				</div>
			</c:when>
			<c:otherwise>
				<div style="width: 800px; height: 300px; margin: auto;">
					<div class="test-center"
						style="margin: auto; display: flex; flex-direction: column; align-items: center;">
						<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80"
							fill="currentColor" class="bi bi-x-circle"
							style="margin-top: 80px;" viewBox="0 0 16 16">
							        <path
								d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16" />
							        <path
								d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708" />
							    </svg>
						<h3 style="margin-top: 50px;">등록된 후기가 없습니다</h3>
					</div>
				</div>

			</c:otherwise>
		</c:choose>

	</section>

	<script>	//리뷰 부분 더보기 버튼
		var toggleButtons = document.querySelectorAll(".toggle-button");

		toggleButtons.forEach(function(button) {
			button.addEventListener("click", function() {

				var fullText = this.parentNode.querySelector(".full-text");
				var shortText = this.parentNode.querySelector(".short-text");

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
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.569422, 126.986022), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('${exhibitionBean.address}', function(result, status) {
		
			var art_title = '${exhibitionBean.title}';
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">' + art_title + '</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
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



	<!-- 데이트 피커 -->
	<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script>
	document.addEventListener('DOMContentLoaded', function() {
		var today = new Date();
		today.setDate(today.getDate() + 1); 
		var offset = today.getTimezoneOffset() * 60000; // 로컬 시간대 오프셋
		var localToday = new Date(today.getTime() - offset);
		var formattedToday = localToday.toISOString().substring(0, 10); 

		var exhibitionEndDate = new Date('${exhibitionBean.exhibition_end.substring(0, 10)}');

		$('#datepicker11').datepicker({
			inline: true,
			minDate: today, 
			maxDate: exhibitionEndDate, 
			dateFormat: 'yy-mm-dd',
			startDate: formattedToday,
			onSelect: function(dateText) {
				$('#hiddenDateField').val(dateText);
			}
		}).datepicker('setDate', formattedToday); // 초기 날짜 설정

		$('#hiddenDateField').val(formattedToday);
	});
</script>

	
	<script>
    function bookmarkAlert() {
        Swal.fire({
            title: '북마크 추가',
            text: "북마크에 추가하시겠습니까?",
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '네',
            cancelButtonText: '아니요'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = '${root}/exhibition/bookmark?exhibition_id=${exhibitionBean.exhibition_id}&user_id=${loginUserBean.user_id}';
            }
        });
    }

    function removeBookmarkAlert() {
        Swal.fire({
            title: '북마크 제거',
            text: "북마크에서 제거하시겠습니까?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '네',
            cancelButtonText: '아니요'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = '${root}/exhibition/bookmark?exhibition_id=${exhibitionBean.exhibition_id}&user_id=${loginUserBean.user_id}';
            }
        });
    }

    function notLoggedInAlert() {
        Swal.fire({
            title: '로그인 필요',
            text: "북마크를 추가하려면 로그인이 필요합니다.",
            icon: 'info',
            confirmButtonColor: '#3085d6',
            confirmButtonText: '확인'
        }).then(() => {
            window.location.href = '${root}/user/login';
        });
    }
</script>

<!--  장바구니 추가 관련  -->
	
	<c:if test="${not empty cartMessage}">
        <script>
        Swal.fire({
            //title: "Are you sure?",
            text: "${cartMessage}",
            icon: "${icon}",
            showCancelButton: true,
            confirmButtonColor: "#4F6F52",
            cancelButtonColor: "gray",
            confirmButtonText: "장바구니 보기",
            cancelButtonText: '닫기'
        }).then((result) => {
            if (result.isConfirmed) {
                // confirmButtonText를 눌렀을 때, 지정된 URL로 이동
                window.location.href = "${root}/user/cart_list";
            }
            // cancelButtonText를 눌렀을 때, 대화 상자가 자동으로 닫힘 (아무 작업도 필요 없음)
        });

    </script>
    </c:if>
    
	<!-- 결제 실패 -->
    <c:if test="${not empty failmsg}">
        <script>
        Swal.fire({
            title: "결제 실패",
            html: "${failmsg} <br><br> 예매를 다시 진행해주세요.",
            icon: "error",
            confirmButtonColor: "#4F6F52",
            confirmButtonText: "확인"
        });

    </script>
    </c:if>
	


</body>

</html>