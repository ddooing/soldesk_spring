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
	
	<!-- 페이지 시작 -->
	<div style="display: flex;
    justify-content: center;
    width: 80%;
    margin: auto;
    padding-top: calc(3rem + 40px); flex-direction: column; ">
		<!-- 상단 -->
		<div  style="justify-content: center;width: 65%;display: flex; margin: auto;">
		

					
			<!-- 이미지 -->
			<div style="display: flex; flex-direction: column;">
			<c:choose>
				<c:when test="${UserTopInfoBean.grade == 'level1'}">
					<img src="../img/level/profile_Lv1.png" style="width:85px; height:85px; border-radius: 4em; box-shadow: 5px 5px rgb(0, 0, 0, 0.1); margin: auto;"/>
				</c:when>
				<c:when test="${UserTopInfoBean.grade == 'level2'}">
					<img src="../img/level/profile_Lv2.png" style="width:85px; height:85px; border-radius: 4em; box-shadow: 5px 5px rgb(0, 0, 0, 0.1); margin: auto;"/>
				</c:when>
				<c:when test="${UserTopInfoBean.grade == 'level3'}">
					<img src="../img/level/profile_Lv3.png" style="width:85px; height:85px; border-radius: 4em; box-shadow: 5px 5px rgb(0, 0, 0, 0.1); margin: auto;"/>
				</c:when>
			</c:choose>
				<button class="button-2" role="button" onclick="window.location.href = '${root}/user/InfoChange?user_id=${loginUserBean.user_id}'">프로필 수정</button>
			</div>
			
			<!-- 닉네임, 게이지, 포인트  -->
			<div style="margin-left: 3em;
		    display: flex;
		    flex-direction: column;">
		    	
					<span style="font-size: 2em;margin-bottom: 0.2em;">${UserTopInfoBean.nickname }
					</span>
					
				
				<div style="display: flex; flex-direction: column; align-items: center;">
					<div style="display: flex;flex-direction: row;">
						<c:choose>
							<c:when test="${UserTopInfoBean.grade == 'level1'}">
								<div style="display: flex;flex-direction: column;">
								  <progress id="progress" value="${UserTopInfoBean.exp }" min="0" max="300" style="width: 20vw; height: 3vh; margin-bottom: 0.5em;"></progress>
								  <span style="font-size: 1em; margin-bottom: 0.5em;">${UserTopInfoBean.grade } &nbsp;다음 레벨까지 ${UserTopInfoBean.exp_to_next_level }exp &#x26A1;</span> 
								</div>
							</c:when>
							<c:when test="${UserTopInfoBean.grade == 'level2'}">
								<div style="display: flex;flex-direction: column;">
								  <progress id="progress" value="${UserTopInfoBean.exp }" min="301" max="800" style="width: 20vw; height: 3vh; margin-bottom: 0.5em;"></progress>
								  <span style="font-size: 1em; margin-bottom: 0.5em;">${UserTopInfoBean.grade } &nbsp;다음 레벨까지 ${UserTopInfoBean.exp_to_next_level }exp &#x26A1;</span> 
								</div>
							</c:when>
							<c:when test="${UserTopInfoBean.grade == 'level3'}">
								<div style="display: flex;flex-direction: column;">
								  <progress id="progress" value="800" min="800" max="800" style="width: 20vw; height: 3vh; margin-bottom: 0.5em;"></progress>
								  <span style="font-size: 1em; margin-bottom: 0.5em;">${UserTopInfoBean.grade } &nbsp;최대 레벨입니다 &#x26A1;</span> 
								</div>
							</c:when>
						</c:choose>
					
						
						
						<!-- 툴팁 -->
						<svg xmlns="http://www.w3.org/2000/svg" width="40px" height="40px" fill="currentColor"
							class="bi bi-question-circle-fill" viewBox="0 0 16 16"
							style="margin-left:50px; opacity:0.8;cursor:pointer;top: -7px;position: relative">
							<path
								d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M5.496 6.033h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286a.237.237 0 0 0 .241.247zm2.325 6.443c.61 0 1.029-.394 1.029-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94 0 .533.425.927 1.01.927z" />
						</svg>
					
					
						<div class="tool-modal" style="z-index: 5;">
					       <div class="tool-modal_body">
								<button class="tool-btn-close-modal">
									<svg xmlns="http://www.w3.org/2000/svg" width="3.5em" height="3.5em"opacity="0.8" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
								  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/>
								</svg>
								
								
							</button>
							
							<p style="margin-left: 30px; font-size:28px;font-weight:bold;">회원등급 혜택 안내</p>
									<div
										style="display: flex; justify-content: center; margin-left: 30px; margin-right: 30px; margin-top: 30px;">
										<div
											style="display: inline-block; text-align: center; width: 170px; border-right: 1px solid black;">
											<p style="font-size:25px">LV.1</p>
					
											<img src="../img/level/profile_Lv1.png"
												style="width:85px; height:85px; border-radius: 4em; box-shadow: 5px 5px rgb(0, 0, 0, 0.1);" />
											<br /><br /><br />
											<b style="margin-top: 10px;">1% 적립</b><br />
											<b style="margin-top: 10px;">exp 0 ~ 299</b>
					
										</div>
										<div
											style="display: inline-block; text-align: center; width: 170px; border-right: 1px solid black;">
											<p style="font-size:25px">LV.2</p>
					
											<img src="../img/level/profile_Lv2.png"
												style="width:85px; height:85px; border-radius: 4em; box-shadow: 5px 5px rgb(0, 0, 0, 0.1); margin: auto;" />
											<br /><br /><br />
											<b style="margin-top: 10px;">3% 적립</b><br />
											<b style="margin-top: 10px;">exp 300 ~ 899</b>
					
										</div>
										<div style="display: inline-block; text-align: center; width: 170px;">
											<p style="font-size:25px">LV.3</p>
					
											<img src="../img/level/profile_Lv3.png"
												style="width:85px; height:85px; border-radius: 4em; box-shadow: 5px 5px rgb(0, 0, 0, 0.1); margin: auto;" />
											<br /><br /><br />
											<b style="margin-top: 10px;">5% 적립</b><br />
											<b style="margin-top: 10px;">exp 900 ~</b>
					
										</div>
									</div>
					
									<hr style="width: 400px; margin-left: auto; margin-right: auto; border-color: black; border-width: 2px 0 0 0; margin-top: 30px;" />
									
									<div style=" margin-top: 30px; text-align: left; margin-right:220px;" >
										<h3 >경험치 획득방법</h3>
										<b style="margin-top: 50px;">전시회 예매 + 50 exp</b> <br /><br />
										<b style="margin-top: 30px; ">소감문 작성시 최대 + 10 exp</b> <br /><br />
										<b style="margin-top: 30px; ">소감문 공개 허용시 추가 + 5 exp</b> <br /><br />
					
									</div>
									
											
									<div style=" margin-top: 30px;text-align: left; ">
										<div style="display: flex;">
										<svg style="opacity:0.8; " xmlns="http://www.w3.org/2000/svg" width="25px" height="25px" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
										  <path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
										</svg>
										<h2 style="opacity:0.8;font-size: 25px;margin-left: 10px;">적립 포인트 정책 안내</h2>
										</div>
										 
										<p > - &nbsp;기간 내에 구매금액에 구매 확정 시점에 적립 포인트가 지급됩니다. </p>		
										<p >- &nbsp; 포인트 적립/이용 내역은 MyPage의 하위 메뉴에서 확인할 수 있습니다.</p>
										<p >- &nbsp; 무료 전시회에 대해서는 포인트,경험치가 지급되지 않습니다.</p>	
											
									</div>
									
									<div style="height:150px;">&nbsp;</div>
							</div>
						</div>
					</div>
					<span style="font-size: 1.5em; margin-right:auto;  " > &#x1F4B8;현재 적립 포인트 : ${UserTopInfoBean.point }P</span>
				</div>

			</div>
		</div>

	</div>
		

</body>
</html>