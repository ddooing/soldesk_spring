<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="root" value="${pageContext.request.contextPath }" />
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

		.close-btn {
			background: none;
			border: none;
			color: #333;
			font-size: 20px;
			cursor: pointer;
			padding: 5px;
			margin-right: 180px;
		}
	</style>

</head>

<body id="page-top">
	<!-- 메뉴바 -->
	<c:import url="/WEB-INF/views/include/header.jsp"/>



	<section style="margin-top: 150px;">
		<div class="container mb-1">
			<h1 style="margin-left: 180px;">장바구니</h1>
			<hr style="margin:auto; margin-top: 50px; width: 1000px;" />
			<!--전시회1 부분-->
			<div style="display: flex; justify-content: space-between;">
				<h3 style="margin-left: 180px; margin-top: 50px;">전시회 1</h3>
				<button class="close-btn">X</button>
			</div>
			<div style="display: flex; align-items: center; flex-direction: row;">
				<img src="../img/poster1.png" alt="예약포스터"
					style="width: 200px; height: 280px; margin-left: 300px; margin-top: 40px;" />

				<div style="margin-left: 200px;">
					<h3>ex)한국의 기하학적 추상미술</h3>

					<div style="display: flex; margin-top: 40px;">
						<div style="margin-right: 10px; width: 200px;">
							<a style="font-size: 20px;">예약 날짜</a>
						</div>
						<div style="margin-left: auto;">
							<a style="font-size: 20px; ">ex)2023.12.23</a>
						</div>
					</div>

					<div style="display: flex; margin-top: 10px;">
						<div style="margin-right: 10px;  width: 200px;">
							<a style="font-size: 20px;">관람 시간</a>
						</div>
						<div style="margin-left: auto;">
							<a style="font-size: 20px;">ex)10:00 ~ 19:20</a>
						</div>
					</div>

					<div style="display: flex; margin-top: 10px;">
						<div style="margin-right: 10px;  width: 200px;">
							<a style="font-size: 20px;">티켓 수량</a style="font-size: 20px;">
						</div>
						<div style="margin-left: auto;">
							<div class="counter">
								<button class="decrement" style="border: none; background-color: transparent; width: 25px;"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-dash-lg" viewBox="0 0 16 16">
										<path fill-rule="evenodd"
											d="M2 8a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11A.5.5 0 0 1 2 8" />
									</svg></button>
								<span class="counterValue" style="width: 10px;">1</span>
								<button class="increment" style="border: none; background-color: transparent; width: 25px;"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
										<path fill-rule="evenodd"
											d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2" />
									</svg></button>
							</div>
						</div>
					</div>

					<div style="display: flex; margin-top: 10px;">
						<div style="margin-right: 10px;  width: 200px;">
							<a style="font-size: 20px;">티켓 가격</a>
						</div>
						<div style="margin-left: auto;">
							<a style="font-size: 20px;">ex)20,000원</a>
						</div>
					</div>
				</div>
			</div>


			<hr style="margin:auto; margin-top: 50px; width: 1000px;" />
			<!--전시회2 부분-->
			<div style="display: flex; justify-content: space-between;">
				<h3 style="margin-left: 180px; margin-top: 50px;">전시회 2</h3>
				<button class="close-btn" onclick="closeExhibition(this)">X</button>
			</div>
			<div style="display: flex; align-items: center; flex-direction: row;">
				<img src="../img/poster1.png" alt="예약포스터"
					style="width: 200px; height: 280px; margin-left: 300px; margin-top: 40px;" />

				<div style="margin-left: 200px;">
					<h3>ex)한국의 기하학적 추상미술</h3>

					<div style="display: flex; margin-top: 40px;">
						<div style="margin-right: 10px; width: 200px;">
							<a style="font-size: 20px;">예약 날짜</a>
						</div>
						<div style="margin-left: auto;">
							<a style="font-size: 20px; ">ex)2023.12.23</a>
						</div>
					</div>

					<div style="display: flex; margin-top: 10px;">
						<div style="margin-right: 10px;  width: 200px;">
							<a style="font-size: 20px;">관람 시간</a>
						</div>
						<div style="margin-left: auto;">
							<a style="font-size: 20px;">ex)10:00 ~ 19:20</a>
						</div>
					</div>

					<div style="display: flex; margin-top: 10px;">
						<div style="margin-right: 10px;  width: 200px;">
							<a style="font-size: 20px;">티켓 수량</a style="font-size: 20px;">
						</div>
						<div style="margin-left: auto;">
							<div class="counter">
								<button class="decrement" style="border: none; background-color: transparent; width: 25px;"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-dash-lg" viewBox="0 0 16 16">
										<path fill-rule="evenodd"
											d="M2 8a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11A.5.5 0 0 1 2 8" />
									</svg></button>
								<span class="counterValue" style="width: 10px;">1</span>
								<button class="increment" style="border: none; background-color: transparent; width: 25px;"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
										<path fill-rule="evenodd"
											d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2" />
									</svg></button>
							</div>
						</div>
					</div>

					<div style="display: flex; margin-top: 10px;">
						<div style="margin-right: 10px;  width: 200px;">
							<a style="font-size: 20px;">티켓 가격</a>
						</div>
						<div style="margin-left: auto;">
							<a style="font-size: 20px;">ex)20,000원</a>
						</div>
					</div>
				</div>
			</div>

			<hr style="margin:auto; margin-top: 50px; width: 1000px;" />

			<div class="text-center" style="margin-top: 50px;">
				<button class="btn btn-dark" onclick="window.location.href = '${root}/exhibition/payment'"
					style=" width: 150px; height: 50px;">결제하기</button>
			</div>

		</div>
	</section>


	<script>
		// 카운터 클래스 정의
		class Counter {
			constructor(counterElement) {
				this.value = 1;
				this.counterElement = counterElement;
				this.updateDisplay();
			}

			increment() {
				this.value++;
				this.updateDisplay();
			}

			decrement() {
				if (this.value > 1) {
					this.value--;
					this.updateDisplay();
				} else {
					alert("최소 수량은 1입니다!");
				}
			}

			updateDisplay() {
				this.counterElement.querySelector(".counterValue").textContent = this.value;
			}
		}

		// 모든 카운터를 초기화하고 이벤트 리스너를 추가하는 함수
		function setupCounters() {
			// 카운터 컨테이너 요소를 모두 찾음
			const counterContainers = document.querySelectorAll('.counter');

			counterContainers.forEach(container => {
				// 새 카운터 객체를 생성하고, 각 버튼에 이벤트 리스너를 부여
				const counter = new Counter(container);

				container.querySelector(".increment").addEventListener('click', () => counter.increment());
				container.querySelector(".decrement").addEventListener('click', () => counter.decrement());
			});
		}

		// 문서가 준비되면 카운터 설정
		document.addEventListener('DOMContentLoaded', setupCounters);

	</script>




	<!-- 푸터-->
	<c:import url="/WEB-INF/views/include/footer.jsp"/>



</body>

</html>