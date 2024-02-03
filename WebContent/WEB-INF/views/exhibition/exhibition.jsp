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
	<link rel="icon" type="image/x-icon" href="../ARTMEE_PAGELOGO.png" />

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
	<link href="css/kakaomapapi.css" rel="stylesheet" />

	<!-- Carousel 자바스크립트-->
	<script src="https://www.gmarwaha.com/script/lib/jquery.easing-1.3.js"></script>
	<script src="https://www.gmarwaha.com/script/lib/jquery.easing.compatibility.js"></script>
	<script src="https://www.gmarwaha.com/script/lib/jquery.mousewheel-3.1.12.js"></script>
	<script src="https://www.gmarwaha.com/jquery/jcarousellite/script/jquery.jcarousellite.js"></script>

</head>

<body id="page-top">
	<!-- 메뉴바 -->
	<c:import url="/WEB-INF/views/include/header.jsp"/>


	<!--전시회 부분-->
	<section class="vh-60">
		<div class="text-center mb-4" style="margin-top: 180px;">
			<h2>전시회</h2>
			<hr style="width: 1200px; margin: auto; margin-top: 30px;" />
		</div>

		<div style="margin-top: 30px; text-align: center; margin-right: 850px;">
			<button id="popularbtn"
				style="color: black; font-size: 25px; text-decoration: none; border: none; background-color: transparent;">인기</button>
			<button id="recentbtn"
				style="color: lightgray; font-size: 25px; text-decoration: none; border: none; background-color: transparent;  margin-left: 15px;">최신</button>
			<button id="freebtn"
				style="color: lightgray; font-size: 25px; text-decoration: none; border: none; background-color: transparent;  margin-left: 15px;">무료</button>
			<button id="soonendbtn"
				style="color: lightgray; font-size: 25px; text-decoration: none; border: none; background-color: transparent;  margin-left: 15px;">곧종료</button>
		</div>
	</section>

	<section id="인기">
		<div class="text-center mb-4"
		    style="margin:auto; margin-top: 30px; border: 0.3px rgb(199, 200, 201) solid; width: 1200px; height: 1500px;">
		
		    <div style="margin-top: 50px; display: flex; flex-wrap: wrap; justify-content: center;">
		        <c:forEach items="${getPopularExhibitionInfo}" var="popularexhibition">
		            <div style="padding: 10px; width: 280px;">
		                <a href="${root}/exhibition/exhibition_click?exhibition_id=${popularexhibition.exhibition_id}&user_id=${loginUserBean.user_id}">
		                    <img src="${popularexhibition.main_poster_path}${popularexhibition.main_poster_name}" alt="포스터"
		                        style="width: 100%; height: auto; margin-bottom: 30px;" />
		                </a>
		                <p style="font-size: 20px; text-align: center;">${popularexhibition.title }</p>
		            </div>
		        </c:forEach>
		    </div>
		</div>


		<!--페이징 부분-->
		<div style="display: flex; justify-content: center; align-items: center;">
			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<li class="page-item">
						<a class="page-link" href="#" aria-label="Previous">
							<span aria-hidden="true">«</span>
						</a>
					</li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item">
						<a class="page-link" href="#" aria-label="Next">
							<span aria-hidden="true">»</span>
						</a>
					</li>
				</ul>
			</nav>
		</div>
	</section>

	<section id="최신">
		<div class="text-center mb-4"
		    style="margin:auto; margin-top: 30px; border: 0.3px rgb(199, 200, 201) solid; width: 1200px; height: 1500px;">
		
		    <div style="margin-top: 50px; display: flex;  flex-wrap: wrap; justify-content: start;">
		        <c:forEach items="${getRecentExhibitionInfo}" var="recentexhibition">
		            <div style="padding: 10px; width: calc(25%-30px); box-sizing: border-box;">
		                <a href="${root}/exhibition/exhibition_click?exhibition_id=${recentexhibition.exhibition_id}&user_id=${loginUserBean.user_id}">
		                    <img src="${recentexhibition.main_poster_path}${recentexhibition.main_poster_name}" alt="포스터"
		                        style="width: 100%; height: auto; margin-bottom: 30px;" />
		                </a>
		                <p style="font-size: 20px; text-align: center;">${recentexhibition.title }</p>
		            </div>
		        </c:forEach>
		    </div>
		</div>


		<!--페이징 부분-->
		<div style="display: flex; justify-content: center; align-items: center;">
			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<li class="page-item">
						<a class="page-link" href="#" aria-label="Previous">
							<span aria-hidden="true">«</span>
						</a>
					</li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item">
						<a class="page-link" href="#" aria-label="Next">
							<span aria-hidden="true">»</span>
						</a>
					</li>
				</ul>
			</nav>
		</div>
	</section>


	<section id="무료">
		<div class="text-center mb-4"
		    style="margin:auto; margin-top: 30px; border: 0.3px rgb(199, 200, 201) solid; width: 1200px; height: 1500px;">
		
		    <div style="margin-top: 50px; display: flex; flex-wrap: wrap; justify-content: center;">
		        <c:forEach items="${getFreeExhibitionInfo}" var="freeexhibition">
		            <div style="padding: 10px; width: 280px;">
		                <a href="${root}/exhibition/exhibition_click?exhibition_id=${freeexhibition.exhibition_id}&user_id=${loginUserBean.user_id}">
		                    <img src="${freeexhibition.main_poster_path}${freeexhibition.main_poster_name}" alt="포스터"
		                        style="width: 100%; height: auto; margin-bottom: 30px;" />
		                </a>
		                <p style="font-size: 20px; text-align: center;">${freeexhibition.title }</p>
		            </div>
		        </c:forEach>
		    </div>
		</div>

		<!--페이징 부분-->
		<div style="display: flex; justify-content: center; align-items: center;">
			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<li class="page-item">
						<a class="page-link" href="#" aria-label="Previous">
							<span aria-hidden="true">«</span>
						</a>
					</li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item">
						<a class="page-link" href="#" aria-label="Next">
							<span aria-hidden="true">»</span>
						</a>
					</li>
				</ul>
			</nav>
		</div>
	</section>


	<section id="곧종료">
		<div class="text-center mb-4"
		    style="margin:auto; margin-top: 30px; border: 0.3px rgb(199, 200, 201) solid; width: 1200px; height: 1500px;">
		
		    <div style="margin-top: 50px; display: flex; flex-wrap: wrap; justify-content: center;">
		        <c:forEach items="${getSoonEndExhibitionInfo}" var="soonendexhibition">
		            <div style="padding: 10px; width: 280px;">
		                <a href="${root}/exhibition/exhibition_click?exhibition_id=${soonendexhibition.exhibition_id}&user_id=${loginUserBean.user_id}">
		                    <img src="${soonendexhibition.main_poster_path}${soonendexhibition.main_poster_name}" alt="포스터"
		                        style="width: 100%; height: auto; margin-bottom: 30px;" />
		                </a>
		                <p style="font-size: 20px; text-align: center;">${soonendexhibition.title }</p>
		            </div>
		        </c:forEach>
		    </div>
		</div>

		<!--페이징 부분-->
		<div style="display: flex; justify-content: center; align-items: center;">
			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<li class="page-item">
						<a class="page-link" href="#" aria-label="Previous">
							<span aria-hidden="true">«</span>
						</a>
					</li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item">
						<a class="page-link" href="#" aria-label="Next">
							<span aria-hidden="true">»</span>
						</a>
					</li>
				</ul>
			</nav>
		</div>
	</section>


	<!-- 푸터-->
	<c:import url="/WEB-INF/views/include/footer.jsp"/> 


	<script>
		$(document).ready(function () {
			$('#최신, #무료, #곧종료').hide();
			$('#popularbtn').css('color', 'black');

			$('#popularbtn, #recentbtn, #freebtn, #soonendbtn, #nearbtn, #regionbtn').click(function () {
				$('#popularbtn, #recentbtn, #freebtn, #soonendbtn, #regionbtn').css('color', 'lightgray');
				$(this).css('color', 'black');
			});

			$('#popularbtn').click(function () {
				$('#최신, #무료, #곧종료').hide();
				$('#인기').show();
			});
			$('#recentbtn').click(function () {
				$('#인기, #무료, #곧종료').hide();
				$('#최신').show();
			});
			$('#freebtn').click(function () {
				$('#인기, #최신, #곧종료').hide();
				$('#무료').show();
			});
			$('#soonendbtn').click(function () {
				$('#인기, #최신, #무료').hide();
				$('#곧종료').show();
			});
		});
	</script>



</body>

</html>