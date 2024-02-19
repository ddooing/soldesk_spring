<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.ParseException"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:set var="root" value="${pageContext.request.contextPath }"/>    
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


	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>


</head>

<body id="page-top">
	<!-- 메뉴바 -->
	<c:import url="/WEB-INF/views/include/header.jsp"/>

	<section style="margin-top: 150px;">
		<div class="container mb-1">
			<h1 style="margin-left: 180px;">예매 정보</h1>
			<div style="color: gray; margin-left: 180px; margin-top: 20px;">
			    ${tempReserveBean.requested_at}
			</div>

			<hr style="margin:auto; margin-top: 10px; width: 1000px;" />
			<!--전시회 정보 부분-->
			
			<div style="display: flex; align-items: center; flex-direction: row;">
				<img src="${exhibitionBean.main_poster_path}${exhibitionBean.main_poster_name} " alt="예약포스터"
					style="width: 200px; height: 280px; margin-left: 300px; margin-top: 40px;" />

				<div style="margin-left: 200px;">
					<h3>${exhibitionBean.title}</h3>

					<div style="display: flex; margin-top: 40px;">
						<div style="margin-right: 10px; width: 200px;">
							<a style="font-size: 20px;">예약 날짜</a>
						</div>
						<div style="margin-left: auto;">
							<a style="font-size: 20px; ">${formattedReserve_date} </a>
						</div>
					</div>
					

					<div style="display: flex; margin-top: 10px;">
						<div style="margin-right: 10px;  width: 200px;">
							<a style="font-size: 20px;">티켓 수량</a>
						</div>
						<div style="margin-left: auto;">
							<a style="font-size: 20px;">${tempReserveBean.ticket_count} 매</a>
						</div>
					</div>
					<div style="display: flex; margin-top: 10px;">
						<div style="margin-right: 10px;  width: 200px;">
							<a style="font-size: 20px;">총 티켓 금액</a>
						</div>
						<div style="margin-left: auto;">
							<a style="font-size: 20px;">${tempReserveBean.total_price} 원</a>
						</div>
					</div>
					<div style="display: flex; margin-top: 10px;">
						<div style="margin-right: 10px;  width: 200px;">
							<a style="font-size: 20px;">포인트 결제 금액</a>
						</div>
						<div style="margin-left: auto;">
							<a style="font-size: 20px;">${tempReserveBean.point_deduction} p</a>
						</div>
					</div>

					
				</div>
			</div>

			<hr style="margin:auto; margin-top: 50px; width: 1000px;" />
			<div style="display: flex; align-items: baseline; margin-top: 50px; margin-left: 800px;">
				<h3>총 결제 금액 : </h3>
				<a style="font-size: 30px; margin-left: 10px;">${tempReserveBean.payment} 원</a>
			</div>
			
			
			<!--포인트 혜택 부분-->
			<hr style="margin: auto; margin-top: 50px; width: 1000px;" />
			<div style="display: flex; align-items: baseline;">
				<h3 style="margin-left: 180px; margin-top: 50px;">포인트 혜택</h3>
				
			</div>
			
			<div style="margin-top: 50px; margin-left: 300px; display: flex;">
				<a style="font-size: 20px; color: gray; margin-right: 5px;">예매 적립  
				
					<a style="font-size: 20px; color: gray;" id="ownpoint">${tempReserveBean.point_plus} p</a>
				</a>
			</div>
			
			<!--포인트 혜택 부분-->
			<hr style="margin: auto; margin-top: 50px; width: 1000px;" />
			<div style="display: flex; align-items: baseline;">
				<h3 style="margin-left: 180px; margin-top: 50px;">경험치 혜택</h3>
				
			</div>
			
			<div style="margin-top: 50px; margin-left: 300px; display: flex;">
				<a style="font-size: 20px; color: gray; margin-right: 5px;">예매 적립  
				
					<a style="font-size: 20px; color: gray;" id="ownpoint"> 50 exp</a>
				</a>
			</div>
            
            
			<div class="text-center" style="margin-top: 50px;">
				<button onclick="window.location.href = '${root}/view/index'" class="btn btn-dark"
					style="margin-right: 20px; width:150px; height: 50px;">메인페이지</button>
				<button onclick="window.location.href = '${root}/mypage/reservelist?user_id=${tempReserveBean.user_id }'" class="btn btn-dark" style="width: 150px; height: 50px;">예매 내역 확인</button>
			</div>
			
			<!-- 회원 등급 클릭 모달 다듬어야함 -->
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
			
		</div>
	</section>

	<!-- 푸터-->
	<c:import url="/WEB-INF/views/include/footer.jsp"/>
	
    <script>
      Swal.fire({
          title: "예매 완료",
          text: "예매가 성공적으로 되었습니다",
          icon: "success",
          showConfirmButton: false,
          timer: 2000
      });

  	</script>
    
</body>

</html>