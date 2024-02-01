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
input[type="radio"] {
	display: none;
	/* 라디오 버튼 숨기기 */
}

input[type="radio"]+label {
	display: inline-block;
	padding: 10px 20px;
	border: 2px solid #000;
	border-radius: 15px;
	cursor: pointer;
	transition: background-color 0.3s, color 0.3s;
}

input[type="radio"]:checked+label {
	border-color: #000;
	background-color: #000;
	color: #fff;
}

.modal {
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
	padding-top: 60px;
}

.modal-content {
	background-color: #fefefe;
	margin: 5% auto;
	padding: 30px;
	border: 1px solid #888;
	width: 700px;
}

.close {
	color: #aaaaaa;
	float: right !important;
	font-size: 28px;
	font-weight: bold;
	width: 25px;
	margin-left: 625px;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}
</style>

</head>

<body id="page-top">
	<!-- 메뉴바 -->
	<c:import url="/WEB-INF/views/include/header.jsp" />

	<section style="margin-top: 150px;">
		<div class="container mb-1">
			<h1 style="margin-left: 180px;">예매</h1>
			<hr style="margin: auto; margin-top: 50px; width: 1000px;" />
			<!--전시회 정보 부분-->
			<div>
				<h3 style="margin-left: 180px; margin-top: 50px;">전시회 정보</h3>
			</div>
			<div style="display: flex; align-items: center; flex-direction: row;">
				<img src="${exhibitionBean.main_poster_path }${exhibitionBean.main_poster_name }" alt="예약포스터"
					style="width: 200px; height: 280px; margin-left: 300px; margin-top: 40px;" />

				<div style="margin-left: 200px;">
					<h3>${exhibitionBean.title }</h3>

					<div style="display: flex; margin-top: 40px;">
						<div style="margin-right: 10px; width: 200px;">
							<a style="font-size: 20px;">예약 날짜</a>
						</div>
						<div style="margin-left: auto;">
							<a style="font-size: 20px;">${ReserveBean.reserve_date }</a>
						</div>
					</div>



					<div style="display: flex; margin-top: 10px;">
						<div style="margin-right: 10px; width: 200px;">
							<a style="font-size: 20px;">티켓 수량</a>
						</div>
						<div style="margin-left: auto;">
							<a style="font-size: 20px;">${ReserveBean.ticket_count} 매</a>
						</div>
					</div>

					<div style="display: flex; margin-top: 10px;">
						<div style="margin-right: 10px; width: 200px;">
							<a style="font-size: 20px;">결제 금액</a>
						</div>
						<div style="margin-left: auto;">
							<a style="font-size: 20px;">${exhibitionBean.price * ReserveBean.ticket_count}
								원</a>
						</div>
					</div>
				</div>
			</div>
			<hr style="margin: auto; margin-top: 50px; width: 1000px;" />
			<form:form action="${root }/toss/checkout_pro" method="post"
				modelAttribute="ReserveBean">
				<form:hidden path="reserve_date" value="${ReserveBean.reserve_date }"/>
				<form:hidden path="ticket_count" value="${ReserveBean.ticket_count }"/>
				<form:hidden path="user_id" value="${LoginAllInfoBean.user_id }" />
				<form:hidden path="total_price"
					value="${exhibitionBean.price * ReserveBean.ticket_count}" />
				<form:hidden path="exhibition_id"
					value="${exhibitionBean.exhibition_id }" />
				<form:hidden path="state" value="1" />
				<!-- 예약상태 -->

				<!--주문자 정보 부분-->
				<div>
					<h3 style="margin-left: 180px; margin-top: 50px;">주문자 정보</h3>
				</div>
				<div class="ml-2" style="margin-top: 50px; margin-left: 300px;">
					<div style="display: flex; margin-top: 30px;">
						<div style="margin-right: 10px; width: 100px;">
							<a style="font-size: 20px;">주문자</a>
						</div>
						<div>
							<form:input readonly="true" value="${LoginAllInfoBean.name }"
								path="" style="width: 300px;" disabled="true" />
						</div>
					</div>

					<div style="display: flex; margin-top: 30px;">
						<div style="margin-right: 10px; width: 100px;">
							<a style="font-size: 20px;">휴대폰</a>
						</div>
						<div>
							<form:input readonly="true" value="${LoginAllInfoBean.telephone }"
								path="" style="width: 300px;" disabled="true" />
						</div>
					</div>

					<div style="display: flex; margin-top: 30px;">
						<div style="margin-right: 10px; width: 100px;">
							<a style="font-size: 20px;">이메일</a>
						</div>
						<div>
							<form:input readonly="true" value="${LoginAllInfoBean.email }"
								path="" style="width: 300px;" disabled="true" />
						</div>
					</div>
				</div>
			
			<!--포인트 사용부분-->
			<hr style="margin: auto; margin-top: 50px; width: 1000px;" />
			<div style="display: flex; align-items: baseline;">
				<h3 style="margin-left: 180px; margin-top: 50px;">포인트 사용</h3>
				<a style="font-size: 20px; margin-left: 100px; color: gray; margin-right: 5px;">보유 포인트 : </a> <a style="font-size: 20px; color: gray;">${LoginAllInfoBean.point } p</a>
			</div>

			<%--<div style="margin-top: 50px; margin-left: 300px; display: flex; align-items: center;">
				<a style="font-size: 20px; margin-right:30px;">포인트</a>
				
				     <form:form action="${root}/exhibition/point_use" method="post" >
					    
					    <form:input path="use_point"/>
					    <form:errors path="use_point">${impossible}</form:errors>
						
						<form:hidden path="exhibition_idx" value="${exhibitionBean.exhibition_idx }"/>
					    <form:hidden path="current_point" value="${LoginAllInfoBean.point}"/>
						
					    <button type="submit" class="btn btn-dark" style="margin-left: 30px;">사용</button>
					    <button type="submit" class="btn btn-dark" style="margin-left: 30px;">전액사용</button>
					</form:form> 
			</div>--%>
			
			<div style="margin-top: 50px; margin-left: 300px; display: flex;">
	            <a style="font-size: 20px;">포인트</a>
	            <form:input path="point_deduction" style="width: 150px; margin-left: 30px;" />
	            <button class="btn btn-dark" style="margin-left: 30px;">사용</button>
	            <button class="btn btn-dark" style="margin-left: 30px;">전액사용</button>
         	</div>

			<div style="margin-top: 50px; margin-left: 300px;">
				<a style="font-size: 20px;">포인트 혜택</a>
				<div
					style="margin-left: 50px; margin-top: 30px; display: flex; width: 300px; text-align: center;">
					<a style="font-size: 20px; margin-right: 10px;">회원등급 적립</a>
					<!--회원등급 모달-->
					<svg xmlns="http://www.w3.org/2000/svg" id="membermodal"
						style="color: black; cursor: pointer;" width="20" height="20"
						fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
						<path
							d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16" />
						<path
							d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0" />
					</svg>
					<a style="font-size: 20px; margin-left: auto;">ex) 300</a>
				</div>
				<div
					style="margin-left: 50px; margin-top: 20px; display: flex; width: 300px; text-align: center;">
					<a style="font-size: 20px; margin-right: 10px;">소감문 적립</a> <a
						style="font-size: 20px; margin-left: auto;">ex) 50</a>
				</div>
			</div>

			<!-- 회원 등급 클릭 모달 -->
			<div id="memberModal" class="modal" style="display: none;">
				<div class="modal-content">
					<div class="close" style="float: right;">&times;</div>
					<h2 style="margin-left: 30px;">회원등급 혜택 안내</h2>
					<div
						style="display: flex; justify-content: center; margin-left: 50px; margin-right: 50px; margin-top: 50px;">
						<div
							style="display: inline-block; text-align: center; width: 200px; border-right: 1px solid black;">
							<h5>LV.1</h5>

							<img src="../img/level/profile_Lv1.png"
								style="width: 85px; height: 85px; border-radius: 4em; box-shadow: 5px 5px rgb(0, 0, 0, 0.1);" />
							<br /> <br /> <br /> <b style="margin-top: 10px;">구매금액의 1%
								적립</b><br /> <b style="margin-top: 10px;">exp 0 ~ 299</b>

						</div>
						<div
							style="display: inline-block; text-align: center; width: 200px; border-right: 1px solid black;">
							<h5>LV.2</h5>

							<img src="../img/profileImg.png"
								style="width: 85px; height: 85px; border-radius: 4em; box-shadow: 5px 5px rgb(0, 0, 0, 0.1); margin: auto;" />
							<br /> <br /> <br /> <b style="margin-top: 10px;">구매금액의 3%
								적립</b><br /> <b style="margin-top: 10px;">exp 300 ~ 899</b>

						</div>
						<div
							style="display: inline-block; text-align: center; width: 200px;">
							<h5>LV.3</h5>

							<img src="../img/level/profile_Lv3.png"
								style="width: 85px; height: 85px; border-radius: 4em; box-shadow: 5px 5px rgb(0, 0, 0, 0.1); margin: auto;" />
							<br /> <br /> <br /> <b style="margin-top: 10px;">구매금액의 5%
								적립</b><br /> <b style="margin-top: 10px;">exp 900 ~</b>

						</div>
					</div>

					<hr
						style="width: 550px; margin-left: auto; margin-right: auto; border-color: black; border-width: 2px 0 0 0; margin-top: 50px;" />


					<div style="margin-top: 50px;">
						<h3 style="margin-left: 30px;">경험치 획득방법</h3>
						<br /> <b style="margin-top: 80px; margin-left: 50px;">전시회 예매
							+ 50 exp</b> <br /> <br /> <b
							style="margin-top: 50px; margin-left: 50px;">소감문 작성시 최대 + 10
							exp</b> <br /> <br /> <b
							style="margin-top: 50px; margin-left: 50px;">소감문 공개 허용시 추가 5
							exp</b> <br /> <br />

					</div>

					<hr
						style="width: 550px; margin-left: auto; margin-right: auto; border-color: black; border-width: 2px 0 0 0; margin-top: 30px;" />


					<div style="margin-top: 50px;">
						<h3 style="margin-left: 30px;">적립 포인트 정책 안내</h3>
						<br /> <b style="margin-left: 50px;">기간 내에 구매금액에 구매 확정 시점에 적립
							포인트가 지급됩니다. </b> <br /> <br /> <b style="margin-left: 50px;">포인트
							적립 내역이나 이용내역은 MyPage에서 확인할 수 있습니다.</b> <br /> <br /> <b
							style="margin-left: 50px;">무료 전시회 관련 소감문 작성 시 ??의 포인트만 적립
							가능합니다.</b> <br /> <br /> <b style="margin-left: 50px;">최초 적립했던
							경로를 벗어나 새로운 경로(기기변경, 인터넷 창 변경 등)로</b><br /> <b
							style="margin-left: 50px;">동일상품 구매시 포인트 적립이 되지 않을 수 있습니다.</b> <br />
						<br />
					</div>
				</div>
			</div>


			<script>
				// 회원 등급 클릭 자바 스크립트
				// 모달을 가져옵니다
				var modal = document.getElementById("memberModal");

				// 모달을 여는 버튼을 가져옵니다
				var btn = document.getElementById("membermodal");

				// 모달을 닫는 <span> 요소를 가져옵니다
				var span = document.getElementsByClassName("close")[0];

				// 사용자가 버튼을 클릭하면 모달을 엽니다
				btn.onclick = function() {
					modal.style.display = "block";
				}

				// 사용자가 <span> (x)을 클릭하면 모달을 닫습니다
				span.onclick = function() {
					modal.style.display = "none";
				}

				// 사용자가 모달 외부의 어디를 클릭하면 모달을 닫습니다
				window.onclick = function(event) {
					if (event.target == modal) {
						modal.style.display = "none";
					}
				}
			</script>

			
					

			<!--결제 부분-->
			<hr style="margin: auto; margin-top: 50px; width: 1000px;" />
			<div>
				<h3 style="margin-left: 180px; margin-top: 50px;">결제 방법</h3>
			</div>
			<div
				style="display: flex; align-items: center; margin-top: 50px; margin-left: 300px;">
				<div>
					<input type="radio" id="cardPayment" name="paymentMethod"
						value="card" hidden> <label for="cardPayment">카드
						결제</label>
				</div>

				<div style="margin-left: 30px;">
					<input type="radio" id="kakaoPayment" name="paymentMethod"
						value="kakao" hidden> <label for="kakaoPayment">카카오페이</label>
				</div>
			</div>

			<div
				style="display: flex; align-items: baseline; margin-top: 50px; margin-left: 800px;">
				<h5>포인트 사용 :</h5>
				<a style="font-size: 20px; margin-left: 10px;">${ReserveBean.point_deduction} P</a>	
			</div>
			
			<div
				style="display: flex; align-items: baseline; margin-top: 10px; margin-left: 800px;">
				<h3>총 결제 금액 :</h3>
				<a style="font-size: 30px; margin-left: 10px;">${exhibitionBean.price * ReserveBean.ticket_count} 원</a>
			</div>

			<div
				style="display: flex; align-items: baseline; margin-top: 80px; margin-left: 850px;">
				<a href="${root }/exhibition/exhibition_click?exhibition_id=${exhibitioBean.exhibition_id}" class="btn btn-dark" style="margin-left: 30px; width: 100px; height: 50px;">돌아가기</a>
				<!-- <button onclick="validatePaymentMethod()" class="btn btn-dark"
					style="margin-left: 30px; width: 100px; height: 50px;">결제하기</button> -->
				<form:button id="payment-button" class="payment-button" style="margin-left: 30px; width: 100px; height: 50px;">결제하기</form:button>
			</div>
			</form:form> 
		</div>
	</section>

	<!-- 푸터-->
	<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>

</html>