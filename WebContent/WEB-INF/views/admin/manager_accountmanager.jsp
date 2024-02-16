<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<!-- JQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(
			function() {
				// thead의 checkbox 클릭 이벤트
				$("thead input[type='checkbox']").click(
						function() {
							// thead의 checkbox 상태를 tbody의 모든 checkbox에 적용
							$("tbody input[type='checkbox']").prop('checked',
									$(this).prop('checked'));
						});
			});

	$(document).ready(function() {
		$("#deleteButton").click(function() {
			var confirmDelete = confirm("선택한 항목을 삭제하시겠습니까?");
			if (confirmDelete) {
				// 사용자가 '예'를 선택한 경우, 폼 제출
				$("form[action='${root}/admin/delete_pro']").submit();
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
					<h3>사용자 관리</h3>
				</div>
				<div
					style="display: flex; justify-content: center; height: 80px; align-items: center; border: 0.2px solid black; background-color: white; margin-top: 20px;">
					<form action="${root }/admin/manager_accountmanager" method="get"
						name="searchUserBean">

						<c:choose>
							<c:when test="${type == 'nickname' }">
								<select name="type" id="usercombo"
									style="width: 150px; height: 40px; margin-right: 30px;">
									<option value="" disabled>검색조건선택</option>
									<option value="nickname" selected>닉네임</option>
									<option value="id">사용자ID</option>
									<option value="email">이메일</option>
								</select>
							</c:when>

							<c:when test="${type == 'id' }">
								<select name="type" id="usercombo"
									style="width: 150px; height: 40px; margin-right: 30px;">
									<option value="" disabled>검색조건선택</option>
									<option value="nickname">닉네임</option>
									<option value="id" selected>사용자ID</option>
									<option value="email">이메일</option>
								</select>
							</c:when>

							<c:when test="${type == 'email' }">
								<select name="type" id="usercombo"
									style="width: 150px; height: 40px; margin-right: 30px;">
									<option value="" disabled>검색조건선택</option>
									<option value="nickname">닉네임</option>
									<option value="id">사용자ID</option>
									<option value="email" selected>이메일</option>
								</select>
							</c:when>
							<c:otherwise>
								<select name="type" id="usercombo"
									style="width: 150px; height: 40px; margin-right: 30px;">
									<option value="" disabled selected>검색조건선택</option>
									<option value="nickname">닉네임</option>
									<option value="id">사용자ID</option>
									<option value="email">이메일</option>
								</select>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${!empty keyword}">
								<input type="text" name="keyword" style="width: 500px; height: 40px; margin-right: 30px;" value="${keyword}" />	
							</c:when>
							
							<c:otherwise>
								<input type="text" name="keyword" style="width: 500px; height: 40px; margin-right: 30px;" placeholder="검색어를 입력해주세요" />
							</c:otherwise>
						</c:choose>
						
						<button type="submit" class="btn btn-dark"
							style="width: 80px; height: 40px;">검색</button>
					</form>
				</div>

				<div style="background-color: white; margin-top: 30px;">

					<form action="${root }/admin/delete_pro" method="post">
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
									<tr
										style="height: 50px; align-items: center; justify-content: center; vertical-align: middle;">
										<th scope="row"><input type="checkbox" name="deleteUser"
											value="${obj.user_id }" /></th>
										<td>${obj.user_id }</td>
										<td>${obj.nickname }</td>
										<td>${obj.id }</td>
										<td>${obj.email }</td>
										<td>${obj.grade }</td>
										<td>${obj.point }</td>
										<c:if test="${obj.state == 1 }">
											<td>활동</td>
										</c:if>
										<c:if test="${obj.state == 2 }">
											<td>탈퇴</td>
										</c:if>
										<c:if test="${obj.state == 3 }">
											<td>관리자</td>
										</c:if>
										<td>
											<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
												<li class="nav-item dropdown"><a id="navbarDropdown"
													href="#" style="color: black;" role="button"
													data-bs-toggle="dropdown" aria-expanded="false"> <i
														class="bi bi-three-dots-vertical"></i>
												</a>
													<ul class="dropdown-menu dropdown-menu-end"
														aria-labelledby="navbarDropdown">
														<li><a class="dropdown-item"
															href="${root }/admin/manager_accountdetail?user_id=${obj.user_id}">수정</a></li>
													</ul></li>
											</ul>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<button class="btn btn-danger" id="deleteButton"
							style="float: right; margin-right: 50px; margin-top: 20px; margin-bottom: 20px;">삭제</button>
					</form>

					<c:choose>
						<c:when test="${!empty pageBean }">
							<div class="d-none d-md-block" style="margin-top: 50px;">
								<ul class="pagination justify-content-center">
									<c:choose>
										<c:when test="${pageBean.prevPage <= 0 }">
											<li class="page-item disabled">
												<!-- 1페이지에 있으면 이전 버튼 비활성화 --> <a href="#" class="page-link">이전</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a
												href="${root }/admin/manager_accountmanager?page=${pageBean.prevPage}"
												class="page-link">이전</a></li>
										</c:otherwise>
									</c:choose>

									<c:forEach var="idx" begin="${pageBean.min}"
										end="${pageBean.max}">
										<!-- model로 가져온 pageBean의 최소페이지부터 최대페이지까지 반복 : idx 는 현재페이지-->
										<c:choose>
											<c:when test="${idx == pageBean.currentPage }">
												<li class="page-item active"><a
													href="${root }/admin/manager_accountmanager?page=${idx}"
													class="page-link"> ${idx } </a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a
													href="${root }/admin/manager_accountmanager?page=${idx}"
													class="page-link"> ${idx } </a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>


									<c:choose>
										<c:when test="${pageBean.max >= pageBean.pageCnt  }">
											<!-- max페이지 > 전체페이지개수 일때  -->
											<li class="page-item disabled">
												<!-- 1페이지에 있으면 이전 버튼 비활성화 --> <a href="#" class="page-link">다음</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a
												href="${root }/admin/manager_accountmanager?page=${pageBean.nextPage}"
												class="page-link">다음</a></li>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>

							<div class="d-block d-md-none">
								<ul class="pagination justify-content-center">
									<li class="page-item"><a href="#" class="page-link">이전</a>
									</li>
									<li class="page-item"><a href="#" class="page-link">다음</a>
									</li>
								</ul>
							</div>
						</c:when>

						<c:when test="${!empty pageBean1 }">
							<div class="d-none d-md-block" style="margin-top: 50px;">
								<ul class="pagination justify-content-center">
									<c:choose>
										<c:when test="${pageBean1.prevPage <= 0 }">
											<li class="page-item disabled">
												<!-- 1페이지에 있으면 이전 버튼 비활성화 --> <a href="#" class="page-link">이전</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a
												href="${root }/admin/manager_accountmanager?type=${type }&keyword=${keyword }&page=${pageBean1.prevPage}"
												class="page-link">이전</a></li>
										</c:otherwise>
									</c:choose>

									<c:forEach var="idx" begin="${pageBean1.min}"
										end="${pageBean1.max}">
										<!-- model로 가져온 pageBean의 최소페이지부터 최대페이지까지 반복 : idx 는 현재페이지-->
										<c:choose>
											<c:when test="${idx == pageBean1.currentPage }">
												<li class="page-item active"><a
													href="${root }/admin/manager_accountmanager?type=${type }&keyword=${keyword }&page=${idx}"
													class="page-link"> ${idx } </a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a
													href="${root }/admin/manager_accountmanager?type=${type }&keyword=${keyword }&page=${idx}"
													class="page-link"> ${idx } </a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>


									<c:choose>
										<c:when test="${pageBean1.max >= pageBean1.pageCnt  }">
											<!-- max페이지 > 전체페이지개수 일때  -->
											<li class="page-item disabled">
												<!-- 1페이지에 있으면 이전 버튼 비활성화 --> <a href="#" class="page-link">다음</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a
												href="${root }/admin/manager_accountmanager?type=${type }&keyword=${keyword }&page=${pageBean1.nextPage}"
												class="page-link">다음</a></li>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>

							<div class="d-block d-md-none">
								<ul class="pagination justify-content-center">
									<li class="page-item"><a href="#" class="page-link">이전</a>
									</li>
									<li class="page-item"><a href="#" class="page-link">다음</a>
									</li>
								</ul>
							</div>

						</c:when>

						<c:when test="${!empty pageBean2 }">
							<div class="d-none d-md-block" style="margin-top: 50px;">
								<ul class="pagination justify-content-center">
									<c:choose>
										<c:when test="${pageBean2.prevPage <= 0 }">
											<li class="page-item disabled">
												<!-- 1페이지에 있으면 이전 버튼 비활성화 --> <a href="#" class="page-link">이전</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a
												href="${root }/admin/manager_accountmanager?type=${type }&keyword=${keyword }&page=${pageBean2.prevPage}"
												class="page-link">이전</a></li>
										</c:otherwise>
									</c:choose>

									<c:forEach var="idx" begin="${pageBean2.min}"
										end="${pageBean2.max}">
										<!-- model로 가져온 pageBean의 최소페이지부터 최대페이지까지 반복 : idx 는 현재페이지-->
										<c:choose>
											<c:when test="${idx == pageBean2.currentPage }">
												<li class="page-item active"><a
													href="${root }/admin/manager_accountmanager?type=${type }&keyword=${keyword }&page=${idx}"
													class="page-link"> ${idx } </a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a
													href="${root }/admin/manager_accountmanager?type=${type }&keyword=${keyword }&page=${idx}"
													class="page-link"> ${idx } </a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>


									<c:choose>
										<c:when test="${pageBean2.max >= pageBean2.pageCnt  }">
											<!-- max페이지 > 전체페이지개수 일때  -->
											<li class="page-item disabled">
												<!-- 1페이지에 있으면 이전 버튼 비활성화 --> <a href="#" class="page-link">다음</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a
												href="${root }/admin/manager_accountmanager?type=${type }&keyword=${keyword }&page=${pageBean2.nextPage}"
												class="page-link">다음</a></li>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>

							<div class="d-block d-md-none">
								<ul class="pagination justify-content-center">
									<li class="page-item"><a href="#" class="page-link">이전</a>
									</li>
									<li class="page-item"><a href="#" class="page-link">다음</a>
									</li>
								</ul>
							</div>

						</c:when>

						<c:when test="${!empty pageBean3 }">
							<div class="d-none d-md-block" style="margin-top: 50px;">
								<ul class="pagination justify-content-center">
									<c:choose>
										<c:when test="${pageBean3.prevPage <= 0 }">
											<li class="page-item disabled">
												<!-- 1페이지에 있으면 이전 버튼 비활성화 --> <a href="#" class="page-link">이전</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a
												href="${root }/admin/manager_accountmanager?type=${type }&keyword=${keyword }&page=${pageBean3.prevPage}"
												class="page-link">이전</a></li>
										</c:otherwise>
									</c:choose>

									<c:forEach var="idx" begin="${pageBean3.min}"
										end="${pageBean3.max}">
										<!-- model로 가져온 pageBean의 최소페이지부터 최대페이지까지 반복 : idx 는 현재페이지-->
										<c:choose>
											<c:when test="${idx == pageBean3.currentPage }">
												<li class="page-item active"><a
													href="${root }/admin/manager_accountmanager?type=${type }&keyword=${keyword }&page=${idx}"
													class="page-link"> ${idx } </a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a
													href="${root }/admin/manager_accountmanager?type=${type }&keyword=${keyword }&page=${idx}"
													class="page-link"> ${idx } </a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>


									<c:choose>
										<c:when test="${pageBean3.max >= pageBean3.pageCnt  }">
											<!-- max페이지 > 전체페이지개수 일때  -->
											<li class="page-item disabled">
												<!-- 1페이지에 있으면 이전 버튼 비활성화 --> <a href="#" class="page-link">다음</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a
												href="${root }/admin/manager_accountmanager?type=${type }&keyword=${keyword }&page=${pageBean3.nextPage}"
												class="page-link">다음</a></li>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>

							<div class="d-block d-md-none">
								<ul class="pagination justify-content-center">
									<li class="page-item"><a href="#" class="page-link">이전</a>
									</li>
									<li class="page-item"><a href="#" class="page-link">다음</a>
									</li>
								</ul>
							</div>

						</c:when>
					</c:choose>

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