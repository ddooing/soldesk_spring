<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />


<meta name="description" content="" />
<meta name="author" content="" />
<title>ARTMEE</title>

<link rel="icon" type="image/x-icon" href="../img/ARTMEE_PAGELOGO.png" />

<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
	rel="stylesheet" />

<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- sweet alert 2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap"
	rel="stylesheet">


<!-- Core theme JS-->
<script src="js/scripts.js"></script>

<script src="js/mypage.js"></script>
<!-- JQuery 자바스크립트-->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>


<!-- CSS -->
<link href="../css/styles.css" rel="stylesheet" />
<link href="../css/Mypage.css" rel="stylesheet" />



<!-- Font Awesome icons (free version) -->
<!--   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
-->


<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
<title>Insert title here</title>
<style>
.menu {
	list-style: none;
}

.star-rating {
	font-size: 0;
}

.star-rating label {
	font-size: 2rem; /* 별의 크기 */
	padding: 0 5px;
	cursor: pointer;
	color: #ccc; /* 비활성화된 별의 색상 */
}

.star-rating label.hovered, .star-rating label.selected {
	color: gold; /* 활성화된 별의 색상 */
}

.modal-dialog {
	margin-top: 700px; /* 또는 원하는 값으로 설정 */
}

.checkbox-wrapper-17 input[type=checkbox] {
	height: 0;
	width: 0;
	visibility: hidden;
}

.checkbox-wrapper-17 label { -
	-size: 55px;
	cursor: pointer;
	width: var(- -size);
	height: calc(var(- -size)/2);
	background: grey;
	display: block;
	border-radius: 100px;
	position: relative;
}

.checkbox-wrapper-17 label:after {
	content: '';
	position: absolute;
	top: 6%;
	left: 2.5%;
	width: calc(50% - 5%);
	height: calc(100% - 11%);
	background: #fff;
	border-radius: 90px;
	transition: 0.3s;
}

.checkbox-wrapper-17 input:checked+label {
	background: #bada55;
}

.checkbox-wrapper-17 input:checked+label:after {
	left: calc(100% - 2.5%);
	transform: translateX(-100%);
}

.checkbox-wrapper-17 label:active:after {
	width: 55%;
}
</style>

</head>
<body id="page-top">
	<!-- 메뉴바 -->
	<c:import url="/WEB-INF/views/include/header.jsp" />
	<c:import url="/WEB-INF/views/include/mypage_header.jsp" />

	<!-- 메뉴바 -->
	<div class="menubar"
		style="margin: auto; justify-content: center; display: flex; padding-top: 75px; flex-direction: column;">
		<div id="index_wrap"
			style="margin: auto; justify-content: center; display: flex; flex-direction: column; margin: auto;">

			<div style="justify-content: center; display: flex; margin: auto;">
				<ul id="leftToRight" class="menu "
					style="display: flex; align-items: center; list-style-type: none; padding: 0; margin: 0;">
					<li class="upMenu"
						onclick="window.location.href='${root}/mypage/reservelist?user_id=${loginUserBean.user_id }'"><div
							id="mypageLink">Mypage</div></li>
					<li class="upMenu"
						onclick="window.location.href='${root}/mypage/bookmark?user_id=${loginUserBean.user_id }'"><div
							id="bookmark">북마크</div></li>
					<li class="upMenu"
						onclick="window.location.href='${root}/mypage/archive?user_id=${loginUserBean.user_id }'"><div
							id="archive" class="selected">아카이브</div></li>
					<li class="upMenu"
						onclick="window.location.href='${root}/mypage/FAQ?user_id=${loginUserBean.user_id }'"><div
							id="crm">고객센터</div></li>
				</ul>
			</div>


			<div class="ullist visible" style="padding-top: 20px;">
				<ul id="mypageMenu" class="submenu">
					<li id="reservationList"
						onclick="window.location.href='${root}/mypage/reservelist?user_id=${loginUserBean.user_id }'">예매내역</li>
					<li id="poinList"
						onclick="window.location.href='${root}/mypage/pointlist?user_id=${loginUserBean.user_id }'">포인트
						적립/이용 내역</li>
					<li id="postList"
						onclick="window.location.href='${root}/mypage/boardwritelist?user_id=${loginUserBean.user_id }'">작성한
						글</li>
				</ul>

				<ul id="crmMenu" class="submenu ">
					<li id="faq"
						onclick="window.location.href='${root}/mypage/FAQ?user_id=${loginUserBean.user_id }'">자주
						묻는 질문</li>
					<li id="qna"
						onclick="window.location.href='${root}/mypage/QnA?user_id=${loginUserBean.user_id }'">Q&A</li>
					<li id="delete"
						onclick="window.location.href='${root}/mypage/Unjoin?user_id=${loginUserBean.user_id }'">회원탈퇴</li>
				</ul>
			</div>
		</div>
	</div>


	<c:choose>
		<c:when test="${empty ArchiveAllInfoBean}">
			<div
				style="background: #d3d3d32e; width: 860px; height: 300px; margin: auto; border-radius: 15px;">
				<div class="test-center"
					style="margin: auto; display: flex; flex-direction: column; align-items: center;">
					<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80"
						fill="currentColor" class="bi bi-x-circle"
						style="margin-top: 80px;" viewBox="0 0 16 16">
					        <path
							d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16" />
					        <path
							d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708" />
					    </svg>
					<h3 style="margin-top: 50px;">아카이브 내역이 없습니다</h3>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="archive" style="margin: auto;">
				<div class="archivegrid"
					style="grid-auto-rows: minmax(350px, auto); display: grid; margin-left: 35px; grid-template-columns: repeat(3, 1fr); grid-template-rows: repeat(3, 1fr); padding: 30px; justify-content: center; margin: auto; \width: 860px;">


					<c:forEach items="${ArchiveAllInfoBean}" var="archivelist">
						<c:choose>
							<c:when test="${!empty archivelist.create_date}">
								<!-- 메인포스터 나오는 코드 -->
								<div class="archivediv btn-open-reviewmodal" data-toggle="modal"
									data-target="#modal-${archivelist.reserve_id}">
									<img
										src="${archivelist.main_poster_path}${archivelist.main_poster_name}" />
								</div>
							</c:when>
							<c:otherwise>
								<div class="archivediv btn-open-reviewmodal">
									<img
										onclick="window.location.href='${root}/mypage/archive_write?user_id=${loginUserBean.user_id}&reserve_id=${archivelist.reserve_id}'"
										src="${archivelist.main_poster_path}${archivelist.main_poster_name}" />
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>




					<c:forEach items="${ArchiveAllInfoBean}" var="archivelist">
						<!-- Modal -->
						<div class="modal fade" id="modal-${archivelist.reserve_id}"
							data-rating="${archivelist.rating}" tabindex="-1" role="dialog"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">소감문 작성</h5>

									</div>
									<div class="modal-body">
										<div style="display: flex; margin-top: 20px;">
											<div style="float: left;">
												<img
													src="${archivelist.main_poster_path}${archivelist.main_poster_name}"
													style="width: 170px; height: 245px;" />
											</div>
											<div
												style="float: right; margin-left: 20px; text-align: left;">
												<p style="font-size: 30px; font-weight: bold;">${archivelist.title}</p>
												<p>${archivelist.place}</p>
												<p>예약 날짜 &nbsp; ${archivelist.reserve_date}</p>
												<p>티켓 수 &nbsp; ${archivelist.ticket_count} 매</p>
												<p>티켓 가격 &nbsp; ${archivelist.total_price} 원</p>
											</div>

										</div>

										<hr />
										<form id="modifyform"
											action="${root }/mypage/archive_modify?user_id=${loginUserBean.user_id }"
											method="post">
											<input type="hidden" name="reserve_id"
												value="${archivelist.reserve_id}" />
											<div style="text-align: center; font-size: 35px;"
												class="star-rating">
												<c:choose>
													<c:when test="${archivelist.rating == 1}">
														<input type="radio" id="star1" name="rating" value="1"
															style="display: none;" checked />
														<label for="star1">&#9733;</label>
														<input type="radio" id="star2" name="rating" value="2"
															style="display: none;" />
														<label for="star2">&#9733;</label>
														<input type="radio" id="star3" name="rating" value="3"
															style="display: none;" />
														<label for="star3">&#9733;</label>
														<input type="radio" id="star4" name="rating" value="4"
															style="display: none;" />
														<label for="star4">&#9733;</label>
														<input type="radio" id="star5" name="rating" value="5"
															style="display: none;" />
														<label for="star5">&#9733;</label>
													</c:when>
													<c:when test="${archivelist.rating == 2}">
														<input type="radio" id="star1" name="rating" value="1"
															style="display: none;" />
														<label for="star1">&#9733;</label>
														<input type="radio" id="star2" name="rating" value="2"
															style="display: none;" checked />
														<label for="star2">&#9733;</label>
														<input type="radio" id="star3" name="rating" value="3"
															style="display: none;" />
														<label for="star3">&#9733;</label>
														<input type="radio" id="star4" name="rating" value="4"
															style="display: none;" />
														<label for="star4">&#9733;</label>
														<input type="radio" id="star5" name="rating" value="5"
															style="display: none;" />
														<label for="star5">&#9733;</label>
													</c:when>
													<c:when test="${archivelist.rating == 3}">
														<input type="radio" id="star1" name="rating" value="1"
															style="display: none;" />
														<label for="star1">&#9733;</label>
														<input type="radio" id="star2" name="rating" value="2"
															style="display: none;" />
														<label for="star2">&#9733;</label>
														<input type="radio" id="star3" name="rating" value="3"
															style="display: none;" checked />
														<label for="star3">&#9733;</label>
														<input type="radio" id="star4" name="rating" value="4"
															style="display: none;" />
														<label for="star4">&#9733;</label>
														<input type="radio" id="star5" name="rating" value="5"
															style="display: none;" />
														<label for="star5">&#9733;</label>
													</c:when>
													<c:when test="${archivelist.rating == 4}">
														<input type="radio" id="star1" name="rating" value="1"
															style="display: none;" />
														<label for="star1">&#9733;</label>
														<input type="radio" id="star2" name="rating" value="2"
															style="display: none;" />
														<label for="star2">&#9733;</label>
														<input type="radio" id="star3" name="rating" value="3"
															style="display: none;" />
														<label for="star3">&#9733;</label>
														<input type="radio" id="star4" name="rating" value="4"
															style="display: none;" checked />
														<label for="star4">&#9733;</label>
														<input type="radio" id="star5" name="rating" value="5"
															style="display: none;" />
														<label for="star5">&#9733;</label>
													</c:when>
													<c:when test="${archivelist.rating == 5}">
														<input type="radio" id="star1" name="rating" value="1"
															style="display: none;" />
														<label for="star1">&#9733;</label>
														<input type="radio" id="star2" name="rating" value="2"
															style="display: none;" />
														<label for="star2">&#9733;</label>
														<input type="radio" id="star3" name="rating" value="3"
															style="display: none;" />
														<label for="star3">&#9733;</label>
														<input type="radio" id="star4" name="rating" value="4"
															style="display: none;" />
														<label for="star4">&#9733;</label>
														<input type="radio" id="star5" name="rating" value="5"
															style="display: none;" checked />
														<label for="star5">&#9733;</label>
													</c:when>
													<c:otherwise>
														<input type="radio" id="star1" name="rating" value="1"
															style="display: none;" />
														<label for="star1">&#9733;</label>
														<input type="radio" id="star2" name="rating" value="2"
															style="display: none;" />
														<label for="star2">&#9733;</label>
														<input type="radio" id="star3" name="rating" value="3"
															style="display: none;" />
														<label for="star3">&#9733;</label>
														<input type="radio" id="star4" name="rating" value="4"
															style="display: none;" />
														<label for="star4">&#9733;</label>
														<input type="radio" id="star5" name="rating" value="5"
															style="display: none;" />
														<label for="star5">&#9733;</label>
													</c:otherwise>
												</c:choose>
											</div>


											<div class="review"
												style="width: 465px; height: 270px; border: none; box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08) 0px 0px 0px 1px; border-radius: 20px; padding: 10px; outline: 0; resize: none;">

												<textarea rows="10" cols="41" name="contents"
													style="resize: none;">${archivelist.contents }</textarea>
												<!-- 임시로 텍스트에디터 사용안함 -->
											</div>
											<!-- textarea에 대한 팝업 크기 조절 추가하기 -->

											<div class="checkbox-wrapper-17"
												style="margin-top: 10px; display: flex; align-items: center;">
												<c:choose>
													<c:when test="${archivelist.expose == 1}">
														<input type="hidden" name="expose"
															id="hiddenCheckboxValue-${archivelist.reserve_id}"
															value="1" />
														<input type="checkbox"
															id="switch-17-${archivelist.reserve_id}"
															onchange="updateCheckboxValue(this, '${archivelist.reserve_id}')"
															checked />
													</c:when>
													<c:otherwise>
														<input type="hidden" name="expose"
															id="hiddenCheckboxValue-${archivelist.reserve_id}"
															value="0" />
														<input type="checkbox"
															id="switch-17-${archivelist.reserve_id}"
															onchange="updateCheckboxValue(this, '${archivelist.reserve_id}')" />
													</c:otherwise>
												</c:choose>
												<label for="switch-17-${archivelist.reserve_id}"></label> <span
													style="margin-left: 10px;">공개 여부</span>
												<button type="button"
													class="btn btn-danger btn-close-reviewmodal"
													data-target="#modal-${archivelist.reserve_id}"
													style="margin-left: 200px;" role="button">취소</button>
												<button type="button" onclick="submitArchiveForm(this)" class="btn btn-dark" style="margin-left: 10px;" role="button">저장</button>
											</div>

										</form>

									</div>
								</div>
							</div>
						</div>
						<script>
							document.addEventListener("DOMContentLoaded", function() {
							    let stars = document.querySelectorAll('.star-rating label');
							    let ratingInputs = document.querySelectorAll('.star-rating input[type="radio"]');
							
							    // 별 클릭 이벤트: 별점 선택 시 해당 라디오 버튼을 체크합니다.
							    stars.forEach(function(star, index) {
							        star.addEventListener('click', function() {
							            ratingInputs[index].checked = true;
							            highlightStars(index + 1);
							        });
							    });
							
							    // 라디오 버튼 변경 감지 이벤트: 별점 상태 업데이트
							    ratingInputs.forEach(function(input, index) {
							        input.addEventListener('change', function() {
							            if(input.checked) {
							                highlightStars(index + 1);
							            }
							        });
							    });
							
							    function highlightStars(count) {
							        stars.forEach(function(star, index) {
							            if (index < count) {
							                star.classList.add('selected');
							            } else {
							                star.classList.remove('selected');
							            }
							        });
							    }
							});
						</script>

						<script>
$(document).ready(function() {
    // 모달 열기
    $('.btn-open-reviewmodal').click(function() {
        const modalId = $(this).data('target');
        const rating = $(modalId).data('rating');
        highlightStars(rating, modalId);
        $(modalId).modal('show');
    });

    // 별점 하이라이트 함수
    function highlightStars(count, modalId) {
        let stars = $(modalId + ' .star-rating label');
        stars.each(function(index) {
            if (index < count) {
                $(this).addClass('selected');
            } else {
                $(this).removeClass('selected');
            }
        });
    }
});
</script>

						<script>
		$(document).ready(function() {
		    // 모달 열기
		    $('.btn-open-reviewmodal').click(function() {
		        const modalId = $(this).data('target');
		        $(modalId).modal('show');
		    });

		    // 모달 닫기
		    $('.btn-close-reviewmodal').click(function() {
		        const modalId = $(this).data('target');
		        $(modalId).modal('hide');
		    });
		});

				    </script>


					</c:forEach>
				</div>




				<!-- 모달 끝 -->

				<!-- 소감문 작성 전 - 소감문 작성 페이지로 이동 , 소감문 작성 후 - 소감문 모달창 -->

				<div class="d-none d-md-block" style="margin-top: 50px;">
					<ul class="pagination justify-content-center">
						<c:choose>
							<c:when test="${pageBean.prevPage <= 0 }">
								<li class="page-item disabled"><a href="#"
									class="page-link">이전</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a
									href="${root}/mypage/archive?user_id=${loginUserBean.user_id}&page=${pageBean.prevPage}"
									class="page-link">이전</a></li>
							</c:otherwise>
						</c:choose>

						<c:forEach var="idx" begin="${pageBean.min}" end="${pageBean.max}">
							<c:choose>
								<c:when test="${idx == pageBean.currentPage}">
									<li class="page-item active"><a
										href="${root}/mypage/archive?user_id=${loginUserBean.user_id}&page=${idx}"
										class="page-link">${idx}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a
										href="${root}/mypage/archive?user_id=${loginUserBean.user_id}&page=${idx}"
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
									href="${root}/mypage/archive?user_id=${loginUserBean.user_id}&page=${pageBean.nextPage}"
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





			</div>
		</c:otherwise>
	</c:choose>

	<!-- 아카이브 -->


	<!-- 푸터-->
	<c:import url="/WEB-INF/views/include/footer.jsp" />


	<script>	// 공개여부 체크시 value : 1 해제시 value : 0
	function updateCheckboxValue(checkbox, reserveId) {
	    var hiddenInput = document.getElementById('hiddenCheckboxValue-' + reserveId);
	    hiddenInput.value = checkbox.checked ? "1" : "0";
	}

	</script>


	<script>	// 레벨 안내 모달
    // 툴팁 아이콘과 모달 요소를 선택
    const toolTipIcon = document.querySelector('.bi.bi-question-circle-fill');
    const toolModal = document.querySelector('.tool-modal');
    const toolCloseButton = document.querySelector('.tool-btn-close-modal');

    // 툴팁 아이콘 클릭 이벤트 리스너 추가
    toolTipIcon.addEventListener("click", () => {
        toolModal.style.display = "flex";
        document.body.style.overflow = 'hidden'; // 모달이 열렸을 때 스크롤 방지
    });

    // 모달 닫기 버튼 클릭 이벤트 리스너 추가
    toolCloseButton.addEventListener("click", () => {
        toolModal.style.display = "none";
        document.body.style.overflow = 'visible'; // 스크롤 가능하게 복원
    });

    // 모달 외부 클릭 시 모달 닫기
    window.addEventListener('click', (e) => {
        if (e.target === toolModal) {
            toolModal.style.display = "none";
            document.body.style.overflow = 'visible'; // 스크롤 가능하게 복원
        }
    });
</script>



<script>	// 아카이브 
function submitArchiveForm(button) {
    var form = $(button).closest('form');

    Swal.fire({
        title: '아카이브를 저장하시겠습니까?',
        icon: 'question',
        showCancelButton: true,
        confirmButtonText: '저장',
        cancelButtonText: '취소',
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire({
                title: '저장되었습니다!',
                icon: 'success' 
            }).then(() => {
                form.submit();
            });
        }
    });
}
</script>




</body>
</html>