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


</head>

<body class="sb-nav-fixed">
	<c:import url="/WEB-INF/views/include/admin_header.jsp" />

		<!--실제 내용(대시보드) 부분-->
		<div id="layoutSidenav_content">
			<main style="background-color: ivory;">
				<div class="container-fluid px-4">
					<div style="margin-top: 30px;">
						<h3>전시회 신청관리</h3>
					</div>
					<div
						style="position: relative; display: flex; justify-content: center; height: 80px; align-items: center; border: 0.2px solid black; background-color: white; margin-top: 20px;">
						<div style="position: absolute; left: 150px;">
							<span class="badge bg-success-subtle text-success-emphasis rounded-pill" style="background-color: black; font-size:15px;">전시회 수 20건</span>
						</div>
						<select name="usercombo" id="usercombo"
							style="width: 150px; height: 40px; margin-right: 30px;">
							<option value="" disabled selected>검색조건선택</option>
							<option value="option1">제목</option>
							<option value="option2">작가</option>
						</select> <input type="text" name="usersearch" id="usersearch"
							style="width: 500px; height: 40px; margin-right: 30px;"
							placeholder="검색어를 입력해주세요" />
						<button class="btn btn-dark" style="width: 80px; height: 40px;">검색</button>
					</div>


					<div style="background-color: white; margin-top: 30px;">



						<table class="table table-striped" style="text-align: center; ">
							<thead>
								<tr style="vertical-align: middle;">
									<th scope="col" style="width: 50px;"><input type="checkbox" id="allcheck" /></th>
									<th scope="col" style="width: 50px;">No</th>
									<th scope="col">신청인</th>
									<th scope="col">제목</th>
									<th scope="col">전시기간</th>
									<th scope="col">작가</th>
									<th scope="col">가격</th>
									<th scope="col">상태</th>
									<th scope="col">관리</th>
								</tr>
							</thead>
							<tbody>
							
								<c:forEach items="${enrollAllBean}" var="enrolllist">
									<tr style="vertical-align: middle;">
									<th scope="row"><input type="checkbox" style="width: 50px;" /></th>
									<td style="width: 50px;">${enrolllist.exhibition_enroll_id }</td>
									<td style="width: 150px;">${enrolllist.apply_name }</td>
									<td style="width: 600px; text-align: left;">${enrolllist.title }</td>
									<td style="width: 300px;">${enrolllist.exhibition_start }~${enrolllist.exhibition_end }</td>
									<td style="width: 150px;">${enrolllist.author }</td>
									<td>${enrolllist.price }원</td>
									
									<c:choose>
										<c:when test="${enrolllist.state == 1 }">
												<td>대기</td>
										</c:when>
										<c:when test="${enrolllist.state == 2 }">
												<td>등록완료</td>
										</c:when>
										<c:when test="${enrolllist.state == 3 }">
												<td style="color:red;">거절</td>
										</c:when>
									</c:choose>
									
									<td>
										<button class="btn btn-dark" onclick="location.href='${root}/admin/manager_exhibitionenrolladd?exhibition_enroll_id=${enrolllist.exhibition_enroll_id}'">상세</button>
										<button class="btn btn-danger">거절</button>
									</td>
								</tr>
								</c:forEach>
								
							</tbody>
						</table>
						<div style="display:flex; margin-top: 20px; margin-bottom: 20px; float: right;">
						<button class="btn btn-danger" style="margin-left: 30px; margin-right: 30px;">거절</button>
						</div>
						<div
							style="display: flex; justify-content: center; margin-top: 30px;">
							<nav aria-label="Page navigation example" class="mx-auto">
								<ul class="pagination">
									<li class="page-item"><a class="page-link" href="#"
										style="color: black;" aria-label="Previous"> <span
											aria-hidden="true">&laquo;</span>
									</a></li>
									<li class="page-item"><a class="page-link" href="#"
										style="color: black;">1</a></li>
									<li class="page-item"><a class="page-link" href="#"
										style="color: black;">2</a></li>
									<li class="page-item"><a class="page-link" href="#"
										style="color: black;">3</a></li>
									<li class="page-item"><a class="page-link" href="#"
										style="color: black;" aria-label="Next"> <span
											aria-hidden="true">&raquo;</span>
									</a></li>
								</ul>
							</nav>
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