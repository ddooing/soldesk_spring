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
	<script src="js/scripts.js"></script>

	<!-- JQuery 자바스크립트-->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>


	<!-- CSS -->
	<link href="css/styles.css" rel="stylesheet" />
	<link href="css/kakaomapapi.css" rel="stylesheet" />

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

		<div style="margin-top: 30px; text-align: center; margin-right: 880px;">
			<button id="popularbtn" type="button" onclick="window.location.href='${root}/exhibition/exhibition_popular'"
				style="color: lightgray; font-size: 25px; text-decoration: none; border: none; background-color: transparent;">인기</button>
			<button id="recentbtn" type="button" onclick="window.location.href='${root}/exhibition/exhibition_recent'"
				style="color: lightgray; font-size: 25px; text-decoration: none; border: none; background-color: transparent;  margin-left: 15px;">최신</button>
			<button id="freebtn" type="button" onclick="window.location.href='${root}/exhibition/exhibition_free'"
				style="color: black; font-size: 25px; text-decoration: none; border: none; background-color: transparent;  margin-left: 15px;">무료</button>
			<button id="soonendbtn" type="button" onclick="window.location.href='${root}/exhibition/exhibition_soon_end'"
				style="color: lightgray; font-size: 25px; text-decoration: none; border: none; background-color: transparent;  margin-left: 15px;">곧종료</button>
		</div>
	</section>
		<div style="margin-top: 30px; text-align: center; margin-left: 850px;">
					<form action="${root }/exhibition/exhibition_search" method="get" name="exhibitionSearch">
						<input type="text" name="keyword" placeholder="키워드로 검색" style="width: 300px; height: 40px;" />
						<button type="submit" class="btn btn-dark" style="margin-left: 10px;">검색</button>
					</form>
				</div>


	<section id="무료">
		<div class="text-center mb-4"
		    style="margin:auto; margin-top: 30px; border: 0.3px rgb(199, 200, 201) solid; width: 1200px; height: 1600px;">
		
		    <div style="margin-top: 50px; display: flex; margin-left:35px; flex-wrap: wrap; justify-content: start;">
		        <c:forEach items="${getFreeExhibitionInfo}" var="freeexhibition">
		            <div style="padding: 10px; width: calc(25%-30px); box-sizing: border-box;">
		                <a href="${root}/exhibition/exhibition_click?exhibition_id=${freeexhibition.exhibition_id}&user_id=${loginUserBean.user_id}">
		                    <img style="width:255px; height:375px;" src="${freeexhibition.main_poster_path}${freeexhibition.main_poster_name}" alt="포스터"
		                        style="width: 100%; height: auto; margin-bottom: 30px;" />
		                </a>
		                <p style="font-size: 20px; width:255px; text-align: center; margin-top:30px; word-wrap: break-word;">${freeexhibition.title }</p>
		            </div>
		        </c:forEach>
		    </div>
		</div>


		<div class="d-none d-md-block" style="margin-top:50px;">
				<ul class="pagination justify-content-center">
					<c:choose>
						<c:when test="${pageBean.prevPage <= 0 }">
							<li class="page-item disabled">		<!-- 1페이지에 있으면 이전 버튼 비활성화 -->
								<a href="#" class="page-link">이전</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a href="${root }/exhibition/exhibition_free?page=${pageBean.prevPage}" class="page-link">이전</a>
							</li>
						</c:otherwise>
					</c:choose>
					
					<c:forEach var ="idx" begin="${pageBean.min}" end="${pageBean.max}">
					<!-- model로 가져온 pageBean의 최소페이지부터 최대페이지까지 반복 : idx 는 현재페이지-->
						<c:choose>
							<c:when test="${idx == pageBean.currentPage }">
								<li class="page-item active" >
									<a href="${root }/exhibition/exhibition_free?page=${idx}" class="page-link">
										${idx }
									</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a href="${root }/exhibition/exhibition_free?page=${idx}" class="page-link">
										${idx }
									</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					
					<c:choose>
						<c:when test="${pageBean.max >= pageBean.pageCnt  }">	<!-- max페이지 > 전체페이지개수 일때  -->
							<li class="page-item disabled" >		<!-- 1페이지에 있으면 이전 버튼 비활성화 -->
								<a href="#" class="page-link">다음</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a href="${root }/exhibition/exhibition_free?page=${pageBean.nextPage}" class="page-link">다음</a>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			
			<div class="d-block d-md-none">
				<ul class="pagination justify-content-center">
					<li class="page-item">
						<a href="#" class="page-link">이전</a>
					</li>
					<li class="page-item">
						<a href="#" class="page-link">다음</a>
					</li>
				</ul>
			</div>
	</section>


	<!-- 푸터-->
	<c:import url="/WEB-INF/views/include/footer.jsp"/> 


</body>

</html>