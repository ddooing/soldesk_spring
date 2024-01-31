<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>게시판 글쓰기</title>
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

<!-- SmartEditor2 CSS and JS -->
<link href="<c:url value='/resources/se2/smarteditor2.css'/>" rel="stylesheet">
<script type="text/javascript" src="<c:url value='/resources/se2/js/HuskyEZCreator.js'/>" charset="utf-8"></script>



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
	text-align: center;
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
	margin-top: 7%;
	text-align: Left;
	margin-bottom: 3px;
	padding-left: 200px;
	padding-bottom: 30px;
}

#totallist {
	font-size: 16px;
	margin-bottom: 5px;
	margin-right: 50px;
	padding-left: 180px;
	float: left;
}

#ExhibitionList {
	font-size: 16px;
	margin-bottom: 5px;
	margin-right: 50px;
	padding-left: 25%;
	padding-bottom: 1%;
}

#ExhibitionList:hover {
	color: red; /* Change to your preferred hover color */
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
	border-bottom: 1px solid #dee2e6;
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
	text-decoration: underline;
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

#contents {
	line-height: 1.1;
	letter-spacing: -0.03em;
	font-family: "Noto Sans KR", "Roboto", "dotum", "sans-serif";
	font-size: 12px;
	color: #000;
	width: 980px;
	margin: 0 auto;
	padding: 50px 0 0 0;
	margin-top: 10px;
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
	border: none;
	padding: 15px;
	margin-bottom: 20px;
	border-radius: 5px;
	/* Centering the fieldset */
	margin-left: auto;
	margin-right: auto;
	/* Optional: Set a specific width or max-width if needed */
	width: 100%; /* or a specific pixel width */
	max-width: 600px; /* or the maximum width you prefer */
}

element.style {
	width: 579.867px;
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
	width: 785px;
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

.boardwritebtn a {
	text-decoration: none;
	background-color: #000000;
	color: #fff;
	padding: 8px;
	border-radius: 5px;
	font-weight: bold;
	width: 70%;
	margin-bottom: 5px;
	margin-right: 50px;
	margin-left: 650px;
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

.content>div {
	display: none;
}

.content div.contentshow {
	display: block;
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
	margin-top: 10px;
}

body {
	font-family: 'Helvetica Neue', Arial, sans-serif;
	background-color: #f4f4f4;
	padding: 20px;
}

#formwrite {
	max-width: 900px;
	margin: auto;
	background: #fff;
	padding: 25px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	margin-top: 100px;
}

legend {
	color: #007bff;
	font-size: 1.2em;
	margin-bottom: 10px;
}

label {
	color: #333;
	margin-bottom: 5px;
}

input[type="text"], input[type="url"], textarea {
	width: 515px;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #cccccc;
	border-radius: 5px;
}

input[type="file"] {
	width: 480px;
	padding: 5px;
	margin-bottom: 5px;
	border: 1px solid #cccccc;
	border-radius: 5px;
}

textarea {
	height: 120px;
}

input[type="checkbox"] {
	margin-right: 5px;
}

input[type="submit"], button {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
}

input[type="submit"]:hover, button[type="button"]:hover {
	background-color: #0056b3;
}

button[type="button"] {
	background-color: #6c757d;
	margin-left: 10px;
}

button[type="button"]:hover {
	background-color: #5a6268;
}

#fileDiv {
	display: flex;
	flex-direction: column; /* 이 부분을 추가합니다 */
	align-items: center;
	margin-bottom: 50px
}

#fileDiv .btn {
	background-color: #dc3545;
	color: #fff;
	border: none;
	padding: 6px 12px;
	margin-left: 10px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
}

#fileDiv .btn:hover {
	background-color: #c82333;
}

#fileUploadSection {
	display: flex;
	flex-direction: column;
}

.file-upload {
	display: flex;
	align-items: center;
	margin-bottom: 10px;
}

.file-upload .file-name {
	flex-grow: 1;
	margin-left: 10px;
}

.delete-btn {
	background-color: #dc3545;
	color: #fff;
	border: none;
	padding: 6px 12px;
	border-radius: 5px;
	cursor: pointer;
}

#addFileBtn {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
}

.btn_col {
	display: inline-block;
	box-sizing: border-box;
	border-radius: 4px;
	border: 1px solid #414141;
	font-size: 14px;
	color: #ffffff !important;
	text-align: center;
	vertical-align: middle;
	background-color: #414141;
	padding: 9px;
	margin-bottom: 3px;
	margin-left: 18px;
	margin-right: 10px;
}

a { /*링크*/
	text-decoration: none;
	color: #000000;
	font-size: 12px;
}

a:hover {
	text-decoration: underline;
}

#fileDiv div, #fileDiv p {
	margin-bottom: -20px; /* 마진을 줄입니다 (기존 값보다 작게 설정) */
	padding: 10px; /* 필요한 경우 패딩도 줄일 수 있습니다 */
}
</style>

</head>
<body>
<body id="page-top">
	<!-- 메뉴바 -->
	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div id="contents" class="contents_customer area_movingvar litype5">
		<form action="/submit" method="post" id="formwrite"
			onsubmit="submitContents(this)">
			<input type="text" id="title" name="title" placeholder="제목을 입력하세요."
				style="width: 100%; padding: 10px; margin-bottom: 10px; border: 1px solid #cccccc; border-radius: 5px;">

			<textarea id="smarteditor" name="content" placeholder="내용을 입력하세요."
				style="width: 100%;"></textarea>
			<!-- 생략된 파일 업로드 및 기타 폼 요소 -->

			<input type="submit" value="작성완료" style="margin-left: 683px;">
			<button type="button">취소</button>
		</form>

		<!-- SmartEditor2 JS -->
		<script type="text/javascript">
			var oEditors = [];
			nhn.husky.EZCreator
					.createInIFrame({
						oAppRef : oEditors,
						elPlaceHolder : "smarteditor",
						sSkinURI : "se2/SmartEditor2Skin.html",
						fCreator : "createSEditor2",
						htParams : {
							bUseToolbar : true,
							bUseVerticalResizer : true,
							bUseModeChanger : true,
							fOnBeforeUnload : function() {
							},
							I18N_LOCALE : 'ko_KR',
							sInitialStyle : 'width:100%; height:300px',
							fOnAppLoad : function() {
							},
							fCreator : "createSEditor2",
							htSE2M_Config : {
								sSE2MConfigUrl: '<c:url value="/path/to/image/upload/handler"/>' // 이미지 업로드를 처리하는 서버 측 URL
							}
						}
					});

			function submitContents() {
				oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD",
						[]);
				// 에디터의 내용이 textarea에 적용된다.
				document.getElementById("formwrite").submit();
			}

			// 여기에 다중 이미지 업로드를 위한 사용자 정의 함수 추가
			// 예: function multiImageUpload() { ... }
		</script>
	</div>
	<!-- 푸터-->
	<c:import url="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>