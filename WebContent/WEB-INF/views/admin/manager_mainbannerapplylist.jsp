<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="../css/styles_manager.css" rel="stylesheet" />
<!--부트스트랩 아이콘 사용-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet">

<!-- fontawesome -->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

<!-- sweetalert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>	
	
<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
<!-- 부트스트랩 아이콘 CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>

<body class="sb-nav-fixed">
	<c:import url="/WEB-INF/views/include/admin_header.jsp" />

		<!--실제 내용(대시보드) 부분-->
		<div id="layoutSidenav_content">
			<main style="background-color: ivory;">
				<div class="container-fluid px-4">
					<div style="margin-top: 30px;">
						<h3>배너 신청 관리</h3>
					</div>
					<div style="position: relative; display: flex; justify-content: start; height: 80px; align-items: center; border: 0.2px solid black; background-color: white; margin-top: 20px;">
						<div style="display:flex;  margin-right:60px; width: 450px; float: left;">
							<span class="badge text-bg-danger rounded-pill" style="font-size: 15px; margin-right: 10px; margin-left: 50px; padding:10px;">등록대기 ${BadgeCnt.state_1_count }건</span> 
							<span class="badge text-bg-success rounded-pill" style="font-size: 15px; margin-right: 10px; padding:10px;">등록완료 ${BadgeCnt.state_2_count }건</span> 
							<span class="badge bg-success-subtle text-success-emphasis rounded-pill" style="background-color: black; font-size: 15px; padding:10px;">배너신청 총 ${BadgeCnt.total_count}건</span>
						</div>

						<form action="${root }/admin/manager_mainbannerapplylist" method="get">
							<select name="bannercombo" id="bannercombo" style="width: 150px; height: 40px; margin-right: 30px;">
								<option value="title" selected>제목</option>
							</select>
							<c:choose>
								<c:when test="${bannersearch != null }">
									<input type="text" name="bannersearch" id="bannersearch" style="width: 250px; height: 40px; margin-right: 30px;" value="${bannersearch }" />
								</c:when>
								<c:otherwise>
									<input type="text" name="bannersearch" id="bannersearch" style="width: 250px; height: 40px; margin-right: 30px;" placeholder="검색어를 입력해주세요" />
								</c:otherwise>
							</c:choose>
							<button class="btn btn-dark" style="width: 80px; height: 40px;">검색</button>
						</form>
					</div>
				
					<div style="display: flex; margin-top:30px;">
						<h3 onclick="window.location='${root}/admin/manager_mainbannerapplylist'" style="cursor: pointer;">메인 배너</h3>
						<h3 onclick="window.location='${root}/admin/manager_subbannerapplylist'" style=" margin-left:30px; color:#e2e2e2; cursor: pointer;">서브 배너</h3>
					</div>
					
					<div style="background-color: white; margin-top:20px;" >					
						<table class="table table-striped" style="text-align: center; ">
							<thead>
								<tr style="vertical-align: middle;">
									<th scope="col" style="width:50px; margin-right:30px;">No</th>
									<th scope="col" style="width:300px;">전시회</th>
									<th scope="col" style="width:270px;">노출기간</th>
									<th scope="col" style="width:150px;">신청일</th>
									<th scope="col" style="width:100px;">신청인</th>
									<th scope="col" style="width:150px;">가격</th>
									<th scope="col" style="width:130px;">상태</th>
									<th scope="col" style="width:170px;">관리</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${BannerApplylistBean }" var="bannerBean">
									<tr id="banner-${bannerBean.banner_apply_form_id}" style="vertical-align: middle; height:50px;">
										<th scope="row" style="width:50px; margin-right:30px;">${bannerBean.banner_apply_form_id }</th>
										
										<td style="width:300px;"><a href="${root }/exhibition/exhibition_click?exhibition_id=${bannerBean.exhibition_id}" style="color:black;">${bannerBean.exhibition_title }</a></td>
										<td style="width:270px">${bannerBean.start_date } ~ ${bannerBean.end_date }</td>
										<td style="width:150px;">${bannerBean.approved_at  }</td>
										<td style="width:100px;">${bannerBean.user_name }</td>
										<td style="width:150px;">
										    <fmt:formatNumber value="${bannerBean.payment}" groupingUsed="true" type="number"/> 원
										</td>
										<c:choose>
											<c:when test="${bannerBean.state  == 1}">
												<td>등록대기</td>		
												<td>
													<button class="btn btn-dark" onclick="location.href='${root}/admin/manager_bannerapplyadd?banner_apply_form_id=${bannerBean.banner_apply_form_id}'">추가</button>
													<button class="btn btn-danger" data-form-id="${bannerBean.banner_apply_form_id}" data-bannertype="${bannerBean.banner_type}"  type="button" onclick="confirmCancel(this.getAttribute('data-form-id'), this.getAttribute('data-bannertype'))">거절</button>
												</td>
											</c:when>
											<c:when test="${bannerBean.state  == 2}">
												<td>등록완료</td>
												<td>
													<button class="btn btn-dark" onclick="location.href='${root}/admin/manager_bannerapplyadd?banner_apply_form_id=${bannerBean.banner_apply_form_id}'">상세</button>
												</td>		
											</c:when>
										</c:choose>	
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>		
					
					<c:choose>
						<c:when test="${!empty pageBean }">
							<div class="d-none d-md-block" style="margin-top: 50px;">
								<ul class="pagination justify-content-center">
									<c:choose>
										<c:when test="${pageBean.prevPage <= 0 }">
											<li class="page-item disabled"><a href="#"
												class="page-link">이전</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a
												href="${root}/admin/manager_mainbannerapplylist?page=${pageBean.prevPage}"
												class="page-link">이전</a></li>
										</c:otherwise>
									</c:choose>

									<c:forEach var="idx" begin="${pageBean.min}"
										end="${pageBean.max}">
										<c:choose>
											<c:when test="${idx == pageBean.currentPage}">
												<li class="page-item active"><a
													href="${root}/admin/manager_mainbannerapplylist?page=${idx}"
													class="page-link">${idx}</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a
													href="${root}/admin/manager_mainbannerapplylist?page=${idx}"
													class="page-link">${idx}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>

									<c:choose>
										<c:when test="${pageBean.max >= pageBean.pageCnt}">
											<li class="page-item disabled"><a href="#"
												class="page-link">다음</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a
												href="${root}/admin/manager_mainbannerapplylist?page=${pageBean.nextPage}"
												class="page-link">다음</a></li>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>

							<div class="d-block d-md-none">
								<ul class="pagination justify-content-center">
									<li class="page-item"><a href="#" class="page-link">이전</a></li>
									<li class="page-item"><a href="#" class="page-link">다음</a></li>
								</ul>
							</div>
						</c:when>
						
						<c:when test="${!empty pageBean1 }">
							<div class="d-none d-md-block" style="margin-top: 50px;">
								<ul class="pagination justify-content-center">
									<c:choose>
										<c:when test="${pageBean1.prevPage <= 0 }">
											<li class="page-item disabled">
												<a href="#" class="page-link">이전</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a
												href="${root }/admin/manager_mainbannerapplylist?bannercombo=${bannercombo}&bannersearch=${bannersearch}&page=${pageBean1.prevPage}"
												class="page-link">이전</a></li>
										</c:otherwise>
									</c:choose>

									<c:forEach var="idx" begin="${pageBean1.min}" end="${pageBean1.max}">
										<c:choose>
											<c:when test="${idx == pageBean1.currentPage }">
												<li class="page-item active"><a
													href="${root }/admin/manager_mainbannerapplylist?bannercombo=${bannercombo}&bannersearch=${bannersearch}&page=${idx}"
													class="page-link"> ${idx } </a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a
													href="${root }/admin/manager_mainbannerapplylist?bannercombo=${bannercombo}&bannersearch=${bannersearch}&page=${idx}"
													class="page-link"> ${idx } </a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>


									<c:choose>
										<c:when test="${pageBean1.max >= pageBean1.pageCnt  }">
											<li class="page-item disabled">
												<a href="#" class="page-link">다음</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a
												href="${root }/admin/manager_mainbannerapplylist?bannercombo=${bannercombo}&bannersearch=${bannersearch}&page=${pageBean1.nextPage}"
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
			</main>
		</div>
	</div>
	
	<script>
	function confirmCancel(bannerId,banner_type) {
	   
	    Swal.fire({
	        title: '거절 처리하시겠습니까?',
	        text:'거절 처리 시, 결제가 취소 처리됩니다.',
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonColor: '#d33',
	        cancelButtonColor: '#3085d6',
	        confirmButtonText: '거절 처리',
	        cancelButtonText: '닫기'
	    }).then((result) => {
	        if (result.isConfirmed) {
	        	console.log("확인 : ",bannerId);
	        	console.log("확인 : ",banner_type);
	        	window.location.href = '${root}/admin/BannerApplyCancel?banner_apply_form_id='+bannerId+"&banner_type="+banner_type;
	    	    
	        }
	    });
	}
	
	document.addEventListener("DOMContentLoaded", function() {
        <% if (request.getAttribute("canceled") != null) { %>
            Swal.fire({
                title: "취소 처리 완료",
                text: "취소 처리가 성공적으로 되었습니다",
                icon: "success",
                showConfirmButton: false,
                timer: 2000
            });
        <% } %>
    });

	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

</body>

</html>