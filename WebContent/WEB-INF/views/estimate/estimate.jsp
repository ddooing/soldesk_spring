<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="icon" type="image/x-icon" href="assets/ARTMEE_PAGELOGO.png" />

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet" />

<!-- Bootstrap core JS-->
<script   src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Core theme JS-->
<script src="js/scripts.js"></script>
<script src="js/order_payment.js"></script>
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

<title>배너 신청페이지</title>
<style>
   @import url(https://fonts.googleapis.com/earlyaccess/notosanskr.css);
   *{ font-family: 'Noto Sans KR', sans-serif;}
   body { white-space: nowrap;display:block; float:left; width:100%; padding:0; margin:0;}
   .container{ width:100%; max-width:1200px; margin: 0 auto; }
   .container .title { width:100%; float:left;  text-align:center; padding-top:50px; position:relative;}
   .container .title img {   max-width: 290px;   }
   .container .subTitle {width: 100%;float: left;text-align: center;margin-top: 50px;font-size: 20px;font-weight: bold;}
   .container .subTitle img {   max-width: 135px;   }
   .container table{float:left; width:100%; margin-top: 10px;}      
   .container table th {   background-color: #000;color: #fff;   font-size: 14px;line-height: 20px;padding: 10px 5px;border: 0px}
   .container table td {text-align: center;font-size: 13px;line-height: 15px;padding: 5px 5px;height: 32px;}
   .container table td[rowspan] {   line-height: 20px;   }
   .gray {   background-color: #f8f7f7   }
   .remarks {   font-size: 12px !important;   text-align: left !important;   }
   .container table .updown__list button {background: none;border: 0px;cursor: pointer;padding: 0;
      float: left;margin-right: 5px;height: 24px;}
   .container table .updown__list input {border: 1px solid transparent;outline: none;border-radius: 2px;text-align: center;
      font-size: 13px;width: 50%;float: left;height: 20px;margin-right: 5px;}
   .container table .updown__list input:focus {   border: 1px dashed gray   }
   .icon {vertical-align: middle;   margin-bottom: 2px;}
   .text__center {   text-align: center;   }
   .ccnt {width: 120px;}
   .amount {font-size: 18px;font-weight: bold;}
   .row {float: left;width: 100%;margin-bottom: 20px;}
   .info {   float: left;   width: calc(100% - 4px);   text-align: center;   font-size: 18px;   font-weight: bold;}
   .info__form {margin: 0 auto;width: 100%;margin-bottom: 100px;margin-top: 50px;float: left;}
   .info__ttl {   font-size: 18px;}
   .info__form .row .input__title {font-size: 14px;float: left;width: 70px;padding-top: 10px;padding-bottom: 10px;}
   .info__form .row .input__wrap {width: 100%;margin-left: 20px;max-width: 370px;float: left;}
   .info__form .row .input__wrap input {float: left;   width: 100%;padding-left: 10px;max-width: 
                              330px;height: 40px;border-radius: 4px;border: 1px solid #dcdcdc}
   .info__form .row .input__wrap textarea {float: left;width: 100%;padding-left: 10px;max-width: 330px;
      padding-top: 8px;border-radius: 4px;border: 1px solid #dcdcdc;resize: none;height: 200px;}
   .info__form .content__wrap {margin: 0 auto;width: 100%;max-width: 500px;}
   .info__form .row button {border-radius: 5px;float: left;width: calc(50% - 5px);background-color: #F8F7F7;border: 1px solid #dcdcdc;
      color: #000;font-size: 16px;font-weight: bold;padding-top: 15px;padding-bottom: 15px;cursor: pointer}
   .info__form .row button:nth-child(2) {margin-left: 10px;}
   .sub__txt {color: #9f9f9f;font-size: 14px;float: left;font-weight: normal;}
   .order__form {margin: 0 auto;width: 100%;margin-bottom: 100px;margin-top: 0px;float: left;}
   .order__form .order__wrap {margin: 0 auto;width: 100%;max-width: 570px;overflow: hidden;}
   .order__form .order__wrap .sub {width: 100%;padding-bottom: 20px;margin: 0 auto;color: #9f9f9f;
                           font-size: 14px;font-weight: normal;border-bottom: 4px solid black;}
   .mylist {padding: 5px 10px;cursor: pointer;position: absolute;top: 50px;right: 0;font-size: 16px;
      background-color: #fff;color: #000;border-radius: 5px;border: 1px solid black;font-weight: bold;}
   .layer {display: none;position: fixed;_position: absolute;top: 0;left: 0;width: 100%;height: 100%;z-index: 1000;}
   .layer .bg {position: absolute;top: 0;left: 0;width: 100%;height: 100%;background: #000;opacity: .5;filter: alpha(opacity = 50);}
   .layer .pop {display: block;}
   .pop {display: none;position: absolute;top: 50%;left: 50%;width: 100%;max-width: 400px;
      min-height: 300px;max-height: 500px;z-index: 100;background-color: #fff;}
   .pop .pop-container {padding: 10px;}
   .pop p.ctxt {color: #666;line-height: 25px;}
   .pop .btn-r {width: 100%;margin: 10px 0 20px;padding-top: 10px;border-top: 1px solid #DDD;text-align: right;}
   .cbtn {display: inline-block;height: 35px;padding: 0px 25px;border: 1px solid #f6921d;
      background-color: #f6921d;font-size: 14px;color: #fff;line-height: 25px;}
   .cbtn:hover {border: 1px solid #091940;   background-color: #1f326a;color: #fff;
   }
   a {text-decoration: none !important}
   a:hover {text-decoration: none !important}
   .m_mylist {display: none;}
   @media screen and (max-width: 768px) {
      .container {   width: calc(100% - 12px);   padding-left: 6px;padding-right: 6px;}
      .container table th {font-size: 10px;}
      .container table td {text-align: center;font-size: 10px;line-height: 20px;padding: 10px 5px;min-width: 50px;}
      .container table .updown__list input {float: none;   margin-bottom: 3px;}
      .container table .updown__list .updown__wrap {float: left;width: 100%;text-align: center;}
      .container table .updown__list .updown__wrap button {float: none;}
      .container table .updown__list div {width: auto;float: left;height: 24px;}
      .info__form {margin-bottom: 10px;}
      .info__form .row .input__title {float: left;width: 100%;text-align: left;}
      .info__form .row .input__wrap {width: 100%;margin: 0;max-width: 100%;}
      .info__form .row .input__wrap input {max-width: calc(100% - 14px);}
      .info__form .row .input__wrap textarea {max-width: calc(100% - 14px);}
      .total {width: 100%;border: 0}
      .total div {width: calc(100% - 20px);border: 0;padding: 10px}
      .total div:nth-child(2) {border: 0;}
      .mylist {display: none;}
      .m_mylist {display: block;position: absolute;top: 10px;right: 0;background-color: #fff;border: 0;}
      .m_mylist img {width: 30px;}
   }
   .price-cancel {   text-decoration: line-through}
   .totalRow {display: flex;justify-content: space-between;align-items: center;font-size: 16px;font-weight: bold;}
   .totalRow>div {flex-grow: 1;display: flex;justify-content: space-between;padding: 23px 70px;}
   .totalTD {background-color: #f8f7f7;padding: 0px !important;position: sticky;bottom: 0}
   #totalAmount {font-size: 26px;   color: #ff6521;}
   #totalAmount:after {content: "";font-size: 16px;}
   #orderAmount2 {color: #ff6521;}
   .direct-Y .name {background-color: rgba(254, 179, 171, 0.21);}
   td.options {text-align: left !important;   overflow: none;}
   td.options input[type=checkbox] {position: absolute;opacity: 0;left: -1000px;top: -1000px;}
   td.options label {display: flex;align-items: center;}
   td.options .checkMask {position: relative;height: 16px;width: 16px;border: 1.5px solid #707070;
                  border-radius: 3px;margin: 0px 8px;}
   td.options .checkMask:after {content: "";position: absolute;left: 5px;top: 2px;width: 3px;height: 7px;
      border: solid white;border-width: 0 3px 3px 0;-webkit-transform: rotate(45deg);-ms-transform: rotate(45deg);
      transform: rotate(45deg);display: none;}
   td.options input[type=checkbox]:checked ~ .checkMask {background-color: #2196F3;}
   td.options input[type=checkbox]:checked ~ .checkMask:after {display: block;}
   #orderAmount:after {content: ""}
   #allAmount:after {content: ""   }
   tr.groupStart td {}
   tr.groupStart:not(:first-child) td {   border-top: 2px solid #c7c7c7;   }
   .custom-check-container {text-align: left !important;   overflow: none;   }
   .custom-check-container input[type=checkbox] {position: absolute;opacity: 0;left: -1000px;top: -1000px;}
   .custom-check-container label {   display: flex;   align-items: center;   }
   .custom-check-container .checkMask {position: relative;height: 16px;width: 16px;
      border: 1.5px solid #707070;border-radius: 3px;margin: 0px 8px;}
   .custom-check-container .checkMask:after {content: "";position: absolute;left: 5px;top: 2px;width: 3px;height: 7px;border: solid white;
      border-width: 0 3px 3px 0;-webkit-transform: rotate(45deg);-ms-transform: rotate(45deg);transform: rotate(45deg);display: none;}
   .custom-check-container input[type=checkbox]:checked ~ .checkMask {   background-color: #2196F3;   }
   .custom-check-container input[type=checkbox]:checked ~ .checkMask:after{   display: block;   }
   #estimate-layer {display: none;position: fixed;opacity: 0;background-color: rgba(1, 1, 1, 0.5);left: 0px;top: 0px;
      width: 100%;height: 100%;z-index: 900;justify-content: center;align-items: center;text-align: center;}
   #estimate-layer.active {   opacity: 1;   }
   #estimate-layer .layer-container {display: flex;width: 447px;height: 400px;border: 0.5px solid #333;
                           background-color: white;flex-direction: column;align-items: center;}
   #estimate-layer .layer-container:before {content: "";display: block;width: 100%;height: 16px;background-color: black;}
   #estimate-layer .layer-container:after {content: "";display: block;width: 100%;height: 16px;background-color: black;}
   #estimate-layer .layer-logo-area {display: flex;justify-content: center;margin-top: 49px}
   #estimate-layer .layer-logo-area img {   height: 23px;}
   #estimate-layer .layer-content-area {   font-size: 18px;margin-top: 40px;}
   #estimate-layer .layer-check-area {   margin: 50px 0px 70px 0px;}
   #estimate-layer .layer-check-area label {   font-size: 16px;}
   #estimate-layer .layer-transition {transition-property: opacity;transition-timing-function: ease-in-out;transition-duration: 0.3s;}
   #estimate-layer p {margin: 10px 0px;}
   #canvas-target-1:after {content: "";display: block;clear: both;}
   td.name {font-weight: 500}
   .showsN {display: none;}
   ::placeholder {color: #d3d3d3;letter-spacing: -0.6px;}
   #file {   display: none;}
   .input__wrap .file-label {float: left;width: 100%;padding-left: 10px;max-width: 330px;height: 40px;border-radius: 4px;border: 1px solid #dcdcdc;}
   .input__wrap .file-label .button {background-color: white;border-radius: 4px;border: 1px solid #dcdcdc;margin: -1px -1px -1px -11px !important;
      height: 100%;padding: 0px;width: 90px;font-size: 14px;letter-spacing: -0.56px;font-weight: 500;line-height: 42px;float: left;}
   #file-name {display: block;background-color: #f8f7f7;color: #9f9f9f;height: 100%;margin-left: -2px;font-size: 14px;
      letter-spacing: -0.56px;line-height: 42px;padding-left: 95px;font-weight: 400;text-align: left;}
   b {   font-weight: 500;}
   .orderdown-image, .orderup-image {   width: 10px;    height: 20px;}
   /* 위 영역 스타일 */
   button {border: none;background: transparent;}
   #jcl-demo {text-align: center;}
   .custom-container.main, .custom-container.main1, .custom-container.main2{display: flex;justify-content: center;align-items: center;}
   .prev, .next, .prev1, .next1, .prev2, .next2 {margin: 0 10px;}
   .carousel ul li, .carousel1 ul li {margin-right: 10px;}
   .carousel ul li:last-child, .carousel1 ul li:last-child {margin-right: 0;}
   .carousel img, .carousel1 img {max-width: 100%;}
   section#scroll *, section#scroll *::before, section#scroll *::after {box-sizing: content-box;}
   
   #money {
      transform: scale(1.2);
      transform-origin: top;
   }

</style>
</head>
<body>
   <script src="/js/html2canvas.min.js"></script>
</head>
<body id="page-top">
	<!-- 메뉴바 -->
	<c:import url="/WEB-INF/views/include/header.jsp" />

	<input type="hidden" id="orderAmount__input" value=0>
	<input type="hidden" id="allAmount__input" value=0>
	<input type="hidden" id="ordernum" value=order_58F0473EE1BB518D00B5>

	<div class="container" id="money">
		<div class="title">
			<a href="index.html"><img src="assets/img/ARTMEE.png"
				style="margin-top: 40px;"></a>
			<button type="button" onclick="layer_open('layer');" class="m_mylist">
				<img src="/img/m_mlist.png">
			</button>
		</div>
		<div class="subTitle">A. 상품 종류</div>

		<table id="canvas-target-2" border='1' bordercolor=#c7c7c7
			cellpadding=0 cellspacing=0>
			<thead style="text-align: center;">
				<th></th>
				<th>상품</th>
				<th>단가(원)</th>
				<th class='ccnt'>상품 수</th>
				<th>비고</th>
			</thead>
			<tbody>
				<tr id="promotion-40" class=" groupStart direct-N">
					<td style="width: 80px;" class="gray" rowspan="7">Web<br>광고
					</td>
					<td class="name">메인 배너</td>
					<td>  80,000(1일)</td>
					<td class="updown__list"><input type="text" value="0"
						data-idx=40 data-discount="N" data-direct="N" data-price=80000
						class="count" id="cnt40" data-index="40"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
						onkeyup="checkNum('40');" />
						<div class="updown__wrap">
							<button type="button" id="up40" onclick="up_promotion('40')"
								class="up-button">
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="20"
									fill="currentColor" class="bi bi-arrow-up" viewBox="0 0 16 16"
									style="border: 1px solid black;">
						  <path fill-rule="evenodd"
										d="M8 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L7.5 2.707V14.5a.5.5 0 0 0 .5.5" />
						</svg>
							</button>
							<button type="button" id="down40" onclick="down_promotion('40')"
								class="orderdown-button">
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="20"
									fill="currentColor" class="bi bi-arrow-down"
									viewBox="0 0 16 16" style="border: 1px solid black;">
							<path fill-rule="evenodd"
										d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1" />
						</svg>
							</button>
						</div></td>

					<td style="display: none;" class="options"></td>
					<td style="display: none;" class="sample_price"></td>
					<td class="remarks">배너 사이즈 1250 x 400 (pix)<br /> 별도 요청이 없을
						경우 기본 포맷 디자인으로 제작되며, 기본 포맷 이외의 디자인을 요청할 시 비용이 추가됩니다.
					</td>
				</tr>


				<tr id="promotion-41" class="  direct-N">
					<td class="name">메인 팝업</td>
					<td>  40,000(1일)</td>
					<td class="updown__list"><input type="text" value="0"
						data-idx=41 data-discount="N" data-direct="N" data-price=40000
						class="count" id="cnt41" data-index="41"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
						onkeyup="checkNum('41');" />
						<div class="updown__wrap">
							<button type="button" id="up41" onclick="up_promotion('41')"
								class="up-button">
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="20"
									fill="currentColor" class="bi bi-arrow-up" viewBox="0 0 16 16"
									style="border: 1px solid black;">
						  <path fill-rule="evenodd"
										d="M8 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L7.5 2.707V14.5a.5.5 0 0 0 .5.5" />
						</svg>
							</button>
							<button type="button" id="down41" onclick="down_promotion('41')"
								class="orderdown-button">
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="20"
									fill="currentColor" class="bi bi-arrow-down"
									viewBox="0 0 16 16" style="border: 1px solid black;">
							<path fill-rule="evenodd"
										d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1" />
						</svg>
							</button>
						</div></td>

					<td style="display: none;" class="options"></td>
					<td style="display: none;" class="sample_price"></td>
					<td class="remarks">팝업 사이즈 600 x 860 (pix)</td>
				</tr>

				<tr id="promotion-42" class="  direct-N">
					<td class="name">추천 배너</td>
					<td>  40,000(1일)</td>
					<td class="updown__list"><input type="text" value="0"
						data-idx=42 data-discount="N" data-direct="N" data-price=40000
						class="count" id="cnt42" data-index="42"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
						onkeyup="checkNum('42');" />
						<div class="updown__wrap">
							<button type="button" id="up42" onclick="up_promotion('42')"
								class="up-button">
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="20"
									fill="currentColor" class="bi bi-arrow-up" viewBox="0 0 16 16"
									style="border: 1px solid black;">
						  <path fill-rule="evenodd"
										d="M8 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L7.5 2.707V14.5a.5.5 0 0 0 .5.5" />
						</svg>
							</button>
							<button type="button" id="down42" onclick="down_promotion('42')"
								class="orderdown-button">
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="20"
									fill="currentColor" class="bi bi-arrow-down"
									viewBox="0 0 16 16" style="border: 1px solid black;">
							<path fill-rule="evenodd"
										d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1" />
						</svg>
							</button>
						</div></td>

					<td style="display: none;" class="options"></td>
					<td style="display: none;" class="sample_price"></td>
					<td class="remarks">기본 600 x 900 (pix) / 가로 600 (pix) 기준으로 비율
						조정 가능</td>
				</tr>


				<tr id="promotion-43" class="  direct-N">
					<td class="name">필터링</td>
					<td>  50,000(1일)</td>
					<td class="updown__list"><input type="text" value="0"
						data-idx=43 data-discount="N" data-direct="N" data-price=50000
						class="count" id="cnt43" data-index="43"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
						onkeyup="checkNum('43');" />
						<div class="updown__wrap">
							<button type="button" id="up43" onclick="up_promotion('43')"
								class="up-button">
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="20"
									fill="currentColor" class="bi bi-arrow-up" viewBox="0 0 16 16"
									style="border: 1px solid black;">
						  <path fill-rule="evenodd"
										d="M8 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L7.5 2.707V14.5a.5.5 0 0 0 .5.5" />
						</svg>
							</button>
							<button type="button" id="down43" onclick="down_promotion('43')"
								class="orderdown-button">
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="20"
									fill="currentColor" class="bi bi-arrow-down"
									viewBox="0 0 16 16" style="border: 1px solid black;">
							<path fill-rule="evenodd"
										d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1" />
						</svg>
							</button>
						</div></td>

					<td style="display: none;" class="options"></td>
					<td style="display: none;" class="sample_price"></td>
					<td class="remarks"></td>
				</tr>

				<tr id="promotion-44" class="  direct-N">
					<td class="name">로그인 화면</td>
					<td>  80,000(1일)</td>
					<td class="updown__list"><input type="text" value="0"
						data-idx=44 data-discount="N" data-direct="Y" data-price=80000
						class="count" id="cnt44" data-index="44"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
						onkeyup="checkNum('44');" />
						<div class="updown__wrap">
							<button type="button" id="up44" onclick="up_promotion('44')"
								class="up-button">
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="20"
									fill="currentColor" class="bi bi-arrow-up" viewBox="0 0 16 16"
									style="border: 1px solid black;">
						  <path fill-rule="evenodd"
										d="M8 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L7.5 2.707V14.5a.5.5 0 0 0 .5.5" />
						</svg>
							</button>
							<button type="button" id="down44" onclick="down_promotion('44')"
								class="orderdown-button">
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="20"
									fill="currentColor" class="bi bi-arrow-down"
									viewBox="0 0 16 16" style="border: 1px solid black;">
							<path fill-rule="evenodd"
										d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1" />
						</svg>
							</button>
						</div></td>

					<td style="display: none;" class="options"></td>
					<td style="display: none;" class="sample_price"></td>
					<td class="remarks">로그인 사이즈 780 X 1080</td>
				</tr>

				<tr id="promotion-45" class="  direct-N">
					<td class="name">공지사항</td>
					<td>  50,000(1일)</td>
					<td class="updown__list"><input type="text" value="0"
						data-idx=45 data-discount="N" data-direct="Y" data-price=50000
						class="count" id="cnt45" data-index="45"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
						onkeyup="checkNum('45');" />
						<div class="updown__wrap">
							<button type="button" id="up45" onclick="up_promotion('45')"
								class="up-button">
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="20"
									fill="currentColor" class="bi bi-arrow-up" viewBox="0 0 16 16"
									style="border: 1px solid black;">
						  <path fill-rule="evenodd"
										d="M8 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L7.5 2.707V14.5a.5.5 0 0 0 .5.5" />
						</svg>
							</button>
							<button type="button" id="down45" onclick="down_promotion('45')"
								class="orderdown-button">
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="20"
									fill="currentColor" class="bi bi-arrow-down"
									viewBox="0 0 16 16" style="border: 1px solid black;">
							<path fill-rule="evenodd"
										d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1" />
						</svg>
							</button>
						</div></td>

					<td style="display: none;" class="options"></td>
					<td style="display: none;" class="sample_price"></td>
					<td class="remarks">로그인 사이즈 780 X 1080</td>
				</tr>

				<tr id="promotion-46" class="  direct-N">
					<td class="name">커뮤니티</td>
					<td>  30,000(1일)</td>
					<td class="updown__list"><input type="text" value="0"
						data-idx=46 data-discount="N" data-direct="Y" data-price=30000
						class="count" id="cnt46" data-index="46"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
						onkeyup="checkNum('46');" />
						<div class="updown__wrap">
							<button type="button" id="up46" onclick="up_promotion('46')"
								class="up-button">
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="20"
									fill="currentColor" class="bi bi-arrow-up" viewBox="0 0 16 16"
									style="border: 1px solid black;">
						  <path fill-rule="evenodd"
										d="M8 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L7.5 2.707V14.5a.5.5 0 0 0 .5.5" />
						</svg>
							</button>
							<button type="button" id="down46" onclick="down_promotion('46')"
								class="orderdown-button">
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="20"
									fill="currentColor" class="bi bi-arrow-down"
									viewBox="0 0 16 16" style="border: 1px solid black;">
							<path fill-rule="evenodd"
										d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1" />
						</svg>
							</button>
						</div></td>

					<td style="display: none;" class="options"></td>
					<td style="display: none;" class="sample_price"></td>
					<td class="remarks">로그인 사이즈 780 X 1080</td>
				</tr>

				<tr>
					<td class="totalTD" colspan=999
						style="border-top: none; border-bottom: none;">

						<div
							style="border-top: 2px solid #c7c7c7; border-bottom: 2px solid #c7c7c7; margin-top: -1px;"
							class="totalRow"></div>
						<div class="totalRow"
							style="border-bottom: 2px solid #c7c7c7; margin-bottom: -1px; font-size: 26px; color: #ff6521;">
							<div style="justify-content: center;">
								<div
									style="display: block; width: 500px; display: flex; justify-content: space-between; margin: 10px;">
									<span>소계</span> <span id="allAmount" class="amount">0원</span>
								</div>
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>

		<div style="padding: 50px; clear: both;"></div>

		<div class="info">
			<div class="info__ttl">B.주문자 정보</div>
			<div class="info__form">
				<div class="content__wrap">
					<form action="/order/artmap_pro.php" method="post"
						id="artmap__form">
						<div id="canvas-target-1">
							<div class="row">
								<div class="input__title">성함</div>
								<div class="input__wrap">
									<input type="text" name="name" id="name" placeholder="입력해주세요.">
								</div>
							</div>
							<div class="row">
								<div class="input__title">연락처</div>
								<div class="input__wrap">
									<input type="text" name="hp" id="hp" placeholder="입력해주세요.">
								</div>
							</div>
							<div class="row">
								<div class="input__title">이메일</div>
								<div class="input__wrap">
									<input type="text" name="email" id="email"
										placeholder="입력해주세요.">
								</div>
							</div>
							<div class="row">
								<div class="input__title">문의내용</div>
								<div class="input__wrap">
									<textarea placeholder="전시회(행사)명 / 전시관 명 / 전시기간 / 각 노출기간 필수 기재"
										id="info"></textarea>
								</div>
							</div>
							<div class="row file-row" style="margin-bottom: 5px;">
								<div class="input__title">파일첨부</div>
								<div class="input__wrap" style="overflow: hidden;">
									<label class="file-label" for="file"><input id="file"
										name="file" type="file">
										<div class="button">파일 선택</div> <span id="file-name">선택된
											파일 없음</span></label>
								</div>
							</div>
							<div class="row file-row">
								<div class="input__title"></div>
								<div class="input__wrap">
									<span class="sub__txt" style="white-space: nowrap; text-align: left;">
										*전시회 텍스트, 포스터, 전시 전경 및 작품 이미지 등 첨부바랍니다.<br />
										*이미지명 : "작품명_노출기간.확장자"로 기재바랍니다.<br /> 
										<br /> 
										<br />자료 미전달 시 답변이 어려우며, 아직 확정된 자료가 없다면 문의란에 꼭 기재 부탁드립니다.
										<br />50MB 이상일 시biz@art-map.co.kr로 전송 부탁드립니다
									</span>
								</div>
							</div>
						</div>
						<div class="row" style="margin-top: 40px;">
							<button type="button" onclick="saveEstimate()">견적서 저장</button>
							<button style="position: relative;" type="button"
								onclick="estimateLayerOpen()">
								아트맵에 보내기
								<div
									style="position: absolute; font-size: 14px; letter-spacing: -0.5px; color: #9f9f9f; font-weight: normal; white-space: nowrap; bottom: -8px; transform: translateY(100%); left: 0px;">답변은
									영업일 기준 1-3일 이내, 이메일로 완료됩니다.</div>
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>

		<div class="info"
			style="display: none; border-right: 2px solid #c7c7c7; box-sizing: border-box;">
			<div class="info__ttl" style='margin-bottom: 10px;'>C.바로 결제 하기</div>
			<div class="order__form">
				<div class="order__wrap">
					<div class="row" style="margin-bottom: 50px;">
						<div class="text__center sub">바로 결제는 선택 사항 입니다.</div>
					</div>
					<div class="row">
						<div class="pay__wrap"></div>
						<!--
                  <div>바로 결제 수단</div>
                  <div class="pay__wrap">
                       <input type="radio" id="SC0010" name="paymethod" value="card" class="option" checked>
                       <label for="SC0010" style="padding: 15px 50px; font-size: 16px; border-radius: 3px; margin-right: 8px;">카드</label>
                       <input type="radio" id="SC0060" name="paymethod" value="hp" class="option">
                       <label for="SC0060" style="padding: 15px 50px; font-size: 16px; border-radius: 3px;">휴대폰</label>
                  </div>
                  -->
						<div class="amount__wrap">
							<span style="font-size: 16px;">바로결제 가능 견적</span> <span
								id="orderAmount2" class="amount" style="font-size: 26px;">0원</span>
						</div>
					</div>
					<div class="row" style="margin-top: 30px;">
						<div class="pay__submit">
							<button type="button" onclick="on_order();">결제하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="layer">
			<div class="bg"></div>
			<div id="layer" class="pop" style="overflow: auto;">
				<div class="pop-container">
					<div class="pop-conts">
						<table style='width: 100%; margin: 0;' cellspacing=0 cellpadding=0>
							<thead>
								<tr>
									<th>저장시간</th>
									<th width=100></th>
									<th width=100></th>
								</tr>
							</thead>
							<tbody id="load_list_target" style="text-align: center;">
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>


	</div>

	<div id="estimate-layer" class="layer-transition">
		<div class="layer-container">
			<div class="layer-logo-area">
				<img src="/img/estimateLogo.png" />
			</div>
			<div class="layer-content-area">
				<p style="color: #ff6521;">*</p>
				<p>프로모션 진행 문의를 보내시면 전담팀에서 확인 후,</p>
				<p>진행 가능한 상품과 일정을 논의하여 답변드립니다.</p>
			</div>
			<div class="layer-check-area">
				<div class="custom-check-container">
					<label onClick="estimateLayerOnClick()"><div
							class="checkMask"></div> 네, 확인했습니다.</label>
				</div>
			</div>
		</div>
	</div>
	<!-- 푸터-->
	<c:import url="/WEB-INF/views/include/footer.jsp"/>

	<script src="./js/order_payment.js"></script>
	<script type="text/javascript" src="/js/jquery.js"></script>
	      <script>
	         function setPro(list,name,hp,email,info){
	            for(var i = 0; list.length > i; i++){
	               var idx = list[i].idx;
	               var cnt = list[i].cnt;
	               var options = list[i].options;
	               document.getElementById("cnt"+idx).value = cnt;
	
	               for(var j = 0; i < options.length; i++){
	                  var tr = document.querySelector("#promotion-"+ idx);
	                  var optionCheck = tr.querySelector(".options input[type=checkbox]:nth-child("+ (parseInt(options[i].index) + 1) +")");
	                  optionCheck.checked = true;
	               }
	
	            }
	            document.getElementById("name").value = name;
	            document.getElementById("hp").value = hp;
	            document.getElementById("email").value = email;
	            document.getElementById("info").value = info;
	            amount();
	            $('.layer').fadeOut();
	         };
	         function deletePro(idx){
	            var formData = new FormData();
	            formData.append('idx', idx);
	            formData.append('type', 'delete');
	            artmap_post("/order/artmap_pro.php",formData);
	         }
	
	         function estimateLayerOpen(){
	            var estimateLayer = document.querySelector("#estimate-layer");
	            estimateLayer.style.display = "flex";
	            estimateLayer.classList.add("active");
	         }
	         function estimateLayerOnClick(){
	            var estimateLayer = document.querySelector("#estimate-layer");
	            estimateLayer.style.display = "none";
	            estimateLayer.classList.remove("active");
	            send_artmap('send');
	         }
	
	         // window.onbeforeunload = function() {
	         //    // if (isDirty) {
	         //       return '데이터를 저장했는지 확인해주세요';
	         //    // }
	         //    // return undefined;
	         // }
	
	         (function($){
	            $(function(){
	               layerListEstimate();
	               $(".file-label").on("click", function(){
	
	                  $("#file").trigger("click");
	               });
	               $("#file").on('change',function(){
	                  var fileName = $("#file").val();
	                  console.log("fileName", fileName)
	                  $("#file-name").text(fileName);
	               });
	
	               $(".layer-container").on("click", function(ev){ev.stopPropagation()});
	               $("#estimate-layer").on("click", function(ev){
	                  var estimateLayer = document.querySelector("#estimate-layer");
	                  estimateLayer.style.display = "none";
	                  estimateLayer.classList.remove("active");
	               });
	            });
	         })(jQuery);
	      </script>
      </body>
</html>