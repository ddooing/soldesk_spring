<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
	<c:import url="/WEB-INF/views/include/admin_header.jsp"/>
		

		<!--실제 내용(대시보드) 부분-->
		<div id="layoutSidenav_content">
			<main style="background-color: ivory;">
				<div class="container-fluid px-4">
					<div style="margin-top: 30px;">
						<h3>전시회 관리</h3>
					</div>
					<div
						style="position: relative; display: flex; justify-content: center; height: 80px; align-items: center; border: 0.2px solid black; background-color: white; margin-top: 20px;">
						<div style="position: absolute; left: 150px;">
							<span class="badge bg-success-subtle text-success-emphasis rounded-pill" style="background-color: black; font-size:15px;">전시회 수 40건</span>
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
									<th scope="col"><input type="checkbox" id="allcheck" /></th>
									<th scope="col">No</th>
									<th scope="col">작가</th>
									<th scope="col">제목</th>
									<th scope="col">전시기간</th>
									<th scope="col">노출순서</th>
									<th scope="col">상태</th>
									<th scope="col">공개여부</th>
									<th scope="col">관리</th>
								</tr>
							</thead>
							<tbody>
								<%
								for (int i = 1; i <= 15; i++) {
								%>
								<tr style="vertical-align: middle;">
									<th scope="row"><input type="checkbox" /></th>
									<td><%=i%></td>
									<td>작가<%=i%></td>
									<td>전시회 제목제목제목<%=i%></td>
									<td>2024.01.15 ~ 2024.01.18</td>
									<td>18,000원</td>
									<td>전시중</td>
									<td><input type="checkbox" value="open" id="open" /></td>
									<td>
										<button class="btn btn-dark" onclick="location.href='manager_exhibitionmodify.jsp'">수정</button>
										<button class="btn btn-danger">삭제</button>
									</td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
						<div style="display:flex; margin-top: 20px; margin-bottom: 20px; float: right;">
						<button class="btn btn-dark" onclick="location.href='manager_exhibitionadd.jsp'">추가</button>
						<button class="btn btn-danger" style="margin-left: 30px; margin-right: 30px;">삭제</button>
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
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>

</body>

</html>