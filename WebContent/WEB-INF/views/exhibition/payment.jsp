<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

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
input[type="number"]::-webkit-inner-spin-button, input[type="number"]::-webkit-outer-spin-button
	{
	-webkit-appearance: none;
	appearance: none;
	margin: 0;
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
							<a style="font-size: 20px;">${tempReserveBean.reserve_date }</a>
						</div>
					</div>



					<div style="display: flex; margin-top: 10px;">
						<div style="margin-right: 10px; width: 200px;">
							<a style="font-size: 20px;">티켓 수량</a>
						</div>
						<div style="margin-left: auto;">
							<a style="font-size: 20px;">${tempReserveBean.ticket_count} 매</a>
						</div>
					</div>

					<div style="display: flex; margin-top: 10px;">
						<div style="margin-right: 10px; width: 200px;">
							<a style="font-size: 20px;">결제 금액</a>
						</div>
						<div style="margin-left: auto;">
							<a style="font-size: 20px;">${exhibitionBean.price * tempReserveBean.ticket_count}
								원</a>
						</div>
					</div>
				</div>
			</div>
			<hr style="margin: auto; margin-top: 50px; width: 1000px;" />
			<form:form action="${root }/toss/checkout_pro" method="post"
				modelAttribute="tempReserveBean">
				<form:hidden path="reserve_date" value="${tempReserveBean.reserve_date }"/>
				<form:hidden path="ticket_count" value="${tempReserveBean.ticket_count }"/>
				<form:hidden path="user_id" value="${LoginAllInfoBean.user_id }" />
				<form:hidden path="payment" id="payment-field" /> <!--  최종 결제 금액  -->
				<form:hidden path="total_price" value="${tempReserveBean.total_price}"/>
				<form:hidden path="exhibition_id" value="${exhibitionBean.exhibition_id }" />
				<form:hidden path="point_plus" value="${tempReserveBean.point_plus}" />
				
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
				
			</div>
			
			<div style="margin-top: 50px; margin-left: 300px; display: flex;">
				<a style="font-size: 20px; color: gray; margin-right: 5px;">보유 포인트 :  
					<a style="font-size: 20px; color: gray;" id="ownpoint">${LoginAllInfoBean.point } p</a>
				</a>
			</div>
			<div style="margin-top: 50px; margin-left: 300px; display: flex;align-items: center;">
               <a style="font-size: 20px;">포인트</a>
               <form:input type="number" path="point_deduction" style="width: 150px; margin-left: 30px;" id="pointinput" />
             <button type="button" class="btn btn-dark" style="margin-left:30px;" id="allpointuse" onclick="useAllPoints()">전액사용</button>
            </div>
            
            <script>
            function updatePoints() {
                var totalPrice = ${exhibitionBean.price * tempReserveBean.ticket_count}; // 전체 가격
                var maxPoints = Math.min(Math.floor(${LoginAllInfoBean.point} / 10) * 10, totalPrice); // 최대 포인트 계산
                var inputPoints = parseInt(document.getElementById('pointinput').value) || 0; // 입력값이 없는 경우 0으로 처리
                var adjustedPoints = inputPoints;

                if (inputPoints > maxPoints) {
                    adjustedPoints = maxPoints;
                } else {
                    var minUnit = 10;
                    adjustedPoints = Math.max(0, Math.floor(inputPoints / minUnit) * minUnit); // 10원 단위로 조정하고 음수 방지
                }

                // 업데이트된 포인트 값이 입력 필드에 설정됨
                document.getElementById('pointinput').value = adjustedPoints;
                document.getElementById('view_point_use').innerHTML = adjustedPoints + " p";
                document.getElementById('view_total_price').innerHTML = totalPrice - adjustedPoints + " 원";
                document.getElementById('ownpoint').innerHTML = ${LoginAllInfoBean.point} - adjustedPoints + " p";
            }

            document.getElementById('pointinput').addEventListener('input', updatePoints);
            
            

            function useAllPoints() {
                var totalPrice = ${exhibitionBean.price * tempReserveBean.ticket_count}; // 전체 가격
                var maxPoints = Math.min(Math.floor(${LoginAllInfoBean.point} / 10) * 10, totalPrice); // 최대 포인트 계산
                document.getElementById('pointinput').value = maxPoints;
                document.getElementById('view_point_use').innerHTML = maxPoints + " p";
                document.getElementById('view_total_price').innerHTML = totalPrice - maxPoints + " 원";
                document.getElementById('ownpoint').innerHTML = ${LoginAllInfoBean.point} - maxPoints +" p";
            }

         </script>

		<!--  결제하기 버튼 클릭 시,최종  view_total_price ( 결제 금액) 을 
		 -->
		
			<div style="margin-top: 50px; margin-left: 300px;">
				<a style="font-size: 20px;">포인트 혜택</a>
				<div
					style="margin-left: 50px; margin-top: 30px; display: flex; width: 300px; text-align: center;">
					<a style="font-size: 20px; margin-right: 10px;">예매 적립</a>
					
					<a style="font-size: 20px; margin-left: auto;">${tempReserveBean.point_plus} p</a>
				</div>

			</div>
			<!--결제 부분-->
			<hr style="margin: auto; margin-top: 50px; width: 1000px;" />
			<div
				style="display: flex; align-items: baseline; margin-top: 50px; margin-left: 800px;">
				<h5>포인트 사용 :</h5>
				<a style="font-size: 20px; margin-left: 10px;" id="view_point_use">${tempReserveBean.point_deduction} P</a>	
			</div>
			
			<div
				style="display: flex; align-items: baseline; margin-top: 10px; margin-left: 800px;">
				<h3>총 결제 금액 :</h3>
				<a style="font-size: 30px; margin-left: 10px;" id="view_total_price">${exhibitionBean.price * tempReserveBean.ticket_count} 원</a>
			</div>

			<div
				style="display: flex; align-items: baseline; margin-top: 80px; margin-left: 850px;">
				<a href="${root }/exhibition/exhibition_click?exhibition_id=${exhibitionBean.exhibition_id}" class="btn btn-dark" style="margin-left: 30px; width: 100px;">취소</a>
				<button id="payment-button" class="btn btn-dark" style="margin-left: 30px; width: 100px; ">결제하기</button>
			</div>
			</form:form> 
			
			
			<script>
			//최종 설정된 1.포인트 사용 금액 2. 결제할 금액
			document.getElementById('payment-button').addEventListener('click', function() {
				
			    var totalPriceElement = document.getElementById('view_total_price').innerHTML;
			    var priceWithoutCurrency = totalPriceElement.replace('원', '').trim();
			    var numericPrice = parseInt(priceWithoutCurrency, 10); // 문자열을 정수로 변환

			    
			    
			    // 숨겨진 폼 필드의 값을 설정합니다.
			    document.getElementById('payment-field').value = priceWithoutCurrency;
			
			    // 폼 객체를 가져와서 제출합니다. id를 사용하여 폼을 찾습니다.
			    var form = document.getElementById('payment-form');
			    
			    
			  
			    
			    //form.submit();
			});
			</script>
		</div>
	</section>

	<footer class="py-4 navbar-custom" style="margin-top: 200px; background-color: navbar-color;">
    <div class="container px-5">
        <div class="row">
            <div class="col-lg-3">
                <img src="../img/ARTMEE.png" alt="Artmee Logo"
                    style="max-width: 80%; height: auto; margin-bottom: 5px;">
            </div>
            <div class="col-lg-6">
                <p class="text-white small" style="margin-top: 5px;">
                    아트미 <br>
                    전화번호: 123-456-7890<br>
                    주소: 서울시 종로구 종로12길 15, 8층 801호<br>
                    이메일: info@artmee.com<br>
                    Copyright &copy; 2023 개발해드림 ALL RIGHTS RESERVED
                </p>
            </div>
        </div>
    </div>
</footer>

</body>

</html>