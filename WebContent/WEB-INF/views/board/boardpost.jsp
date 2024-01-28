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




table {
	border-collapse: collapse;
	max-width: 70%;
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
	font-size: 12px;
	color: #000;
	border-collapse: collapse;
	border-spacing: 0;
	text-align: center !important;
}

tbody {
	line-height: 1.1;
	letter-spacing: -0.03em;
	font-family: "Noto Sans KR", "Roboto", "dotum", "sans-serif";
	font-size: 12px;
	color: #000;
	border-collapse: collapse;
	border-spacing: 0;
	text-align: center !important;
}

th, td {
	padding: 10px;
	text-align: center;
	font-size: 13px;
}

th {
	background-color: #f8f9fa;
	color: #000;
	font-size: 14px;
}

a { /*링크*/
	text-decoration: none;
	color: #000000;
	font-size: 12px;
}

a:hover {
	text-decoration: none;
	color: #000000;
}

#contents {
	line-height: 1.1;
	letter-spacing: -0.03em;
	font-family: "Noto Sans KR", "Roboto", "dotum", "sans-serif";
	font-size: 12px;
	color: #000;
	width: 980px;
	margin: 0 auto;
	padding: 50px 0 0 0;
	margin-top:10px;
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

.search_wrap {
	position: relativergb;	border: 1px solid #DDDDDD;
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
	font-size: 14px;
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
	font-size: 14px;
	box-sizing: border-box;
	border: 1px solid #DDD;
}

input, select, button {
	vertical-align: middle;
	appearance: none;
	-webkit-appearance: none;
	-moz-appearance: none;
}

body, input, select, textarea {
	font-family: "Noto Sans KR", "Roboto", "dotum", "sans-serif";
	font-size: 12px;
	color: #000;
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
	font-size: 14px;
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
	width: 685px;
	height: 100px;
	margin-right: 10px;
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
	padding-left: 40px;
}

.tbl_dtal th, .tbl_dtal td {
	text-align: left;
}

.tbl_list th, .tbl_list td, .tbl_dtal th, .tbl_dtal td {
	border-bottom: 1px solid #EEEEEE;
	padding: 18px;
	font-size: 15px;
	line-height: 1.3;
	border-left: 1px solid #EEEEEE;
    border-right: 1px solid #EEEEEE
}

td {
	display: table-cell;
	vertical-align: inherit;
	height: 70px;
}

table {
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0;
	border: 0;
}

table {
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
	font-size: 12px;
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
    font-size: 14px;
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


.comment-box {
	max-width: 740px;
	margin: 20px auto;

	padding: 20px;
	/* border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); */
}

.comment-box h3 {
	margin-left: 15px;
	font-size: 24px;
	color: #414141; /* 제목의 색상을 블루로 변경 */
}

.comment-box textarea {
	width: 610px; /* 버튼 너비를 고려한 조정 */
	border: none;
	border-radius: 4px 4px 4px 4px; /* 오른쪽 상단과 하단의 둥근 모서리 제거 */
	padding: 10px;
	resize: vertical;
	font-size: 1rem;
	box-sizing: border-box; /* padding과 border를 width에 포함 */
	outline: none;
	 white-space: pre-wrap;
	 background-color: transparent;
	 resize:none;
}

.comment-box button {
	width: 74px; /* 버튼 너비 설정 */
	border: 1px solid #414141;
	background-color: #414141;
	color: white;
	padding: 10px 20px;
	border-radius: 4px 4px 4px 4px; /* 왼쪽 상단과 하단의 둥근 모서리 제거 */
	box-sizing: border-box; /* padding과 border를 width에 포함 */
	cursor: pointer;
	font-size: 1rem;
	transition: background-color 0.3s;
}

.comment-box button:hover {
	background-color: #0056b3;
}

.comment-list {
	list-style-type: none; /* 불릿 포인트 제거 */
	padding: 0;
	margin-top: 30px;
}

.comment-item {
	border-bottom: 1px solid #dee2e6;
	padding: 15px 0;
	list-style-type: none; /* 목록 스타일 제거 */
}

.comment-item:last-child {
	border-bottom: none;
}

.comment-meta {
	font-size: 0.85rem;
	color: #6c757d;
	margin-bottom: 5px;
}

.comment-content {
	font-size: 1rem;
}

.comment-author {
	font-weight: bold;
	margin-right: 5px;
}

.comment-timestamp {
	color: #adb5bd;
}

#pagination {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

#pagination button {
	width: 10px;
	border: none;
	background-color: transparent;
	margin: 0 2px; /* Reduce the horizontal margin between buttons */
	cursor: pointer;
	font-size: 1rem;
	color: #858585;
	transition: color 0.3s;
}

#pagination .active {
	font-weight: bold;
	color: #000000;
}

#pagination .active {
	font-weight: bold;
	color: #000000;
}

.comment2 {
	margin: 10px;
	border: 0.1px solid #ced4da;
}

.row2 {
	justify-content: space-between;
	align-items: center;
	width: 100%; /* 부모 요소의 너비에 맞추어 조정 */
	/* 기타 스타일링 */
}

.comment-count {
	margin-right: 540px; /* 오른쪽 여백 추가 */
	
}

.right-align {
    display: flex;
    justify-content: flex-end;
    align-items: center; /* 추가: 자식 요소를 수직 중앙 정렬 */
}
.cell2 {
	padding: 5px;
}
#cell2bottom {
 	border-bottom:1px solid #d5d5d5;
}
#comments-list {
	margin-left:15px;
	width: 670px;
}
.btn3{
	margin-left:683px;
    margin-top: 20px;
}

.btn3 button {
  background-color: #ffffff; /* 버튼 배경 색상 */
  color: #ffffff; /* 버튼 텍스트 색상 */
  border: 1px solid #919191; /* 테두리 없음 */
  padding: 7px 10px; /* 내부 여백 */
  margin-right: 5px; /* 오른쪽 마진 */

  cursor: pointer; /* 커서 스타일 */
  border-radius: 5px; /* 둥근 모서리 */
  transition: background-color 0.3s; /* 배경색 변화 애니메이션 */
}

.btn3 button:hover {
  background-color: #919191;
}
#contents, comment-box{
	transform: scale(1.2);
	transform-origin: top;
}
</style>

</head>
<body>
<body id="page-top">
	<!-- 메뉴바 -->
	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div id="contents" class="contents_customer area_movingvar litype5">

		<div class="board_title" style="margin-top : 80px; margin-bottom:15px;">
		    <h3><a href="BoardList.html" style="font-size: 35px; margin-left: 155px;">게시판</a></h3>
		</div>
		<div>
			<div class="active">
				<div class="tab_con">
					<ul class="tab_wrap inner">
						<table class="tbl_dtal" summary="게시판 상세내용에 대한 표입니다">

							<tr>
								<th scope="col" style=" padding:6px;" >게시판 제목</th>
							</tr>

							<tbody style = "border:1px solid black;">
								<tr class="tb_info">
									<td style="background-color: rgb(200,200,200); border:1px solid rgb(200,200,200);">
										<span class="tit" >작성자</span> 
										<span class="cont unvisible">사용자이름</span>
										<span class="tit">등록일</span>
										<span class="cont">2020-09-14</span>
										<span class="tit">조회수</span><span class="cont">1471</span>
									</td>
								</tr>
								<tr class="tb_content" style="height: 350px;">
									<td><div id="divNoticeContents">
											<p>	안녕하세요. <br>게시글 내용입니다.</p>
											<p>게시글 내용입니다.</p>
											<p>게시글 내용입니다.</p>
											<p>게시글 내용입니다.</p>
											<p>게시글 내용입니다.<br>게시글 내용입니다.</p>
										</div></td>
								</tr>
								<tr class="tb_link">
									
									<td><a href="#" class="" id="2197">
									<span class="tb_next">다음글</span>
									<span>다음 게시글</span></a></td>
								</tr>
								<tr class="tb_link">
									<td><a href="#" class="" id="2193">
									<span class="tb_prev">이전글</span>
									<span>이전 게시글</span><a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</li>
				<div class= "btn3"> <!-- 수정 ?-->
					<button><a href="BoardList.html">목록</a></button>
					<button><a href="#">수정</a></button>
					<button><a href="#">삭제</a></button>
				</div>
			</ul>
		</div>

		<div class="comment-box">
				<h3>댓글</h3>
				<div class="comment2">
		
					<div class="row2">
						<div class="cell2" id= "cell2bottom">
							<textarea id="comment-input" rows="3" placeholder="댓글을 입력하세요..."></textarea>
						</div>
					</div>
					<div class="row2"></div>
					<div class="row2">
						<div class="cell2 right-align">
							<div class="cell2 comment-count">0/500</div>
							<button onclick="addComment()">등록</button>
						</div>
					</div>
				</div>
		
				<div>
					<ul id="comments-list"></ul>
				</div>
				<div id="pagination" style="justify-content: center"></div>
			</div>
		</div>
	</div>
	<!-- 푸터-->
	<c:import url="/WEB-INF/views/include/footer.jsp"/>
	
	<script>
	let comments = [];
	let currentPage = 1;
	const commentsPerPage = 5;
	const pageNumbersPerGroup = 5; // 한 그룹에 표시할 페이지 번호의 수
	let currentGroup = 1;

	function createDummyComments() {
	    for (let i = 1; i <= 50; i++) {
	        comments.push({
	            author: `익명${i}`,
	            text: `댓글 내용 ${i}`,
	            time: new Date().toLocaleString('ko-KR', { hour12: true })
	        });
	    }
	}

	function addComment() {
	    var commentInput = document.getElementById("comment-input");
	    var commentText = commentInput.value.trim();
	    if (commentText) {
	        var now = new Date();
	        var timestamp = now.toLocaleString('ko-KR', { hour12: true });

	        // '익명'으로 시작하는 기존 댓글들의 숫자를 업데이트
	        updateAnonymousComments();

	        var newComment = {
	            author: '익명1', // 새 댓글은 항상 '익명1'로 시작
	            text: commentText,
	            time: timestamp
	        };

	        comments.unshift(newComment);
	        currentPage = 1;
	        currentGroup = 1;
	        renderComments();
	        renderPagination();

	        commentInput.value = '';
	    } else {
	        alert('댓글 내용을 입력해주세요.');
	    }
	}

	function updateAnonymousComments() {
	    comments.forEach(comment => {
	        if (comment.author.startsWith('익명')) {
	            let number = parseInt(comment.author.substring(2)) || 1;
	            comment.author = `익명${number + 1}`;
	        }
	    });
	}

	function renderComments() {
	    const commentList = document.getElementById("comments-list");
	    commentList.innerHTML = '';

	    const start = (currentPage - 1) * commentsPerPage;
	    const end = start + commentsPerPage;
	    const currentComments = comments.slice(start, end);

	    currentComments.forEach(comment => {
	        const li = document.createElement('li');
	        li.classList.add('comment-item');

	        const meta = document.createElement('div');
	        meta.classList.add('comment-meta');
	        meta.textContent = `${comment.author} - ${comment.time}`;

	        const text = document.createElement('div');
	        text.classList.add('comment-content');
	        text.textContent = comment.text;

	        li.appendChild(meta);
	        li.appendChild(text);
	        commentList.appendChild(li);
	    });
	}

	function renderPagination() {
	    const paginationDiv = document.getElementById("pagination");
	    paginationDiv.innerHTML = '';

	    const pageCount = Math.ceil(comments.length / commentsPerPage);
	    const totalGroups = Math.ceil(pageCount / pageNumbersPerGroup);

	    let startPage = (currentGroup - 1) * pageNumbersPerGroup + 1;
	    let endPage = startPage + pageNumbersPerGroup - 1;
	    endPage = endPage > pageCount ? pageCount : endPage;

	    if (currentGroup > 1) {
	        addPaginationButton(paginationDiv, '«', 1);
	        addPaginationButton(paginationDiv, '‹', startPage - 1);
	    }

	    for (let i = startPage; i <= endPage; i++) {
	        const button = document.createElement('button');
	        button.textContent = i;
	        button.onclick = function() { setCurrentPage(i); };
	        if (currentPage === i) button.classList.add('active');
	        paginationDiv.appendChild(button);
	    }

	    if (currentGroup < totalGroups) {
	        addPaginationButton(paginationDiv, '›', endPage + 1);
	        addPaginationButton(paginationDiv, '»', pageCount);
	    }
	}

	function setCurrentPage(pageNumber) {
	    currentPage = pageNumber;
	    currentGroup = Math.ceil(pageNumber / pageNumbersPerGroup);
	    renderComments();
	    renderPagination();
	}

	function addPaginationButton(container, text, page) {
	    const button = document.createElement('button');
	    button.textContent = text;
	    button.onclick = function() { setCurrentPage(page); };
	    container.appendChild(button);
	}

	createDummyComments();
	renderComments();
	renderPagination();

	document.getElementById('comment-input').addEventListener('input', function() {
	    var commentInput = this.value; // 사용자가 입력한 댓글
	    var charCount = commentInput.length; // 입력된 글자 수
	    var maxChar = 500; // 최대 글자 수

	    // 'comment-count' 클래스를 가진 div의 내용을 업데이트
	    document.querySelector('.comment-count').textContent = charCount + '/500';

	    // 글자 수가 최대치를 초과했는지 검사
	    if (charCount > maxChar) {
	        // 최대 글자 수를 초과한 경우, 초과된 글자 수 만큼 글자를 잘라냄
	        this.value = commentInput.substring(0, maxChar);
	        // 업데이트된 글자 수 반영
	        document.querySelector('.comment-count').textContent = maxChar + '/500';
	    }
	});
	document.addEventListener('DOMContentLoaded', function() {
	    var commentInput = document.getElementById('comment-input');

	    function adjustTextareaHeight() {
	        // 높이를 초기화하기 전에 스크롤 높이를 계산
	        var scrollHeight = commentInput.scrollHeight;
	        commentInput.style.height = 'auto'; // 높이 초기화
	        commentInput.style.height = scrollHeight + 'px'; // 계산된 스크롤 높이로 설정
	    }

	    // 'input' 이벤트 리스너를 통해 사용자 입력마다 높이 조절
	    commentInput.addEventListener('input', adjustTextareaHeight);

	    // 초기 페이지 로드 시 한 번 실행하여 높이 조절
	    adjustTextareaHeight();
	});
	</script>
</body>
</html>