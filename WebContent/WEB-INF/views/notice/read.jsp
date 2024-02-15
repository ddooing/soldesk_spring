<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }" />   
<!DOCTYPE html>
<html>
<head>
<title>공지사항</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<!-- 메뉴바 -->
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
.selected {
	opacity: 1 !important;
}

.ullist.visible {
	display: block;
}

.submenu {
	display: none;
	align-items: center;
	list-style-type: none;
	padding: 0;
	margin: 0;
	position: relative;
}

.submenu li {
	display: inline-block;
	margin: 0 30px;
	height: 40px;
	text-align: center;
	line-height: 30px;
	cursor: pointer;
	font-size: 20px;
	color: gray;
}

.submenu li.sel {
	color: black;
}

.submenu.visible {
	display: block;
}

.content>div {
	display: none;
}

.content div.contentshow {
	display: block;
}

.ullist {
	justify-content: center;
	display: none;
	margin-left: 30px;
}

button {
	border: none;
	font-size: 20px;
	background: transparent;
}

#jcl-demo {
	text-align: center;
}

.custom-container.main, .custom-container.main1, .custom-container.main2
	{
	display: flex;
	justify-content: center;
	align-items: center;
}

.prev, .next, .prev1, .next1, .prev2, .next2 {
	margin: 0 10px;
}

.carousel ul li, .carousel1 ul li {
	margin-right: 10px;
}

.carousel ul li:last-child, .carousel1 ul li:last-child {
	margin-right: 0;
}

.carousel img, .carousel1 img {
	max-width: 100%;
}

section#scroll *, section#scroll *::before, section#scroll *::after {
	box-sizing: content-box;
}

body {
	font-family: 'Roboto', sans-serif;
	background-color: #f8f9fa;
}

#BoardNotice {
	margin-top: 20px;
}

.board_title {

	text-align: Left;
	margin-bottom: 3px;
	padding-left: 110px;
	padding-bottom: 0px;
}


table {
	border-collapse: collapse;
	max-width: 830px;
	width: 100%;
	margin-top: 10px;
	margin-left: auto;
	margin-right: auto;
	border-spacing: 0
}

thead {
	line-height: 3;
	letter-spacing: -0.03em;
	font-family: "Noto Sans KR", "Roboto", "dotum", "sans-serif";
	font-size: 20px;
	color: #000;
	border-collapse: collapse;
	border-spacing: 0;
	text-align: center !important;
}

tbody {
	line-height: 1.1;
	letter-spacing: -0.03em;
	font-family: "Noto Sans KR", "Roboto", "dotum", "sans-serif";
	font-size: 20px;
	color: #000;
	border-collapse: collapse;
	border-spacing: 0;
	text-align: center !important;
}

th, td {
	padding: 10px;
	text-align: center;
	font-size: 20px;
}

th {
	background-color: #f8f9fa;
	color: #000;
	font-size: 23px;
}

a { /*링크*/
	text-decoration: none;
	color: #000000;
	font-size: 20px;
}

a:hover {
	text-decoration: none;
	color: #000000;
}

#contents {
	line-height: 1.1;
	letter-spacing: -0.03em;
	font-family: "Noto Sans KR", "Roboto", "dotum", "sans-serif";
	font-size: 20px;
	color: #000;
	width: 1000px;
	margin: 0 auto;
	padding: 50px 0 0 0;
	margin-top:10px;
}

div {
	display: block;
}

body, input, select, textarea {
	font-family: "Noto Sans KR", "Roboto", "dotum", "sans-serif";
	font-size: 20px;
	color: #000;
}

.tab_wrap.inner {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: -20px;
}

.tab_wrap {
	position: relative;
}

ul, ol {
	/* list-style: none; */
	
}

body, h1, h2, h3, h4, h5, h6, fieldset, ul, ol, dl, dt, dd, p, figure {
	margin: 0;
	padding: 0;
}

fieldset {
	border: none;
}

body, h1, h2, h3, h4, h5, h6, fieldset, ul, ol, dl, dt, dd, p, figure {
	margin: 0;
	padding: 0;
}

body, textarea {
	line-height: 1.1;
	letter-spacing: -0.03em;
}

input[type="password"], input[type="text"], input[type="number"], input[type="tel"]
	{
	height: 40px;
	line-height: 40px;
	padding: 0 18px;
	border-radius: 4px;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	-ms-border-radius: 4px;
	-o-border-radius: 4px;
	background-color: #fff;
	font-size: 20px;
	box-sizing: border-box;
	border: 1px solid #DDD;
}

input, select, button {
	vertical-align: middle;
	appearance: none;
	-webkit-appearance: none;
	-moz-appearance: none;
}

input[type="text" i] {
	writing-mode: horizontal-tb !important;
	padding-block: 1px;
	padding-inline: 2px;
}

input:not([type="file" i], [type="image" i], [type="checkbox" i], [type="radio"
	i]) {
	
}

input {
	text-rendering: auto;
	color: fieldtext;
	letter-spacing: normal;
	word-spacing: normal;
	line-height: normal;
	text-transform: none;
	text-indent: 0px;
	text-shadow: none;
	display: inline-block;
	text-align: start;
	appearance: auto;
	-webkit-rtl-ordering: logical;
	cursor: text;
	background-color: field;
	margin: 0em;
	padding: 1px 0px;
	border-width: 2px;
	border-style: inset;
	border-color: -internal-light-dark(rgb(118, 118, 118),
		rgb(133, 133, 133));
	border-image: initial;
	padding-block: 1px;
	padding-inline: 2px;
}


.btn_col2 {
	display: inline-block;
	box-sizing: border-box;
	border-radius: 4px;
	border: 1px solid #414141;
	font-size: 20px;
	color: #ffffff !important;
	text-align: center;
	vertical-align: middle;
	background-color: #414141;
	padding:20px;
	padding-left:40px;
	padding-right:40px;
}

.center-content {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

.center-content>div {
	margin-top: 30px; /* 필요에 따라 조절 */
}

.banner1 {
	border: 1px solid black;
	width: 830px;
	height: 100px;
	margin-left: 30px;
	margin-top:0px;
	margin-bottom: 20px;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
}

.pagination a.active {
	background-color: dodgerblue;
	color: white;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}

.tbl_dtal tr.tb_info>td {
	background: #F8F8F8;
	padding-left: 61px;
}

.tbl_dtal th, .tbl_dtal td {
	text-align: left;
}

.tbl_list th, .tbl_list td, .tbl_dtal th, .tbl_dtal td {
	padding: 18px;
	line-height: 1.3;
    border:1px solid #EEEEEE;
}

td {
	display: table-cell;
	vertical-align: inherit;
	height: 80px;
}

table {
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0;
	border: 0;
	border-collapse: separate;
	text-indent: initial;
	border-spacing: 2px;
}


li {
	text-align: -webkit-match-parent;
}

ul, ol {
	list-style: none;
}

ul ul {
	list-style-type: circle;
}

ul {
	list-style-type: disc;
}

li {
	text-align: -webkit-match-parent;
}

ul {
	list-style-type: disc;
}

body, input, button, select, textarea {
	font-family: "Noto Sans KR", "Roboto", "dotum", "sans-serif";
	font-size: 20px;
	color: #000;
}

body, textarea {
	line-height: 1.1;
	letter-spacing: -0.03em;
}

.tbl_dtal tr.tb_info>td .tit:after {
	content: '';
	display: inline-block;
	background: #666;
	width: 1px;
	height: 14px;
	margin: 0 20px;
	vertical-align: middle;
}
.btn_col2 {
    display: inline-block;
    box-sizing: border-box;
    border-radius: 4px;
    border: 1px solid #414141;
    font-size: 20px;
    color: #ffffff !important;
    text-align: center;
    vertical-align: middle;
    background-color: #414141;
}
.tab_wrap > li > .tab_con {
    overflow: hidden;
    position: absolute;
    width: 100%;
    height: 0;
}
.tbl_dtal tr.tb_info>td .cont+.tit {
    margin-left: 80px;
}
.tbl_dtal tr.tb_link>td a .tb_next{
	margin-right:4px;
    background-image: url(assets/img/upwt.png);
}
.tbl_dtal tr.tb_link>td a .tb_prev {
	margin-right:4px;
    background-image: url(assets/img/downwt.png);
}
.tbl_dtal tr.tb_link>td a .tb_next, .tbl_dtal tr.tb_link>td a .tb_prev {
    background-repeat: no-repeat;
    background-position: 100% 54%;
    margin-right: 30px;
    padding-right: 24px;
    color: #000;
}
.tbl_dtal tr.tb_link>td a .tb_next, .tbl_dtal tr.tb_link>td a .tb_prev {
    background-repeat: no-repeat;
    background-position: 100% 54%;
    margin-right: 30px;
    padding-right: 24px;
    color: #000;
}
.btn_btm_wrap a, .btn_btm_wrap button {
    margin: 0 3px;
    min-width: 160px;
    /* padding: 0 !important; */
}
.btn_btm_wrap {
    margin: 30px 0;
    text-align: center;
}
.no-markers {
    list-style-type: none;
}
ul, ol {
    list-style-type: none; /* This removes markers from all unordered and ordered lists */
}
</style>

</head>
<body>
<body id="page-top">
	<!-- 메뉴바 -->
	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div id="contents" class="contents_customer area_movingvar litype5">

		<div class="board_title" style="margin-top :110px; margin-bottom:15px;">
		    <h2><a href="${root }/notice/main" style="font-size: 42px;">공지사항</a></h2>
		</div>
		
		<br>

		<div>
			<div class="active">
				<div class="tab_con">
					<ul class="tab_wrap inner">
						<table class="tbl_dtal" summary="공지사항 상세내용에 대한 표입니다">
							<thead>
								<tr>
									<th scope="col" style="padding:6px;" >${RN.title }</th>
								</tr>
							</thead>
							<tbody style = "border:1px solid black;">
								<tr class="tb_info">
									<td style="background-color: rgb(200,200,200); border:1px solid rgb(200,200,200);">
										<span class="tit">등록일</span>
										<span class="cont">${RN.create_date }</span>
										<span class="tit">조회수</span><span class="cont">${RN.views }</span>
									</td>
								</tr>
								<tr class="tb_content" style="height: 350px;">
									<td><div id="divNoticeContents">
										${RN.contents }
										</div></td>
								</tr>
							</tbody>
						</table>
					</div>
				</li>
				<div class="btn_btm_wrap">
					<a href="${root}/notice/main" class="btn_col2 ty6">목록</a>
				</div>
			</ul>
		</div>

			
		</div>
	</div>
	
	<!-- 배너 캐러셀 -->
					<section style="margin-top: 100px;">
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
	<!-- 푸터-->
	<c:import url="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>