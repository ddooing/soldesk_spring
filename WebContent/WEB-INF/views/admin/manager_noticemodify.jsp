<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<link rel="icon" type="image/x-icon" href="assets/ARTMEE_PAGELOGO.png" />
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
<script
	src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js"
	referrerpolicy="origin"></script>
<!-- JQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- SweetAlert2 CSS 파일 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
<!-- SweetAlert2 JS 파일 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
$(document).ready(function(){
    $("#allcheck").click(function(){
        if($(this).is(":checked")) {
            $("tbody tr th input[type='checkbox']").prop("checked", true);
        } else {
            $("tbody tr th input[type='checkbox']").prop("checked", false);
        }
    });
});

</script>

<style>
.filebox .upload-name {
	display: inline-block;
	height: 40px;
	padding: 0 10px;
	vertical-align: middle;
	border: 1px solid #dddddd;
	width: 90%;
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
textarea:focus {
    outline: none;
}
</style>
</head>

<body class="sb-nav-fixed">
			<c:import url="/WEB-INF/views/include/admin_header.jsp"/>

		<!--실제 내용(대시보드) 부분-->
		<div id="layoutSidenav_content">
			<main style="background-color: ivory;">
				<div class="container-fluid px-4">
					<div style="margin-top: 30px; margin-left:20px;">
						<h3>공지사항 수정</h3>
					</div>
					<div style="position: relative; margin:20px; display: flex; justify-content: start; height: 80px; align-items: center; background-color: #E8E8E8; margin-top: 20px;">
						<button class="btn btn-dark" style="margin-left: 50px;">공지사항 수정</button>
						<button class="btn btn-dark" style="margin-left: 20px;" onclick="${root}/admin/manager_noticemanage">공지사항 목록</button>
					</div>

					<div style="background-color: white; margin-top: 30px; margin: 20px;">
					<form:form action="${root }/admin/nmodify_pro" method="post" modelAttribute="nmodifyBean">
					<form:hidden path="notice_id"/>
						<table class="table table-bordered">
							<tr style="align-items: center; height: 100px;">
								<th style="width: 200px; vertical-align: middle; font-size:20px;">제목*</th>
								<td colspan="3" style="vertical-align: middle;">
									<form:input type="text" id="title" path="title" value="${RN.title }" style="width: 100%; height:50px; border:none; border-bottom: 1px solid black;"></form:input>
								</td>
							</tr>
							<tr style="align-items: center; height: 100px;">
								<th style="vertical-align: middle; width:200px; font-size:20px;">상태 관리*</th>
								<td style="vertical-align: middle; width:500px;">
								
								<c:choose>
									<c:when test="${RN.state == 0 }">
										<input type="radio" id="important" name="state" value="1" style="width: 20px; height: 20px; margin-left:50px;" > 
										<label for="important" style="font-size: 20px; margin-left:20px;">일반 공개</label> 
										<input type="radio" id="notimportant" name="state" value="2" style="width: 20px; height: 20px; margin-left:30px;"> 
										<label for="notimportant" style="font-size: 20px; margin-left:20px;">중요 공개</label>
										<input type="radio" id="noopen" name="state" value="0" style="width: 20px; height: 20px; margin-left:30px;" checked> 
										<label for="noopen" style="font-size: 20px; margin-left:20px;">비공개</label>
									</c:when>
									<c:when test="${RN.state == 1 }">
										<input type="radio" id="important" name="state" value="1" style="width: 20px; height: 20px; margin-left:50px;" checked> 
										<label for="important" style="font-size: 20px; margin-left:20px;">일반 공개</label> 
										<input type="radio" id="notimportant" name="state" value="2" style="width: 20px; height: 20px; margin-left:30px;"> 
										<label for="notimportant" style="font-size: 20px; margin-left:20px;">중요 공개</label>
										<input type="radio" id="noopen" name="state" value="0" style="width: 20px; height: 20px; margin-left:30px;" > 
										<label for="noopen" style="font-size: 20px; margin-left:20px;">비공개</label>
									</c:when>
									<c:when test="${RN.state == 2 }">
										<input type="radio" id="important" name="state" value="1" style="width: 20px; height: 20px; margin-left:50px;"> 
										<label for="important" style="font-size: 20px; margin-left:20px;">일반 공개</label> 
										<input type="radio" id="notimportant" name="state" value="2" style="width: 20px; height: 20px; margin-left:30px;" checked> 
										<label for="notimportant" style="font-size: 20px; margin-left:20px;">중요 공개</label>
										<input type="radio" id="noopen" name="state" value="0" style="width: 20px; height: 20px; margin-left:30px;"> 
										<label for="noopen" style="font-size: 20px; margin-left:20px;">비공개</label>
									</c:when>
									<c:otherwise>
										오잉
									</c:otherwise>
								</c:choose>
								</td>
							</tr>
							<tr style="align-items: center; height: 100px; ">
								<th style="vertical-align: middle; font-size:20px;">내용</th>
								<td colspan="3">
									<form:textarea rows="15" cols="140" path="contents" style="resize:none;" />
								</td>
							</tr>
						</table>
							
							<div style="float:right; margin-bottom:50px;">
								<button class="btn btn-danger" style="margin-right: 15px;" onclick="${root}/admin/manager_noticemanage">취소</button>
								<form:button class="btn btn-dark" id="submitButton" style="margin-right: 30px;">수정</form:button>
							</div>
							</form:form>
							
							<script>
							document.addEventListener('DOMContentLoaded', function() {
							  document.getElementById('submitButton').addEventListener('click', function(event) {
							    event.preventDefault(); // 폼 자동 제출 방지
							
							    // 수정 확인 요청
							    Swal.fire({
							      title: '수정하시겠습니까?',
							      icon: 'warning',
							      showCancelButton: true,
							      confirmButtonColor: '#3085d6',
							      cancelButtonColor: '#d33',
							      confirmButtonText: '수정',
							      cancelButtonText: '취소'
							    }).then((result) => {
							      if (result.value) {
							        // 성공 메시지 표시
							        Swal.fire(
							          '수정 완료!',
							          '수정이 완료되었습니다.',
							          'success'
							        ).then(() => {
							          // 폼 제출
							          document.querySelector('form').submit();
							        });
							      }
							    });
							  });
							});
						</script>
						
						
							
					</div>
				</div>
			</main>


		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>

</body>

</html>