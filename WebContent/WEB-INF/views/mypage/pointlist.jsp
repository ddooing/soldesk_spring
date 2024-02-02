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
	
	<link rel="icon" type="image/x-icon" href="assets/ARTMEE_PAGELOGO.png" />

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
	
.menu {
    list-style: none;
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
					   <li class="upMenu" onclick="window.location.href='${root}/mypage/reservelist?user_id=${loginUserBean.user_id }'"><div id="mypageLink" class="selected" >Mypage</div></li>
					   <li class="upMenu" onclick="window.location.href='${root}/mypage/bookmark?user_id=${loginUserBean.user_id }'"><div id="bookmark" >북마크 </div></li>
					   <li class="upMenu" onclick="window.location.href='${root}/mypage/archive?user_id=${loginUserBean.user_id }'"><div id="archive">아카이브</div></li>
					   <li class="upMenu" onclick="window.location.href='${root}/mypage/FAQ?user_id=${loginUserBean.user_id }'"><div id="crm">고객센터</div></li>
				  	</ul>
	 			</div>
 			

 			<div class="ullist visible" style="padding-top:20px;">
			   <ul id="mypageMenu" class="submenu visible">
					<li id="reservationList" onclick="window.location.href='${root}/mypage/reservelist?user_id=${loginUserBean.user_id }'">예매내역</li>
	                <li id="poinList" class="sel" onclick="window.location.href='${root}/mypage/pointlist?user_id=${loginUserBean.user_id }'">포인트 적립/이용 내역</li>
	                <li id="postList"  onclick="window.location.href='${root}/mypage/boardwritelist?user_id=${loginUserBean.user_id }'">작성한 글</li>
		        </ul>
		        
			    <ul id="crmMenu" class="submenu " >
					<li id="faq" onclick="window.location.href='${root}/mypage/FAQ?user_id=${loginUserBean.user_id }'">자주 묻는 질문</li>
	                <li id="qna" onclick="window.location.href='${root}/mypage/QnA?user_id=${loginUserBean.user_id }'">Q&A</li>
	                <li id="delete" onclick="window.location.href='${root}/mypage/Unjoin?user_id=${loginUserBean.user_id }'">회원탈퇴</li>
		        </ul>
		 	</div>
		</div>
	</div>
		
	
			<!-- 포인트 적립/사용 내역 -->
			<div class="poinList" style="margin:auto; margin-top:30px;"> 
				<div style="background :#d3d3d32e;  width:860px; display: flex; padding: 30px; margin:auto; border-radius:15px;" >
					<table class="point-table" style="width:100%;">
						<tr style="border-bottom: 1px solid #ccc; padding: 5px;">
							<th style="text-align:center; font-size:23px;">적립/사용일</th>
							<th style="text-align:center; font-size:23px;">적립/사용내역</th>
							<th style="text-align:center; font-size:23px;">적립/사용액</th>
						</tr>
						
						<c:forEach items="${UserPointListBean}" var="pointlist">
							<tr>
					        	<td >${pointlist.regdate}</td>
					        	   
					        	<c:if test="${pointlist.point_state_code == 1}">
					        		<c:if test="${pointlist.point_type_code == 1}">
					        			<td>예매 포인트 적립</td>
					        		</c:if>
					        		<c:if test="${pointlist.point_type_code == 2}">
					        			<td>소감문 포인트 적립</td>
					        		</c:if>
					        		<c:if test="${pointlist.point_type_code == 3}">
					        			<td>소감문 공개 포인트 적립</td>
					        		</c:if>
					        	</c:if>
					        	<c:if test="${pointlist.point_state_code == 2}">
					        		<td>예매 포인트 사용</td>
					        	</c:if>
					        		
					        	<c:if test="${pointlist.point_state_code == 1}">
					        		<td style="color:green;">+${pointlist.point}P</td>
					        	</c:if>
					        	<c:if test="${pointlist.point_state_code == 2}">
					        		<td style="color:#ff6a00;">-${pointlist.point}P</td>
					        	</c:if>
					    	</tr>
						</c:forEach>
					
					</table>
				</div>
			</div>	
		
		
	
	<!-- 푸터-->
	<c:import url="/WEB-INF/views/include/footer.jsp"/> 
	
	
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