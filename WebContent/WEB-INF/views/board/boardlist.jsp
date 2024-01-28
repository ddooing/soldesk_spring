<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
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


.content > div{
      display: none ;
}
.content div.contentshow{
    display: block ;
}  
.ullist{justify-content: center;display: none; margin-left:30px ;
}  

button {
	border: none;
	font-size:20px;
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
	margin-top: 120px;
	text-align: Left;
	margin-bottom: 3px;
	padding-left: 195px;
	padding-bottom: 20px;
}

table {
	border-collapse: collapse;
	max-width: 70%;
	width: 100%;
	margin-top: 10px;
	margin-left: auto;
	margin-right: auto;
    border-spacing: 0
}
thead{
    line-height: 3;
    letter-spacing: -0.03em;
    font-family: "Noto Sans KR", "Roboto", "dotum", "sans-serif";
    font-size: 12px;
    color: #000;
    border-collapse: collapse;
    border-spacing: 0;
    text-align: center !important;
}
tbody{
	line-height: 1.1;
    letter-spacing: -0.03em;
    font-family: "Noto Sans KR", "Roboto", "dotum", "sans-serif";
    font-size: 23px;
    color: #000;
    border-collapse: collapse;
    border-spacing: 0;
    text-align: center !important;
}
th, td {
	border-bottom: 1px solid #dee2e6;
	padding: 10px;
	text-align: center;
	font-size: 20px;
}
th {
	background-color: #f8f9fa;
	color: #000;
	font-size: 20px;
}
a {	/*링크*/
	text-decoration: none;
	color: #000000;
	font-size: 12px;
}
a:hover {
	text-decoration: underline;
}
#contents {
	line-height: 1.1;
	letter-spacing: -0.03em;
	font-family: "Noto Sans KR", "Roboto", "dotum", "sans-serif";
	font-size: 12px;
	color: #000;
	width: 1330px;
	margin: 0 auto;
	padding: 50px 0 0 0;
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
	margin-top: -30px;
	padding-top: 30px;
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

.search_wrap {
	position: relative;
	border: 1px solid #DDDDDD;
	border-radius: 4px;
	background: #F8F8F8;
	padding: 22px 22px;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	-ms-border-radius: 4px;
	-o-border-radius: 4px;
	font-size: 0;
	margin-left: 15%;
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

.search_wrap select {
	margin-right: 10px;
}

select.ty3 {
	background-image: url(../images/icon/arr_dw_9.png);
}

select {
	border-radius: 4px;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	-ms-border-radius: 4px;
	-o-border-radius: 4px;
	border: 1px solid #DDD;
	background: #fff url(../images/icon/arr_dw_13.png);
	background-repeat: no-repeat;
	background-position: right 6px top 50%;
	height: 40px;
	line-height: 40px;
	padding: 0 34px 0 18px;
	font-size: 20px;
	box-sizing: border-box;
}

fieldset {
	display: block;
	margin-inline-start: 2px;
	margin-inline-end: 2px;
	padding-block-start: 0.35em;
	padding-inline-start: 0.75em;
	padding-inline-end: 0.75em;
	padding-block-end: 0.625em;
	min-inline-size: min-content;
	border-width: 2px;
	border-style: groove;
	border-color: rgb(133, 133, 133);
	border-image: initial;
}

element.style {
	width: 579.867px;
}

.search_wrap input[type="text"] {
	width: 400px;
	margin-right: 6px;
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

.search_wrap [class^="btn_col"] {
	width: 86px;
	height: 38px;
	line-height: 34px;
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

.boardwritebtn a {
	text-decoration: none;
	background-color: #000000;
	color: #fff;
	padding: 8px;
	border-radius: 5px;
	font-weight: bold;
	width: 70%;
	margin-bottom: 5px;
	margin-left: 767px;
	
}
html body .boardwritebtn a:hover {
    color: #fff !important;
}
.center-content {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

.center-content > div {
    margin-top: 30px; /*ㅁㅁㄴㅇㅁㄴㅇㅁㄴㅇ 필요에 따라 조절 */
}
.banner1{
	border: 1px solid black; width : 900px; height :100px; margin-right:10px;
	margin-top:50px; margin-bottom:50px;
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

.pagination a:hover:not(.active) {background-color: #ddd;}
ul, ol {
    list-style-type: none; /* Removes default markers */
}
</style>

</head>
<body>
<body id="page-top">
	<!-- 메뉴바 -->
	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div id="contents" class="contents_customer area_movingvar litype5">

		<div class="board_title">
			<h2 style="margin-left: 30px;">
				<a href="BoardList.html" style="font-size: 42px; margin-left: 8px;">게시판</a>
			</h2>
		</div>
		<div class="active contentshow" id="totalListContent">
			<div>
				<ul class="tap_wrap inner">
					<fieldset class="search_wrap" id="search_wrap1"
						style="width: 930px;">
						<select class="ty3" title="검색조건 제목 선택" id="selectCondition1">
							<option value="1" selected>제목</option>
							<option value="2">내용</option>
							<option value="3">제목+내용</option>
						</select> <input type="text" placeholder="검색어를 입력해주세요." title="검색어를 입력해주세요"
							id="searchKeyword1" style="width: 630px;">
						<button type="button" class="btn_col2" id="btnSearch1">검색</button>
					</fieldset>
				</ul>
				<div>
					<p />
					<table class="tbl_list text_c" summary="공지사항에 대한 표입니다">
						<caption>게시판 내용</caption>
						<colgroup>
							<col style="width: 10%;">
							<col style="width: auto;">
							<col style="width: 15%;">
							<col style="width: 15%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">등록일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><strong class="ico_imp"><span>중요</span></strong></td>
								<td class="text_l"><a href="BoardPost.html" id="2578"
									class="txt_color01">중요 게시글입니다.</a></td>
								<td>관리자</td>
								<td>2023-09-13</td>
							</tr>
							<tr>
								<td><strong class="ico_imp"><span>중요</span></strong></td>
								<td class="text_l"><a href="BoardPost.html" id="2541"
									class="txt_color01">중요 게시글입니다.</a></td>
								<td>관리자</td>
								<td>2023-06-08</td>
							</tr>
							<tr>
								<td>28</td>
								<td class="text_l"><a href="#none" id="2606" class="">게시글입니다.</a></td>
								<td>사용자이름</td>
								<td>2023-12-07</td>
							</tr>
							<tr>
								<td>27</td>
								<td class="text_l"><a href="#none" id="2605" class="">게시글입니다.</a></td>
								<td>사용자이름</td>
								<td>2023-12-01</td>
							</tr>
							<tr>
								<td>26</td>
								<td class="text_l"><a href="#none" id="2602" class="">게시글입니다.</a></td>
								<td>사용자이름</td>
								<td>2023-12-01</td>
							</tr>
							<tr>
								<td>25</td>
								<td class="text_l"><a href="#none" id="2596" class="">게시글입니다.</a></td>
								<td>사용자이름</td>
								<td>2023-11-16</td>
							</tr>
							<tr>
								<td>24</td>
								<td class="text_l"><a href="#none" id="2594" class="">게시글입니다.</a></td>
								<td>사용자이름</td>
								<td>2023-12-06</td>
							</tr>
							<tr>
								<td>23</td>
								<td class="text_l"><a href="#none" id="2591" class="">게시글입니다.</a></td>
								<td>사용자이름</td>
								<td>2023-10-13</td>
							</tr>
							<tr>
								<td>22</td>
								<td class="text_l"><a href="#none" id="2590" class="">게시글입니다.</a></td>
								<td>사용자이름</td>
								<td>2023-10-11</td>
							</tr>
							<tr>
								<td>21</td>
								<td class="text_l"><a href="#none" id="2587" class="">게시글입니다.</a></td>
								<td>사용자이름</td>
								<td>2023-10-05</td>
							</tr>
						</tbody>
					</table>
				</div>
				<br>

				<!-- 페이징처리 구현 -->
				<div
					style="display: flex; justify-content: center; margin-bottom: 30px;">
					<div id="pagination-container">
						<div class="pagination">
							<a href="#">&laquo;</a> <a href="#">&lt;</a> <a class="active"
								href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a>
							<a href="#">5</a> <a href="#">&gt;</a> <a href="#">&raquo;</a>
						</div>
					</div>
					<div class="boardwritebtn" style="position: absolute;">
						<a href="BoardWriteForm.jsp" style="text-decoration: none">글쓰기</a>
					</div>
				</div>


				<!-- 배너부분 -->
				<section style="margin-top: -8spx;">
					<div class="container px-1">
						<div class="d-flex justify-content-center">
							<img src="assets/img/banner1.png" class="banner1" alt="banner1">
						</div>
					</div>
				</section>
			</div>
		</div>
		<!-- 푸터-->
		<c:import url="/WEB-INF/views/include/footer.jsp" />
	</div>
</body>
</html>