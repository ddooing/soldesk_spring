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
<link rel="icon" type="image/x-icon" href="../img/ARTMEE_PAGELOGO.png" />
<title>관리자 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="css/styles_manager.css" rel="stylesheet" />
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
						<h3>공지사항 글보기</h3>
					</div>
					<div style="position: relative; margin:20px; display: flex; justify-content: start; height: 80px; align-items: center; background-color: #E8E8E8; margin-top: 20px;">
						<a href="${root }/admin/manager_noticemodify?notice_id=${RN.notice_id}" class="btn btn-dark">공지사항 관리</a>
						<a href="${root }/admin/manager_noticemanage" class="btn btn-dark" style="margin-left: 20px;">공지사항 목록</a>
					</div>

					<div style="background-color: white; margin-top: 30px; margin: 20px;">
						
						<table class="table table-bordered">
						    <tr style="align-items: center; height: 100px;">
						        <th style="width: 200px; vertical-align: middle; font-size:20px;">제목</th>
						        <td colspan="5" style="vertical-align: middle;">
						            ${RN.title }
						        </td>
						    </tr>
						
						    <tr style="align-items: center; height: 100px;">
						        <th style="vertical-align: middle; font-size:20px;">작성자</th>
						        <td style="vertical-align: middle;">
						            이이름
						        </td>
						        <th style="vertical-align: middle; font-size:20px; width: 250px;">등록일</th>
						        <td style="vertical-align: middle;">
						            ${RN.create_date }
						        </td>
						        <th style="vertical-align: middle; font-size:20px; width: 150px;">상태</th>
						        <c:choose>
							        <c:when test="${RN.state == 0 }">
								        <td style="vertical-align: middle;">
								            비공개
								        </td>
							        </c:when>
							        <c:when test="${RN.state == 1 }">
								        <td style="vertical-align: middle;">
								            게시중
								        </td>
							        </c:when>
							        <c:when test="${RN.state == 2 }">
								        <td style="vertical-align: middle;">
								            중요 게시
								        </td>
							        </c:when>
						        </c:choose>
						    </tr>
						
						    <tr style="align-items: center; height: 600px;">
						        <th style="vertical-align: middle; font-size:20px;">내용</th>
						        <td colspan="5">
						            ${RN.contents }
						        </td>
						    </tr>
						</table>

	
							
							<div style="float:right; margin-bottom:50px;">
								<a href="${root }/admin/manager_noticemanage" class="btn btn-dark" style="margin-right: 15px;">목록보기</a>
							</div>
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