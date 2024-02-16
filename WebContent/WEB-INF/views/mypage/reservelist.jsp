<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="root" value="${pageContext.request.contextPath }"/>    
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
	<link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900"
		rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
		rel="stylesheet" />

	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Carousel 자바스크립트-->
	<script src='https://www.gmarwaha.com/script/lib/jquery-1.11.1.js'></script>
	<script src="https://www.gmarwaha.com/script/lib/jquery.easing-1.3.js"></script>
	<script src="https://www.gmarwaha.com/script/lib/jquery.easing.compatibility.js"></script>
	<script src="https://www.gmarwaha.com/script/lib/jquery.mousewheel-3.1.12.js"></script>
	<script src="https://www.gmarwaha.com/jquery/jcarousellite/script/jquery.jcarousellite.js"></script>
	
		<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
	
		<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
	
	
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


<link  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
<title>Insert title here</title>
<style>
table, th, td {
  padding: 30px;
}
.menu {
    list-style: none;
}
 td{
	text-align: right;
}




</style>

</head>
<body id="page-top">
	<!-- 메뉴바 -->
	<c:import url="/WEB-INF/views/include/header.jsp"/>
	<c:import url="/WEB-INF/views/include/mypage_header.jsp"/>
	
	
		
		
		<!-- 메뉴바 -->
		<div class="menubar" style="/*width:80%;*/ margin:auto; justify-content: center; display: flex;padding-top: 75px;  flex-direction: column;">
			<div id="index_wrap" style="/*width:80%;*/ margin:auto; justify-content: center; display: flex;  flex-direction: column;">
				
				<div  style="justify-content: center;display: flex; margin: auto;  ">
					<ul id ="leftToRight" class="menu " style="display: flex; 
				    align-items: center; list-style-type: none; padding: 0; margin: 0;">
					   <li class="upMenu" onclick="window.location.href='${root}/mypage/reservelist?user_id=${loginUserBean.user_id }'"><div id="mypageLink" class="selected">Mypage</div></li>
					   <li class="upMenu" onclick="window.location.href='${root}/mypage/bookmark?user_id=${loginUserBean.user_id }'"><div id="bookmark" >북마크 </div></li>
					   <li class="upMenu" onclick="window.location.href='${root}/mypage/archive?user_id=${loginUserBean.user_id }'"><div id="archive" >아카이브</div></li>
					   <li class="upMenu" onclick="window.location.href='${root}/mypage/FAQ?user_id=${loginUserBean.user_id }'"><div id="crm">고객센터</div></li>
				  	</ul>
	 			</div>
 			
 			<div class="ullist visible" style="padding-top:20px;">
			   <ul id="mypageMenu" class="submenu visible">
					<li id="reservationList" class="sel" onclick="window.location.href='${root}/mypage/reservelist?user_id=${loginUserBean.user_id }'">예매내역</li>
	                <li id="poinList" onclick="window.location.href='${root}/mypage/pointlist?user_id=${loginUserBean.user_id }'">포인트 적립/이용 내역</li>
	                <li id="postList" onclick="window.location.href='${root}/mypage/boardwritelist?user_id=${loginUserBean.user_id }'">작성한 글</li>
		        </ul>
		        
			    <ul id="crmMenu" class="submenu " >
					<li id="faq" onclick="window.location.href='${root}/mypage/FAQ?user_id=${loginUserBean.user_id }'">자주 묻는 질문</li>
	                <li id="qna" onclick="window.location.href='${root}/mypage/QnA?user_id=${loginUserBean.user_id }'">Q&A</li>
	                <li id="delete" onclick="window.location.href='${root}/mypage/Unjoin?user_id=${loginUserBean.user_id }'">회원탈퇴</li>
		        </ul>
		 	</div>
		</div>
	</div>
		
				

				
				
			<!-- 예매내역 -->
			<div class="reservationList contentshow" style="margin:auto;" > 
			
			
			<c:choose>
				<c:when test="${empty UserReserveListBean}">
				<div style="background :#d3d3d32e;  width:860px; height:300px; margin:auto; border-radius:15px;" >
					<div class="test-center" style="margin:auto;   display:flex;  flex-direction:column; align-items:center;">
					    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="currentColor" class="bi bi-x-circle" style="margin-top:80px;" viewBox="0 0 16 16">
					        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
					        <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/>
					    </svg>
					    <h3 style="margin-top:50px;">예매 내역이 없습니다</h3>
					</div>
				</div>	
				</c:when>
				<c:otherwise>
					<c:choose>
				<c:when test="${empty UserReserveListBean}">
				<div style="background :#d3d3d32e;  width:860px; height:300px; margin:auto; border-radius:15px;" >
					<div class="test-center" style="margin:auto;   display:flex;  flex-direction:column; align-items:center;">
					    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="currentColor" class="bi bi-x-circle" style="margin-top:80px;" viewBox="0 0 16 16">
					        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
					        <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/>
					    </svg>
					    <h3 style="margin-top:50px;">예매 내역이 없습니다</h3>
					</div>
				</div>	
				</c:when>
				<c:otherwise>
					<c:forEach items="${UserReserveListBean}" var="reservelist">
						<div style="background:#d3d3d32e; display: flex; flex-direction: row;  padding: 30px; width:830px;" >
							<div>
								<table style="width: 770px;">
									<tr>
										<th rowspan="5" style="width:300px; align-items: center; align-content: center;"><img src="${reservelist.main_poster_path}${reservelist.main_poster_name}" style="width:250px; height:350px;"/></th>
									</tr>
									<tr style="text-align: center;">
										<th colspan="2"><p style="margin-bottom:10px; font-weight:bold; font-size:25px;">${reservelist.title }</p></th>
									</tr>
									<tr>
										<th><p>예매 날짜</p></th>
										<td><p>${reservelist.reserve_date }</p></td>
									</tr>
									<tr>
										<th><p>티켓 수량</p></th>
										<td><p>${reservelist.ticket_count } 매 </p></td>
									</tr>
									
									<tr>
										<th><p>총 결제 금액</p></th>
										<td><p>${reservelist.total_price } 원</p></td>
									</tr>
									<tr>
									<td>
										<c:choose>
												<c:when test="${reservelist.state == 1 }">
													<p style=" color:gray;">예매 상태 : 
														<span>
															결제완료
														</span>
													</p>
													<td>
														<button class="reserCancel" data-target="detailInfo${reservelist.reserve_id}">상세보기</button>
													</td>
												</c:when>
												<c:when test="${reservelist.state == 2 }">
													<p style=" color:gray;">예매 상태 : 
														<span>
															결제취소
														</span>
													</p>
												</c:when>
												<c:otherwise>
													<p style=" color:gray;">예매 상태 : 
														<span>
															관람완료	
														</span>
													</p>
														<td>
															<button class="reserCancel" data-target="detailInfo${reservelist.reserve_id}">상세보기</button>
														</td>
													
												</c:otherwise>
											</c:choose>
											</td>
									</tr>
								</table>
							</div>
						</div>
						<div id="detailInfo${reservelist.reserve_id}" style="display: none;background:#d3d3d32e; width: 830px;">
							<table>
								<tr>
									<th colspan="2"><hr style="margin: auto; margin-top:10px; width: 800px;" /></th>
								</tr>
								<tr>
									<th style="width: 300px; text-align: center;"><p>포인트 상세</p></th>
									<td>
										<p style=" color: red">- 포인트 결제액 500P</p>
										<p style=" color: green">+ 포인트 적립액 200P</p>
									</td>
								</tr>
								<tr>
									<th colspan="2"><hr style="margin: auto; width: 800px;" /></th>
								</tr>
								<tr>
									<th style="width: 300px; text-align: center;"></th>
									<td>
										<p>티켓 금액 : <b>50000</b> 원</p>
										<p style=" color: red">- 포인트 사용 할인금액 : <b>1000</b> 원</p>
										<p style="font-size: 30px;">총 결제 금액 : <b>49000</b> 원</p>
									</td>
								</tr>
								<tr>
									<th colspan="2"><hr style="margin: auto; margin-bottom:10px; width: 800px;" /></th>
								</tr>
							</table>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
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
								<a href="${root }/mypage/reservelist?user_id=${loginUserBean.user_id}&page=${pageBean.prevPage}" class="page-link">이전</a>
							</li>
						</c:otherwise>
					</c:choose>
					
					<c:forEach var ="idx" begin="${pageBean.min}" end="${pageBean.max}">
					<!-- model로 가져온 pageBean의 최소페이지부터 최대페이지까지 반복 : idx 는 현재페이지-->
						<c:choose>
							<c:when test="${idx == pageBean.currentPage }">
								<li class="page-item active" >
									<a href="${root }/mypage/reservelist?user_id=${loginUserBean.user_id}&page=${idx}" class="page-link">
										${idx }
									</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a href="${root }/mypage/reservelist?user_id=${loginUserBean.user_id}&page=${idx}" class="page-link">
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
								<a href="${root }/mypage/reservelist?user_id=${loginUserBean.user_id}&page=${pageBean.nextPage}" class="page-link">다음</a>
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
					
				</c:otherwise>
			</c:choose>
			
				
			</div>
	<!-- 푸터-->
	<c:import url="/WEB-INF/views/include/footer.jsp"/> 
	
	<script>
    document.querySelectorAll('.reserCancel').forEach(button => {
        button.addEventListener('click', function() {
            var targetId = this.getAttribute('data-target');
            var targetElement = document.getElementById(targetId);
            if (targetElement.style.display === "none") {
                targetElement.style.display = "block";
            } else {
                targetElement.style.display = "none";
            }
        });
    });
</script>
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
</body>
</html>