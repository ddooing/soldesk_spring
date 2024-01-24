<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
	<link href="css/styles.css" rel="stylesheet" />
	<link href="css/Mypage.css" rel="stylesheet" />
	

	<script type="text/javascript">   
	$(document).ready( function() {
	
	$("#headers").load("component/header.html");  
	$("#footer").load("component/footer.html");
	});
	</script>
	


<link  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
<title>Insert title here</title>

</head>
<body id="page-top">
	<!-- 메뉴바 -->
	<div id="headers"></div>
	
	<!-- 페이지 시작 -->
	<div style="display: flex;
    justify-content: center;
    width: 80%;
    margin: auto;
    margin-top: calc(3rem + 40px); flex-direction: column; ">
		
		
		<div style="width:80%;margin:auto; justify-content: center; display: flex;  flex-direction: column;align-items: center;">
			
			
			<div style="width:80%;margin:auto; justify-content: center; display: flex; flex-direction: column; align-items: center;">
				
				<div  style="justify-content: center;display: flex; margin: auto; flex-direction: column; ">
					<p style="font-size: 25px;margin-bottom: 5px;">스페이스 월링앤딩링</p>
					<img src="https://png.pngtree.com/png-clipart/20210704/original/pngtree-colorful-abstract-art-exhibition-poster-png-image_6488081.jpg"
								 style="width: 260px;"/>
	 			</div>
			</div>
			
			<hr style="width: 60%;"/>
			
			<div style="text-align: center;">
				<span class="star"><!--  스타일 추후 수정 -->
				  ★★★★★
				  <span>★★★★★</span>
				  <input type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="5">
				</span>	
			</div>
			
			<div style="width: 60%;">
				<textarea class="review"style="width:100%; height:270px; border:none;box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08) 0px 0px 0px 1px;
					border-radius:20px;padding:10px;outline: 0;resize: none;"
				 	placeholder="감상문을 작성해주세요"></textarea>
			</div>
			
			<div class="checkbox-wrapper-17" style="margin-top: 10px;display: flex;align-items: center;width: 60%;">
			  <input type="checkbox" id="switch-17" /><label for="switch-17"></label>
				<span style="margin-left:10px;">공개 여부</span>
				<!--  공개 여부에 따른 공개, 비공개 표시 하기  -->
				
				
				<button class="reviewButton" role="button"  onclick="moveToMypage()">작성 완료</button>
				

			</div>
	       </div>
	</div>
		
		
		
	</div>
	<!-- 푸터-->
	<c:import url="/WEB-INF/views/include/footer.jsp"/> 
	
	
	
	
</body>


<script>
	
	//작성 완료 시 ,아카이브로 이동하게끔 추후 수정하기 
	function moveToMypage() {
	  window.location.href = "mypage.html";
	}

	//별점
	 const drawStar = (target) => {
        document.querySelector(`.star span`).style.width = `${target.value * 20}%`;
      }
</script>
</html>