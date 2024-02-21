<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.min.css">
<!-- SweetAlert2 CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
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

<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
						<h3>게시판 관리</h3>
					</div>
					<div
						style="position: relative; display: flex; justify-content: center; height: 80px; align-items: center; border: 0.2px solid black; background-color: white; margin-top: 20px;">
						<div style="position: absolute; left: 10px;">
							<c:choose>
								<c:when test="${!empty pageBean }">
									<span class="badge text-bg-dark rounded-pill" style="font-size: 15px; margin-right: 10px; margin-left: 50px; padding:10px;">게시글 ${n1 }건</span>
								</c:when>
								<c:when test="${!empty pageBean1 }">
									<span class="badge text-bg-dark rounded-pill" style="font-size: 15px; margin-right: 10px; margin-left: 50px; padding:10px;">게시글 ${n2 }건</span>
								</c:when>
								<c:when test="${!empty pageBean2 }">
									<span class="badge text-bg-dark rounded-pill" style="font-size: 15px; margin-right: 10px; margin-left: 50px; padding:10px;">게시글 ${n3 }건</span>
								</c:when>
								<c:when test="${!empty pageBean3 }">
									<span class="badge text-bg-dark rounded-pill" style="font-size: 15px; margin-right: 10px; margin-left: 50px; padding:10px;">게시글 ${n4 }건</span>
								</c:when>
							</c:choose>
						</div>
						<form action="${root }/admin/manager_boardlist" method="get" style="margin-top: 15px;">
						<c:choose>
							<c:when test="${type == 'title' }">
								<select name="type" style="width: 150px; height: 40px; margin-right: 30px;">
									<option value="" disabled >검색조건선택</option>
									<option value="title"selected>제목</option>
									<option value="titlecontents">제목+내용</option>
									<option value="nickname">닉네임</option>
								</select>
							</c:when>
							<c:when test="${type == 'titlecontents' }">
								<select name="type" style="width: 150px; height: 40px; margin-right: 30px;">
									<option value="" disabled >검색조건선택</option>
									<option value="title">제목</option>
									<option value="titlecontents"selected>제목+내용</option>
									<option value="nickname">닉네임</option>
								</select>
							</c:when>
							<c:when test="${type == 'nickname' }">
								<select name="type" style="width: 150px; height: 40px; margin-right: 30px;">
									<option value="" disabled >검색조건선택</option>
									<option value="title">제목</option>
									<option value="titlecontents">제목+내용</option>
									<option value="nickname" selected>닉네임</option>
								</select>
							</c:when>
						<c:otherwise>
							<select name="type" style="width: 150px; height: 40px; margin-right: 30px;">
								<option value="" disabled selected>검색조건선택</option>
								<option value="title">제목</option>
								<option value="titlecontents">제목+내용</option>
								<option value="nickname">닉네임</option>
							</select>
						</c:otherwise>
						</c:choose>
								<input type="text" name="keyword" value="${keyword }"
								style="width: 500px; height: 40px; margin-right: 30px;"
								placeholder="검색어를 입력해주세요" />
							<button class="btn btn-dark" style="width: 80px; height: 40px;">검색</button>
						</form>
					</div>
					<div style="background-color: white; margin-top: 30px;">
						<table class="table table-striped" style="text-align: center; ">
							<thead>
								<tr style="vertical-align: middle;">
									<th scope="col"><input type="checkbox" id="allcheck" /></th>
									<th scope="col">No</th>
									<th scope="col">닉네임</th>
									<th scope="col">제목</th>
									<th scope="col">등록일</th>
									<th scope="col">조회수</th>
									<th scope="col">공개여부</th>
									<th scope="col">관리</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${boardList}" var="boardList">
									<tr style="vertical-align: middle;">
										<th scope="row">
											<input type="checkbox" class="board-checkbox" value="${boardList.board_id }" />
										</th>
										<td>${boardList.board_id }</td>
										<td>${boardList.nickname }</td>
										<td style="text-align:left;"><a href="${root}/admin/manager_boardlook?board_id=${boardList.board_id}" style="text-decoration-line:none;color:black;">${boardList.title}</a></td>
										<td>${boardList.create_date }</td>
										<td>${boardList.views}</td>
										<td>
											<!-- 여기서부터 문제 -->
											<c:choose>
												<c:when test="${boardList.state == 0 }">
													삭제처리
												</c:when>
												<c:when test="${boardList.state == 1 }">
													게시중
												</c:when>
												<c:when test="${boardList.state == 2 }">
													복구
												</c:when>
												
											</c:choose>
										</td>
										<td>
											<a href="${root }/admin/manager_boardmodify?board_id=${boardList.board_id}" class="btn btn-dark">수정</a>
											<c:choose>
											    <c:when test="${boardList.state == 1 }">
											        <a href="#" class="btn btn-danger delete-link" data-href="${root }/admin/onedeleteB?board_id=${boardList.board_id}">삭제</a>
											    </c:when>
											    <c:otherwise>
											    	<button class="btn btn-info" onclick="confirmRecovery('${boardList.board_id}')" >복구</button>
											    </c:otherwise>
											</c:choose>
										</td>
									</tr>
									<script>	// 게시판복구
										function confirmRecovery(boardId) {
											    Swal.fire({
											        title: '복구하시겠습니까?',
											        text: '선택한 항목을 복구합니다.',
											        icon: 'board',
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
											                    window.location.href = '${root}/admin/board_recovery?board_id=' + boardId;
											                }
											            });
											        }
											    });
											}
										</script>
									
									
									<script>
									$(document).ready(function(){
									    $('.delete-link').click(function(e) {
									        e.preventDefault(); // 기본 링크 동작 방지
									        var url = $(this).data('href'); // 실제 이동할 URL
									
									        Swal.fire({
									            title: '정말 삭제하시겠습니까?',
									            icon: 'warning',
									            showCancelButton: true,
									            confirmButtonColor: '#3085d6',
									            cancelButtonColor: '#d33',
									            confirmButtonText: '삭제',
									            cancelButtonText: '취소'
									        }).then((result) => {
									            if (result.isConfirmed) {
									                window.location.href = url; // 사용자가 삭제를 선택하면 URL로 이동
									            }
									        });
									    });
									});
								</script>
								</c:forEach>
								
							</tbody>
						</table> 
						<!-- 외곽에 있는 내용 -->
						<div style="display:flex; margin-top: 20px; margin-bottom: 20px; float: right;">
						<button class="btn btn-dark" onclick="location.href='${root}/admin/manager_boardwrite'">글쓰기</button>
						<button class="btn btn-danger" id="deleteBtn" style="margin-left: 30px; margin-right: 30px;">삭제</button>  <!-- 전체 -->
						</div>
						<script>
						    $(document).ready(function() {
						        $("#deleteBtn").click(function() {
						            var selectedBoardIds = [];
						            $(".board-checkbox:checked").each(function() {
						                selectedBoardIds.push(parseInt($(this).val()));
						            });
						
						            if (selectedBoardIds.length > 0) {
						                // SweetAlert로 수정 확인 요청
						                Swal.fire({
						                    title: '정말 삭제하시겠습니까?',
						                    icon: 'warning',
						                    showCancelButton: true,
						                    confirmButtonColor: '#3085d6',
						                    cancelButtonColor: '#d33',
						                    confirmButtonText: '삭제',
						                    cancelButtonText: '취소'
						                }).then((result) => {
						                    if (result.isConfirmed) {
						                        // AJAX 요청
						                        $.ajax({
						                            url: "${root}/admin/DeleteBoard",
						                            type: "POST",
						                            traditional: true,
						                            data: {
						                                boardIds: selectedBoardIds
						                            },
						                            success: function(response) {
						                                Swal.fire(
						                                    '삭제 완료!',
						                                    '선택한 항목이 삭제되었습니다.',
						                                    'success'
						                                ).then(() => {
						                                    location.reload(); // 페이지 새로고침
						                                });
						                            },
						                            error: function(xhr, status, error) {
						                                Swal.fire(
						                                    '오류 발생',
						                                    '삭제 처리 중 문제가 발생하였습니다.',
						                                    'error'
						                                );
						                            }
						                        });
						                    }
						                });
						            } else {
						                Swal.fire(
						                    '항목 선택',
						                    '삭제할 항목을 선택해주세요.',
						                    'info'
						                );
						            }
						        });
						    });
						</script>
						
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
												href="${root }/admin/manager_boardlist?page=${pageBean.prevPage}"
												class="page-link">이전</a></li>
										</c:otherwise>
									</c:choose>

									<c:forEach var="idx" begin="${pageBean.min}"
										end="${pageBean.max}">
										<!-- model로 가져온 pageBean의 최소페이지부터 최대페이지까지 반복 : idx 는 현재페이지-->
										<c:choose>
											<c:when test="${idx == pageBean.currentPage }">
												<li class="page-item active"><a
													href="${root }/admin/manager_boardlist?page=${idx}"
													class="page-link"> ${idx } </a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a
													href="${root }/admin/manager_boardlist?page=${idx}"
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
												href="${root }/admin/manager_boardlist?page=${pageBean.nextPage}"
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
												href="${root }/admin/manager_boardlist?type=${type}&keyword=${keyword}&page=${pageBean1.prevPage}"
												class="page-link">이전</a></li>
										</c:otherwise>
									</c:choose>

									<c:forEach var="idx" begin="${pageBean1.min}"
										end="${pageBean1.max}">
										<!-- model로 가져온 pageBean의 최소페이지부터 최대페이지까지 반복 : idx 는 현재페이지-->
										<c:choose>
											<c:when test="${idx == pageBean1.currentPage }">
												<li class="page-item active"><a
													href="${root }/admin/manager_boardlist?type=${type}&keyword=${keyword}&page=${idx}"
													class="page-link"> ${idx } </a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a
													href="${root }/admin/manager_boardlist?type=${type}&keyword=${keyword}&page=${idx}"
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
												href="${root }/admin/manager_boardlist?type=${type}&keyword=${keyword}&page=${pageBean1.nextPage}"
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
												href="${root }/admin/manager_boardlist?type=${type}&keyword=${keyword}&page=${pageBean2.prevPage}"
												class="page-link">이전</a></li>
										</c:otherwise>
									</c:choose>

									<c:forEach var="idx" begin="${pageBean2.min}"
										end="${pageBean2.max}">
										<!-- model로 가져온 pageBean의 최소페이지부터 최대페이지까지 반복 : idx 는 현재페이지-->
										<c:choose>
											<c:when test="${idx == pageBean2.currentPage }">
												<li class="page-item active"><a
													href="${root }/admin/manager_boardlist?type=${type}&keyword=${keyword}&page=${idx}"
													class="page-link"> ${idx } </a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a
													href="${root }/admin/manager_boardlist?type=${type}&keyword=${keyword}&page=${idx}"
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
												href="${root }/admin/manager_boardlist?type=${type}&keyword=${keyword}&page=${pageBean2.nextPage}"
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
												href="${root }/admin/manager_boardlist?type=${type}&keyword=${keyword}&page=${pageBean3.prevPage}"
												class="page-link">이전</a></li>
										</c:otherwise>
									</c:choose>

									<c:forEach var="idx" begin="${pageBean3.min}"
										end="${pageBean3.max}">
										<!-- model로 가져온 pageBean의 최소페이지부터 최대페이지까지 반복 : idx 는 현재페이지-->
										<c:choose>
											<c:when test="${idx == pageBean3.currentPage }">
												<li class="page-item active"><a
													href="${root }/admin/manager_boardlist?type=${type}&keyword=${keyword}&page=${idx}"
													class="page-link"> ${idx } </a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a
													href="${root }/admin/manager_boardlist?type=${type}&keyword=${keyword}&page=${idx}"
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
												href="${root }/admin/manager_boardlist?type=${type}&keyword=${keyword}&page=${pageBean3.nextPage}"
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
						
						
						
						
						
						<c:otherwise>
						<p></p>
						</c:otherwise>
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