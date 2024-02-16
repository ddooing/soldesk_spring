<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>ARTMEE</title>
<link rel="icon" type="image/x-icon" href="../img/ARTMEE_PAGELOGO.png" />

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

<!-- sweet alert 2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- CSS -->
<link href="../css/styles.css" rel="stylesheet" />

<!-- Carousel 자바스크립트-->
<script src='https://www.gmarwaha.com/script/lib/jquery-1.11.1.js'></script>
<script src="https://www.gmarwaha.com/script/lib/jquery.easing-1.3.js"></script>
<script
	src="https://www.gmarwaha.com/script/lib/jquery.easing.compatibility.js"></script>
<script
	src="https://www.gmarwaha.com/script/lib/jquery.mousewheel-3.1.12.js"></script>
<script
	src="https://www.gmarwaha.com/jquery/jcarousellite/script/jquery.jcarousellite.js"></script>

<script>
	$(document)
			.ready(
					function() {
						// enroll_second, enroll_third, enroll_forth, enroll_fifth 숨김
						$(
								"#enroll_second, #enroll_third, #enroll_forth, #enroll_fifth")
								.hide();

						function scrollToTop() {
							window.scrollTo(0, 0);
						}

						$("#first_nextButton").click(function() {
							$("#enroll_first").hide();
							$("#enroll_second").show();
							scrollToTop();
						});

						$("#second_nextButton").click(
								function() {
									if ($("#title").val() && $("#place").val()
											&& $("#price").val()
											&& $("#exhibition_start").val()
											&& $("#exhibition_end").val()
											&& $("#open_time").val()
											&& $("#close_time").val()
											&& $("#author").val()
											&& $("#address").val() ) {
										$("#enroll_second").hide();
										$("#enroll_third").show();
										scrollToTop();
									} else {
										Swal.fire({
											icon : "error",
											title : "오류!",
											text : "필수부분을 입력해주세요",
										});
									}
								});

						$("#third_nextButton").click(function() {
							if($("#file1").val()&&$("#file2").val){
								$("#enroll_third").hide();
								$("#enroll_forth").show();
								scrollToTop();	
							} else {
								Swal.fire({
									icon : "error",
									title : "오류!",
									text : "필수파일을 입력해주세요",
								});
							}
						});

						$("#re_check").click(function() {
							$("#enroll_forth").hide();
							$("#enroll_first").show();
							scrollToTop();
						});

						$("#come_back").click(function() {
							window.location.href = '${root}/view/index';
						});
					});
</script>


<style>
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

.filebox .upload-name1, .filebox .upload-name2 {
	display: inline-block;
	height: 40px;
	padding: 0 10px;
	vertical-align: middle;
	border: 1px solid #dddddd;
	width: 78%;
	color: #999999;
	width: 300px;
}

.filebox label {
	display: inline-block;
	padding: 10px 20px;
	color: #fff;
	vertical-align: middle;
	background-color: #999999;
	cursor: pointer;
	height: 40px;
	margin-left: 10px;
}

.filebox input[type="file"] {
	position: absolute;
	width: 0;
	height: 0;
	padding: 0;
	overflow: hidden;
	border: 0;
}

input[type="number"]::-webkit-inner-spin-button, input[type="number"]::-webkit-outer-spin-button
	{
	-webkit-appearance: none;
	appearance: none;
	margin: 0;
}
</style>

</head>

<body id="page-top">

	<c:import url="/WEB-INF/views/include/header.jsp" />

	<!--등록 페이지 1 ~ 5 단계-->

	<section style="margin-top: 150px;" id="enroll_first">
		<center>
			<img src="../img/ARTMEE.png" alt="아트미 로고"
				style="width: 300px; height: 140px;" /> <br />
			<br />
			<h4>전시회 등록을 환영합니다!</h4>
			<h4>아트미 전시회 등록은 검토를 거쳐 아트미 웹페이지에 게시됩니다.</h4>
			<br />
			<br /> <img src="../img/enroll/enroll_firstimg.png" alt="등록 첫번째"
				style="width: 450px; height: 110px;" /> <br />
			<br />
			<div
				style="width: 700px; height: 700px; border: 1px solid lightgray; border-radius: 5%;">

				<b
					style="float: left; margin-left: 40px; margin-top: 50px; font-size: 30px;">1.
					신청인 정보</b>


				<div class="form-group" style="margin-top: 140px;">
					<label for="apply_name"
						style="width: 150px; display: inline-block; font-size: 20px;">이름*</label>
					<input type="text" id="apply_name" value="${getLoginUserAllInfo.name }" style="width: 400px;"
						readonly="readonly" disabled="disabled" />
				</div>
				<div class="form-group" style="margin-top: 30px;">
					<label for="apply_email"
						style="width: 150px; display: inline-block; font-size: 20px;">이메일*</label>
					<input type="text" id="apply_email" value="${getLoginUserAllInfo.email }" style="width: 400px;"
						readonly="readonly" disabled="disabled" />
				</div>
				<div class="form-group" style="margin-top: 30px;">
					<label for="apply_telephone"
						style="width: 150px; display: inline-block; font-size: 20px;">전화번호*</label>
					<input type="text" id="apply_telephone" value="${getLoginUserAllInfo.telephone }"
						style="width: 400px;" readonly="readonly" disabled="disabled" />
				</div>

				<b
					style="float: left; margin-left: 40px; margin-top: 50px; font-size: 20px;">1-2.
					약관 동의*</b> <br />
				<br />
				<br />
				<br />
				<br /> <a style="font-size: 20px;">견적 제공을 위해 약관을 동의해 주세요! <a
					style="margin-left: 30px; font-size: 20px; color: blue; cursor: pointer;"
					data-bs-toggle="modal" data-bs-target="#termsModal">약관 확인</a></a> <br />
				<br />
				<br />

				<div class="form-check">
					<input type="checkbox" id="agree"
						style="width: 17px; height: 17px; margin-right: 15px;" required />
					<label for="agree" style="font-size: 20px;">개인정보 취급 방침에
						동의합니다.</label>
				</div>

				<div style="margin-top: 90px;">
					<button type="button"
						style="width: 400px; border: 0.5px solid lightgray; font-size: 20px;"
						id="first_nextButton" class="btn btn-light">다음</button>
				</div>

			</div>
		</center>
	</section>

	<script>
		// 개인정보 동의 안할시 버튼 활성화 x
		$(document).ready(function() {
			$("#first_nextButton").prop('disabled', true);

			$("#agree").change(function() {
				if (this.checked) {
					$("#first_nextButton").prop('disabled', false);
				} else {
					$("#first_nextButton").prop('disabled', true);
				}
			});
		});
	</script>

	<form:form method="post" action="${root }/exhibition/Exhibition_Enroll_pro" id="form"
		modelAttribute="addExhibitionDetailBean" enctype="multipart/form-data">
		<form:hidden path="apply_person" value="${loginUserBean.user_id }"/>
		<section style="margin-top: 150px;" id="enroll_second">
			<center>
				<img src="../img/ARTMEE.png" alt="아트미 로고"
					style="width: 300px; height: 140px;" /> <br />
				<br /> <img src="../img/enroll/enroll_secondimg.png" alt="등록 두번째"
					style="width: 450px; height: 110px;" /> <br />
				<br />
				<div style="width: 750px; height: 850px; border: 1px solid lightgray; border-radius: 5%;">

					<div style="float: left; margin-left: 50px; margin-top: 50px; display: flex; align-items: baseline;">
								<h3>2.전시회등록</h3>
								<p style="margin-left: 20px; color: #888888">* 표시는 필수항목입니다</p>
					</div>
					
					<div class="form-group" style="margin-top: 140px;">
						<label for="title" style="width: 150px; display: inline-block; font-size: 20px;">전시명*</label>
						<form:input path="title" id="title" style="width: 400px;" required="required" />
					</div>
					
					<div class="form-group" style="margin-top: 30px;">
						<label for="place" style="width: 150px; display: inline-block; font-size: 20px;">전시관*</label>
						<form:input path="place" id="place" style="width:400px;" required="required" />
					</div>

					<div class="form-group" style="margin-top: 30px;">
						<label for="author" style="width: 150px; display: inline-block; font-size: 20px;">작가*</label>
						<form:input path="author" style="width: 400px;" id="author" />
					</div>
					
					<div class="form-group" style="margin-top: 30px; margin-left:70px;">
						<label for="address" style="width: 150px; display: inline-block; font-size: 20px;">주소*</label>
						<form:input path="address" id="address" style="width: 400px;" readonly="true" />
						<input type="button" style="margin-left:10px; border: 0.5px solid lightgray;" class="btn btn-light" onclick="sample4_execDaumPostcode()" value="검색"><br>
					</div>
					
					<div class="form-group" style="margin-top: 30px;">
						<label for="price" style="width: 150px; display: inline-block; font-size: 20px;">가격*</label>
						<form:input type="number" path="price" id="price" style="width:365px; margin-right:10px;" required="required" />원
					</div>
					
					<div class="form-group" style="margin-top: 30px;">
						<label for="exhibition_start" style="width: 150px; display: inline-block; font-size: 20px;">전시기간*</label>
						<form:input path="exhibition_start" id="exhibition_start" type="date" style="width: 180px; margin-right: 10px;" required="required" />
						~
						<form:input path="exhibition_end" id="exhibition_end" type="date" style="width: 180px; margin-left: 10px;" required="required" />
					</div>

					<div class="form-group" style="margin-top: 30px;">
						<label for="exhibition_start_time" style="width: 150px; display: inline-block; font-size: 20px;">운영시간*</label>
							<form:input path="open_time" id="open_time" type="time" style="width: 180px; margin-right: 10px;" required="required" />
							~
							<form:input path="close_time" id="close_time" type="time" style="width: 180px; margin-left: 10px;" required="required" />
					</div>

					<div class="form-group" style="margin-top: 30px;">
						<label for="holiday" style="width: 150px; display: inline-block; font-size: 20px;">휴무일</label>
						<form:input path="holiday" id="holiday" style="width:400px;" />
					</div>
					
					<div class="form-group" style="margin-top: 30px;">
						<label for="site" style="width: 150px; display: inline-block; font-size: 20px;">사이트</label>
						<form:input path="site" id="site" style="width: 400px;" />
					</div>

					<div style="margin-top: 90px;">
						<button type="button" style="width: 400px; border: 0.5px solid lightgray; font-size: 20px;" id="second_nextButton" class="btn btn-light">다음</button>
					</div>
				</div>
			</center>
		</section>

		<script>
			// 시간 validation
			var start = document.getElementById('exhibition_start');
			var end = document.getElementById('exhibition_end');
			
			end.addEventListener('change', function() {
				if (end.value < start.value) {
					Swal.fire({
						  icon: "error",
						  title: "날짜 선택 오류",
						  text: "종료 날짜는 시작 날짜보다 이전일 수 없습니다!",
						});
					end.value = start.value;
				}
			});
			
			// 시간 validation
			var start_time = document.getElementById('open_time');
			var close_time = document.getElementById('close_time');
			
			close_time.addEventListener('change', function() {
				if(close_time.value < start_time.value) {
					Swal.fire({
						  icon: "error",
						  title: "시간 선택 오류",
						  text: "종료 시간은 시작 시간보다 이전일 수 없습니다!",
						});
					close_time.value = start_time.value;
				}
			});
			
			// 가격 validation
			var priceInput = document.getElementById("price");

		    priceInput.addEventListener("input", function() {
		        var value = priceInput.value;
		        
		        value = value.replace(/[^0-9]/g, "");
		        
		        if (value.length > 0 && value.charAt(0) === "0") {
		            value = value.substring(1);
		        }
		        
		        priceInput.value = value;
		    });
		</script>
		
		<!-- 주소 검색 -->
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
		    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		    function sample4_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var roadAddr = data.roadAddress; // 도로명 주소 변수
		                var extraRoadAddr = ''; // 참고 항목 변수
		
		                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    extraRoadAddr += data.bname;
		                }
		                // 건물명이 있고, 공동주택일 경우 추가한다.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                if(extraRoadAddr !== ''){
		                    extraRoadAddr = ' (' + extraRoadAddr + ')';
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById("address").value = roadAddr;
		
		            }
		        }).open();
		    }
		</script>
		

		<section style="margin-top: 150px;" id="enroll_third">
			<center>
				<img src="../img/ARTMEE.png" alt="아트미 로고"
					style="width: 300px; height: 140px;" /> <br />
				<br /> <img src="../img/enroll/enroll_thirdimg.png" alt="등록 세번째"
					style="width: 450px; height: 110px;" /> <br />
				<br />
				<div
					style="width: 700px; height: 500px; border: 1px solid lightgray; border-radius: 5%;">

					<b
						style="float: left; margin-left: 40px; margin-top: 50px; font-size: 30px;">3.
						첨부파일 업로드</b> <br />
					<br />
					<br />
					<br /> <b
						style="float: left; margin-left: 140px; margin-top: 30px; font-size: 20px;">메인
						포스터</b> <br />
					<br />
					<br />
					<div class="filebox" style="margin-top: 15px;">
						<input class="upload-name1" value="첨부파일" placeholder="첨부파일">
						<label for="file1">파일찾기</label>
						<form:input type="file" path="main_poster_file" id="file1"
							name="main_poster"  />
					</div>
					<b
						style="float: left; margin-left: 140px; margin-top: 30px; font-size: 20px;">상세
						포스터</b> <br />
					<br />
					<br />
					<div class="filebox" style="margin-top: 15px;">
						<input class="upload-name2" value="첨부파일" placeholder="첨부파일">
						<label for="file2">파일찾기</label>
						<form:input path="detail_poster_file" type="file" id="file2" />
					</div>

					<div style="margin-top: 90px;">
						<button type="button"
							style="width: 400px; border: 0.5px solid lightgray;"
							id="third_nextButton" class="btn btn-light">다음</button>
					</div>
				</div>
			</center>
		</section>


		<script>
			// input="file" 부분 파일이름으로 변경되게 하는 스크립트
			$("#file1").on(
					'change',
					function() {
						var filePath = $("#file1").val();
						var fileName = filePath.substring(filePath
								.lastIndexOf("\\") + 1);
						$(".upload-name1").val(fileName);
					});

			$("#file2").on(
					'change',
					function() {
						var filePath = $("#file2").val();
						var fileName = filePath.substring(filePath
								.lastIndexOf("\\") + 1);
						$(".upload-name2").val(fileName);
					});
		</script>



		<section style="margin-top: 150px;" id="enroll_forth">
			<center>
				<img src="../img/ARTMEE.png" alt="아트미 로고"
					style="width: 300px; height: 140px;" /> <br />
				<br /> <img src="../img/enroll/enroll_forthimg.png" alt="등록 네번째"
					style="width: 450px; height: 110px;" /> <br />
				<br />
				<div
					style="width: 700px; height: 400px; border: 1px solid lightgray; border-radius: 5%;">

					<b
						style="float: left; margin-left: 40px; margin-top: 50px; font-size: 30px;">4.
						확인</b> <br />
					<br />
					<br />
					<br />
					<br />
					<br /> <b style="margin-top: 400px; font-size: 25px;">입력하신 정보로
						전시회가 등록됩니다</b>

					<div style="margin-top: 70px;">
						<button type="button"
							style="width: 400px; border: 0.5px solid lightgray;"
							id="re_check" class="btn btn-light">한번 더 확인해 볼게요</button>
					</div>

					<div style="margin-top: 40px;">
						<button type="button"
							style="width: 400px; border: 0.5px solid lightgray;" onclick="submit_fn();"
							id="forth_nextButton" class="btn btn-light">등록</button>
					</div>
				</div>
			</center>
		</section>
		<!--폼여기서 닫았음!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
	</form:form>




	<!-- 모달 창 -->
	<div class="modal fade" id="termsModal" tabindex="-1"
		aria-labelledby="termsModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="termsModalLabel">개인정보 취급 방침</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<h6>	1. 개인정보의 처리 목적</h6>
    				<br><br>
					<p>고객은 사이트 회원 가입시 회원 약관, 개인정보 수집 및 이용 내용에 대해 「동의함」 버튼을 클릭할 수 있는 절차를 마련하여, 「동의함」 버튼을 클릭하면 개인정보 수집 및 이용에 대해 동의한 것으로 봅니다.</p><br/>
					<p>아트미는 다음의 목적을 위하여 개인정보를 처리하고 있으며, 다음의 목적 이외의 용도로는 이용하지 않습니다. - 고객 가입의사 확인, 고객에 대한 서비스 제공에 따른 본인 식별.인증, 회원자격 유지.관리, 서비스 이용 및 상담, 공지사항 전달, 서비스 공급에 따른 금액 결제, 서비스의 공급, 제작상품 연계서비스 제공 등</p>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	function submit_fn() {
	    var form = document.querySelector("form"); // 폼 요소를 가져옵니다.

	    Swal.fire({
	        title: "전시회를 등록하시겠습니까?",
	        showCancelButton: true,
	        icon: "info",
	        confirmButtonText: "등록",
	        cancelButtonText: "취소"
	    }).then((result) => {
	        if (result.isConfirmed) {
	            form.submit();
	        }
	    });
	}
	</script>

	<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>

</html>