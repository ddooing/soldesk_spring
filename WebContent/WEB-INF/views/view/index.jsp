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

	<!-- sweetalert2 알림 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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

	<!-- 상단 케러셀-->
	<header class="masthead">
		<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
			    <c:forEach items="${AllMainBannerInfo}" var="mainBanner" varStatus="status">
			        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.index}" 
			                class="${status.index == 0 ? 'active' : ''}" aria-label="Slide ${status.index + 1}">
			        </button>
			    </c:forEach>
			</div>
			<div class="carousel-inner">
				<c:forEach items="${AllMainBannerInfo}" var="mainBanner" varStatus="status">
				    <c:choose>
				        <c:when test="${status.index == 0}">
				            <div class="carousel-item active">
				                <a href='${root}/exhibition/exhibition_click?exhibition_id=${mainBanner.exhibition_id}'>
				                    <img src="${mainBanner.main_banner_path}${mainBanner.main_banner_name}" class="d-block w-80 mx-auto img-fluid" style="height: 400px; width:1200px;" alt="img1">
				                </a>
				            </div>
				        </c:when>
				        <c:otherwise>
				            <div class="carousel-item">
				                <a href='${root}/exhibition/exhibition_click?exhibition_id=${mainBanner.exhibition_id}'>
				                    <img src="${mainBanner.main_banner_path}${mainBanner.main_banner_name}" class="d-block w-80 mx-auto img-fluid" style="height: 400px; width:1200px;" alt="img1">
				                </a>
				            </div>
				        </c:otherwise>
				    </c:choose>
				</c:forEach>

				
			</div>
		</div>
	</header>

	<div id="right-side-menu">
		<div style="display: inline-block; box-shadow: 0 3px 6px 0 rgba(0, 0, 0, 0.22); border-top: 10px solid black; border-top-left-radius: 5%; border-top-right-radius: 5%; border-bottom: 10px solid black; border-bottom-left-radius: 5%; border-bottom-right-radius: 5%; background-color: white;">
			
				<c:choose>
					<c:when test="${loginUserBean.userLogin == false}">
					<div id="sidebar_menu" onclick="nologin();"
						style="border: 1px solid #e7e7e7; border-top-right-radius: 5%; border-top-left-radius: 5%; border-bottom: none; width: 100px; height: 80px; text-align: center; align-items: center; justify-content: center; display: flex;">
						<div style=" justify-content: center;" >
							<a href="#" style="color: black; text-decoration: none;">
								<p1>전시회 등록</p1>
							</a>
						</div>
						</div>
					</c:when>
					<c:otherwise>
					<div id="sidebar_menu" onclick="window.location.href='${root}/exhibition/Exhibition_Enroll'" style="border: 1px solid #e7e7e7; border-top-right-radius: 5%; border-top-left-radius: 5%; border-bottom: none; width: 100px; height: 80px; text-align: center; align-items: center; justify-content: center; display: flex;">
						<div style=" justify-content: center;">
							<a href="#" style="color: black; text-decoration: none;">
								<p1>전시회 등록</p1>
							</a>
						</div>
					</div>
					</c:otherwise>
				</c:choose>
				
				
			
			<hr style="margin:auto; width: 80px; color: black;" />
			
				<c:choose>
					<c:when test="${loginUserBean.userLogin == false}">
					<div id="sidebar_menu" onclick="nologin();"
						style="border: 1px solid #e7e7e7; border-top-right-radius: 5%; border-top-left-radius: 5%; border-bottom: none; width: 100px; height: 80px; text-align: center; align-items: center; justify-content: center; display: flex;">
						<div style=" justify-content: center;" >
							<a href="#" style="color: black; text-decoration: none;">
								<p1>배너 신청</p1>
							</a>
						</div>
						</div>
					</c:when>
					<c:otherwise>
					<div id="sidebar_menu" onclick="window.location.href='${root}/admin/bannerapply'" style="border: 1px solid #e7e7e7; border-top-right-radius: 5%; border-top-left-radius: 5%; border-bottom: none; width: 100px; height: 80px; text-align: center; align-items: center; justify-content: center; display: flex;">
						<div style=" justify-content: center;">
							<a href="#" style="color: black; text-decoration: none;">
								<p1>배너 신청</p1>
							</a>
						</div>
					</div>
					</c:otherwise>
				</c:choose>
			
			
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
				    <div id="sidebar_menu" onclick="nologin();" style="cursor: pointer; border: 1px solid #e7e7e7; border-radius: 5%; width: 100px; height: 80px; text-align: center; align-items: center; justify-content: center; display: flex;">
								<div style="justify-content: center;">
									<p1>Q&A</p1>
								</div>
					</div>
				</c:when>
			
			<c:otherwise>
				<div id="sidebar_menu" onclick="window.location.href='${root}/mypage/QnA?user_id=${loginUserBean.user_id}'"
						style="cursor: pointer; border: 1px solid #e7e7e7; border-radius: 5%; width: 100px; height: 80px; text-align: center; align-items: center; justify-content: center; display: flex;">
							<div style="justify-content: center;">
								<p1>Q&A</p1>
							</div>
				</div>
			</c:otherwise>
			</c:choose>
		</div>
	</div>
	
	<script>
		function nologin() {
			Swal.fire({
				  icon: "error",
				  title: "로그인 오류",
				  text: "로그인이 필요한 서비스입니다",
				  showConfirmButton: true
				}).then(function() {
				  window.location.href = "${root}/user/login";
				});			
		}
	</script>

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
									<c:forEach items="${currentExhibitionInfo }" var="currentExhibition">
										<li><a href="${root }/exhibition/exhibition_click?exhibition_id=${currentExhibition.exhibition_id}&user_id=${loginUserBean.user_id}"><img src="${currentExhibition.main_poster_path}${currentExhibition.main_poster_name}" style="width:255px; height:375px;"></a></li>
									</c:forEach>
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
									<li><a href="${root }/exhibition/exhibition_click?exhibition_id=${popularexhibition.exhibition_id}&user_id=${loginUserBean.user_id}"><img src="${popularexhibition.main_poster_path}${popularexhibition.main_poster_name}" style="width:255px; height:375px;"></a></li>
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

	
	<!-- 배너 캐러셀 -->
	<section style="margin-top: 150px;">
	    <div class="container px-1" style="width:1100px;">
	        <div id="bannerCarousel" class="carousel slide" data-bs-ride="carousel">
	            <!-- 캐러셀 인디케이터 -->
	            <div class="carousel-indicators">
	                <c:forEach items="${AllSubBannerInfo}" var="subBanner" varStatus="status">
	                    <button type="button" data-bs-target="#bannerCarousel" data-bs-slide-to="${status.index}" 
	                            class="${status.index == 0 ? 'active' : ''}" aria-label="Slide ${status.index + 1}">
	                    </button>
	                </c:forEach>
	            </div>
	
	            <!-- 캐러셀 슬라이드 -->
	            <div class="carousel-inner">
	                <c:forEach items="${AllSubBannerInfo}" var="subBanner" varStatus="status">
	                    <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
	                        <a href='${root}/exhibition/exhibition_click?exhibition_id=${subBanner.exhibition_id}'>
	                            <img src="${subBanner.sub_banner_path}${subBanner.sub_banner_name}" class="d-block w-100" alt="Banner ${status.index + 1}" style="height:150px;">
	                        </a>
	                    </div>
	                </c:forEach>
	            </div>
	
	            <!-- 캐러셀 컨트롤 -->
	            <button class="carousel-control-prev" type="button" data-bs-target="#bannerCarousel" data-bs-slide="prev">
	                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	                <span class="visually-hidden">Previous</span>
	            </button>
	            <button class="carousel-control-next" type="button" data-bs-target="#bannerCarousel" data-bs-slide="next">
	                <span class="carousel-control-next-icon" aria-hidden="true"></span>
	                <span class="visually-hidden">Next</span>
	            </button>
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
								<li><a href="${root }/exhibition/exhibition_click?exhibition_id=${soonexhibition.exhibition_id}&user_id=${loginUserBean.user_id}"><img src="${soonexhibition.main_poster_path}${soonexhibition.main_poster_name}" style="width:255px; height:375px;"></a></li>
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