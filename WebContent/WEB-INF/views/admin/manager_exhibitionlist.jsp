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
	$(document).ready(function() {
		$("#allcheck").click(function() {
			if ($(this).is(":checked")) {
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
					<h3>전시회 관리</h3>
				</div>
				<div
					style="position: relative; display: flex; justify-content: start; height: 80px; align-items: center; border: 0.2px solid black; background-color: white; margin-top: 20px;">
					<div
						style="position: flex; margin-right: 60px; width: 400px; float: left;">
						<!-- 여기에 margin-right 추가 -->
						<span class="badge text-bg-primary rounded-pill"
							style="font-size: 15px; margin-right: 10px; margin-left: 50px;">전시중
							${ExhibitionCountBean.current_exhibitions_count }건</span> <span
							class="badge text-bg-success rounded-pill"
							style="font-size: 15px; margin-right: 10px;">전시예정
							${ExhibitionCountBean.upcoming_exhibitions_count }건</span> <span
							class="badge bg-success-subtle text-success-emphasis rounded-pill"
							style="background-color: black; font-size: 15px;">전시회 수
							${ExhibitionCountBean.total_exhibitions_count}건</span>
					</div>
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


				<div style="background-color: white; margin-top: 30px;">



					<table class="table table-striped" style="text-align: center;">
						<thead>
							<tr style="vertical-align: middle;">
								<th scope="col"><input type="checkbox" id="allcheck" /></th>
								<th scope="col">No</th>
								<th scope="col">작가</th>
								<th scope="col">제목</th>
								<th scope="col">전시기간</th>
								<th scope="col">가격</th>
								<th scope="col">상태</th>
								<th scope="col">공개여부</th>
								<th scope="col">관리</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${AdminExhibitionInfoBean }"
								var="exhibitonlist">
								<tr style="vertical-align: middle;">
									<th scope="row" style="width: 50px;"><input
										type="checkbox" /></th>
									<td style="width: 50px;">${exhibitonlist.exhibition_id }</td>
									<td style="width: 150px;">${exhibitonlist.author }</td>
									<td style="width: 550px; text-align: left;"><a
										href="${root }/exhibition/exhibition_click?exhibition_id=${exhibitonlist.exhibition_id}&user_id=${loginUserBean.user_id}"
										style="color: black; text-align: left;">${exhibitonlist.title }</a></td>
									<td style="width: 350px;">${exhibitonlist.exhibition_start }
										~ ${exhibitonlist.exhibition_end }</td>
									<c:choose>
										<c:when test="${exhibitonlist.price ==0}">
											<td style="width: 100px;">무료</td>
										</c:when>
										<c:otherwise>
											<td style="width: 100px;">${exhibitonlist.price } 원</td>
										</c:otherwise>
									</c:choose>


									<td style="width: 100px;">${exhibitonlist.open_state }</td>
									<td><input type="checkbox" value="open" id="open" /></td>
									<td>
										<button class="btn btn-dark"
											onclick="location.href='manager_exhibitionmodify.jsp'">수정</button>
										<button class="btn btn-danger">삭제</button>
									</td>
								</tr>
							</c:forEach>


						</tbody>
					</table>
					<div
						style="display: flex; margin-top: 20px; margin-bottom: 20px; float: right;">
						<button class="btn btn-dark"
							onclick="location.href='manager_exhibitionadd.jsp'">추가</button>
						<button class="btn btn-danger"
							style="margin-left: 30px; margin-right: 30px;">삭제</button>
					</div>

					<c:choose>
						<c:when test="${!empty pageBean}">
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
												href="${root }/admin/manager_exhibitionlist?page=${pageBean.prevPage}"
												class="page-link">이전</a></li>
										</c:otherwise>
									</c:choose>

									<c:forEach var="idx" begin="${pageBean.min}"
										end="${pageBean.max}">
										<!-- model로 가져온 pageBean의 최소페이지부터 최대페이지까지 반복 : idx 는 현재페이지-->
										<c:choose>
											<c:when test="${idx == pageBean.currentPage }">
												<li class="page-item active"><a
													href="${root }/admin/manager_exhibitionlist?page=${idx}"
													class="page-link"> ${idx } </a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a
													href="${root }/admin/manager_exhibitionlist?page=${idx}"
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
												href="${root }/admin/manager_exhibitionlist?page=${pageBean.nextPage}"
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

						<c:when test="${!empty pageBean2}">
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
												href="${root }/admin/manager_exhibitionlist?exhibitioncombo=${exhibitioncombo}&exhibitionsearch=${exhibitionsearch}&page=${pageBean2.prevPage}"
												class="page-link">이전</a></li>
										</c:otherwise>
									</c:choose>

									<c:forEach var="idx" begin="${pageBean2.min}"
										end="${pageBean2.max}">
										<!-- model로 가져온 pageBean의 최소페이지부터 최대페이지까지 반복 : idx 는 현재페이지-->
										<c:choose>
											<c:when test="${idx == pageBean2.currentPage }">
												<li class="page-item active"><a
													href="${root }/admin/manager_exhibitionlist?exhibitioncombo=${exhibitioncombo}&exhibitionsearch=${exhibitionsearch}&page=${idx}"
													class="page-link"> ${idx } </a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a
													href="${root }/admin/manager_exhibitionlist?exhibitioncombo=${exhibitioncombo}&exhibitionsearch=${exhibitionsearch}&page=${idx}"
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
												href="${root }/admin/manager_exhibitionlist?exhibitioncombo=${exhibitioncombo}&exhibitionsearch=${exhibitionsearch}&page=${pageBean2.nextPage}"
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
						
						<c:when test="${!empty pageBean1}">
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
												href="${root }/admin/manager_exhibitionlist?exhibitioncombo=${exhibitioncombo}&exhibitionsearch=${exhibitionsearch}&page=${pageBean1.prevPage}"
												class="page-link">이전</a></li>
										</c:otherwise>
									</c:choose>

									<c:forEach var="idx" begin="${pageBean1.min}"
										end="${pageBean1.max}">
										<!-- model로 가져온 pageBean의 최소페이지부터 최대페이지까지 반복 : idx 는 현재페이지-->
										<c:choose>
											<c:when test="${idx == pageBean1.currentPage }">
												<li class="page-item active"><a
													href="${root }/admin/manager_exhibitionlist?exhibitioncombo=${exhibitioncombo}&exhibitionsearch=${exhibitionsearch}&page=${idx}"
													class="page-link"> ${idx } </a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a
													href="${root }/admin/manager_exhibitionlist?exhibitioncombo=${exhibitioncombo}&exhibitionsearch=${exhibitionsearch}&page=${idx}"
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
												href="${root }/admin/manager_exhibitionlist?exhibitioncombo=${exhibitioncombo}&exhibitionsearch=${exhibitionsearch}&page=${pageBean1.nextPage}"
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

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>

</body>

</html>