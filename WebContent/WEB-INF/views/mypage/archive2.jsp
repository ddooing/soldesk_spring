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


	<!-- 아카이브 -->
	<div class="archive" style="margin: auto;">
		<div class="archivegrid"
			style="grid-auto-rows: minmax(350px, auto); display: grid; margin-left: 35px; grid-template-columns: repeat(3, 1fr); grid-template-rows: repeat(3, 1fr); padding: 30px; justify-content: center; margin: auto; \width: 860px;">

			<!-- 소감문 작성 전 - 소감문 작성 페이지로 이동 , 소감문 작성 후 - 소감문 모달창 -->
			<div class="archivediv btn-open-reivewmodal">
				<!-- db 연결 시추후 수정해야함 -->
				<img
					src="https://png.pngtree.com/png-clipart/20210704/original/pngtree-colorful-abstract-art-exhibition-poster-png-image_6488081.jpg" />
			</div>

			<!-- 소감문 모달창 -->
			<div class="reivewmodal">
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
								src="https://png.pngtree.com/png-clipart/20210704/original/pngtree-colorful-abstract-art-exhibition-poster-png-image_6488081.jpg"
								style="width: 170px; height: 245px;" />
						</div>
						<div style="float: right; margin-left: 20px; text-align: left;">
							<p style="font-size: 30px; font-weight: bold;">스페이스 월링앤딩링</p>
							<p>롯데뮤지엄</p>
							<p>예약 날짜 &nbsp; 2023.12.05 금</p>
							<p>관람 시간 &nbsp; 10:00 - 11:00</p>
							<p>티켓 수 &nbsp; 2매</p>
							<p>티켓 가격 &nbsp; 20,000원</p>
						</div>

					</div>

					<hr />
					<form:form action="${root }/mypage/review_pro" method="post"
						modelAttribute="reviewBean">
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
							
							<button type="submit" class="btn btn-dark" style="margin-left: 270px;" role="button">제출</button>

						</div>
					</form:form>
				</div>
			</div>

			<!-- 모달 끝 -->

			<div class="archivediv btn-open-reivewmodal">
				<img
					src="https://www.fnnews.com/resource/media/image/2023/07/06/202307061117228867_l.jpg" />
			</div>



			<div class="archivediv btn-open-reivewmodal">
				<img
					src="https://png.pngtree.com/png-clipart/20210704/original/pngtree-colorful-abstract-art-exhibition-poster-png-image_6488081.jpg" />
			</div>

			<div class="archivediv btn-open-reivewmodal">
				<img
					src="https://cdn.st-news.co.kr/news/photo/202303/7114_21221_2635.jpg" />
			</div>
			<div class="archivediv">
				<img
					src="https://cdn.st-news.co.kr/news/photo/202303/7114_21221_2635.jpg" />
			</div>

			<div class="archivediv">
				<img
					src="https://www.fnnews.com/resource/media/image/2023/07/06/202307061117228867_l.jpg" />
			</div>

			<div class="archivediv">
				<img
					src="data:image/jpeg;base64,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" />
			</div>
			<div class="archivediv">
				<img
					src="data:image/jpeg;base64,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" />
			</div>


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


	<script>	// 소감문 모달
    // 모달과 열기 버튼, 닫기 버튼을 선택
    const openModalButtons = document.querySelectorAll('.archivediv.btn-open-reivewmodal');
    const reviewModal = document.querySelector('.reivewmodal');
    const closeModalButton = reviewModal.querySelector('.btn-close-reivewmodal');

    // 각 열기 버튼에 이벤트 리스너 추가
    openModalButtons.forEach(button => {
        button.addEventListener('click', () => {
            reviewModal.style.display = 'flex';
            document.body.style.overflow = 'hidden'; // 모달이 열렸을 때 스크롤 방지
        });
    });

    // 닫기 버튼에 이벤트 리스너 추가
    closeModalButton.addEventListener('click', () => {
        reviewModal.style.display = 'none';
        document.body.style.overflow = 'visible'; // 스크롤 가능하게 복원
    });

    // 모달 외부 클릭 시 모달 닫기
    window.addEventListener('click', (e) => {
        if (e.target === reviewModal) {
            reviewModal.style.display = 'none';
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