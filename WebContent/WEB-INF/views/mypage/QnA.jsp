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
<!-- Carousel 자바스크립트-->
<script src='https://www.gmarwaha.com/script/lib/jquery-1.11.1.js'></script>
<script src="https://www.gmarwaha.com/script/lib/jquery.easing-1.3.js"></script>
<script
	src="https://www.gmarwaha.com/script/lib/jquery.easing.compatibility.js"></script>
<script
	src="https://www.gmarwaha.com/script/lib/jquery.mousewheel-3.1.12.js"></script>
<script
	src="https://www.gmarwaha.com/jquery/jcarousellite/script/jquery.jcarousellite.js"></script>

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
</style>

</head>
<body id="page-top">
	<!-- 메뉴바 -->
	<c:import url="/WEB-INF/views/include/header.jsp" />
	<c:import url="/WEB-INF/views/include/mypage_header.jsp" />

	<!-- 페이지 시작 -->



	<!-- 메뉴바 -->
	<div class="menubar"
		style="margin: auto; justify-content: center; display: flex; padding-top: 75px; flex-direction: column;">
		<div id="index_wrap"
			style="margin: auto; justify-content: center; display: flex; flex-direction: column;">

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
							id="archive">아카이브</div></li>
					<li class="upMenu"
						onclick="window.location.href='${root}/mypage/FAQ?user_id=${loginUserBean.user_id }'"><div
							id="crm" class="selected">고객센터</div></li>
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

				<ul id="crmMenu" class="submenu visible">
					<li id="faq"
						onclick="window.location.href='${root}/mypage/FAQ?user_id=${loginUserBean.user_id }'">자주
						묻는 질문</li>
					<li id="qna" class="sel"
						onclick="window.location.href='${root}/mypage/QnA?user_id=${loginUserBean.user_id }'">Q&A</li>
					<li id="delete" onclick="">회원탈퇴</li>
				</ul>
			</div>
		</div>
	</div>



	<!-- 문의사항 -->
	<div class="qna" style="margin: auto;">

		<div style="width: 860px; display: flex; margin: auto;">
			<section class="notice"
				style="width: 860px; display: flex; margin-top: 50px;">
				<div id="board-list">
					<div
						style="width: 835px; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
						<div
							style="display: flex; justify-content: center; text-align: center; margin-top: 20px;">
							<div style="width: 100px;">
								<p>번호</p>
							</div>
							<div style="width: 700px;">
								<p>제목</p>
							</div>
							<div style="width: 100px;">
								<p>답변상태</p>
							</div>
							<div style="width: 200px;">
								<p>날짜</p>
							</div>
						</div>
						<!--내용-->

						<c:choose>
							<c:when test="${empty UserQnAInfoBean}">
								<div
									style=" width: 835px; height: 300px; margin: auto; border-top: 1px solid #e7e7e7;">
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
										<h3 style="margin-top: 50px;">예매 내역이 없습니다</h3>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach items="${UserQnAInfoBean}" var="qnalist"
									varStatus="status">
									<div id="question_${qnalist.qna_id}" class="question"
										style="display: flex; justify-content: center; align-items: center; text-align: center; border-top: 1px solid #e7e7e7;">
										<div
											style="width: 100px; height: 60px; display: flex; align-items: center; justify-content: center;">
											<p1 style="margin: 0;">${qnalist.row_number}</p1>
										</div>
										<div
											style="width: 700px; text-align: left; height: 60px; display: flex; align-items: center;">
											<a href="#" style="color: black; text-decoration: none;">
												<p1 style="margin: 0;">[질문] ${qnalist.title}</p1>
											</a>
										</div>
										<div
											style="width: 100px; height: 60px; display: flex; align-items: center; justify-content: center;">
											<c:choose>
												<c:when test="${qnalist.state == 0 }">
													<span class="badge text-bg-danger rounded-pill"
														style="font-size: 15px;">답변전</span>
												</c:when>
												<c:otherwise>
													<span class="badge text-bg-success rounded-pill"
														style="font-size: 15px;">답변완료</span>
												</c:otherwise>
											</c:choose>
										</div>
										<div
											style="width: 200px; height: 60px; display: flex; align-items: center; justify-content: center;">
											<p1 style="margin: 0;">${qnalist.regdate}</p1>
										</div>
									</div>


									<div id="answer_${qnalist.qna_id}" class="answer"
										style="display: none; width: 835px; justify-content: center; margin-top: 20px; margin-bottom: 20px; padding-left: 110px; padding-right: 50px;">
										<div>${qnalist.contents }</div>
										<br>
										<div>
											<svg xmlns="http://www.w3.org/2000/svg" width="16"
												height="16" fill="currentColor"
												class="bi bi-arrow-return-right" viewBox="0 0 16 16">
										  <path fill-rule="evenodd"
													d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5"></path>
										</svg>
											[답변]
										</div>
										<c:choose>
											<c:when test="${qnalist.reply != null}">
												<p1> ${qnalist.reply} </p1>
											</c:when>
											<c:otherwise>
												<p1> 아직 답변을 받지 못했습니다. </p1>
											</c:otherwise>
										</c:choose>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>



					</div>
				</div>
			</section>


		</div>
		
		<div class="d-none d-md-block" style="margin-top:50px;">
				<ul class="pagination justify-content-center">
					<c:choose>
						<c:when test="${pageBean.prevPage <= 0 }">
							<li class="page-item disabled">		<!-- 1페이지에 있으면 이전 버튼 비활성화 -->
								<a href="#" class="page-link">이전</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a href="${root }/mypage/QnA?user_id=${loginUserBean.user_id}&page=${pageBean.prevPage}" class="page-link">이전</a>
							</li>
						</c:otherwise>
					</c:choose>
					
					<c:forEach var ="idx" begin="${pageBean.min}" end="${pageBean.max}">
					<!-- model로 가져온 pageBean의 최소페이지부터 최대페이지까지 반복 : idx 는 현재페이지-->
						<c:choose>
							<c:when test="${idx == pageBean.currentPage }">
								<li class="page-item active" >
									<a href="${root }/mypage/QnA?user_id=${loginUserBean.user_id}&page=${idx}" class="page-link">
										${idx }
									</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a href="${root }/mypage/QnA?user_id=${loginUserBean.user_id}&page=${idx}" class="page-link">
										${idx }
									</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					
					<c:choose>
						<c:when test="${pageBean.max >= pageBean.pageCnt  }">	<!-- max페이지 > 전체페이지개수 일때  -->
							<li class="page-item disabled" >		<!-- 1페이지에 있으면 이전 버튼 비활성화 -->
								<a href="#" class="page-link">다음</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a href="${root }/mypage/QnA?user_id=${loginUserBean.user_id}&page=${pageBean.nextPage}" class="page-link">다음</a>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			
			<div class="d-block d-md-none">
				<ul class="pagination justify-content-center">
					<li class="page-item">
						<a href="#" class="page-link">이전</a>
					</li>
					<li class="page-item">
						<a href="#" class="page-link">다음</a>
					</li>
				</ul>
			</div>
		
		
		
		<div
			style="display: flex; justify-content: center; align-content: center;">
			<button class="btn btn-dark" data-bs-toggle="modal"
				data-bs-target="#qnaModal"
				style="margin-top: 10px; margin-left: 650px;">문의 작성</button>
		</div>


	</div>

	<!-- QnA 모달 시작 -->
	<form:form action="${root }/mypage/QnA_add" method="post"
		modelAttribute="qnaBean">
		<form:hidden path="user_id" value="${loginUserBean.user_id }" />
		<div class="modal fade" id="qnaModal" tabindex="-1"
			aria-labelledby="qnaModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content"
					style="width: 950px; border-radius: 25px;">
					<div class="modal-header">
						<h5 class="modal-title" id="qnaModalLabel">Q&A</h5>
						<button type="button"
							style="border: none; background-color: transparent;"
							class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div
							class="container h-100 align-items-center justify-content-center">
							<!-- 제목 입력란 -->
							<div class="d-flex align-items-center" style="margin-top: 50px;">
								<div style="width: 150px; text-align: left;">
									<label for="title" style="font-size: 18px;">제목</label>
								</div>
								<div style="margin-left: 20px;">
									<form:input path="title" style="width: 700px;" />
								</div>
							</div>

							<!-- 문의 내용 입력란 -->
							<div class="d-flex align-items-center" style="margin-top: 50px;">
								<div style="width: 150px; text-align: left;">
									<label for="QnAcontent" style="font-size: 18px;">문의 내용</label>
								</div>
								<div style="margin-left: 20px;">
									<form:textarea path="contents"
										placeholder="정확한 상담을 위해 문의 내용을 자세히 작성해 주세요."
										style="width: 700px; height: 400px; resize: none;" />
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-dark">등록</button>
					</div>
				</div>
			</div>
		</div>
	</form:form>
	<!-- QnA 모달 종료 -->

	<!-- 회원 탈퇴 모달창 -->
	<div class="deletemodal"
		style="position: fixed; display: none; left: 50%; top: 50%; transform: translate(-50%, -50%); width: 650px; height: 500px; padding: 20px; background-color: rgba(255, 255, 255, 1); box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.3); border-radius: 10px; z-index: 1000;">
		<div class="deletemodal_body"
			style="position: relative; width: 100%; height: 100%;">
			<!-- 흰부분 -->
			<button class="archivediv btn-close-deletemodal"
				style="position: absolute; border: none; background-color: transparent; top: 0px; right: 10px;">
				<!-- SVG for close button -->
				<svg xmlns="http://www.w3.org/2000/svg" width="2.0m" height="2.0em"
					opacity="0.8" fill="currentColor" class="bi bi-x"
					viewBox="0 0 16 16">
								  <path
						d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708" />
							</svg>
			</button>
			<div style="margin-top: 20px; text-align: center;">
				<p style="font-size: 30px; font-weight: bold; text-align: center;">회원탈퇴</p>
			</div>
			<div style="text-align: center; font-size: 35px;">
				<p class="custom-message">
					회원 정보를 <span class="highlight-text" style="color: red;">안전하게
						보관</span>하기 위해<br>비밀번호를 다시 확인합니다.
				</p>
			</div>
			<div class="delete_filed"
				style="margin: auto; width: 465px; height: 270px; border-radius: 20px; padding: 10px;">
				<!-- 입력 필드 및 버튼 -->


				<div class="mb-3 text-center">
					<div class="form-label-group">
						<input type="text" class="form-control" placeholder="아이디"
							id="userId" required>
					</div>
				</div>

				<div class="mb-3 text-center">
					<div class="form-label-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							id="password" required>
					</div>
				</div>

				<div class="mb-3 text-center">
					<div class="form-label-group">
						<input type="password" class="form-control" placeholder="비밀번호 확인"
							id="confirmPassword" required>
					</div>
				</div>
				<button type="submit" class="btn btn-danger"
					style="margin-left: 177px;">회원 탈퇴</button>
			</div>
		</div>
	</div>

	<!-- 푸터-->
	<c:import url="/WEB-INF/views/include/footer.jsp" />
	<script>
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

	<script>
    // 모든 질문 요소에 대한 클릭 이벤트 리스너 추가
    document.querySelectorAll('.question').forEach(question => {
        question.addEventListener('click', function() {
            // 질문의 ID에서 qna_id 추출
            const qnaId = this.id.split('_')[1];

            // 관련된 답변 요소 찾기
            const answer = document.getElementById('answer_' + qnaId);

            // 답변 요소의 표시 상태 토글
            if (answer.style.display === 'none') {
                answer.style.display = 'block';
            } else {
                answer.style.display = 'none';
            }
        });
    });
</script>

	<script>
    // 회원 탈퇴 모달과 열기, 닫기 버튼을 선택
    const deleteModal = document.querySelector('.deletemodal');
    const openDeleteModalButton = document.querySelector('#delete');
    const closeDeleteModalButton = deleteModal.querySelector('.btn-close-deletemodal');

    // '회원 탈퇴' 버튼에 이벤트 리스너 추가
    openDeleteModalButton.addEventListener('click', () => {
        deleteModal.style.display = 'flex';
        document.body.style.overflow = 'hidden'; // 모달이 열렸을 때 스크롤 방지
    });

    // 닫기 버튼에 이벤트 리스너 추가
    closeDeleteModalButton.addEventListener('click', () => {
        deleteModal.style.display = 'none';
        document.body.style.overflow = 'visible'; // 스크롤 가능하게 복원
    });

    // 모달 외부 클릭 시 모달 닫기
    window.addEventListener('click', (e) => {
        if (e.target === deleteModal) {
            deleteModal.style.display = 'none';
            document.body.style.overflow = 'visible'; // 스크롤 가능하게 복원
        }
    });
</script>



</body>
</html>