<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="icon" type="image/x-icon" href="../img/ARTMEE_PAGELOGO.png" />
<title>관리자 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="../css/styles_manager.css" rel="stylesheet" />
<!--부트스트랩 아이콘 사용-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"
	rel="stylesheet">

<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
	
<!-- sweetalert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>	

<!-- JQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<script>
						function previewImage(event) {
							  var reader = new FileReader();
							  reader.onload = function() {
							    var preview = document.getElementById('preview');
							    preview.src = reader.result;
							    preview.style.display = 'block';
							  }
							  reader.readAsDataURL(event.target.files[0]);
							}
						</script>
	
	<style>
.filebox .upload-name {
	display: inline-block;
	height: 40px;
	padding: 0 10px;
	vertical-align: middle;
	border: 1px solid #dddddd;
	width: 40%;
	color: #999999;
	
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

.filebox1 .upload-name1 {
	display: inline-block;
	height: 80px;
	padding: 0 10px;
	vertical-align: middle;
	border: 1px solid #dddddd;
	
	color: #999999;
	
}

.filebox1 label {
	display: inline-block;
	padding: 10px 20px;
	color: #fff;
	vertical-align: middle;
	background-color: #999999;
	cursor: pointer;
	height: 40px;
	margin-left: 10px;
}

.filebox1 input[type="file"] {
	position: absolute;
	width: 0;
	height: 0;
	padding: 0;
	overflow: hidden;
	border: 0;
}
</style>

</head>

<body class="sb-nav-fixed">
		<c:import url="/WEB-INF/views/include/admin_header.jsp" />

		
		<!--실제 내용(대시보드) 부분-->
		<div id="layoutSidenav_content">
			<main style="background-color: ivory;">
				<div class="container-fluid px-4">
					<div style="margin-top: 30px;">
						<h3>전시회 수정</h3>
					</div>
					<div style="position: relative; display: flex; justify-content: center; margin:10px; height: 80px; align-items: center; border: 0.2px solid black; background-color: white; margin-top: 20px;">
						
						
						<form action="${root }/admin/manager_exhibitionlist" method="get">
							<select name="exhibitioncombo" id="exhibitioncombo"
								style="width: 150px; height: 40px; margin-right: 30px;">
								<option value="" disabled selected>검색조건선택</option>
								<option value="author">작가</option>
								<option value="title">제목</option>
							</select> <input type="text" name="exhibitionsearch" id="exhibitionsearch"
								style="width: 500px; height: 40px; margin-right: 30px;"
								placeholder="검색어를 입력해주세요" />
							<button class="btn btn-dark" style="width: 80px; height: 40px;">검색</button>
						</form>
					</div>

					<form:form action="${root }/admin/exhibition_exhibitionmodify_pro" method="post" modelAttribute="DetailExhibitionBean" enctype="multipart/form-data" id="myForm">
					<form:hidden path="exhibition_id"/>
					<form:hidden path="main_poster_file_id"/>
					<form:hidden path="detail_poster_file_id"/>
					<div style="display: flex; width: 100%;">
						<div style="flex: 1; margin: 10px; border: 1px solid black;  background-color: white;">
							<div style="align-items: center; margin: 30px; border: 0.2px solid black; width: 600px; margin-left: auto; margin-right: auto;">
							<h3 style="margin-top:20px; margin-left:15px;">포스터 이미지 변경</h3>
							  <img src="${DetailExhibitionBean.main_poster_path }${DetailExhibitionBean.main_poster_name }" id="poster" alt="포스터" style="margin-left: auto; margin-right: auto; display: block; margin-top: 30px; margin-bottom: 10px; width: 250px; height: 350px;" />
								  <div class="filebox" style="margin-top: 25px; margin-left:auto; margin-right:auto; text-align: center; margin-bottom: 20px;">
								    <input class="upload-name" value="${DetailExhibitionBean.main_poster_name }">
								    <label for="file">파일찾기</label>
								    <form:input type="file" id="file" path="main_poster_file" value="${DetailExhibitionBean.main_poster_path }${DetailExhibitionBean.main_poster_name }" onchange="updateImage(event)" accept="image/*"/>
								  </div>
							</div>
							
							<script>
							  function updateImage(event) {
							    var input = event.target;
							    if (input.files && input.files[0]) {
							      var reader = new FileReader();
							      reader.onload = function(e) {
							        var imgElement = document.getElementById("poster");
							        imgElement.setAttribute("src", e.target.result);
							      }
							      reader.readAsDataURL(input.files[0]);
							    }
							  }
							  
							  $("#file").on('change', function() {
								    var fileName = $(this).val().split('\\').pop();
								    $(".upload-name").val(fileName);
								});
							</script>

							<div style="margin-top: 50px; text-align: center;">
								<h3 style="margin-left: 100px; margin-top: 60px; text-align: left;">전시회 제목*</h3>
								<form:input path="title"
									style="background-color: transparent; border: none; border-bottom: 1px solid black; width: 600px; margin-top: 20px; font-size:20px;" required="required"/>
								<h3 style="margin-left: 100px; margin-top: 35px; text-align: left;">신청인</h3>
								<form:input path="apply_name"  style="background-color: transparent; border: none; border-bottom: 1px solid black; width: 600px; margin-top: 20px; font-size:20px;" readonly="true" disabled="true"/>		
								<h3 style="margin-left: 100px; margin-top: 35px; text-align: left;">전화번호</h3>
								<form:input id="apply_telephone" path="apply_telephone" style="background-color: transparent; border: none; border-bottom: 1px solid black; width: 600px; margin-top: 20px; font-size:20px;" readonly="true" disabled="true"/>		

								
							</div>
							
							
							
						</div>
						
							
							<div style="flex: 1; margin: 10px; border: 1px solid black;  background-color: white;">
								<div style="margin-left: 50px; margin-top: 30px; display: flex; align-items: baseline;">
									<h3>전시회 상세정보</h3>
									<p style="margin-left: 20px; color: #888888">* 표시는 필수항목입니다</p>
								</div>
									<table class="table table-hover table-borderless" style="margin-top:50px; width:700px; margin-left:auto; margin-right:auto; vertical-align:middle;" >
									<tr style="height: 80px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">등록일자</th>
  										<td style="width:400px;">
  											<form:input id="regdate" path="regdate" style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;" readonly="true" disabled="true" />
  										</td>
  									</tr>
  									<tr style="height: 80px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">공개여부*</th>
  										<td style="width:400px;">
  											<div style="text-align: center;">
	  											<c:choose>
	  												<c:when test="${DetailExhibitionBean.state == 1 }">
	  													<form:radiobutton path="state" id="view" value="1" style="width: 15px; height: 15px;"  checked="checked" required="required"/>
													    <label for="view" style="margin-right: 50px; font-size: 20px; margin-left:20px;">공개</label>
													    <form:radiobutton path="state" id="noview" value="2" style="width: 15px; height: 15px;" required="required"/> 
													    <label for="noview" style="font-size: 20px; margin-left:20px;">비공개</label>
	  												</c:when>
	  												
	  												<c:when test="${DetailExhibitionBean.state == 2 }">
	  													<form:radiobutton path="state" id="view" value="1" style="width: 15px; height: 15px;" required="required"/> 
													    <label for="view" style="margin-right: 50px; font-size: 20px; margin-left:20px;">공개</label>
													    <form:radiobutton path="state" id="noview" value="2" style="width: 15px; height: 15px;"  checked="checked" required="required"/> 
													    <label for="noview" style="font-size: 20px; margin-left:20px;">비공개</label>
	  												</c:when>
	  												
	  												<c:otherwise>
	  													<form:radiobutton path="state" id="view" value="1" style="width: 15px; height: 15px;" required="required"/> 
													    <label for="view" style="margin-right: 50px; font-size: 20px; margin-left:20px;">공개</label>
													    <form:radiobutton path="state" id="noview" value="2" style="width: 15px; height: 15px;" required="required"/> 
													    <label for="noview" style="font-size: 20px; margin-left:20px;">비공개</label>
	  												</c:otherwise>
	  											</c:choose>
	  											
											</div>
  										</td>
  									</tr>
  									<tr style="height: 80px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">작가*</th>
  										<td style="width:400px;">
  											<form:input path="author" style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;"/>
  										</td>
  									</tr>
  									<tr style="height: 80px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">예매 가격*</th>
  										<td style="width:400px;">
  											<form:input path="price" style="border:none; border-bottom: 1px solid black; width:95%; text-align: right; font-size: 20px;"/>원
  										</td>
  									</tr>
  									<tr style="height: 80px;">
									<th style="width: 200px; text-align: center; font-size: 20px;">전시일
										*</th>
									<td style="width: 400px;">
										<div style="display: flex;">
											<form:input type="date" id="exhibition_start"
												path="exhibition_start" onchange="validateDate()"
												style="border:none; border-bottom: 1px solid black; width:200px; text-align: center; font-size: 20px; margin-right:35px;"
												required="required" />
											~
											<form:input type="date" id="exhibition_end"
												path="exhibition_end" onchange="validateDate()"
												style="border:none; border-bottom: 1px solid black; width:200px; text-align: center; font-size: 20px;margin-left:35px;"
												required="required" />
										</div>
									</td>
								</tr>
								<tr style="height: 80px;">
										<th style="width: 200px; text-align: center; font-size: 20px;">운영시간
											*</th>
										<td style="width: 400px;">
											<div style="display: flex;">
												<form:input type="time" id="open_time" path="open_time"
													style="border:none; border-bottom: 1px solid black; width:200px; text-align: center; font-size: 20px; margin-right:35px;"
													onchange="validateTime()" required="required" />
												~
												<form:input type="time" id="close_time" path="close_time"
													style="border:none; border-bottom: 1px solid black; width:200px; text-align: center; font-size: 20px;margin-left:35px;"
													onchange="validateTime()" required="required" />
											</div>
										</td>
									</tr>
								
  									<tr style="height: 80px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">전시관*</th>
  										<td style="width:400px;">
  											<form:input path="place" style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;" required="required"/>
  										</td>
  									</tr>
  									<tr style="height: 80px;">
										<th style="width: 200px; text-align: center; font-size: 20px;">주소*</th>
										<td style="width: 400px;">
											<div style="display: flex;">
												<form:input path="address"
													style="border:none; border-bottom: 1px solid black; width:80%; margin-right:10px; text-align: right; font-size: 20px;"
													readonly="true" required="required" />
												<button class="btn btn-dark" style="height: 50px; width: 15%"
													type="button" onclick="sample4_execDaumPostcode();">검색</button>
											</div>
										</td>
									</tr>
  									<tr style="height: 80px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">휴무일</th>
  										<td style="width:400px;">
  											<form:input path="holiday" style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;"/>
  										</td>
  									</tr>
  									
  									<tr style="height: 80px;">
  										<th style="width:200px; text-align: center; font-size: 20px;">사이트</th>
  										<td style="width:400px;">
  											<form:input path="site" style="border:none; border-bottom: 1px solid black; width:100%; text-align: right; font-size: 20px;"/>
  										</td>
  									</tr>
  									
  									<tr style="height: 80px;">
									    <th style="width: 200px; text-align: center; font-size: 20px;">상세 포스터*</th>
									    <td style="height:80px; display: flex; align-items: center; justify-content: center;" class="filebox1">
									       
									            <input class="upload-name1" value="${DetailExhibitionBean.detail_poster_name }" style="margin-bottom: 0; height:40px; width:250px;">
									            <label for="file1" style="margin-bottom: 0;">파일찾기</label>
									            <form:input path="detail_poster_file" value="${DetailExhibitionBean.detail_poster_path}${DetailExhibitionBean.detail_poster_name}" type="file" id="file1" accept="image/*"/>
									       
									    </td>
									</tr>

								</table>
									
								<script>
							 $("#file1").on('change', function() {
								    var fileName = $(this).val().split('\\').pop();
								    $(".upload-name1").val(fileName);
								});
							</script>
							</div>
						</div>
						<div style="float:right; margin-right:30px; margin-top:20px; margin-bottom:50px;">
						<a href="${root }/admin/manager_exhibitionlist" class="btn btn-danger" style="width:70px; margin-right:10px;">취소</a>
						<button type="button" class="btn btn-dark" style="width:70px;" onclick="showConfirmation();">수정</button>
						</div>
						</form:form>
					</div>
						
						
			
				</div>
				
				
				
				<script>
					function validateTime() {
					    var openTime = document.getElementById('open_time').value;
					    var closeTime = document.getElementById('close_time').value;
					    
					    // 시간이 모두 입력된 경우에만 검증
					    if(openTime && closeTime) {
					        // Date 객체를 사용하여 시간을 비교합니다.
					        var startTime = new Date('1970-01-01T' + openTime + 'Z');
					        var endTime = new Date('1970-01-01T' + closeTime + 'Z');
					        
					        // 종료 시간이 시작 시간보다 이를 경우
					        if(endTime <= startTime) {
					            Swal.fire({
					            	  icon: "error",
					            	  title: "오류",
					            	  text: "종료 시간은 시작 시간보다 빠를 수 없습니다.",
					            	});
					            document.getElementById('close_time').value = openTime; // 종료 시간 초기화
					        }
					    }
					}
					
					function validateDate() {
					    var startDate = document.getElementById('exhibition_start').value;
					    var endDate = document.getElementById('exhibition_end').value;
					    
					    // 날짜가 모두 입력된 경우에만 검증
					    if(startDate && endDate) {
					        // 날짜 객체로 변환하여 비교합니다.
					        var start = new Date(startDate);
					        var end = new Date(endDate);
					        
					        // 종료 날짜가 시작 날짜보다 이를 경우
					        if(end < start) {
					            Swal.fire({
					                icon: "error",
					                title: "오류",
					                text: "종료 날짜는 시작 날짜보다 빠를 수 없습니다.",
					            });
					            document.getElementById('exhibition_end').value = startDate; // 종료 날짜 초기화
					        }
					    }
					}
				</script>
				
				<script>
					function showConfirmation() {
					  // 폼 요소를 가져옵니다.
					 var form = document.getElementById("myForm");
					  
					  Swal.fire({
					    title: "전시회를 수정하시겠습니까?",
					    showCancelButton: true,
					    icon: "warning",
					    confirmButtonText: "수정",
					    cancelButtonText: "취소"
					  }).then((result) => {
					    if (result.isConfirmed) {
					      // 폼의 유효성을 체크합니다.
					      if (form.checkValidity()) {
					        Swal.fire("수정되었습니다!", "", "success").then(() => {
					          form.submit(); // 알림이 닫힌 후 폼을 제출합니다.
					        });
					      } else {
					        // 유효성 검사에 실패했을 경우, 오류 메시지를 브라우저가 표시하도록 합니다.
					        form.reportValidity();
					        Swal.fire({
					      	  icon: "error",
					      	  title: "오류",
					      	  text: "필수 입력사항을 입력해주세요",
					      	});
					      }
					    } else if (result.isDenied) {
					      window.location.href = "${root}/admin/manager_exhibitionapplylist";
					    }
					    // '취소'를 선택한 경우 아무것도 하지 않습니다.
					  });
					}
					</script>
					
					<!-- 주소 검색 -->
					<script
						src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
				
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>


</body>

</html>