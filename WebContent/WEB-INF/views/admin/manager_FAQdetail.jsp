<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	
<c:set var="root" value="${pageContext.request.contextPath }"/>  
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
<script
	src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js"
	referrerpolicy="origin"></script>
<!-- SweetAlert2 CSS 파일 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

  <!-- SweetAlert2 JS 파일 -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- JQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
</style>
</head>

<body class="sb-nav-fixed">
	<c:import url="/WEB-INF/views/include/admin_header.jsp"/>

		<!--실제 내용(대시보드) 부분-->
		<div id="layoutSidenav_content">
			<main style="background-color: ivory;">
				<div class="container-fluid px-4">
					<div style="margin-top: 30px; margin-left:20px;">
						<h3>FAQ 상세</h3>
					</div>
					<div style="position: relative; margin:20px; display: flex; justify-content: start; height: 80px; align-items: center; background-color: #E8E8E8; margin-top: 20px;">
						<button class="btn btn-dark" style="margin-left: 20px;" onclick="location.href='${root}/admin/manager_FAQlist'">FAQ 목록</button>
					</div>
					<div style="background-color: white; margin-top: 30px; margin: 20px;">
						<form:form action="${root }/admin/manager_FAQdetail_pro" method="post" modelAttribute="FAQmodifyBean">
					    <form:hidden path="faq_id" value="${oneFAQInfo.faq_id }"/>
					    <form:hidden path="state" value="${oneFAQInfo.state }" />
					    <c:choose>
									<c:when test="${oneFAQInfo.state == 1 }">
										<span class="badge text-bg-success rounded-pill" style="font-size:15px; margin-left:20px; margin-bottom:20px;">게시중</span>
									</c:when>
									<c:when test="${oneFAQInfo.state == 2 }">
										<span class="badge text-bg-warning rounded-pill" style="font-size:15px; margin-left:20px; margin-bottom:20px;">비공개</span>
									</c:when>
								</c:choose>
					    <table class="table table-bordered">
					        <!-- 제목 행 -->
					        <tr style="vertical-align: middle; height: 20px;">
					            <th style="font-size:20px; width: 200px; text-align:center; margin-right: 30px;">제목</th>
					            <td>
					                <form:input path="title" value="${oneFAQInfo.title }" style="width: 100%;" />
					             
					            </td>
					        </tr>
					        <!-- 내용 행 -->
					        <tr>
					            <th style="font-size:20px; text-align:center; vertical-align:middle; align-items: center; ">내용</th>
					            <td>
                				<form:textarea path="contents" rows="15" name="reply" style="resize:none; width: 100%;" />
					            </td>
					        </tr>
					    </table>    
					    <!-- 나머지 폼 내용 -->
					     <div style="float:right; margin-bottom:50px;">
										<a href="${root}/admin/manager_FAQlist" class="btn btn-danger" style="margin-right: 15px;">돌아가기</a>
										<form:button class="btn btn-dark" id="submitButton" style="margin-right: 30px;" >등록하기</form:button>
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