<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link href="css/styles_manager.css" rel="stylesheet" />
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
    // thead의 checkbox 클릭 이벤트
    $("thead input[type='checkbox']").click(function(){
        // thead의 checkbox 상태를 tbody의 모든 checkbox에 적용
        $("tbody input[type='checkbox']").prop('checked', $(this).prop('checked'));
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
					<div style="margin-top:30px;">
						<h3>사용자 관리</h3>
					</div>
					<div
						style="display: flex; justify-content: center; height: 80px; align-items: center; border: 0.2px solid black; background-color: white; margin-top: 20px;">
						<select name="usercombo" id="usercombo"
							style="width: 150px; height: 40px; margin-right: 30px;">
							<option value="" disabled selected>검색조건선택</option>
							<option value="option1">닉네임</option>
							<option value="option2">사용자ID</option>
							<option value="option3">이메일</option>
						</select> 
						<input type="text" name="usersearch" id="usersearch"
							style="width: 500px; height: 40px; margin-right: 30px;"
							placeholder="검색어를 입력해주세요" />
						<button class="btn btn-dark" style="width: 80px; height: 40px;">검색</button>
					</div>

					<div style="background-color: white; margin-top: 30px;">
						


						<table class="table table-striped" style="text-align: center;">
							<thead>
								<tr>
									<th scope="col"><input type="checkbox" /></th>
									<th scope="col">No</th>
									<th scope="col">닉네임</th>
									<th scope="col">사용자ID</th>
									<th scope="col">이메일</th>
									<th scope="col">등급</th>
									<th scope="col">포인트</th>
									<th scope="col">계정상태</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="obj" items="${userList }">
									<tr>
										<th scope="row"><input type="checkbox" /></th>
										<td>${obj.user_id }</td>
										<td>${obj.nickname }</td>
										<td>${obj.id }</td>
										<td>${obj.email }</td>
										<td>${obj.grade }</td>
										<td>${obj.point }</td>
										<td>${obj.state }</td>
										<td>
											<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
												<li class="nav-item dropdown"><a id="navbarDropdown"
													href="#" style="color: black;" role="button"
													data-bs-toggle="dropdown" aria-expanded="false"> <i
														class="bi bi-three-dots-vertical"></i>
												</a>
													<ul class="dropdown-menu dropdown-menu-end"
														aria-labelledby="navbarDropdown">
														<li><a class="dropdown-item" href="${root }/admin/manager_accountdetail?user_id=${loginUserBean.user_id}">수정</a></li>
													</ul></li>
											</ul>
										</td>
									</tr>
								</c:forEach>
								<%-- <%
								for (int i = 1; i <= 15; i++) {
								%>
								<tr>
									<th scope="row"><input type="checkbox" /></th>
									<td><%=i%></td>
									<td>닉네임<%=i%></td>
									<td>사용자ID<%=i%></td>
									<td>example<%=i - 1%>@naver.com
									</td>
									<td>1레벨</td>
									<td>30p</td>
									<td>정상</td>
									<td>
										<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
											<li class="nav-item dropdown"><a id="navbarDropdown"
												href="#" style="color: black;" role="button"
												data-bs-toggle="dropdown" aria-expanded="false"> <i
													class="bi bi-three-dots-vertical"></i>
											</a>
												<ul class="dropdown-menu dropdown-menu-end"
													aria-labelledby="navbarDropdown">
													<li><a class="dropdown-item" href="manager_accountdetail.jsp">수정</a></li>
												</ul></li>
										</ul>
									</td>
								</tr>
								<%
								}
								%> --%>
							</tbody>
							

						</table>
						<button class="btn btn-danger"
							style="float: right; margin-right: 50px; margin-top: 20px; margin-bottom: 20px;">삭제</button>

						<div style="display: flex; justify-content: center; margin-top:30px;">
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