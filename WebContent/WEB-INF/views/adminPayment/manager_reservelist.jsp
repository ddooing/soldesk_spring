<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="icon" type="image/x-icon" href="assets/ARTMEE_PAGELOGO.png" />
<title>관리자 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="css/styles_manager.css" rel="stylesheet" />
<!--부트스트랩 아이콘 사용-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"
	rel="stylesheet">

<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>	
<script>

$(document).ready(function(){
    // thead의 checkbox 클릭 이벤트
    $("thead input[type='checkbox']").click(function(){
        // thead의 checkbox 상태를 tbody의 모든 checkbox에 적용
        $("tbody input[type='checkbox']").prop('checked', $(this).prop('checked'));
    });
});
</script>


<style>
input[type="date"]{
	box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08) 0px 0px 0px 1px;
	position: relative;
	width: 180px;
	height: 48px;
	padding-right: 42px;
	border: 1px solid white;
	border-radius: 12px;
}

input[type="date"]::before{
	content: attr(data-placeholder);
	width: 100%;
	text-align: center;
}
input[type="date"]::valid::before{
	display: none;
}

input[type="date"]::-webkit-calendar-picker-indicator{
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	cursor: pointer;
	background: transparent;
	color: transparent;
}


/* White Version */
.pikaday-white {
	--backgroundColor: #ffffff;
	--textColor: #718096;
	--currentDateTextColor: #3182ce;
	--selectedDateBackgroundColor: #3182ce;
	--selectedDateTextColor: #ffffff;

	--labelTextColor: #4a5568; /* eg. May 2020 */
	--weekDaysTextColor: #a0aec0; /* eg. Mo Tu We ....*/

	background-color: var(--backgroundColor);
	border-radius: 10px;
	padding: 0.7rem;
	z-index: 2000;
    margin: 6px 0 0 0;
	box-shadow: 0 1px 2px 0 rgba(60, 64, 67, .30), 0 1px 3px 1px rgba(60, 64, 67, .15);
	font-family: inherit;

}

.pikaday-white.is-hidden {
    display: none;
}

.pikaday-white .pika-title {
    padding: 0.2rem 0;
    width: 100%;
	text-align: center;
	display: flex;
	justify-content: flex-start;
}

/* Next/Previous */
.pikaday-white .pika-prev,
.pikaday-white .pika-next {
    position: absolute;
    outline: none;
    padding: 0;
    width: 24px;
	height: 24px;
	top: 15px;
	display: inline-block;
    margin-top: 0;
    cursor: pointer;
	/* hide text using text-indent trick, using width value (it's enough) */
    text-indent: -9999px;
    white-space: nowrap;
    overflow: hidden;
    background-color: transparent;
    background-position: center center;
    background-repeat: no-repeat;
	opacity: .7;
}
.pikaday-white .pika-prev:hover,
.pikaday-white .pika-next:hover {
	opacity: 1;
}
.pikaday-white .pika-prev {
	right: 30px;
	background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='%23a0aec0'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M15 19l-7-7 7-7'%3E%3C/path%3E%3C/svg%3E");
}
.pikaday-white .pika-next {
	right: 10px;
	background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='%23a0aec0'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M9 5l7 7-7 7'%3E%3C/path%3E%3C/svg%3E");
}
.pika-prev.is-disabled,
.pika-next.is-disabled {
    cursor: default;
    opacity: .2;
}

.pikaday-white .pika-label {
	font-size: 1.2rem;
	font-weight: 700;
	padding-right: 4px;
	padding-left: 4px;
	color: var(--labelTextColor);
}

/* Show Month & Year select */
.pikaday-white .pika-select-month,
.pikaday-white .pika-select-year {
	display: none;
}

.pikaday-white table {
    width: 100%;
    border-collapse: collapse;
}
.pikaday-white table th {
    width: 2em;
    height: 2em;
    font-weight: normal;
    color: var(--weekDaysTextColor);
    text-align: center;
}
.pikaday-white table th abbr {
    text-decoration: none;
}
.pikaday-white table td {
	padding: 1px;
}
.pikaday-white table td button {
    width: 2em;
    height: 2em;
    text-align: center;
    border-radius: 50% !important;
}
.pikaday-white table td button:hover {
    background-color: var(--selectedDateBackgroundColor);
}
.pikaday-white table td.is-today button {
	color: var(--currentDateTextColor);
}
.pikaday-white table td.is-selected button {
	background-color: var(--selectedDateBackgroundColor);
}

.pikaday-white table td button {
	color: var(--textColor);
}
.pikaday-white table td button:hover,
.pikaday-white table td.is-selected button,
.pikaday-white table td.is-selected button:hover {
    color: var(--selectedDateTextColor);
}
.button-39 {
  background-color: #FFFFFF;
  border: 1px solid rgb(209,213,219);
  border-radius: .5rem;
  box-sizing: border-box;
  color: #111827;
  font-family: "Inter var",ui-sans-serif,system-ui,-apple-system,system-ui,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
  font-size: .875rem;
  font-weight: 600;
  line-height: 1.25rem;
  padding: .75rem 1rem;
  text-align: center;
  text-decoration: none #D1D5DB solid;
  text-decoration-thickness: auto;
  box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
  cursor: pointer;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
}

.button-39:hover {
  background-color: rgb(249,250,251);
}

.button-39:focus {
  outline: 2px solid transparent;
  outline-offset: 2px;
}

.button-39:focus-visible {
  box-shadow: none;
}
/*----------------*/

</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

    <!-- Pikaday 라이브러리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pikaday/1.8.0/pikaday.min.js"></script>

    <!-- Pikaday CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/pikaday/1.8.0/css/pikaday.min.css">
</head>

<body class="sb-nav-fixed">

<c:import url="/WEB-INF/views/include/admin_header.jsp" />

		<div id="layoutSidenav_content">
			<main style="background-color: ivory;">
				<div class="container-fluid px-4">
					<div style="margin-top:30px;">
						<h3>예매 결제 관리</h3>
					</div>
					
					<div style="display: flex; justify-content: center; height: 95px; align-items: center; border: 0.2px solid black; background-color: white; margin-top: 20px;">
						
						<div style="margin-right: 50px;">
							<div>결제일자</div>
							<input id="datepicker" type="text" autocomplete="off" class="px-4 py-2 focus:outline-none focus:shadow-outline rounded shadow" 
								style="width: 200px; box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08) 0px 0px 0px 1px !important;border-radius: 12px !important;border: none;"
								value="YYYY - MM - DD" spellcheck="false">
          					<label style="margin-left: 30px; margin-right: 30px;">~</label>
							<input id="datepicker2" type="text" autocomplete="off" class="px-4 py-2 focus:outline-none focus:shadow-outline rounded shadow" 
								style="width: 200px; box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08) 0px 0px 0px 1px !important;border-radius: 12px !important;border: none;"
							value="YYYY - MM - DD" spellcheck="false">
							
							  <script>
							  
							    window.addEventListener('DOMContentLoaded', () => {
							    	var firstPayDate = "${firstPayDate}"; // 서버에서 받은 날짜와 시간 문자열
							        var dateParts = firstPayDate.split(/[- :]/); // '2024-02-13 19:34:21'를 ['2024', '02', '13', '19', '34', '21']로 분리

							        // UTC 기반 Date 객체 생성
							        var date = new Date(Date.UTC(dateParts[0], dateParts[1] - 1, dateParts[2], dateParts[3], dateParts[4], dateParts[5]));

							        // ISO 문자열로 변환 후 날짜 부분만 추출
							        var formattedFirstRequestedAt = date.toISOString().substring(0, 10);


							    	var today = new Date();
									var offset = today.getTimezoneOffset() * 60000; // 로컬 시간대 오프셋
									var localToday = new Date(today.getTime() - offset);
									var formattedToday = localToday.toISOString().substring(0, 10); // yyyy-mm-dd 형식으로 변환
							      
									
									 var datepickerValue = document.getElementById('datepicker').value;
									 var datepicker2Value = document.getElementById('datepicker2').value;
								    // 콘솔에 출력합니다.
								    console.log("datepicker value:", datepickerValue);
								    console.log("datepicker2Value  value:", datepicker2Value);
								    
								    
								    
									function redirectToAdminList() {
										 var datepickerValue = document.getElementById('datepicker').value;
										 var datepicker2Value = document.getElementById('datepicker2').value;
										console.log("datepicker value:", datepickerValue);
									    console.log("datepicker2Value  value:", datepicker2Value);
									    
									    var startDate = datepickerValue;
									    var endDate = datepicker2Value;

							            var urlParams = new URLSearchParams(window.location.search);

							           
							            urlParams.set('startDate', startDate);
							            urlParams.set('endDate', endDate);
							            // 페이지를 업데이트된 URL로 리디렉션합니다.
							            window.location.href = window.location.pathname + '?' + urlParams.toString();
								    }
									
									
									function fomatting(dateText){
										var year = dateText.getFullYear();
							    	    var month = dateText.getMonth() + 1; // getMonth()는 0부터 시작하므로 1을 더해줍니다.
							    	    var day = dateText.getDate();
							    	    var formattedDate = year + '-' + ('0' + month).slice(-2) + '-' + ('0' + day).slice(-2); // 'YYYY-MM-DD' 형식으로 변경
										return formattedDate;
									}
									
									
									new Pikaday({
							        field: document.getElementById('datepicker'),
							        theme: "pikaday-white",
							        firstDay: 1,
							       	defaultDate: new Date(formattedFirstRequestedAt), // 변환된 날짜를 기본값으로 설정
							        setDefaultDate: true,
							        minDate: new Date(formattedFirstRequestedAt),
							        maxDate: new Date(formattedToday),
							        i18n: {
							          previousMonth: 'Prev',
							          nextMonth: 'Next',
							          months: [
								        	  '1월', '2월', '3월', '4월', '5월', '6월',
								        	  '7월', '8월', '9월', '10월', '11월', '12월'
							        	],
								      weekdays: [
								       	  '일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'
								       	],
								      weekdaysShort: ['일', '월', '화', '수', '목', '금', '토']},
								      onSelect: function(dateText) {
								    	  var fomattingDate = fomatting(dateText);

								    	  $('#datepicker').val(fomattingDate);
								    	  redirectToAdminList();
								      }
							      });
							      
							      new Pikaday({
							        field: document.getElementById('datepicker2'),
							        theme: "pikaday-white",
							        firstDay: 1,
							        minDate: new Date(formattedFirstRequestedAt),
							        maxDate: new Date(formattedToday),//today,
							        //defaultDate: formattedToday,//today, // 오늘 날짜를 기본값으로 설정
							        setDefaultDate: true, // 기본 날짜를 입력 필드에 표시
							        i18n: {
							        	previousMonth: 'Prev',
							            nextMonth: 'Next',
							            months: [
							  	        	  '1월', '2월', '3월', '4월', '5월', '6월',
							  	        	  '7월', '8월', '9월', '10월', '11월', '12월'
							          	],
							  	      weekdays: [
							  	       	  '일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'
							  	       	],
							  	      weekdaysShort: ['일', '월', '화', '수', '목', '금', '토']},
							  	      onSelect: function(dateText) {
							  	    	 var fomattingDate = fomatting(dateText);
							  	    	 $('#datepicker2').val(fomattingDate);
							  	    	redirectToAdminList();
							          }
						
							      });
							      
							      
							      
							   // 현재 URL에서 startDate와 endDate 값을 가져옵니다.
								    var urlParams = new URLSearchParams(window.location.search);
								    var existingStartDate = urlParams.get('startDate');
								    
								    var existingEndDate = urlParams.get('endDate');

								    // 만약 존재한다면, 해당 값을 datepicker에 설정합니다.
								    if (existingStartDate) {
								      $('#datepicker').val(existingStartDate);
								    } else {
								      $('#datepicker').val(formattedFirstRequestedAt);
								    }

								    if (existingEndDate) {
								      $('#datepicker2').val(existingEndDate);
								    } else {
								      $('#datepicker2').val(formattedToday);
								    }
									 
							      
							    })

							  </script>
							
							
						</div>
						<div style="display: flex; flex-direction: column;"> 결제 수단
							<select name="usercombo" id="payment_method_combo"
								style="width: 150px; height: 36px; margin-right: 30px;">
								<option value="" selected>전체</option>
								<option value="간편결제">간편결제</option>
								<option value="포인트결제">포인트결제</option>
								<option value="신용·체크카드">신용·체크카드</option>
								<option value="가상계좌">가상계좌</option>
								<option value="휴대폰">휴대폰</option>
								<option value="문화상품권">문화상품권</option>
								<option value="게임문화상품권">게임문화상품권</option>
								<option value="도서문화상품권">도서문화상품권</option>
								<option value="계좌이체">계좌이체</option>
							</select> 
						</div>
						<script>
							document.addEventListener('DOMContentLoaded', function() {
							    // 결제 수단 콤보박스 요소를 가져옵니다.
							    var paymentMethodCombo = document.getElementById('payment_method_combo');
							
							    // 결제 수단 콤보박스의 변경 사항을 감지합니다.
							    paymentMethodCombo.addEventListener('change', function() {
							    	var selectedPaymentMethod = paymentMethodCombo.value;
						            var urlParams = new URLSearchParams(window.location.search);

						            // 'payment_method' 매개변수를 업데이트합니다.
						            urlParams.set('payment_method', selectedPaymentMethod);

						            // 페이지를 업데이트된 URL로 리디렉션합니다.
						            window.location.href = window.location.pathname + '?' + urlParams.toString();
							    });
							});
						</script>
						
						<select name="usercombo" id="searchcombo"
							style="width: 150px; height: 36px; margin-right: 30px; margin-top: 22px;">
							<option value="" disabled selected>검색조건선택</option>
							<option value="user_name">구매자명</option>
							<option value="exhibition_title">구매상품</option>
						</select> 
						<input type="text" name="usersearch" id="usersearch"
							style="width: 250px; height: 36px; margin-right: 30px; margin-top: 20px;"
							placeholder="검색어를 입력해주세요" />
						<button class="btn btn-dark" style="width: 80px; height: 40px; margin-top: 22px;">검색</button>
					
						<script>
						    document.addEventListener('DOMContentLoaded', function() {
						        // 검색 조건 콤보박스와 검색어 입력 필드, 검색 버튼 요소를 가져옵니다.
						        var searchCombo = document.getElementById('searchcombo');
						        var searchInput = document.getElementById('usersearch');
						        var searchButton = document.querySelector('.btn-dark'); // 클래스 이름으로 검색 버튼을 선택합니다.
						
						        // 검색 버튼 클릭 이벤트 리스너를 추가합니다.
						        searchButton.addEventListener('click', function() {
						        	var selectedOption = searchCombo.value;
						            var searchText = searchInput.value;
						            var urlParams = new URLSearchParams(window.location.search);

						            // 선택된 검색 조건과 검색어를 URL 매개변수로 추가 또는 업데이트합니다.
						            urlParams.set(selectedOption, searchText);

						            // 페이지를 업데이트된 URL로 리디렉션합니다.
						            window.location.href = window.location.pathname + '?' + urlParams.toString();
						        });
						    });
						</script>
						
						
						<button class="button-39" id="resetButton" role="button" style="width: 80px; height: 44px; margin-top: 22px; margin-left: 30px;">초기화</button>
						
						<script>
						    document.addEventListener('DOMContentLoaded', function() {
						        // 검색 조건 콤보박스와 검색어 입력 필드, 검색 버튼 요소를 가져옵니다.
						        var resetButton = document.getElementById('resetButton');

						        // 검색 버튼 클릭 이벤트 리스너를 추가합니다.
						        resetButton.addEventListener('click', function() {
						            window.location.href = '${root}/adminPayment/manager_reservelist';
						        });
						    });
						</script>
					
					</div>
					

					<div style="background-color: white; margin-top: 30px;">
						<table class="table table-striped" style="text-align: center;">
							<thead>
								<tr>
									<th scope="col">No</th>
									<th scope="col" style="width: 150px;">주문일시</th>
									<th scope="col" style="width: 150px;">결제일시</th>
									<th scope="col">주문번호</th>
									<th scope="col" style="width: 150px;">결제상태</th>
									<th scope="col" style="width: 150px;">구매자명</th>
									<th scope="col">결제액</th>
									<th scope="col" style="width: 130px;">결제 수단</th>
									<th scope="col" style="width: 200px;">구매상품</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${reserveBean}" var="reservelist">
									<tr style="vertical-align: middle;">
										<th scope="row">${reservelist.reserve_id}</th>
										<td style="width: 150px;">${reservelist.requested_at}</td>
										<td style="width: 150px;">${reservelist.approved_at != null ? reservelist.approved_at : '-'}</td>
										<td>${reservelist.order_id}</td>
										
										<c:choose>
									        <c:when test="${reservelist.state == 1}">
									            <td style="color: gray;">완료</td>
									        </c:when>
									        <c:when test="${reservelist.state == 0}">
									            <td style="color: red;">취소</td>
									        </c:when>
									     
									    </c:choose>
									    
									    
										<td style="width: 150px;">${reservelist.name}</td>
										
										
										<c:choose>
									        <c:when test="${reservelist.state == 1}">
									            <td style="width: 200px;">${reservelist.payment}</td>
									        </c:when>
									        <c:when test="${reservelist.state == 0}">
									            <td style="width: 200px; color: red;">- ${reservelist.payment}</td>
									        </c:when>
									     
									    </c:choose>
										<td>${reservelist.payment_method}</td>
										<td>${reservelist.title}</td>
										<td style="width: 150px;">
											
											<button data-reserve-id="${reservelist.reserve_id}" class="btn btn-danger"style="float: right; margin-right: 50px;
											 margin-top: 20px; margin-bottom: 20px;" onclick="showConfrimCancle(this.getAttribute('data-reserve-id'))">취소</button>
										
										</td>
										
										
									</tr>
								</c:forEach>
							</tbody>
						</table>
						

						<div style="display: flex; justify-content: center; margin-top:30px;">
							<nav aria-label="Page navigation example" class="mx-auto">
								<ul class="pagination">
									<li class="page-item"><a class="page-link" href="#"
										style="color: black;" aria-label="Previous"> <span
											aria-hidden="true">&laquo;</span>
									</a></li>
									<li class="page-item"><a class="page-link" href="#"
										style="color: black;">1</a></li>
									<li class="page-item"><a class="page-link" href="#"
										style="color: black;">2</a></li>
									<li class="page-item"><a class="page-link" href="#"
										style="color: black;">3</a></li>
									<li class="page-item"><a class="page-link" href="#"
										style="color: black;" aria-label="Next"> <span
											aria-hidden="true">&raquo;</span>
									</a></li>
								</ul>
							</nav>
						</div>

					</div>
				</div>
			</main>
		</div>

	<script>
		function showConfrimCancle(reserveId) {

			Swal.fire({
	            //title: "Are you sure?",
	            text: "취소 처리하시겠습니까?",
	            icon: "warning",
	            showCancelButton: true,
	            confirmButtonColor: "#dd3344",
	            cancelButtonColor: "gray",
	            confirmButtonText: "취소 처리",
	            cancelButtonText: '닫기'
	        }).then((result) => {
	            if (result.isConfirmed) {
	            	 window.location.href = '${root}/adminPayment/reserve_cancel?reserve_id='+reserveId;
	            	console.log("클릭한 예매 reserve_id : ",reserveId);
	            }
	            
	        });
		}

		document.addEventListener("DOMContentLoaded", function() {
	        <% if (request.getAttribute("canceled") != null) { %>
	            Swal.fire({
	                title: "취소 처리 완료",
	                text: "취소 처리가 성공적으로 되었습니다",
	                icon: "success",
	                showConfirmButton: false,
	                timer: 2000
	            });
	        <% } %>
	    });
		
	</script>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	
	
</body>

</html>