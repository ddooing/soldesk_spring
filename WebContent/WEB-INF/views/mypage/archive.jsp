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

<link rel="icon" type="image/x-icon" href="assets/ARTMEE_PAGELOGO.png" />

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
</style>

</head>
<body id="page-top">
	<!-- 메뉴바 -->
	<c:import url="/WEB-INF/views/include/header.jsp" />
	<c:import url="/WEB-INF/views/include/mypage_header.jsp" />


<a href="${root }/mypage/archive_write?user_id=${loginUserBean.user_id}">아카이브 작성</a>

	<!-- 메뉴바 -->
	<div class="menubar"
		style="margin: auto; justify-content: center; display: flex; padding-top: 75px; flex-direction: column;">
		<div id="index_wrap" style="margin: auto; justify-content: center; display: flex; flex-direction: column; margin: auto;">

			<div style="justify-content: center; display: flex; margin: auto;">
				<ul id="leftToRight" class="menu "
					style="display: flex; align-items: center; list-style-type: none; padding: 0; margin: 0;">
					<li class="upMenu" onclick="window.location.href='${root}/mypage/reservelist?user_id=${loginUserBean.user_id }'"><div
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


	<!-- 아카이브 -->
	<div class="archive" style="margin: auto;">
		<div class="archivegrid"
			style="grid-auto-rows: minmax(350px, auto); display: grid; margin-left: 35px; grid-template-columns: repeat(3, 1fr); grid-template-rows: repeat(3, 1fr); padding: 30px; justify-content: center; margin: auto; \width: 860px;">
		
		
		<c:forEach items="${ArchiveAllInfoBean}" var="archivelist">
			<c:choose>
				<c:when test="${!empty archivelist.create_date}">
					<!-- 메인포스터 나오는 코드 -->
					<div class="archivediv btn-open-reviewmodal" data-modal-id="modal-${archivelist.reserve_id}">
		                <img src="${archivelist.main_poster_path}${archivelist.main_poster_name}" />
		            </div>
				</c:when>
				<c:otherwise>
					<div class="archivediv btn-open-reviewmodal">
		                <img onclick="window.location.href='${root}/mypage/archive_write?user_id=${loginUserBean.user_id}&reserve_id=${archivelist.reserve_id}'" src="${archivelist.main_poster_path}${archivelist.main_poster_name}" />
		            </div>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:forEach items="${ArchiveAllInfoBean}" var="archivelist">
		<!-- 소감문 모달창 -->
			<div class="reviewmodal" id="modal-${archivelist.reserve_id}" style="display: none;">
				<div class="reivewmodal_body">
					<button class="archivediv btn-close-reivewmodal">
						<svg xmlns="http://www.w3.org/2000/svg" width="3.5em"
							height="3.5em" opacity="0.8" fill="currentColor" class="bi bi-x"
							viewBox="0 0 16 16">
								  <path
								d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708" />
						</svg>
					</button>


					<div style="display: flex; margin-top: 20px;">
						<div style="float: left;">
							<img
								src="${archivelist.main_poster_path}${archivelist.main_poster_name}"
								style="width: 170px; height: 245px;" />
						</div>
						<div style="float: right; margin-left: 20px; text-align: left;">
							<p style="font-size: 30px; font-weight: bold;">${archivelist.title}</p>
							<p>${archivelist.place}</p>
							<p>예약 날짜 &nbsp; ${archivelist.reserve_date}</p>
							<p>티켓 수 &nbsp; ${archivelist.ticket_count} 매</p>
							<p>티켓 가격 &nbsp; ${archivelist.total_price} 원</p>
						</div>

					</div>

					<hr />
					<form:form action="${root }/mypage/review_modify" method="post"		
						modelAttribute="reviewBean">
						<form:hidden path="reserve_id" value="${archivelist.reserve_id}"/>
						<div style="text-align: center; font-size: 35px;"
							class="star-rating">
							<input type="radio" id="star1" name="rating" value="1"
								style="display: none;" /><label for="star1" title="1 star">&#9733;</label>
							<input type="radio" id="star2" name="rating" value="2"
								style="display: none;" /><label for="star2" title="2 stars">&#9733;</label>
							<input type="radio" id="star3" name="rating" value="3"
								style="display: none;" /><label for="star3" title="3 stars">&#9733;</label>
							<input type="radio" id="star4" name="rating" value="4"
								style="display: none;" /><label for="star4" title="4 stars">&#9733;</label>
							<input type="radio" id="star5" name="rating" value="5"
								style="display: none;" /><label for="star5" title="5 stars">&#9733;</label>
						</div>


						<div class="review"
							style="width: 465px; height: 270px; border: none; box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08) 0px 0px 0px 1px; border-radius: 20px; padding: 10px; outline: 0; resize: none;">
							<form:textarea path="contents"/>
							<!-- 임시로 텍스트에디터 사용안함 -->
						</div>
						<!-- textarea에 대한 팝업 크기 조절 추가하기 -->

						<div class="checkbox-wrapper-17"
							style="margin-top: 10px; display: flex; align-items: center;">
							<input type="checkbox" id="switch-17" value="1" path="expose" onchange="updateValue(this)" /><label for="switch-17"></label>
							<span style="margin-left: 10px;">공개 여부</span>
							
							<button type="submit" class="btn btn-dark" style="margin-left: 270px;" role="button">수정</button>

						</div>
					</form:form>
					
					 
				</div>
			</div>

			<!-- 모달 끝 -->
			</c:forEach>
			<!-- 소감문 작성 전 - 소감문 작성 페이지로 이동 , 소감문 작성 후 - 소감문 모달창 -->
			
					<script>
				        document.addEventListener('DOMContentLoaded', function() {
				            const openModalButtons = document.querySelectorAll('.btn-open-reviewmodal');
				            const closeModalButtons = document.querySelectorAll('.btn-close-reviewmodal');
				
				            openModalButtons.forEach(button => {
				                button.addEventListener('click', function() {
				                    const modalId = this.getAttribute('data-modal-id');
				                    const modal = document.getElementById(modalId);
				                    modal.style.display = 'flex';
				                });
				            });
				
				            closeModalButtons.forEach(button => {
				                button.addEventListener('click', function() {
				                    // '.reviewmodal' 클래스를 가진 가장 가까운 부모 요소를 찾아서 닫음
				                    this.closest('.reviewmodal').style.display = 'none';
				                });
				            });
				        });
				    </script>
			

			


		</div>
	</div>



	</div>
	<!-- 푸터-->
	<c:import url="/WEB-INF/views/include/footer.jsp" />


	<script>	// 공개여부 체크시 value : 1 해제시 value : 0
		function updateValue(checkbox) {
		  if (checkbox.checked) {
		    checkbox.value = "1";
		  } else {
		    checkbox.value = "0";
		  }
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


	


	<script>	// 별작동 모달
        document.addEventListener("DOMContentLoaded", function() {
            let stars = document.querySelectorAll('.star-rating label');
            let ratingInputs = document.querySelectorAll('.star-rating input[type="radio"]');
            let selectedRating = 0;

            stars.forEach(function(star, index) {
                star.addEventListener('mouseover', function() {
                    highlightStars(index + 1);
                });

                star.addEventListener('mouseout', function() {
                    highlightStars(selectedRating);
                });

                star.addEventListener('click', function() {
                    selectedRating = index + 1;
                });
            });

            ratingInputs.forEach(function(input) {
                input.addEventListener('change', function() {
                    selectedRating = parseInt(this.value);
                });
            });

            function highlightStars(count) {
                stars.forEach(function(star, index) {
                    if (index < count) {
                        star.classList.add('hovered');
                    } else {
                        star.classList.remove('hovered');
                    }
                });
            }
        });
    </script>



</body>
</html>