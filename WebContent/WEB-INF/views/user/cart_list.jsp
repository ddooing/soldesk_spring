<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="root" value="${pageContext.request.contextPath }" />
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>ARTMEE</title>
	<link rel="icon" type="image/x-icon" href="assets/ARTMEE_PAGELOGO.png" />

	<!-- Font Awesome icons (free version)-->
	<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>

	<!-- JQuery 자바스크립트-->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>


	<!-- CSS -->
	<link href="css/styles.css" rel="stylesheet" />

	<!-- Carousel 자바스크립트-->
	<script src='https://www.gmarwaha.com/script/lib/jquery-1.11.1.js'></script>
	<script src="https://www.gmarwaha.com/script/lib/jquery.easing-1.3.js"></script>
	<script src="https://www.gmarwaha.com/script/lib/jquery.easing.compatibility.js"></script>
	<script src="https://www.gmarwaha.com/script/lib/jquery.mousewheel-3.1.12.js"></script>
	<script src="https://www.gmarwaha.com/jquery/jcarousellite/script/jquery.jcarousellite.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

	<style>
		#jcl-demo {
			text-align: center;
		}

		.custom-container.main,
		.custom-container.main1,
		.custom-container.main2 {
			display: flex;
			justify-content: center;
			align-items: center;
		}

		.prev,
		.next
		.prev1,
		.next1,
		.prev2,
		.next2 {
			margin: 0 10px;
		}

		.carousel ul li,
		.carousel1 ul li {
			margin-right: 10px;
		}

		.carousel ul li:last-child,
		.carousel1 ul li:last-child {
			margin-right: 0;
		}

		.carousel img,
		.carousel1 img {
			max-width: 100%;
		}

		section#scroll *,
		section#scroll *::before,
		section#scroll *::after {
			box-sizing: content-box;
		}

		.divider:after,
		.divider:before {
			content: "";
			flex: 1;
			height: 1px;
			background: #eee;
		}

		.form-check-input[type="checkbox"] {
			background-color: #fff;
			border: 1px solid #000;
			border-radius: 4px;
		}

		.form-check-input[type="checkbox"]:checked {
			background-color: #000;
			border: 1px solid #000;
			color: #fff;
		}

		.close-btn {
			background: none;
			border: none;
			color: #333;
			font-size: 20px;
			cursor: pointer;
			padding: 5px;
			margin-right: 180px;
		}
		input[type=radio] {
		  --s: 1em;     /* control the size */
		  --c: #009688; /* the active color */
		  
		  height: var(--s);
		  aspect-ratio: 1;
		  border: calc(var(--s)/8) solid #939393;
		  padding: calc(var(--s)/8);
		  background: 
		     radial-gradient(farthest-side,var(--c) 94%,#0000) 
		     50%/0 0 no-repeat content-box;
		  border-radius: 50%;
		  outline-offset: calc(var(--s)/10);
		  -webkit-appearance: none;
		  -moz-appearance: none;
		  appearance: none;
		  cursor: pointer;
		  font-size: inherit;
		  transition: .3s;
		}
		input[type=radio]:checked {
		  border-color: var(--c);
		  background-size: 100% 100%;
		}

		@media print {
		  input[type=radio] {
		    -webkit-appearance: auto;
		    -moz-appearance: auto;
		    appearance: auto;
		    background: none;
		  }
		}
	</style>

</head>

<body id="page-top">
	<!-- 메뉴바 -->
	<c:import url="/WEB-INF/views/include/header.jsp"/>

	<section style="margin-top: 100px;">
		<div class="container mb-1">
			<h1 style="margin-left: 180px;">장바구니</h1>
			<hr style="margin:auto; margin-top: 50px; width: 1000px;" />
			
			<c:choose>
				<c:when test="${empty list}">
				<div style="background :#d3d3d32e;  width:860px; height:300px; margin:auto; border-radius:15px;" >
					<div class="test-center" style="margin:100px auto;  display:flex;  flex-direction:column; align-items:center;">
					    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="currentColor" class="bi bi-x-circle" style="margin-top:80px;" viewBox="0 0 16 16">
					        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
					        <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/>
					    </svg>
					    <h3 style="margin-top:50px;">장바구니 내역이 없습니다</h3>
					</div>
				</div>	
				</c:when>
				<c:otherwise>
					<form:form id="paymentForm" action="${root}/exhibition/payment?exhibition_id=${cartlist.exhibition_id }"
						 	   method="post" modelAttribute="tempReserveBean">
						 
						<c:forEach items="${list}" var="cartlist" varStatus="status">
							
						    <input type="hidden" name="reserve_date" id="inputReserveDate" value=""/>
	   						<input type="hidden" name="ticket_count" id="inputTicketCount" value=""/>
						    <input type="hidden" name="exhibition_id" id="inputExhibition_id" value=""/>
						       
						    <div style="display: flex; flex-direction: column;"> 
						       	<div style="margin-top: 25px; margin-right: 150px;margin-left: auto;">
							    	<button type="button" class="btn-close" aria-label="Close" 
							    	style="background-size: 1.5em 1.5em; " onclick="removeCartItem(${status.index})"/>
							    </div>
								<div style="display: flex; align-items: center; flex-direction: row;">
									
									<div style="margin-left: 155px; margin-top: 20px;">
								        <input type="radio" name="selectedItem"
								         style="border-radius: 25%; width: 20px; height: 20px;"
								        data-index="${status.index}"
								        data-reserve_date="${cartlist.reserve_date}"
								        data-exhibition_id="${cartlist.exhibition_id}"
								        data-ticket_count="${cartlist.ticket_count}"
		               						<c:if test="${status.first}">checked="checked"</c:if>> 
								    </div>
									<img src=${cartlist.main_poster_path}${cartlist.main_poster_name} alt="예약포스터"
										style="width: 200px; height: 280px; margin-left: 150px; margin-top: 40px;" 
										onclick="location.href='${root}/exhibition/exhibition_click?exhibition_id=${cartlist.exhibition_id}';"/>
					
									<div style="margin-left: 200px;">
										<h3>${cartlist.title }</h3>
					
										<div style="display: flex; margin-top: 40px;">
											<div style="margin-right: 10px; width: 200px;">예약 날짜</div>
											<div style="margin-left: auto;">
												<span class="reserveDateValue" style="width: 10px;">${cartlist.reserve_date }</span>
											</div>
										</div>
										<script>
											console.log(${cartlist.ticket_count });
											var ticket_cnt= ${cartlist.ticket_count };
										</script>
										<div style="display: flex; margin-top: 10px;">
											<div style="margin-right: 10px;  width: 200px;">티켓 수량</div>
											<div style="margin-left: auto;">
												<div class="counter">
													<span class="counterValue" style="width: 10px;">${cartlist.ticket_count} 매</span>
												</div>
											</div>
										</div>
										
										<div style="display: flex; margin-top: 10px;">
											<div style="margin-right: 10px;  width: 200px;">총 티켓 가격</div>
											<div style="margin-left: auto;">${cartlist.total_price } 원</div>
										</div>
									</div>
								</div>
							</div>
							<hr style="margin:auto; margin-top: 50px; width: 1000px;"/>
						</c:forEach>
							
							<c:if test="${not empty list}">
							    <div class="text-center" style="margin-top: 50px; text-align: right !important; margin-right: 150px;">
							        <button id="payment-button"  class="btn btn-dark" style="width: 150px; height: 50px;" >예매하기</button>
							    </div>
							</c:if>
						</form:form>
					</c:otherwise>
			</c:choose>
	
		</div>
	</section>

	<!-- 푸터-->
	<c:import url="/WEB-INF/views/include/footer.jsp"/>
</body>
	<script>
	    function removeCartItem(index) {
	        window.location.href = '${root}/user/cart_cancel?no=' + index;
	    }
	</script>
	
	<script>
	document.addEventListener('DOMContentLoaded', function() {
	    var radioButtons = document.querySelectorAll('input[name="selectedItem"]');
	    
	    // list의 마지막 요소 선택
	    if (radioButtons.length > 0) {
	        var lastRadioButton = radioButtons[radioButtons.length - 1];
	        lastRadioButton.checked = true;  // 마지막 라디오 버튼 선택

	        // 마지막 요소의 정보 추출
	        var index = lastRadioButton.getAttribute('data-index');
	        var reserve_date = lastRadioButton.getAttribute('data-reserve_date');
	        var exhibition_id = lastRadioButton.getAttribute('data-exhibition_id');
	        var ticket_count = lastRadioButton.getAttribute('data-ticket_count');

	        console.log("선택된 항목의 인덱스: " + index);
	        console.log("선택된 항목의 예약 날짜: " + reserve_date);
	        console.log("선택된 항목의 exhibition_id: " + exhibition_id);
	        console.log("선택된 항목의 ticket_count: " + ticket_count);

	        // hidden input 값 설정
	        document.getElementById('inputReserveDate').value = reserve_date;
	        document.getElementById('inputTicketCount').value = ticket_count;
	        document.getElementById('inputExhibition_id').value = exhibition_id;

	        // 폼의 action 업데이트
	        var formElement = document.getElementById('paymentForm');
	        formElement.action = '${root}/exhibition/payment?exhibition_id=' + exhibition_id;
	    }
	});

	</script>
	
	<script>
	    document.addEventListener('DOMContentLoaded', function() {
	    	
	        var radioButtons = document.querySelectorAll('input[name="selectedItem"]');
	            
	        radioButtons.forEach(function(radioButton) {
	            radioButton.addEventListener('click', function() {
	            	var index = this.getAttribute('data-index');
	            	var reserve_date = this.getAttribute('data-reserve_date');
	            	var exhibition_id = this.getAttribute('data-exhibition_id');
	            	var ticket_count = this.getAttribute('data-ticket_count');

	                console.log("선택된 항목의 인덱스: " + index);
	                console.log("선택된 항목의 예약 날짜: " + reserve_date);
	                console.log("선택된 항목의 exhibition_id: " + exhibition_id);
	                console.log("선택된 항목의 ticket_count: " + ticket_count);
	             
	             // hidden input 값 설정
	                document.getElementById('inputReserveDate').value =reserve_date;
	                document.getElementById('inputTicketCount').value = ticket_count;
	                document.getElementById('inputExhibition_id').value = exhibition_id;
	                
	                
	                var inputReserveDateValue = document.getElementById('inputReserveDate').value;
	                var inputTicketCountValue = document.getElementById('inputTicketCount').value;

	                console.log("inputReserveDate 값: " + inputReserveDateValue);
	                console.log("inputTicketCount 값: " + inputTicketCountValue);
	                
	                
	                var formElement = document.getElementById('paymentForm');
	                formElement.action = '${root}/exhibition/payment?exhibition_id='+exhibition_id;

	                
	            });
	        });
	        
	    });
	</script>
	
	<script>
		
			document.getElementById('payment-button').addEventListener('click', function() {
				
				var inputReserveDateValue = document.getElementById('inputReserveDate').value;
				var inputTicketCountValue = document.getElementById('inputTicketCount').value;

				console.log("inputReserveDate 값: " + inputReserveDateValue);
				console.log("inputTicketCount 값: " + inputTicketCountValue);
			   	console.log("버튼 클릭")
				//formElement.submit();
			});
		
	</script>
</html>