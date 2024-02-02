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
				<button class="button-2" role="button" onclick="profileEditor()">프로필 수정</button>
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
					
					
						<div class="tool-modal" style="z-index: 1;">
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
									
									<div style=" margin-top: 30px;" >
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
						
						
						
						<!-- 툴팁 내용  -->
						
	

					</div>
					<span style="font-size: 1.5em; margin-right:auto;  " > &#x1F4B8;현재 적립 포인트 : ${UserTopInfoBean.point }P</span>
				</div>

			</div>
		</div>
		
		
		<!-- 메뉴바 -->
		<div class="menubar" style="/*width:80%;*/ margin:auto; justify-content: center; display: flex;padding-top: 75px;  flex-direction: column;">
			<div id="index_wrap" style="/*width:80%;*/ margin:auto; justify-content: center; display: flex;  flex-direction: column;">
				
				<div  style="justify-content: center;display: flex; margin: auto;  ">
					<ul id ="leftToRight" class="menu " style="display: flex; 
				    align-items: center; list-style-type: none; padding: 0; margin: 0;">
					   <li class="upMenu"><div id="mypageLink" class="selected" >Mypage</div></li>
					   <li class="upMenu"><div id="bookmark" >북마크 </div></li>
					   <li class="upMenu"><div id="archive">아카이브</div></li>
					   <li class="upMenu"><div id="crm">고객센터</div></li>
				  	</ul>
	 			</div>
 			

 			<div class="ullist visible" style="padding-top:20px;">
			   <ul id="mypageMenu" class="submenu visible">
					<li id="reservationList" class="sel">예매내역</li>
	                <!-- 견적 <li id="promotionList">견적내역</li>-->
	                <li id="poinList">포인트 적립/이용 내역</li>
	                <li id="postList">작성한 글</li>
		        </ul>
		        
			    <ul id="crmMenu" class="submenu " >
					<li id="faq" >자주 묻는 질문</li>
	                <li id="qna">Q&A</li>
	                <li id="delete">회원탈퇴</li>
		        </ul>
		 	</div>
		</div>
	</div>
		<!-- 내용 -->
		<div style="display: flex;justify-content: center;width: 80%;margin: auto;"  class="content">
				
			<!-- 예매내역 -->
			<div class="reservationList contentshow" > 
				<c:forEach items="${UserReserveListBean}" var="reservelist">
					<div style=" background:#d3d3d32e;height:290px; display: flex; flex-direction: row;  padding: 30px; width:830px;" >
						<div>
							<img src="${reservelist.main_poster_path}${reservelist.main_poster_name}" style="width:160px; height:220px;"/>
						</div>
						
						<div class="reserinfo"style=" margin-left:20px;">
							<p style="margin-bottom:10px; font-weight:bold; font-size:25px;">${reservelist.title }</p>
							<p>${reservelist.reserve_date }</p>
							<p>${reservelist.ticket_count } 매 </p>
							<p>${reservelist.total_price } 원</p>
							
									<c:choose>
										<c:when test="${reservelist.state == 1 }">
											<p style=" color:gray;">예매 상태 : 
												<span>
													결제완료
												</span>
												<button class="reserCancel" >예매취소</button>
											</p>
											
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
										</c:otherwise>
									</c:choose>
						</div>
					</div>
				</c:forEach>
			</div>
			
			<!-- 견적 내역 -->	
			<div class="promotionList"> 
				<div style=" width:860px; display: flex;  padding: 30px; " >
					<table class="board-table" style="width:100%;">
						<thead >
						    <tr>
						        <th>번호</th>
						        <th>분류</th>
						        <th>제목</th>
						        <th>처리 상태</th>
						        <th>신청 날짜</th>
						    </tr>
						 </thead>
						 <tbody >
						    <tr >
						        <td >1</td>
						        <td >배너 신청</td>
						        <td >게시글 1 입니다.</td>
						        <td >대기</td>
						        <td >2022-05-18</td>   
						    </tr>
						  </tbody>
						  <tbody >
						    <tr >
						        <td >2</td>
						        <td >배너 신청</td>
						        <td >게시글 1 입니다.</td>
						        <td >결제 완료</td>
						        <td >2022-05-18</td>   
						    </tr>
						  </tbody>
						  <tbody >
						    <tr >
						        <td >3</td>
						        <td >배너 신청</td>
						        <td >게시글 1 입니다.</td>
						        <td >결제 취소</td>
						        <td >2022-05-18</td>   
						    </tr>
						  </tbody>
						   <tbody >
						    <tr >
						        <td >4</td>
						        <td >등록 신청</td>
						        <td >게시글 1 입니다.</td>
						        <td >환불처리</td>
						        <td >2022-05-18</td>   
						    </tr>
						  </tbody>
						   <tbody >
						    <tr >
						        <td >5</td>
						        <td >등록 신청</td>
						        <td >게시글 1 입니다.</td>
						        <td >완료</td>
						        <td >2022-05-18</td>   
						    </tr>
						  </tbody>
					</table>
				</div>
			</div>
			<!-- 포인트 적립/사용 내역 -->
			<div class="poinList" style="margin-top:30px;"> 
				<div style="background :#d3d3d32e;  width:860px; display: flex;  padding: 30px; border-radius:15px;" >
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
			
			<!-- 작성한 글 -->
			<div class="postList"> 
				<div style=" width:860px;height:40vh; display: flex;  padding: 30px; " >
					<table class="post-table" style="width:100%;">
						<thead >
						
						    <tr >
						        <th>번호</th>
						        <th>제목</th>
						        <th>날짜</th>
						    </tr>
						 </thead>
						 
						 <tbody >
						    <tr >
						        <td >1</td>
						        <td >게시글 1 입니다.</td>
						        <td >2022-05-18</td>   
						    </tr>
						  </tbody>
						  <tbody >
						    <tr >
						        <td >2</td>
						        <td >게시글 2 입니다.</td>
						        <td >2022-05-18</td>    
						    </tr>
						  </tbody>
						  <tbody >
						    <tr >
						        <td >3</td>
						        <td >게시글 3 입니다.</td>
						        <td >2022-05-18</td>   
						    </tr>
						  </tbody>
						   <tbody >
						    <tr >
						        <td >4</td>
						        <td >게시글 4 입니다.</td>
						        <td >2022-05-18</td>    
						    </tr>
						  </tbody>
						   <tbody >
						    <tr >
						        <td >5</td>
						        <td >게시글 5 입니다.</td>
						        <td >2022-05-18</td>    
						    </tr>
						  </tbody>
					</table>
				</div>
			</div>
			
			<!-- 자주 묻는 질문 -->
			<div class="faq">
				<div style=" width:860px; display: flex;  padding: 30px; margin-right: 110px;" >
					<section class="notice" style="width:860px; display: flex;  padding: 30px;">
						<div id="board-list">
							<div style="width: 835px; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
								<div style="display: flex; justify-content: center; text-align: center; margin-top: 20px;">
									<div style="width: 100px;">
										<p>번호</p>
									</div>
									<div style="width: 700px;">
										<p>제목</p>
									</div>
									<div style="width: 200px;">
										<p>날짜</p>
									</div>
								</div>
								<!--내용-->
								<div id="FAQ_1"
									style="display: flex; justify-content: center;  align-items: center; text-align: center; border-top: 1px solid #e7e7e7">
									<div style="width: 100px; padding: 14px 0px;">
										<p1>1</p1>
									</div>
									<div style="width: 700px; text-align: left; padding: 14px 14px 14px 28px;">
										<a href="#" style="color: black;text-decoration: none">
											<p1>게시글 1 입니다.</p1>
										</a>
									</div>
									<div style="width: 200px; padding: 14px 0px;">
										<p1>2023.12.28</p1>
									</div>
								</div>
		
								<div style="display: none; width: 835px; justify-content: center; margin-top: 20px; margin-bottom: 20px; padding-left: 110px; padding-right: 50px;"
									id="FAQ_1_click">
									<p1>
									아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.
									아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.
									아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.
									</p1>
								</div>
		
								<div id="FAQ_2"
									style="display: flex; justify-content: center;  align-items: center; text-align: center; border-top: 1px solid #e7e7e7">
									<div style="width: 100px; padding: 14px 0px;">
										<p1>2</p1>
									</div>
									<div style="width: 700px; text-align: left; padding: 14px 14px 14px 28px;">
										<a href="#" style="color: black;text-decoration: none">
											<p1>게시글 2 입니다.</p1>
										</a>
									</div>
									<div style="width: 200px; padding: 14px 0px;">
										<p1>2023.12.28</p1>
									</div>
								</div>
		
								<div style="display: none; width: 835px; justify-content: center; margin-top: 20px; margin-bottom: 20px; padding-left: 110px; padding-right: 50px;"
									id="FAQ_2_click">
									<p1>
									아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.
									아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.
									아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.
									</p1>
								</div>
		
								<div id="FAQ_3"
									style="display: flex; justify-content: center;  align-items: center; text-align: center; border-top: 1px solid #e7e7e7">
									<div style="width: 100px; padding: 14px 0px;">
										<p1>3</p1>
									</div>
									<div style="width: 700px; text-align: left; padding: 14px 14px 14px 28px;">
										<a href="#" style="color: black;text-decoration: none">
											<p1>게시글 3 입니다.</p1>
										</a>
									</div>
									<div style="width: 200px; padding: 14px 0px;">
										<p1>2023.12.28</p1>
									</div>
								</div>
		
								<div style="display: none; width: 835px; justify-content: center; margin-top: 20px; margin-bottom: 20px; padding-left: 110px; padding-right: 50px;"
									id="FAQ_3_click">
									<p1>
									아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.
									아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.
									아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.
									</p1>
								</div>
		
								<div id="FAQ_4"
									style="display: flex; justify-content: center;  align-items: center; text-align: center; border-top: 1px solid #e7e7e7">
									<div style="width: 100px; padding: 14px 0px;">
										<p1>4</p1>
									</div>
									<div style="width: 700px; text-align: left; padding: 14px 14px 14px 28px;">
										<a href="#" style="color: black;text-decoration: none">
											<p1>게시글 4 입니다.</p1>
										</a>
									</div>
									<div style="width: 200px; padding: 14px 0px;">
										<p1>2023.12.28</p1>
									</div>
								</div>
		
								<div style="display: none; width: 835px; justify-content: center; margin-top: 20px; margin-bottom: 20px; padding-left: 110px; padding-right: 50px;"
									id="FAQ_4_click">
									<p1>
									아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.
									아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.
									아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.
									</p1>
								</div>
		
								<div id="FAQ_5"
									style="display: flex; justify-content: center;  align-items: center; text-align: center; border-top: 1px solid #e7e7e7">
									<div style="width: 100px; padding: 14px 0px;">
										<p1>5</p1>
									</div>
									<div style="width: 700px; text-align: left; padding: 14px 14px 14px 28px;">
										<a href="#" style="color: black; text-decoration: none">
											<p1>게시글 5 입니다.</p1>
										</a>
									</div>
									<div style="width: 200px; padding: 14px 0px;">
										<p1>2023.12.28</p1>
									</div>
								</div>
		
								<div style="display: none; width: 835px; justify-content: center; margin-top: 20px; margin-bottom: 20px; padding-left: 110px; padding-right: 50px;"
									id="FAQ_5_click">
									<p1>
									아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.
									아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.
									아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.아트미 FAQ입니다.
									</p1>
								</div>
		
							</div>
						</div>
					</section>
				</div>
			</div>
			
			<!-- 문의사항 -->
			<div class="qna">
				<div style=" width:860px; display: flex;  padding: 30px; margin-right: 110px;" >
					<section class="notice" style="width:860px; display: flex;  padding: 30px;">
						<div id="board-list">
							<div style="width: 835px; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
								<div style="display: flex; justify-content: center; text-align: center; margin-top: 20px;">
									<div style="width: 100px;">
										<p>번호</p>
									</div>
									<div style="width: 700px;">
										<p>제목</p>
									</div>
									<div style="width: 200px;">
										<p>날짜</p>
									</div>
								</div>
								<!--내용-->
								<div id="review_1"
									style="display: flex; justify-content: center;  align-items: center; text-align: center; border-top: 1px solid #e7e7e7">
									<div style="width: 100px; padding: 14px 0px;">
										<p1>1</p1>
									</div>
									<div style="width: 700px; text-align: left; padding: 14px 14px 14px 28px;">
										<a href="#" style="color: black;text-decoration: none">
											<p1>[질문] 게시글 1 입니다.</p1>
										</a>
									</div>
									<div style="width: 200px; padding: 14px 0px;">
										<p1>2023.12.28</p1>
									</div>
								</div>
		
								<div style="display: none; width: 835px; justify-content: center; margin-top: 20px; margin-bottom: 20px; padding-left: 110px; padding-right: 50px;"
									id="review_1_click">
									<div>이거 어떻게 해야해요?</div>
									<br>
									<div>
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
										  <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5"/>
										</svg>
										[답변]
									</div>
									
									<p1>
										아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.
										아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.
										아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.
									</p1>
								</div>
		
								<div id="review_2"
									style="display: flex; justify-content: center;  align-items: center; text-align: center; border-top: 1px solid #e7e7e7">
									<div style="width: 100px; padding: 14px 0px;">
										<p1>2</p1>
									</div>
									<div style="width: 700px; text-align: left; padding: 14px 14px 14px 28px;">
										<a href="#" style="color: black;text-decoration: none">
											<p1>[질문] 게시글 2 입니다.</p1>
										</a>
									</div>
									<div style="width: 200px; padding: 14px 0px;">
										<p1>2023.12.28</p1>
									</div>
								</div>
		
								<div style="display: none; width: 835px; justify-content: center; margin-top: 20px; margin-bottom: 20px; padding-left: 110px; padding-right: 50px;"
									id="review_2_click">
									<div>이거 어떻게 해야해요?</div>
									<br>
									<div>
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
										  <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5"/>
										</svg>
										[답변]
									</div>
									
									<p1>
										아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.
										아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.
										아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.
									</p1>
								</div>
		
								<div id="review_3"
									style="display: flex; justify-content: center;  align-items: center; text-align: center; border-top: 1px solid #e7e7e7">
									<div style="width: 100px; padding: 14px 0px;">
										<p1>3</p1>
									</div>
									<div style="width: 700px; text-align: left; padding: 14px 14px 14px 28px;text-decoration: none">
										<a href="#" style="color: black;text-decoration: none">
											<p1>[질문] 게시글 3 입니다.</p1>
										</a>
									</div>
									<div style="width: 200px; padding: 14px 0px;">
										<p1>2023.12.28</p1>
									</div>
								</div>
		
								
								<div style="display: none; width: 835px; justify-content: center; margin-top: 20px; margin-bottom: 20px; padding-left: 110px; padding-right: 50px;"
									id="review_3_click">
									<div>이거 어떻게 해야해요?</div>
									<br>
									<div>
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
										  <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5"/>
										</svg>
										[답변]
									</div>
									
									<p1>
										아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.
										아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.
										아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.
									</p1>
								</div>
		
								<div id="review_4"
									style="display: flex; justify-content: center;  align-items: center; text-align: center; border-top: 1px solid #e7e7e7">
									<div style="width: 100px; padding: 14px 0px;">
										<p1>4</p1>
									</div>
									<div style="width: 700px; text-align: left; padding: 14px 14px 14px 28px;">
										<a href="#" style="color: black;text-decoration: none">
											<p1>[질문] 게시글 4 입니다.</p1>
										</a>
									</div>
									<div style="width: 200px; padding: 14px 0px;">
										<p1>2023.12.28</p1>
									</div>
								</div>
		
								<div style="display: none; width: 835px; justify-content: center; margin-top: 20px; margin-bottom: 20px; padding-left: 110px; padding-right: 50px;"
									id="review_4_click">
									<div>이거 어떻게 해야해요?</div>
									<br>
									<div>
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
										  <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5"/>
										</svg>
										[답변]
									</div>
									
									<p1>
										아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.
										아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.
										아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.
									</p1>
								</div>
		
								<div id="review_5"
									style="display: flex; justify-content: center;  align-items: center; text-align: center; border-top: 1px solid #e7e7e7">
									<div style="width: 100px; padding: 14px 0px;">
										<p1>5</p1>
									</div>
									<div style="width: 700px; text-align: left; padding: 14px 14px 14px 28px;">
										<a href="#" style="color: black;text-decoration: none">
											<p1>[질문] 게시글 5 입니다.</p1>
										</a>
									</div>
									<div style="width: 200px; padding: 14px 0px;">
										<p1>2023.12.28</p1>
									</div>
								</div>
		
								<div style="display: none; width: 835px; justify-content: center; margin-top: 20px; margin-bottom: 20px; padding-left: 110px; padding-right: 50px;"
									id="review_5_click">
									<div>이거 어떻게 해야해요?</div>
									<br>
									<div>
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
										  <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5"/>
										</svg>
										[답변]
									</div>
									
									<p1>
										아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.
										아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.
										아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.아트미 QnA입니다.
									</p1>
								</div>
		
							</div>
						</div>
					</section>
				</div>
				<div>
					<button class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#qnaModal" style="align-self: flex-end; margin-top: 10px; margin-left: 800px;">문의 작성</button>
				</div>
				
			</div>
			<!-- QnA 모달 시작 -->
			
			<div class="modal fade" id="qnaModal" tabindex="-1" aria-labelledby="qnaModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
    				<div class="modal-content" style="width: 950px; border-radius: 25px;">
        				<div class="modal-header">
            				<h5 class="modal-title" id="qnaModalLabel">Q&A</h5>
            				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        				</div>
        			<div class="modal-body">
            			<form action="#"> <!-- 폼 시작 -->
                			<div class="container h-100 align-items-center justify-content-center">
                    
                    			<!-- 제목 입력란 -->
                    			<div class="d-flex align-items-center" style="margin-top: 50px;">
                        			<div style="width: 150px; text-align: left;">
                            			<label for="QnAtitle" style="font-size: 18px;">제목</label>
                       				</div>
                        			<div style="margin-left: 20px;">
                            			<input type="text" name="QnAtitle" placeholder="" style="width: 700px;" />
                        			</div>
                    			</div>

                    			<!-- 문의 내용 입력란 -->
                    			<div class="d-flex align-items-center" style="margin-top: 50px;">
                        			<div style="width: 150px; text-align: left;">
                            			<label for="QnAcontent" style="font-size: 18px;">문의 내용</label>
                        			</div>
                        			<div style="margin-left: 20px;">
                            			<textarea name="QnAcontent" placeholder="정확한 상담을 위해 문의 내용을 자세히 작성해 주세요."
                                			style="width: 700px; height: 400px; resize: none;"></textarea>
                        			</div>
                    			</div>

                			</div>
            			</form> <!-- 폼 종료 -->
        			</div>
        		<div class="modal-footer">
            		<button type="button" class="btn btn-dark">확인</button>
        		</div>
    		</div>
				</div>
			</div>
			<!-- QnA 모달 종료 -->

			<!-- 회원 탈퇴 -->
			<div class="backdrop" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.2); z-index: 999;"> 
		    <!-- 회원 탈퇴 모달창 -->
		    <div class="deletemodal" style="position: fixed; display: none; left: 50%; top: 50%; transform: translate(-50%, -50%); width: 650px; height: 500px; padding: 20px;  background-color: rgba(255, 255, 255, 1); box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.3); border-radius: 10px; z-index: 1000;">
					<div class="deletemodal_body"
						style="position: relative; width: 100%; height: 100%;">
						<!-- 흰부분 -->
						<button class="archivediv btn-close-deletemodal"
							style="position: absolute; top: 0px; right: 10px;">
							<!-- SVG for close button -->
							<svg xmlns="http://www.w3.org/2000/svg" width="2.0m" height="2.0em"opacity="0.8" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
								  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/>
							</svg>
						</button>
						<div style="margin-top: 20px; text-align: center;">
							<p style="font-size: 30px; font-weight: bold;text-align: center;">회원탈퇴</p>
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
									<input type="password" class="form-control"
										placeholder="비밀번호 확인" id="confirmPassword" required>
								</div>
							</div>
							<button type="submit" class="btn btn-danger" style="margin-left:177px;">회원 탈퇴</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 모달 끝 -->

			<!-- 북마크 -->
			<div class="bookmark"> 
				<div class="bookmarkgrid" style="grid-auto-rows: minmax(350px, auto);
										display: grid; margin-left:35px;grid-template-columns: repeat(3,1fr);
										grid-template-rows: repeat(3,1fr);  padding: 30px; justify-content: center; width:860px;" >
				  
					<div style="position: relative;" >
						<img style="position: relative;"src="https://png.pngtree.com/png-clipart/20210704/original/pngtree-colorful-abstract-art-exhibition-poster-png-image_6488081.jpg" />
						<div class="heart-icons" style="position: absolute; bottom: 15px; right: 15px; cursor: pointer;">
               					
                				<svg  xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="currentColor" class="bi bi-heart heart-icon empty_heart" viewBox="0 0 16 16" style="fill: red; filter: drop-shadow(1px 1px 4px red);">
                    				<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/>
                				</svg>
                		</div>
					</div>
					
					
					
					<div  style="position: relative;">
						<img  style="position: relative;" src="https://www.fnnews.com/resource/media/image/2023/07/06/202307061117228867_l.jpg" 
						/>
						<div class="heart-icons" style="position: absolute; bottom: 15px; right: 15px; cursor: pointer;">
                				<svg  xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="currentColor" class="bi bi-heart heart-icon empty_heart" viewBox="0 0 16 16" style="fill: red; filter: drop-shadow(1px 1px 4px red);">
                    				<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/>
                				</svg>
                		</div>
					</div>
					
					<div  style="position: relative;">
						<img  style="position: relative;" src="https://png.pngtree.com/png-clipart/20210704/original/pngtree-colorful-abstract-art-exhibition-poster-png-image_6488081.jpg" 
						/>
						<div class="heart-icons" style="position: absolute; bottom: 15px; right: 15px; cursor: pointer;">
               					
                				<svg  xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="currentColor" class="bi bi-heart heart-icon empty_heart" viewBox="0 0 16 16" style="fill: red; filter: drop-shadow(1px 1px 4px red);">
                    				<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/>
                				</svg>
                		</div>
					</div>
					
					<div  style="position: relative;">
						<img style="position: relative;" src="https://cdn.st-news.co.kr/news/photo/202303/7114_21221_2635.jpg" 
						/>
						<div class="heart-icons" style="position: absolute; bottom: 15px; right: 15px; cursor: pointer;">
               					
                				<svg  xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="currentColor" class="bi bi-heart heart-icon empty_heart" viewBox="0 0 16 16" style="fill: red;">
                    				<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/>
                				</svg>
                		</div>
					</div>
					<div  style="position: relative;">
						<img style="position: relative;" src="https://cdn.st-news.co.kr/news/photo/202303/7114_21221_2635.jpg" 
						/>
						<div class="heart-icons" style="position: absolute; bottom: 15px; right: 15px; cursor: pointer;">
               					
                				<svg  xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="currentColor" class="bi bi-heart heart-icon empty_heart" viewBox="0 0 16 16" style="fill: red; filter: drop-shadow(1px 1px 4px red);">
                    				<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/>
                				</svg>
                		</div>
					</div>
					
					<div  style="position: relative;">
						<img style="position: relative;" src="https://www.fnnews.com/resource/media/image/2023/07/06/202307061117228867_l.jpg" 
						/>
						<div class="heart-icons" style="position: absolute; bottom: 15px; right: 15px; cursor: pointer;">
               					
                				<svg  xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="currentColor" class="bi bi-heart heart-icon empty_heart" viewBox="0 0 16 16" style="fill: red; filter: drop-shadow(1px 1px 4px red);">
                    				<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/>
                				</svg>
                		</div>
					</div>
					
					<div  style="position: relative;">
						<img style="position: relative;" src="data:image/jpeg;base64,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" 
						/>
						<div class="heart-icons" style="position: absolute; bottom: 15px; right: 15px; cursor: pointer;">
               					
                				<svg  xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="currentColor" class="bi bi-heart heart-icon empty_heart" viewBox="0 0 16 16" style="fill: red; filter: drop-shadow(1px 1px 4px red);">
                    				<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/>
                				</svg>
                		</div>
					</div>
					<div  style="position: relative;">
						<img style="position: relative;" src="data:image/jpeg;base64,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" 
						/>
						<div class="heart-icons" style="position: absolute; bottom: 15px; right: 15px; cursor: pointer;">
               					
                				<svg  xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="currentColor" class="bi bi-heart heart-icon empty_heart" viewBox="0 0 16 16" style="fill: red; filter: drop-shadow(1px 1px 4px red);">
                    				<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/>
                				</svg>
                		</div>
					</div>
				</div>
				
			</div>
			<!-- 아카이브 -->
			<div class="archive">
				<div class="archivegrid" style="grid-auto-rows: minmax(350px, auto);
												display: grid;margin-left:35px;grid-template-columns: repeat(3,1fr);
												grid-template-rows: repeat(3,1fr);  padding: 30px; justify-content: center; \width:860px;" >
				  
				  	<!-- 소감문 작성 전 - 소감문 작성 페이지로 이동 , 소감문 작성 후 - 소감문 모달창 -->
					<div class="archivediv btn-open-reivewmodal"><!-- db 연결 시추후 수정해야함 -->
						<img src="https://png.pngtree.com/png-clipart/20210704/original/pngtree-colorful-abstract-art-exhibition-poster-png-image_6488081.jpg" 
						/>
					</div>
					
					<!-- 소감문 모달창 -->
					<div class="reivewmodal">
				       <div class="reivewmodal_body">
							<button class="archivediv btn-close-reivewmodal">
								<svg xmlns="http://www.w3.org/2000/svg" width="3.5em" height="3.5em"opacity="0.8" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
								  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/>
								</svg>
							</button>
				           
				           
				           <div style="display: flex; margin-top: 20px;">
							<div style="float: left;">
								<img src="https://png.pngtree.com/png-clipart/20210704/original/pngtree-colorful-abstract-art-exhibition-poster-png-image_6488081.jpg"
								 style="width: 170px; height: 245px; "/>
							</div>
							<div style="float: right;
								   margin-left: 20px;
								   text-align: left;">
								<p style="font-size:30px; font-weight:bold;">스페이스 월링앤딩링</p>
								<p>롯데뮤지엄</p>
								<p>예약 날짜 &nbsp; 2023.12.05 금</p>
								<p>관람 시간 &nbsp; 10:00 - 11:00</p>
								<p>티켓 수 &nbsp; 2매</p>
								<p>티켓 가격 &nbsp; 20,000원</p>
							</div>
							
						</div>
						
						<hr/>
						<div style="text-align: center; font-size: 35px;">
							<span style="color:gold;"><!--  스타일 추후 수정 -->
							  ★★★★<span style="color:gray;">★</span>
							</span>	
						</div>
						
						
						<div class="review"style="width:465px; height:270px; border:none;box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08) 0px 0px 0px 1px;
						border-radius:20px;padding:10px;outline: 0;resize: none;"
						 placeholder="감상문을 작성해주세요">Truly speaking i only see the world through YOU. I lack the sense of direction
						</div>
						<!-- textarea에 대한 팝업 크기 조절 추가하기 -->
						
						<div class="checkbox-wrapper-17" style="margin-top: 10px;display: flex;align-items: center;">
							<input type="checkbox" id="switch-17" onchange="updateCheckboxValue(this)"/><label for="switch-17"></label>
							<span style="margin-left:10px;">공개 여부</span>
							<button class="reviewButton" role="button" onclick="goReviewEditor()">수정</button>
							
						</div>
				       </div>
				   </div>
					<!-- 모달 끝 -->
					
					<div class="archivediv btn-open-reivewmodal" >
						<img src="https://www.fnnews.com/resource/media/image/2023/07/06/202307061117228867_l.jpg" 
						/>
					</div>
					
					
					
					<div  class="archivediv btn-open-reivewmodal" >
						<img src="https://png.pngtree.com/png-clipart/20210704/original/pngtree-colorful-abstract-art-exhibition-poster-png-image_6488081.jpg" 
						/>
					</div>
					
					<div  class="archivediv btn-open-reivewmodal" >
						<img src="https://cdn.st-news.co.kr/news/photo/202303/7114_21221_2635.jpg" 
						/>
					</div>
					<div  class="archivediv" >
						<img src="https://cdn.st-news.co.kr/news/photo/202303/7114_21221_2635.jpg" 
						/>
					</div>
					
					<div class="archivediv" >
						<img src="https://www.fnnews.com/resource/media/image/2023/07/06/202307061117228867_l.jpg" 
						/>
					</div>
					
					<div  class="archivediv" >
						<img src="data:image/jpeg;base64,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" 
						/>
					</div>
					<div  class="archivediv" >
						<img src="data:image/jpeg;base64,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" 
						/>
					</div>
				</div>
			</div>
				
		</div>
		
	</div>
	<!-- 푸터-->
	<c:import url="/WEB-INF/views/include/footer.jsp"/> 
	
	
	<script>
  // JavaScript 함수
  function updateCheckboxValue(checkbox) {
    if (checkbox.checked) {
      checkbox.value = "on";
    } else {
      // 만약 체크가 해제되면 여전히 "on"으로 유지
      checkbox.value = "on";
    }
  }
</script>
<script>
	
	//소감문 수정
	function goReviewEditor() {
	  window.location.href = "review_editor.html";
	}
	
	//프로필 수정 
	profileEditor
	function profileEditor() {
	  window.location.href = "${root}/user/InfoChange";
	}
	document.addEventListener("DOMContentLoaded", function () {
	    
	    var divElements = document.querySelectorAll(".upMenu > div");
	 	var twomenu = document.querySelector(".ullist");
	    var ulElements = document.querySelectorAll(".ullist ul");
	    var liElements = document.querySelectorAll(".ullist ul li ");
	    var contentElements = document.querySelectorAll(".content > div");
	      
	    divElements.forEach(function (divElement) 
	    {
	        divElement.addEventListener("click", function () {  
	            
	           
	        	divElements.forEach(function (otherItem) {
	                otherItem.classList.remove("selected");
	            });
	               	
	        	twomenu.classList.remove("visible");
	        	
	        	ulElements.forEach(function (otherItem) {
	                otherItem.classList.remove("visible");
	            });
	        	
	        	liElements.forEach(function (otherItem) {
	                otherItem.classList.remove("sel");  
	            });
	        	contentElements.forEach(function (contentElement) {
	    			contentElement.classList.remove("contentshow");
	    		})
	        	
	        	divElement.classList.add("selected");
	        	
	        	if(divElement.id==='mypageLink')
	    		{
	        		twomenu.classList.add("visible");
	        		
	        		document.getElementById("mypageMenu").classList.add("visible");
	        		document.getElementById("reservationList").classList.add("sel");
	        		document.querySelector(".reservationList").classList.add("contentshow");
	        		document.querySelector(".content").classList.add("contentpadding");
	    		}
	    		else if(divElement.id==='crm')
	    		{
	    			twomenu.classList.add("visible");
	    			document.getElementById("crmMenu").classList.add("visible");
	    			document.getElementById("faq").classList.add("sel");
	    			document.querySelector(".faq").classList.add("contentshow");
	    			document.querySelector(".content").classList.add("contentpadding");
		        	
	        	}else{
	        		var contentName= divElement.id;
		    		//console.log(contentName);
		        	document.querySelector("."+contentName).classList.add("contentshow");
		        	document.querySelector(".content").classList.remove("contentpadding");
	        	}
	        });
	    });
	     
	    
	    liElements.forEach(function (liElement) {

	    	liElement.addEventListener("click", function () {
	    		liElements.forEach(function (otherItem) {
	                otherItem.classList.remove("sel");  
	            });
	    		contentElements.forEach(function (contentElement) {
	    			contentElement.classList.remove("contentshow");
	    		})
	    		
	    		liElement.classList.add("sel");

	    		var contentName= liElement.id;
	    		//console.log(contentName);
	        	document.querySelector("."+contentName).classList.add("contentshow");
	        });
		});
	
	
		 // #leftToRight의 높이를 가져옴
		    var leftToRightHeight = document.getElementById('leftToRight').offsetHeight;
		    
		    var mypageMenutHeight = document.getElementById('mypageMenu').offsetHeight;
		    // #index_wrap의 높이를 설정
		    document.getElementById('index_wrap').style.height = leftToRightHeight +mypageMenutHeight+ 'px';
		    
		    


			 //툴 모달창 
        const toolOpenButton = document.querySelector('.bi.bi-question-circle-fill');
        const toolCloseBuuton = document.querySelector('.tool-btn-close-modal');
        const toolModal = document.querySelector('.tool-modal');
        toolOpenButton.addEventListener("click", ()=>{
     	   toolModal.style.display="flex";
            document.getElementsByTagName('body')[0].style.overflow = 'hidden';
        });	
        window.addEventListener('click',  (e) => {
            e.target === toolModal ?  tool_close() : false
            })
           toolCloseBuuton.addEventListener("click", ()=>{
	        	tool_close();
	        });
		 function tool_close(){
        	toolModal.style.display="none";
		  document.getElementsByTagName('body')[0].style.overflow = 'visible';
		 }
        
     
	});

	
    function addMenuParam(menuName) {
        // 현재 URL 가져오기
        var currentUrl = window.location.href;

        // 기존의 menu 파라미터를 제거
        var updatedUrl = currentUrl.replace(/[\?&]menu=[^&]+/, '');

        // 새로운 menu 파라미터 추가 또는 업데이트
        updatedUrl += updatedUrl.indexOf('?') !== -1
            ? '&menu=' + encodeURIComponent(menuName)
            : '?menu=' + encodeURIComponent(menuName);

        // 새로운 URL로 이동
        window.location.href = updatedUrl;
    }
    
    </script>	
    
    
   <script>//소감문 모달창 
	document.addEventListener('DOMContentLoaded', () => {
    	//소감문 모달창 
		    const modal = document.querySelector('.reivewmodal');
	        const btnOpenModal=document.querySelector('.btn-open-reivewmodal');
			const btnCloseModal=document.querySelector('.btn-close-reivewmodal');
	       	const body =  document.querySelector('#page-top');
	       
	       
	       
	       btnOpenModal.addEventListener("click", ()=>{
	            modal.style.display="flex";
	            document.getElementsByTagName('body')[0].style.overflow = 'hidden';
	        });
	        
	        btnCloseModal.addEventListener("click", ()=>{
	        	close();
	        });
	        
	        
	        window.addEventListener('click',  (e) => {
	        e.target === modal ?  close() : false
	        })
	        
	        
	        function close(){
			  modal.style.display="none";
			  document.getElementsByTagName('body')[0].style.overflow = 'visible';
			 }
			 
	});
   
   </script>
   
    <script>
	    // 하트 토글 버튼

	    document.querySelectorAll('.heart-icon').forEach(item => {
			//console.log(item);
	        item.addEventListener('click', function(event) {
	            event.preventDefault();  // 기본 동작 방지
	            event.stopPropagation(); // 이벤트 전파 중지

	            const emptyHeartIcon = this.classList.contains('empty_heart') ? this : this.parentElement.querySelector('.empty_heart');
				
				 if (emptyHeartIcon.style.fill === 'white') {
	               emptyHeartIcon.style.fill = 'red';
	                
	            } else {
	                emptyHeartIcon.style.fill = 'white'
	            }
	        });
	    });
	</script>
   	</script>
	<script>
	<!-- 리뷰내용 -->
				for (var i = 1; i <= 5; i++) {
					(function (index) {
						document.querySelector('#review_' + index + ' a').addEventListener('click', function (event) {
							event.preventDefault(); // 기본 링크 동작 방지

							// 다른 모든 리뷰의 내용을 숨깁니다.
							for (var j = 1; j <= 5; j++) {
								if (j !== index) {
									document.getElementById('review_' + j + '_click').style.display = 'none';
								}
							}

							// 클릭된 리뷰의 내용을 토글합니다.
							var content = document.getElementById('review_' + index + '_click');
							content.style.display = content.style.display === 'block' ? 'none' : 'block';
						});
					})(i);
				}
			</script>
	</script>
	
	<script>
	<!-- FAQ내용 -->
				for (var i = 1; i <= 5; i++) {
					(function (index) {
						document.querySelector('#FAQ_' + index + ' a').addEventListener('click', function (event) {
							event.preventDefault(); // 기본 링크 동작 방지

							// 다른 모든 FAQ의 내용을 숨깁니다.
							for (var j = 1; j <= 5; j++) {
								if (j !== index) {
									document.getElementById('FAQ_' + j + '_click').style.display = 'none';
								}
							}

							// 클릭된 FAQ의 내용을 토글합니다.
							var content = document.getElementById('FAQ_' + index + '_click');
							content.style.display = content.style.display === 'block' ? 'none' : 'block';
						});
					})(i);
				}
			</script>
	</script>
	<script>
	var deleteModal = document.querySelector('.deletemodal');
	var backdrop = document.querySelector('.backdrop'); // 추가
	var deleteButton = document.getElementById('delete');
	var closeModalButton = document.querySelector('.btn-close-deletemodal');
	
	// 회원탈퇴 버튼 클릭 시
	deleteButton.onclick = function() {
	    backdrop.style.display = 'block'; // 배경 레이어 표시
	    deleteModal.style.display = 'block';
	    body.style.overflow = 'hidden';
	};
	
	// 닫기 버튼 클릭 시
	closeModalButton.onclick = function() {
	    backdrop.style.display = 'none'; // 배경 레이어 숨김
	    deleteModal.style.display = 'none';
	    body.style.overflow = 'auto';
	};
	
	// 배경 레이어 클릭 시
	backdrop.onclick = function(event) {
	    if (event.target == backdrop) {
	        backdrop.style.display = 'none';
	        deleteModal.style.display = 'none';
	        body.style.overflow = 'auto';
	    }
	};
	
	</script>
</body>
</html>