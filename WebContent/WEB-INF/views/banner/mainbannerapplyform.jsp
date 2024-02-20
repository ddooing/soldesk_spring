<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="root" value="${pageContext.request.contextPath }" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="icon" type="image/x-icon" href="../img/ARTMEE_PAGELOGO.png" />

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet" />

<!-- Bootstrap core JS-->
<script   src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>


<!-- JQuery 자바스크립트-->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- CSS -->
<link href="../css/styles.css" rel="stylesheet" />


<!-- sweetalert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>	

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
      font-size: 13px;width: 50%;height: 20px;margin-right: 5px;}
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
   
</head>
<body id="page-top">
	<!-- 메뉴바 -->
	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div class="container" id="money">
		<div class="title">
			<img src="../img/ARTMEE.png" style="margin-top: 40px;">
			<button type="button" onclick="layer_open('layer');" class="m_mylist">
				<img src="../img/ARTMEE.png">
			</button>
		</div>
		<div class="subTitle">A. 상품</div>
		
		<table id="canvas-target-2" style="margin-left:150px;width: 1000px;" border='1' bordercolor=#c7c7c7 cellpadding=0 cellspacing=0>
			<thead style="text-align: center;">
				<th></th>
				<th>상품</th>
				<th>단가(원)</th>
				<th class='ccnt'>상품 수</th>
				<th>비고</th>
			</thead>
			<tbody>
				<tr id="promotion-40" class=" groupStart direct-N" style="height:100px;">
					<td style="width: 80px;" class="gray" rowspan="7">Web<br>광고
					</td>
					<td class="name">메인 배너</td>
					<td>  80,000(1일) </td>
					<td class="updown__list">
					<input type="text" value="0" id="days_count" data-idx=40 data-discount="N" data-direct="N" data-price=80000 class="count" id="cnt40" data-index="40" readonly="readonly"/>
					</td>
					<td style="display: none;" class="options"></td>
					<td style="display: none;" class="sample_price"></td>
					<td class="remarks">배너 사이즈 1200 x 400 (pix)<br /> 별도 요청이 없을
						경우 기본 포맷 디자인으로 제작되며, 기본 포맷 이외의 디자인을 요청할 시 비용이 추가됩니다.
					</td>
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
				<form:form action="${root }/banner/checkout" method="post" modelAttribute="applybannerBean" enctype="multipart/form-data" id="application-form">
				<form:hidden path="apply_person_id" value="${userinfoBean.user_id }"/>
				<form:hidden path="banner_type" value="1"/> 
				<form:hidden path="payment" id="payment" value=""/>	
						<div id="canvas-target-1">
							<div class="row">
								<div class="input__title">성함</div>
								<div class="input__wrap">
									<input type="text" name="name" id="name" disabled="disabled" readonly="readonly" value="${userinfoBean.name }">
								</div>
							</div>
							<div class="row">
								<div class="input__title">연락처</div>
								<div class="input__wrap">
									<input type="text" name="hp" id="hp" disabled="disabled" readonly="readonly" value="${userinfoBean.telephone }">
								</div>
							</div>
							<div class="row">
								<div class="input__title">이메일</div>
								<div class="input__wrap">
									<input type="text" name="email" id="email" disabled="disabled" readonly="readonly"
										value="${userinfoBean.email }">
								</div>
							</div>
							<div class="row">
								<div class="input__title">전시회</div>
								<div class="input__wrap">
									<form:select path="exhibition_id"  style="height:35px; float:left; width:330px; margin-top:3px;">
										<c:choose>
											<c:when test="${empty apply_personexhibitionlist }">
												<form:option value="0" disabled="true" required="required">신청한 전시회가 없습니다</form:option>
											</c:when>
											<c:otherwise>
												<c:forEach items="${apply_personexhibitionlist }" var="applyexhibitionlist">
													<form:option value="${applyexhibitionlist.exhibition_id }" required="required" >${applyexhibitionlist.title }</form:option>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</form:select>
								</div>
							</div>
							<div class="row">
								<div class="input__title">노출일자*</div>
								<div class="input__wrap">
									<div style="display: flex;">
										<form:input type="date" path="start_date" id="start_date" onchange="updateEndDateMinimum()" required="required" style="width:43%; margin-right:10px; font-size:15px;"/> ~
										<form:input type="date" path="end_date" id="end_date" onchange="calculateDaysAndUpdate()" required="required" style="width:43%; margin-left:10px; font-size:15px;"/>
									</div>
									<span class="sub__txt" style="white-space: nowrap; text-align: left;">
										신청은 익일부터 최소 1일 이상 신청 가능합니다
									</span>
								</div>
							</div>
							
							<div class="row">
								<div class="input__title">문의내용*</div>
								<div class="input__wrap">
									<form:textarea path="command" id="info" placeholder="요청사항을 입력해주세요" required="required"/>
								</div>
							</div>
							<div class="row file-row" style="margin-bottom: 5px;">
								<div class="input__title">파일첨부*</div>
								<div class="input__wrap" style="overflow: hidden;">
									<label class="file-label" for="file">
										<form:input path="banner_file" type="file" id="file" accept="image/*"  onchange="updateFileName()" required="required"/>
										<div class="button">파일 선택</div> 
										<span id="file-name">선택된 파일 없음</span>
									</label>
								</div>
							</div>
							<div class="row file-row">
								<div class="input__title"></div>
								<div class="input__wrap">
									<span class="sub__txt" style="white-space: nowrap; text-align: left;">
										*전시회 텍스트, 포스터, 전시 전경 및 작품 이미지 등 첨부바랍니다.<br />
										*이미지명 : "작품명_노출기간"로 기재바랍니다.<br /> 
										<br /> 
										<br />자료 미전달 시 답변이 어려우며, 아직 확정된 자료가 없다면 문의란에 꼭 기재 부탁드립니다.
									</span>
								</div>
							</div>
						</div>
						<div class="row" style="margin-top: 40px;">
							<button type="button" onclick="window.location.href='${root}/view/index'">돌아가기</button>
							<button style="position: relative;" type="button" id="submit-button">
								결제하기
								<div style="position: absolute; font-size: 14px; letter-spacing: -0.5px; color: #9f9f9f; font-weight: normal; white-space: nowrap; bottom: -8px; transform: translateY(100%); left: 0px;">답변은
									영업일 기준 1-3일 이내, 이메일로 안내됩니다.</div>
							</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
		</div>
		
		
		
			<script>
					function submitApplication() {
					    var requiredInputs = document.querySelectorAll('#application-form [required]');
					    var exhibitionSelect = document.getElementById('exhibition_id');
	
					    if (exhibitionSelect.options.length === 0 || exhibitionSelect.options[0].value === "0") {
					        Swal.fire({
					            title: '알림',
					            text: '신청할 수 있는 전시회가 없습니다!',
					            icon: 'warning',
					            confirmButtonText: '확인'
					        });
					        return;
					    }
	
					    for (var i = 0; i < requiredInputs.length; i++) {
					        if (!requiredInputs[i].value.trim()) {
					            Swal.fire({
					                title: '경고!',
					                text: '필수 부분을 모두 입력해주세요.',
					                icon: 'warning',
					                confirmButtonText: '확인'
					            });
					            return;
					        }
					    }
	
					    Swal.fire({
					        title: '견적을 신청하시겠습니까?',
					        showCancelButton: true,
					        confirmButtonText: '신청',
					        cancelButtonText: '취소',
					        icon: 'question'
					    }).then((result) => {
					        if (result.isConfirmed) {
					            document.getElementById('application-form').submit();
					        }
					    });
					}
	
					document.getElementById('submit-button').addEventListener('click', submitApplication);		
			</script>		
		
			<script>
			    function updateFileName() {
			        var input = document.getElementById('file');
			        var fileNameSpan = document.getElementById('file-name');
			
			        if (input.files && input.files.length > 0) {
			            var fileName = input.files[0].name;
			
			            if (fileName.length > 15) {
			                fileName = fileName.substring(0, 20) + "...";
			            }
			
			            fileNameSpan.textContent = fileName;
			        } else {
			            fileNameSpan.textContent = '선택된 파일 없음';
			        }
			    }
			</script>


			<script>
			
			document.addEventListener('DOMContentLoaded', function() {
			    setStartDateToTomorrow();
			    updateEndDateMinimum();
			});

			function setStartDateToTomorrow() {
			    var today = new Date();
			    var tomorrow = new Date(today.getTime() + (24 * 60 * 60 * 1000));
			    var tomorrowFormatted = tomorrow.toISOString().split('T')[0];
			    document.getElementById('start_date').setAttribute('min', tomorrowFormatted);
			    document.getElementById('start_date').value = tomorrowFormatted;
			}

			function updateEndDateMinimum() {
			    var startDate = document.getElementById('start_date').value;
			    var nextDay = new Date(new Date(startDate).getTime() + (24 * 60 * 60 * 1000)); 
			    var nextDayFormatted = nextDay.toISOString().split('T')[0];
			    document.getElementById('end_date').setAttribute('min', nextDayFormatted);
			}
			
			function calculateDaysAndUpdate() {
			    var startDate = document.getElementById('start_date').value;
			    var endDate = document.getElementById('end_date').value;
			    var unitPrice = 80000; // 단가
			
			    if (startDate && endDate) {
			        var start = new Date(startDate);
			        var end = new Date(endDate);
			        var timeDiff = end - start;
			        var daysDiff = Math.ceil(timeDiff / (1000 * 60 * 60 * 24));
			
			        var totalPrice = daysDiff * unitPrice;
			        document.getElementById('days_count').value = daysDiff; 
			        updateAllAmount(totalPrice); // 총액 업데이트
			    }
			}
			
			function updateAllAmount(totalPrice) {
			    var allAmountElement = document.getElementById("allAmount");
			    allAmountElement.textContent = totalPrice.toLocaleString() + "원";
			
			    document.getElementById("payment").value = totalPrice;
			}
			
			</script>
	
			   <!-- 결제 실패 -->
		    <c:if test="${not empty failmsg}">
		        <script>
		        Swal.fire({
		            title: "결제 실패",
		            html: "${failmsg} <br><br> 신청을 다시 진행해주세요.",
		            icon: "error",
		            confirmButtonColor: "#4F6F52",
		            confirmButtonText: "확인"
		        });
		
		    </script>
		    </c:if>   	      
      </body>

</html>