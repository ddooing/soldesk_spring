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

<!-- sweet alert 2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
					<h3>QnA 관리</h3>
				</div>
				<div
					style="position: relative; display: flex; justify-content: start; height: 80px; align-items: center; border: 0.2px solid black; background-color: white; margin-top: 20px;">
					<div style="position: flex; margin-right: 60px; width: 450px; float: left;">
						<!-- 여기에 margin-right 추가 -->
						<span class="badge text-bg-danger rounded-pill"
							style="font-size: 15px; margin-right: 10px; margin-left: 50px; padding:10px;">답변대기
							${qnaCountBean.state_0_count }건</span> <span
							class="badge text-bg-success rounded-pill"
							style="font-size: 15px; margin-right: 10px; padding:10px;">답변완료
							${qnaCountBean.state_1_count }건</span> <span
							class="badge bg-success-subtle text-success-emphasis rounded-pill"
							style="background-color: black; font-size: 15px; padding:10px;">QnA
							총${qnaCountBean.total_count}건</span>
					</div>
					<form action="${root }/admin/manager_QnAlist" method="get">
					
						<c:choose>
							<c:when test="${usercombo == null }">
								<select name="usercombo" id="usercombo" style="width: 150px; height: 40px; margin-right: 30px;">
									<option value="" disabled selected>검색조건선택</option>
									<option value="nickname">닉네임</option>
									<option value="title">제목</option>
								</select>	
							</c:when>
							
							<c:when test="${usercombo == 'nickname' }">
								<select name="usercombo" id="usercombo" style="width: 150px; height: 40px; margin-right: 30px;">
									<option value="" disabled >검색조건선택</option>
									<option value="nickname" selected>닉네임</option>
									<option value="title">제목</option>
								</select>	
							</c:when>
							
							<c:when test="${usercombo == 'title' }">
								<select name="usercombo" id="usercombo" style="width: 150px; height: 40px; margin-right: 30px;">
									<option value="" disabled >검색조건선택</option>
									<option value="nickname" >닉네임</option>
									<option value="title" selected>제목</option>
								</select>	
							</c:when>
				
						</c:choose>
						 
						<c:choose>
							<c:when test="${usersearch != null }">
								<input type="text" name="usersearch" id="usersearch"
								style="width: 500px; height: 40px; margin-right: 30px;" value="${usersearch }"
								placeholder="검색어를 입력해주세요" />	
							</c:when>
							<c:otherwise>
								<input type="text" name="usersearch" id="usersearch"
								style="width: 500px; height: 40px; margin-right: 30px;"
								placeholder="검색어를 입력해주세요" />
							</c:otherwise>
						</c:choose>
						
						<button class="btn btn-dark" style="width: 80px; height: 40px;">검색</button>
					</form>
				</div>


				<div style="background-color: white; margin-top: 30px;">



					<table class="table table-striped" style="text-align: center;">
						<thead>
							<tr style="vertical-align: middle;">
								<th scope="col" style="width: 50px;"><input type="checkbox"
									id="allcheck" /></th>
								<th scope="col" style="width: 50px;">No</th>
								<th scope="col" style="width: 150px;">닉네임</th>
								<th scope="col" style="width: 800px;">제목</th>
								<th scope="col" style="width: 200px;">등록일</th>
								<th scope="col" style="width: 150px;">상태</th>
								<th scope="col">관리</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty qnaAllBean }">

								</c:when>
								<c:otherwise>
									<c:forEach items="${qnaAllBean }" var="qnalist">
										<tr style="vertical-align: middle;">
											<th scope="row" style="width: 50px;"><input
												type="checkbox" class="qna-checkbox"
												value="${qnalist.qna_id}" /></th>
											<td style="width: 50px;">${qnalist.qna_id}</td>
											<td style="width: 150px;">${qnalist.nickname }</td>
											<td style="text-align: left; width: 800px;"><a
												href="${root }/admin/manager_QnAwrite?qna_id=${qnalist.qna_id}"
												style="color: black; text-decoration: none;">${qnalist.title }</a></td>
											<td style="width: 200px;">${qnalist.regdate }</td>
											<c:choose>
												<c:when test="${qnalist.state == 0 }">
													<td style="width: 150px;"><span
														class="badge text-bg-danger rounded-pill"
														style="font-size: 15px;">답변대기</span></td>
												</c:when>
												<c:when test="${qnalist.state == 1 }">
													<td style="width: 150px;"><span
														class="badge text-bg-success rounded-pill"
														style="font-size: 15px;">답변완료</span></td>
												</c:when>
												<c:when test="${qnalist.state == 2 }">
													<td style="width: 150px;"><span
														class="badge text-bg-warning rounded-pill"
														style="font-size: 15px;">삭제처리</span></td>
												</c:when>
											</c:choose>
											<c:choose>
												<c:when test="${qnalist.state == 0 }">
													<td>
														<button class="btn btn-dark"
															onclick="window.location.href='${root}/admin/manager_QnAwrite?qna_id=${qnalist.qna_id}'">답변</button>
														<button class="btn btn-danger"
															onclick="window.location.href='${root}/admin/manager_QnAdelete?qna_id=${qnalist.qna_id}'">삭제</button>
													</td>
												</c:when>
												<c:when test="${qnalist.state == 1 }">
													<td>
														<button class="btn btn-dark"
															onclick="window.location.href='${root}/admin/manager_QnAwrite?qna_id=${qnalist.qna_id}'">수정</button>
														<button class="btn btn-danger" onclick="confirmDeletion('${root}/admin/manager_QnAdelete?qna_id=${qnalist.qna_id}')">삭제</button>
													</td>
												</c:when>
												<c:when test="${qnalist.state == 2 }">
													<td>
														<button class="btn btn-dark"
															onclick="window.location.href='${root}/admin/manager_QnAwrite?qna_id=${qnalist.qna_id}'">보기</button>
														<button class="btn btn-info" onclick="confirmRecovery('${qnalist.qna_id}', '${qnalist.reply}')" >복구</button>
													</td>
												</c:when>
											</c:choose>
										</tr>
										<script>	// qna 복구
											function confirmRecovery(qnaId, reply) {
											    Swal.fire({
											        title: '복구하시겠습니까?',
											        text: '선택한 항목을 복구합니다.',
											        icon: 'question',
											        showCancelButton: true,
											        confirmButtonColor: '#3085d6',
											        cancelButtonColor: '#d33',
											        confirmButtonText: '복구',
											        cancelButtonText: '취소'
											    }).then((result) => {
											        if (result.isConfirmed) {
											            Swal.fire(
											                '복구되었습니다!',
											                '항목이 복구되었습니다.',
											                'success'
											            ).then((result) => {
											                if (result.isConfirmed) {
											                    // 복구 처리 URL로 리디렉션
											                    window.location.href = '${root}/admin/QnA_recovery?qna_id=' + qnaId + '&reply=' + reply;
											                }
											            });
											        }
											    });
											}
										
											 function confirmDeletion(url) {
											        Swal.fire({
											            title: '삭제하시겠습니까?',
											            icon: 'warning',
											            showCancelButton: true,
											            confirmButtonColor: '#d33',
											            cancelButtonColor: '#3085d6',
											            confirmButtonText: '삭제',
											            cancelButtonText: '취소'
											        }).then((result) => {
											            if (result.isConfirmed) {
											                Swal.fire(
											                    '삭제되었습니다!',
											                    '항목이 삭제되었습니다.',
											                    'success'
											                ).then((result) => {
											                    if (result.isConfirmed) {
											                        // 삭제 처리 URL로 리디렉션
											                        window.location.href = url;
											                    }
											                });
											            }
											        });
											    }
										</script>
										
									</c:forEach>
								</c:otherwise>
							</c:choose>


						</tbody>
					</table>
					<div
						style="display: flex; margin-top: 15px; margin-bottom: 20px; float: right;">
						<button class="btn btn-danger" id="deleteBtn"
							style="margin-right: 70px;">삭제</button>
					</div>

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
												href="${root }/admin/manager_QnAlist?page=${pageBean.prevPage}"
												class="page-link">이전</a></li>
										</c:otherwise>
									</c:choose>

									<c:forEach var="idx" begin="${pageBean.min}"
										end="${pageBean.max}">
										<!-- model로 가져온 pageBean의 최소페이지부터 최대페이지까지 반복 : idx 는 현재페이지-->
										<c:choose>
											<c:when test="${idx == pageBean.currentPage }">
												<li class="page-item active"><a
													href="${root }/admin/manager_QnAlist?page=${idx}"
													class="page-link"> ${idx } </a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a
													href="${root }/admin/manager_QnAlist?page=${idx}"
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
												href="${root }/admin/manager_QnAlist?page=${pageBean.nextPage}"
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
												href="${root }/admin/manager_QnAlist?usercombo=${usercombo}&usersearch=${usersearch}&page=${pageBean1.prevPage}"
												class="page-link">이전</a></li>
										</c:otherwise>
									</c:choose>

									<c:forEach var="idx" begin="${pageBean1.min}"
										end="${pageBean1.max}">
										<!-- model로 가져온 pageBean의 최소페이지부터 최대페이지까지 반복 : idx 는 현재페이지-->
										<c:choose>
											<c:when test="${idx == pageBean1.currentPage }">
												<li class="page-item active"><a
													href="${root }/admin/manager_QnAlist?usercombo=${usercombo}&usersearch=${usersearch}&page=${idx}"
													class="page-link"> ${idx } </a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a
													href="${root }/admin/manager_QnAlist?usercombo=${usercombo}&usersearch=${usersearch}&page=${idx}"
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
												href="${root }/admin/manager_QnAlist?usercombo=${usercombo}&usersearch=${usersearch}&page=${pageBean1.nextPage}"
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
												href="${root }/admin/manager_QnAlist?usercombo=${usercombo }&usersearch=${usersearch}&page=${pageBean2.prevPage}"
												class="page-link">이전</a></li>
										</c:otherwise>
									</c:choose>

									<c:forEach var="idx" begin="${pageBean2.min}"
										end="${pageBean2.max}">
										<!-- model로 가져온 pageBean의 최소페이지부터 최대페이지까지 반복 : idx 는 현재페이지-->
										<c:choose>
											<c:when test="${idx == pageBean2.currentPage }">
												<li class="page-item active"><a
													href="${root }/admin/manager_QnAlist?usercombo=${usercombo }&usersearch=${usersearch}&page=${idx}"
													class="page-link"> ${idx } </a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a
													href="${root }/admin/manager_QnAlist?usercombo=${usercombo }&usersearch=${usersearch}&page=${idx}"
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
												href="${root }/admin/manager_QnAlist?usercombo=${usercombo }&usersearch=${usersearch}&page=${pageBean2.nextPage}"
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

	<script>	// 선택 삭제
    $(document).ready(function() {
        $("#deleteBtn").click(function() {
            var selectedQnaIds = [];
            $(".qna-checkbox:checked").each(function() {
                selectedQnaIds.push(parseInt($(this).val()));
            });

            if (selectedQnaIds.length > 0) {
                // 사용자에게 삭제 확인 요청
                Swal.fire({
                    title: '삭제 하시겠습니까?',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '삭제',
                    cancelButtonText: '취소'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: "${root}/admin/deleteSelectedQnA",
                            type: "POST",
                            traditional: true,
                            data: { qnaIds: selectedQnaIds },
                            success: function(response) {
                                Swal.fire('삭제되었습니다!', '선택한 항목이 삭제되었습니다.', 'success').then((result) => {
                                    if (result.isConfirmed) {
                                        location.reload();
                                    }
                                });
                            },
                            error: function(xhr, status, error) {
                                Swal.fire('오류', '삭제 처리 중 문제가 발생했습니다.', 'error');
                            }
                        });
                    }
                });
            } else {
                Swal.fire('알림', '삭제할 항목을 선택해주세요.', 'warning');
            }
        });
    });
</script>



</body>

</html>