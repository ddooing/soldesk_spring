<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>ARTMEE</title>

	<link rel="icon" type="image/x-icon" href="../img/ARTMEE_PAGELOGO.png" />

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
	<script src="../js/scripts.js"></script>

	<!-- JQuery 자바스크립트-->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>


	<!-- CSS -->
	<link href="../css/styles.css" rel="stylesheet" />

	<!-- Carousel 자바스크립트-->
	<script src='https://www.gmarwaha.com/script/lib/jquery-1.11.1.js'></script>
	<script src="https://www.gmarwaha.com/script/lib/jquery.easing-1.3.js"></script>
	<script src="https://www.gmarwaha.com/script/lib/jquery.easing.compatibility.js"></script>
	<script src="https://www.gmarwaha.com/script/lib/jquery.mousewheel-3.1.12.js"></script>
	<script src="https://www.gmarwaha.com/jquery/jcarousellite/script/jquery.jcarousellite.js"></script>


	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
	<style>
		button {
			border: none;
			background: transparent;
		}

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


		#right-side-menu {
			position: absolute;
			top: 500px;
			right: 10px;
			width: 150px;
			transition: top 0.3s;

		}

		#sidebar_menu:hover {
			cursor: pointer;
			background-color: rgb(192, 192, 192);
		}
	</style>

</head>

<body id="page-top">
	<!-- 메뉴바 -->

	 <c:import url="/WEB-INF/views/include/header.jsp"/> 

<a href="${root }/admin/manager_QnAlist">관리자 qna list</a>	<br />
<a href="${root }/admin/manager_exhibitionmodify">관리자 전시회 수정</a>



	<!-- 상단 케러셀-->
	<header class="masthead">
		<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
					aria-current="true" aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
					aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
					aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<a href='${root }/exhibition/exhibition_click'>
						<img src="../img/carousel1.jpg" class="d-block w-80 mx-auto img-fluid"
							style="max-height: 400px;" alt="img1">
					</a>
				</div>
				<div class="carousel-item">
					<a href="#2">
						<img src="../img/carousel2.jpg" class="d-block w-80 mx-auto img-fluid"
							style="max-height: 400px;" alt="img2">
					</a>
				</div>
				<div class="carousel-item">
					<a href="#3">
						<img src="../img/carousel3.jpg" class="d-block w-80 mx-auto img-fluid"
							style="max-height: 400px;" alt="img3">
					</a>
				</div>
			</div>
		</div>
	</header>

	<div id="right-side-menu">
		<div style="display: inline-block; box-shadow: 0 3px 6px 0 rgba(0, 0, 0, 0.22); border-top: 10px solid black; border-top-left-radius: 5%; border-top-right-radius: 5%; border-bottom: 10px solid black; border-bottom-left-radius: 5%; border-bottom-right-radius: 5%; background-color: white;">
			<div id="sidebar_menu"
				style="border: 1px solid #e7e7e7; border-top-right-radius: 5%; border-top-left-radius: 5%; border-bottom: none; width: 100px; height: 80px; text-align: center; align-items: center; justify-content: center; display: flex;">
				<div style=" justify-content: center;">
					<a href="Exhibition_Enroll.html" style="color: black; text-decoration: none;">
						<p1>전시회 등록</p1>
					</a>
				</div>
			</div>
			<hr style="margin:auto; width: 80px; color: black;" />

			<div id="sidebar_menu"
				style="border: 1px solid #e7e7e7;  border-top: none; border-bottom: none; border-radius: 5%; width: 100px; height: 80px; text-align: center; align-items: center; justify-content: center; display: flex;">
				<div style=" justify-content: center; ">
					<a href="" style="color: black; text-decoration: none;">
						<p1>배너 신청</p1>
					</a>
				</div>
			</div>
			<hr style="margin:auto; width: 80px; color: black;" />

			<div id="sidebar_menu"
				style="border: 1px solid #e7e7e7; border-top-right-radius: 5%; border-top-left-radius: 5%; border-bottom: none; width: 100px; height: 80px; text-align: center; align-items: center; justify-content: center; display: flex;">
				<div style=" justify-content: center;">
					<a href="#" style="color: black; text-decoration: none;">
						<p1>FAQ</p1>
					</a>
				</div>
			</div>
			<hr style="margin:auto; width: 80px; color: black;" />

			<c:choose>
			    <c:when test="${loginUserBean.userLogin == false}">
				    <div id="sidebar_menu" onclick="location.href='${root}/user/not_login'" style="cursor: pointer; border: 1px solid #e7e7e7; border-radius: 5%; width: 100px; height: 80px; text-align: center; align-items: center; justify-content: center; display: flex;">
								<div style="justify-content: center;">
									<p1>Q&A</p1>
								</div>
					</div>
				</c:when>
			
			<c:otherwise>
				<div id="sidebar_menu" data-bs-toggle="modal" data-bs-target="#qnaModal"
						style="cursor: pointer; border: 1px solid #e7e7e7; border-radius: 5%; width: 100px; height: 80px; text-align: center; align-items: center; justify-content: center; display: flex;">
							<div style="justify-content: center;">
								<p1>Q&A</p1>
							</div>
				</div>
			</c:otherwise>
			</c:choose>
		</div>
	</div>

	<!--Q&A 모달 창-->
	<div class="modal fade" id="qnaModal" tabindex="-1" aria-labelledby="qnaModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content" style="width: 950px;">
				<div class="modal-header">
					<h5 class="modal-title" id="qnaModalLabel">Q&A</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="#"><!--폼열기-->
						<div class="container h-100 align-items-center justify-content-center">
							<div class="d-flex align-items-center" style="margin-top: 20px;">
								<div style="width: 150px; text-align: left;">
									<label for="gender" style="font-size: 20px; text-align: left;">회원
										여부</label>
								</div>
								<div style="margin-left: 20px; width: 218px;">
									<input type="radio" name="gender" id="man" style="margin-right: 20px;" /> <label
										for="man">회원</label> <input type="radio" name="gender" id="woman"
										style="margin-left: 50px; margin-right: 20px;" /> <label for="woman">비회원</label>
								</div>
								<div style="margin-left: 20px; width: 100px;"></div>
							</div>

							<div class="d-flex align-items-center " style="margin-top: 50px;">
								<div style="width: 150px; text-align: left;">
									<label for="nickname" style="font-size: 18px;">ARTMEE
										아이디</label>
								</div>
								<div style="margin-left: 20px;">
									<input type="text" name="id" placeholder="회원일 경우만 작성" />
								</div>
							</div>

							<div class="d-flex align-items-center" style="margin-top: 50px;">
								<div style="width: 150px; text-align: left;">
									<label for="name" style="font-size: 18px;">성함</label>
								</div>
								<div style="margin-left: 20px;">
									<input type="text" name="id" placeholder="" />
								</div>

								<div style="width: 150px; text-align: left; margin-left: 80px;">
									<label for="email" style="font-size: 18px;">이메일</label>
								</div>
								<div style="margin-left: 15px;">
									<input type="text" name="email" placeholder="@ 포함" />
								</div>
							</div>

							<div class="d-flex align-items-center " style="margin-top: 50px;">
								<div style="width: 150px; text-align: left;">
									<label for="QnAtitle" style="font-size: 18px;">제목</label>
								</div>
								<div style="margin-left: 20px;">
									<input type="text" name="QnAtitle" placeholder="" style="width: 700px;" />
								</div>
							</div>

							<div class="d-flex align-items-center" style="margin-top: 50px;">
								<div style="width: 150px; text-align: left;">
									<label for="QnAcontent" style="font-size: 18px;">문의 내용</label>
								</div>
								<div style="margin-left: 20px;">
									<textarea name="QnAcontent" placeholder="정확한 상담을 위해 문의 내용을 자세히 작성해 주세요."
										style="width: 700px; height: 400px; resize: none;"></textarea>
								</div>
							</div>
							<hr style="margin: auto; margin-top: 50px; width: 900px;" />

							<div class="d-flex align-items-center" style="margin-top: 50px;">
								<div class="gain">
									<h3>개인정보 수집 및 이용안내</h3>
									아트맵은 문의사항 답변을 희망하는 회원을 대상으로 아래와 같이 개인정보를 수집하고 있습니다.<br> 1.
									수집 개인정보 항목 : [필수] 회원 성함, 전화번호 이메일주소<br> 2. 개인정보의 수집 및
									이용목적:문의 신청에 따른 본인확인 및 원활한 의사소통 경로 확보<br> <b>3. 개인정보의 보유
										및 이용기간: 문의 사항 처리종료 시점으로부터 6개월간 보관 후 파기합니다.</b><br> 4. 동의 거부권리
									안내 추가 : 위와 같은 개인정보 수입동의를 거부할 수있습니다.<br> 다만 동의를 거부하는 경우 문의
									신청이 제한 됩니다.
								</div>
							</div>
						</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-dark" data-bs-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-dark">Submit</button>
				</div>
			</div>
			</form>
		</div>
	</div>
	</div>

	<script>
		window.addEventListener('scroll', function () {
			var scrollPosition = window.pageYOffset || document.documentElement.scrollTop;
			var menu = document.getElementById('right-side-menu');

			menu.style.top = (500 + scrollPosition) + 'px'; // 스크롤 위치에 따라 메뉴 위치 업데이트
		});
	</script>


	<!--현재 전시, 인기 전시 캐러셀-->
	<section id="scroll">
		<div class="container px-5">
			<!-- 현재 전시, 인기 전시 라디오 버튼 -->
			<div class="d-flex justify-content-between">
				<div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="exhibitionType" id="currentExhibition"
							checked style="display: none;">
						<label id="currentExhibitionLabel" class="form-check-label" for="currentExhibition"
							style="cursor: pointer; font-size: 30px;">현재 전시</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="exhibitionType" id="popularExhibition"
							style="display: none;">
						<label id="popularExhibitionLabel" class="form-check-label" for="popularExhibition"
							style="cursor: pointer; font-size: 30px;">인기 전시</label>
					</div>
				</div>
				<label id="morelook" class="form-check-label" for="morelook"
					style="cursor: pointer; font-size: 20px;" onclick="window.location.href='${root}/exhibition/exhibition_popular'">더보기</label>
			</div>
			<br /><br />


			<!-- 현재 전시, 인기 전시 캐러셀 -->
			<div id="currentExhibitionCarousel" class="entry-content">
				<div class="container px-1">
					<div id="jcl-demo" class="entry-content">
						<div class="custom-container main">
							<button class="prev" type="button">
								<span class="carousel-control-prev-icon" style="filter: brightness(0);"
									aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<div class="carousel">
								<ul>
									<li><img src="../img/poster4.png"></li>
									<li><img src="../img/poster3.png"></li>
									<li><img src="../img/poster2.png"></li>
									<li><img src="../img/poster1.png"></li>
									<li><img src="../img/poster4.png"></li>
									<li><img src="../img/poster3.png"></li>
									<li><img src="../img/poster2.png"></li>
									<li><img src="../img/poster1.png"></li>
									<li><img src="../img/poster1.png"></li>
									<li><img src="../img/poster2.png"></li>
									<li><img src="../img/poster3.png"></li>
								</ul>
							</div>
							<div class="clear"></div>
							<button class="next" type="button">
								<span class="carousel-control-next-icon" style="filter: brightness(0);"
									aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="popularExhibitionCarousel" class="entry-content">
			<div class="container px-1">
				<div id="jcl-demo" class="entry-content">
					<div class="custom-container main1">
						<button class="prev1" type="button">
							<span class="carousel-control-prev-icon" style="filter: brightness(0);"
								aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<div class="carousel">
							<ul>
								<c:forEach items="${popularExhibitionInfo }" var="popularexhibition">
									<li><a href="${root }/exhibition/exhibition_click?exhibition_id=${popularexhibition.exhibition_id}&user_id=${loginUserBean.user_id}"><img src="${popularexhibition.main_poster_path}${popularexhibition.main_poster_name}"></a></li>
								</c:forEach>
							</ul>
						</div>
						<div class="clear"></div>
						<button class="next1" type="button">
							<span class="carousel-control-next-icon" style="filter: brightness(0);"
								aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
				</div>
			</div>
		</div>
		</div>
		<script>
			$(document).ready(function () {
				$(".main .carousel").jCarouselLite({
					btnNext: ".main .next",
					btnPrev: ".main .prev",
					visible: 4,
					speed: 1000,
					auto: 4000
				});



				$(".main1 .carousel").jCarouselLite({
					btnNext: ".main1 .next1",
					btnPrev: ".main1 .prev1",
					visible: 4,
					speed: 1000,
					auto: 4000
				});


			});
		</script>
	</section>

	<!-- 배너부분 -->
	<section style="margin-top: 150px;">
		<div class="container px-1">
			<div class="d-flex justify-content-center">
				<img src="../img/banner1.png" alt="banner1" style="border: 1px solid black;">
			</div>
		</div>
		</div>
	</section>

	<!-- 곧 전시 캐러셀 -->
	<section style="margin-top: 150px;">
		<div class="container px-1">
			<!-- 곧 전시 라벨-->
			<div class="d-flex justify-content-between">
				<div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="text" name="exhibitionType" id="currentExhibition" checked
							style="display: none;">
						<label id="currentExhibitionLabel" class="form-check-label" for="currentExhibition"
							style="font-size: 30px;">전시 예정</label>
					</div>
				</div>
				<label id="morelook1" class="form-check-label" for="morelook1"
					style="cursor: pointer; font-size: 20px;" onclick="window.location.href='${root}/exhibition/exhibition_popular'">더보기</label>
			</div>
			<br /><br />
			<div id="jcl-demo" class="entry-content">
				<div class="custom-container main2">
					<button class="prev2" type="button">
						<span class="carousel-control-prev-icon" style="filter: brightness(0);"
							aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<div class="carousel">
						<ul>
							<c:forEach items="${SoonExhibitionInfo }" var="soonexhibition">
								<li><a href="${root }/exhibition/exhibition_click?exhibition_id=${soonexhibition.exhibition_id}&user_id=${loginUserBean.user_id}"><img src="${soonexhibition.main_poster_path}${soonexhibition.main_poster_name}"></a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="clear"></div>
					<button class="next2" type="button">
						<span class="carousel-control-next-icon" style="filter: brightness(0);"
							aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>

				<script>
					$(function () {
						$(".main2 .carousel").jCarouselLite({
							btnNext: ".main2 .next2",
							btnPrev: ".main2 .prev2",
							visible: 4,
							speed: 1000,
							auto: 4000
						});
					});
				</script>
			</div>
		</div>
		</div>

	</section>

	<!-- 푸터-->
	 <c:import url="/WEB-INF/views/include/footer.jsp"/> 


	<script>
		$(document).ready(function () {
			var selectedExhibitionType = "currentExhibition"; // 초기 값 현재전시

			$("#popularExhibitionCarousel").hide();			  // 실행시 현재 전시 기본값이므로 인기전시 캐러셀 hide 처리

			$('input[type="radio"]').change(function () {
				if ($(this).attr("id") == "currentExhibition") {
					$("#currentExhibitionCarousel").show();
					$("#popularExhibitionCarousel").hide();
					selectedExhibitionType = "currentExhibition";
				}
				if ($(this).attr("id") == "popularExhibition") {
					$("#currentExhibitionCarousel").hide();
					$("#popularExhibitionCarousel").show();
					selectedExhibitionType = "popularExhibition";
				}

				updateTextColorEffect();
			});

			updateTextColorEffect();

			function updateTextColorEffect() {
				$(".form-check-label").css("color", "#000");

				if (selectedExhibitionType == "currentExhibition") {
					$("#popularExhibitionLabel").css("color", "#888");
				} else {
					$("#currentExhibitionLabel").css("color", "#888");
				}
			}
		});
	</script>

</body>

</html>