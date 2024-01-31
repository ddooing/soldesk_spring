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
          opacity:1 !important;
}      
.ullist.visible {
   display: block ;
}	
      
.submenu{
	display: none;  align-items: center; list-style-type: none; padding: 0; margin: 0;position: relative;
}
.submenu li {display: inline-block; margin: 0 30px; height: 40px; text-align: center; line-height: 30px; cursor: pointer;
text-align: center; font-size: 30px; color: gray;}
      
      
.submenu li.sel {
	color: black;
}        
      
      
.submenu.visible {
	display: block ;
}	
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
	padding-left: 55px;
	padding-bottom: 20px;
}

#totallist {
	font-size: 30px;
	margin-bottom: 0px;
	margin-right: 50px;
	padding-left: 180px;
	float: left;
}

#ExhibitionList {
	font-size: 30px;
	margin-bottom: 0px;
	margin-right: 50px;
	padding-left: 25%;
	padding-bottom: 1%;
}

#ExhibitionList:hover {
    color: red; /* Change to your preferred hover color */
}
table {
	border-collapse: collapse;
	max-width: 100%;
	width: 100%;
	margin-top: 10px;
	margin-left: auto;
	margin-right: auto;
    border-spacing: 0
}
thead{
    line-height: 2;
    letter-spacing: -0.03em;
    font-family: "Noto Sans KR", "Roboto", "dotum", "sans-serif";
    color: #000;
    border-collapse: collapse;
    border-spacing: 0;
    text-align: center !important;
}
tbody{
	line-height: 1.1;
    letter-spacing: -0.03em;
    font-family: "Noto Sans KR", "Roboto", "dotum", "sans-serif";
    font-size: 40px;
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
	font-size: 20px;
}
a:hover {
	text-decoration: underline;
}
#contents {
	line-height: 1.1;
	letter-spacing: -0.03em;
	font-family: "Noto Sans KR", "Roboto", "dotum", "sans-serif";
	font-size: 15px;
	color: #000;
	width: 900px;
	margin: 0 auto;
}

div {
	display: block;
}

body, input, select, textarea {
	font-family: "Noto Sans KR", "Roboto", "dotum", "sans-serif";
	font-size: 12px;
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


.center-content {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

.center-content > div {
    margin-top: 30px; /* 필요에 따라 조절 */
}
.banner1{
	border: 1px solid black; width : 900px; height : 100px; margin-left: 30px;
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


a:hover {
	text-decoration: none;
	color: #000000;
}

</style>

</head>
<body>
<body id="page-top">
	<!-- 메뉴바 -->
	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div id="contents" class="contents_customer area_movingvar litype5">

		<div class="board_title">
			<h2>
				<a href="BoardNoticeList.html"
					style="font-size: 42px; text-decoration-line: none;">공지사항</a>
			</h2>
		</div>


		<div style="justify-content: center; display: flex; margin: auto;">
			<ul id="subMenu" class="submenu visible"
				style="display: flex; align-items: right; list-style-type: none; padding: 0; margin: 0; margin-right: 570px;">
				<li id="totallistbtn" class="sel" style="">전체</li>
				<li id="exhibitionbtn">전시회</li>
			</ul>
		</div>
		<br>
		<li class="active contentshow" id="totalListContent">
			<div>
				<ul class="tap_wrap inner">
					<fieldset class="search_wrap" id="search_wrap1"
						style="width: 900px;">
						<select class="ty3" title="검색조건 제목 선택" id="selectCondition1">
							<option value="1" selected>제목</option>
							<option value="2">내용</option>
							<option value="3">제목+내용</option>
						</select> <input type="text" placeholder="검색어를 입력해주세요." title="검색어를 입력해주세요"
							id="searchKeyword1" style="width: 600px;">
						<button type="button" class="btn_col2" id="btnSearch1">검색</button>
					</fieldset>
				</ul>
				<div>
					<p />
					<table class="tbl_list text_c" summary="공지사항에 대한 표입니다">
						<caption>전체 공지사항 내용</caption>
						<colgroup>
							<col style="width: 10%;">
							<col style="width: 15%;">
							<col style="width: auto;">
							<col style="width: 15%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">구분</th>
								<th scope="col">제목</th>
								<th scope="col">등록일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><strong class="ico_imp"><span>중요</span></strong></td>
								<td>전체</td>
								<td class="text_l"><a href="${root }/notice/post" id="2578"
									class="txt_color01">공지사항 중요 게시글입니다.</a></td>
								<td>2023-09-13</td>
							</tr>
							<tr>
								<td><strong class="ico_imp"><span>중요</span></strong></td>
								<td>전체</td>
								<td class="text_l"><a href="${root }/notice/post" id="2541"
									class="txt_color01">공지사항 중요 게시글입니다.</a></td>
								<td>2023-06-08</td>
							</tr>
							<tr>
								<td>28</td>
								<td>전체</td>
								<td class="text_l"><a href="${root }/notice/post" id="2606"
									class="txt_color01">공지사항 게시글입니다.</a></td>
								<td>2023-12-07</td>
							</tr>
							<tr>
								<td>27</td>
								<td>전체</td>
								<td class="text_l"><a href="${root }/notice/post" id="2605"
									class="txt_color01">공지사항 게시글입니다.</a></td>
								<td>2023-12-01</td>
							</tr>
							<tr>
								<td>26</td>
								<td>전체</td>
								<td class="text_l"><a href="${root }/notice/post" id="2602"
									class="txt_color01">공지사항 게시글입니다.</a></td>
								<td>2023-12-01</td>
							</tr>
							<tr>
								<td>25</td>
								<td>전체</td>
								<td class="text_l"><a href="${root }/notice/post" id="2596"
									class="txt_color01">공지사항 게시글입니다.</a></td>
								<td>2023-11-16</td>
							</tr>
							<tr>
								<td>24</td>
								<td>전체</td>
								<td class="text_l"><a href="${root }/notice/post" id="2594"
									class="txt_color01">공지사항 게시글입니다.</a></td>
								<td>2023-12-06</td>
							</tr>
							<tr>
								<td>23</td>
								<td>전시회</td>
								<td class="text_l"><a href="${root }/notice/post" id="2591"
									class="txt_color01">공지사항 전시회 게시글입니다.</a></td>
								<td>2023-10-13</td>
							</tr>
							<tr>
								<td>22</td>
								<td>전체</td>
								<td class="text_l"><a href="${root }/notice/post" id="2590"
									class="">공지사항 게시글입니다.</td>
							</tr>
							<tr>
								<td>21</td>
								<td>전시회</td>
								<td class="text_l"><a href="#none" id="2587" class="">공지사항
										전시회 게시글입니다.</a></td>
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
					<!--  
				<div class="boardwritebtn"  style="position: absolute;">
					<a href="BoardWriteForm.jsp" style="text-decoration: none">글쓰기</a>
				</div>
				-->
				</div>


				<!-- 배너부분 -->
				<section style="margin-top: -8spx;">
					<div class="container px-1">
						<div class="d-flex justify-content-center">
							<img src="../img/banner1.png" class="banner1" alt="banner1">
						</div>
					</div>
				</section>
		</li>

		<!-- 전시회 -->
		<li class="active contentshow" id="exhibitionContent"
			style="display: none;">
			<div>
				<ul class="tap_wrap inner">
					<fieldset class="search_wrap" id="search_wrap1"
						style="width: 900px;">
						<select id="selectArea1" title="지역 선택" style="display: none;"></select>
						<select id="selectCinema1" title="영화관 선택" style="display: none;"></select>
						<select class="ty3" title="검색조건 제목 선택" id="selectCondition1">
							<option value="1" selected>제목</option>
							<option value="2">내용</option>
							<option value="3">제목+내용</option>
						</select> <input type="text" placeholder="검색어를 입력해주세요." title="검색어를 입력해주세요"
							id="searchKeyword1" style="width: 600px;">
						<button type="button" class="btn_col2" id="btnSearch1">검색</button>
					</fieldset>
				</ul>
				<div>
					<p />
					<table class="tbl_list text_c" summary="전시회 공지사항에 대한 표입니다">
						<caption>전시회 공지사항 내용</caption>
						<colgroup>
							<col style="width: 10%;">
							<col style="width: 15%;">
							<col style="width: auto;">
							<col style="width: 15%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">구분</th>
								<th scope="col">제목</th>
								<th scope="col">등록일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><strong class="ico_imp"><span>중요</span></strong></td>
								<td>전시회</td>
								<td class="text_l"><a href="${root }/notice/post" id="2578"
									class="txt_color01">공지사항 전시회 중요 게시글입니다.</a></td>
								<td>2023-09-13</td>
							</tr>
							<tr>
								<td><strong class="ico_imp"><span>중요</span></strong></td>
								<td>전시회</td>
								<td class="text_l"><a href="${root }/notice/post" id="2541"
									class="txt_color01">공지사항 전시회 중요 게시글입니다.</a></td>
								<td>2023-06-08</td>
							</tr>
							<tr>
								<td>18</td>
								<td>전시회</td>
								<td class="text_l"><a href="${root }/notice/post" id="2606"
									class="">공지사항 전시회 게시글입니다.</a></td>
								<td>2023-12-07</td>
							</tr>
							<tr>
								<td>17</td>
								<td>전시회</td>
								<td class="text_l"><a href="${root }/notice/post" id="2605"
									class="">공지사항 전시회 게시글입니다.</a></td>
								<td>2023-12-01</td>
							</tr>
							<tr>
								<td>16</td>
								<td>전시회</td>
								<td class="text_l"><a href="${root }/notice/post" id="2602"
									class="">공지사항 전시회 게시글입니다.</a></td>
								<td>2023-12-01</td>
							</tr>
							<tr>
								<td>15</td>
								<td>전시회</td>
								<td class="text_l"><a href="${root }/notice/post" id="2596"
									class="">공지사항 전시회 게시글입니다.</a></td>
								<td>2023-11-16</td>
							</tr>
							<tr>
								<td>14</td>
								<td>전시회</td>
								<td class="text_l"><a href="${root }/notice/post" id="2594"
									class="">공지사항 전시회 게시글입니다.</td>
							</tr>
							<tr>
								<td>13</td>
								<td>전시회</td>
								<td class="text_l"><a href="${root }/notice/post" id="2591"
									class="">공지사항 전시회 게시글입니다.</a></td>
								<td>2023-10-13</td>
							</tr>
							<tr>
								<td>12</td>
								<td>전시회</td>
								<td class="text_l"><a href="${root }/notice/post" id="2590"
									class="">공지사항 전시회 게시글입니다.</td>
							</tr>
							<tr>
								<td>11</td>
								<td>전시회</td>
								<td class="text_l"><a href="${root }/notice/post" id="2587"
									class="">공지사항 전시회 게시글입니다.</td>
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
					<!-- 
				<div class="boardwritebtn"  style="position: absolute;">
					<a href="BoardWriteForm.jsp" style="text-decoration: none">글쓰기</a>
				</div>  
				-->
				</div>
				<!--밑부분 배너-->
				<section style="margin-top: 100px;">
					<div class="container px-1">
						<div class="d-flex justify-content-center">
							<img src="../img/banner1.png" alt="banner1"
								style="border: 1px solid black;">
						</div>
					</div>
				</section>
		</li>
	</div>

	<!-- 푸터-->
	<c:import url="/WEB-INF/views/include/footer.jsp"/>
	
	<script>
	document.addEventListener('DOMContentLoaded', function () {
	    // 각 탭 버튼에 클릭 이벤트 리스너 추가
	    var tabButtons = document.querySelectorAll('.submenu li');
	    var tabContents = document.querySelectorAll('.contentshow');
	
	    // 초기에 totallistbtn를 선택된 상태로 만듭니다.
	    tabButtons[0].classList.add('sel');
	    tabContents[0].style.display = 'block';
	
	    tabButtons.forEach(function (button, index) {
	        button.addEventListener('click', function () {
	            // 모든 탭 버튼의 클래스 제거
	            tabButtons.forEach(function (btn) {
	                btn.classList.remove('sel');
	            });
	
	            // 클릭된 탭 버튼에 클래스 추가
	            button.classList.add('sel');
	
	            // 모든 컨텐츠를 숨김
	            tabContents.forEach(function (content) {
	                content.style.display = 'none';
	            });
	
	            // 클릭된 탭에 해당하는 컨텐츠를 표시
	            tabContents[index].style.display = 'block';
	
	            // 해당하는 ID에 따라 전시/전체 리스트 컨텐츠 표시 설정
	            var exhibitionContent = document.getElementById('exhibitionContent');
	            var totalListContent = document.getElementById('totalListContent');
	
	            if (tabContents[index].id === 'exhibitionContent') {
	                exhibitionContent.style.display = 'block';
	                totalListContent.style.display = 'none';
	            } else if (tabContents[index].id === 'totalListContent') {
	                exhibitionContent.style.display = 'none';
	                totalListContent.style.display = 'block';
	            }
	        });
	    });
	});	
	</script>

</body>
</html>