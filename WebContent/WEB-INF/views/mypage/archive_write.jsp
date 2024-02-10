<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>ARTMEE</title>

<link rel="icon" type="image/x-icon" href="../img/ARTMEE_PAGELOGO.png" />

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>

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
<!-- Core theme JS-->
<script src="js/scripts.js"></script>

<!-- JQuery 자바스크립트-->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- sweet alert 2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- CSS -->
<link href="css/styles.css" rel="stylesheet" />

<!-- Carousel 자바스크립트-->
<script src='https://www.gmarwaha.com/script/lib/jquery-1.11.1.js'></script>
<script src="https://www.gmarwaha.com/script/lib/jquery.easing-1.3.js"></script>
<script
	src="https://www.gmarwaha.com/script/lib/jquery.easing.compatibility.js"></script>
<script
	src="https://www.gmarwaha.com/script/lib/jquery.mousewheel-3.1.12.js"></script>
<script
	src="https://www.gmarwaha.com/jquery/jcarousellite/script/jquery.jcarousellite.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">

<script>
  document.addEventListener("keydown", function(event) {
    if (event.key === "Enter") {
      event.preventDefault(); // 기본 동작(폼의 submit) 막기
    }
  });
</script>


<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap"
	rel="stylesheet">

<style>



.star-rating {
	font-size: 0;
}

.star-rating label {
	font-size: 3rem; /* 별의 크기 */
	padding: 0 5px;
	cursor: pointer;
	color: #ccc; /* 비활성화된 별의 색상 */
}

.star-rating label.hovered, .star-rating label.selected {
	color: gold; /* 활성화된 별의 색상 */
}

.checkbox-wrapper-17 input[type=checkbox] {
	    height: 0;
	    width: 0;
	    visibility: hidden;
	  }

	  .checkbox-wrapper-17 label {
	    --size: 55px;
	
	    cursor: pointer;
	    width: var(--size);
	    height: calc(var(--size) / 2);
	    background: grey;
	    display: block;
	    border-radius: 100px;
	    position: relative;
	  }
	
	  .checkbox-wrapper-17 label:after {
	    content: '';
	    position: absolute;
	    top: 6%;
	    left: 2.5%;
	    width: calc(50% - 5%);
	    height: calc(100% - 11%);
	    background: #fff;
	    border-radius: 90px;
	    transition: 0.3s;
	  }
	
	  .checkbox-wrapper-17 input:checked + label {
	    background: #bada55;
	  }
	
	  .checkbox-wrapper-17 input:checked + label:after {
	    left: calc(100% - 2.5%);
	    transform: translateX(-100%);
	  }
	
	  .checkbox-wrapper-17 label:active:after {
	    width: 55%;
	  }
</style>

</head>

<body id="page-top">
	<!-- 메뉴바 -->
	<c:import url="/WEB-INF/views/include/header.jsp" />

	<section style="margin-top: 150px;">
		<div class="container mb-1">
			<h1 style="margin-left: 180px;">소감문 작성</h1>
			<hr style="margin: auto; margin-top: 50px; width: 1000px;" />
			<!--전시회 정보 부분-->
			<div>
				<h3 style="margin-left: 180px; margin-top: 50px;">전시회 정보</h3>
			</div>
			<div style="display: flex; align-items: center; flex-direction: row;">
				<img
					src="${ArchiveOneInfoBean.main_poster_path }${ArchiveOneInfoBean.main_poster_name }"
					alt="예약포스터"
					style="width: 200px; height: 280px; margin-left: 300px; margin-top: 40px;" />

				<div style="margin-left: 200px;">
					<h2>${ArchiveOneInfoBean.title }</h2>
					
					
					<div style="display: flex; margin-top: 50px;">
						<div style="margin-right: 10px; width: 200px;">
							<a style="font-size: 20px;">전시관</a>
						</div>
						<div style="margin-left: auto;">
							<a style="font-size: 20px;">${ArchiveOneInfoBean.place }</a>
						</div>
					</div>
					
					<div style="display: flex; margin-top: 10px;">
						<div style="margin-right: 10px; width: 200px;">
							<a style="font-size: 20px;">예약 날짜</a>
						</div>
						<div style="margin-left: auto;">
							<a style="font-size: 20px;">${ArchiveOneInfoBean.reserve_date }</a>
						</div>
					</div>



					<div style="display: flex; margin-top: 10px;">
						<div style="margin-right: 10px; width: 200px;">
							<a style="font-size: 20px;">티켓 수량</a>
						</div>
						<div style="margin-left: auto;">
							<a style="font-size: 20px;">${ArchiveOneInfoBean.ticket_count} 매</a>
						</div>
					</div>

					<div style="display: flex; margin-top: 10px;">
						<div style="margin-right: 10px; width: 200px;">
							<a style="font-size: 20px;">결제 금액</a>
						</div>
						<div style="margin-left: auto;">
							<a style="font-size: 20px;">${ArchiveOneInfoBean.total_price} 원</a>
						</div>
					</div>
				</div>
			</div>
			<hr style="margin: auto; margin-top: 50px; width: 1000px;" />

			<div>
				<h3 style="margin-left: 180px; margin-top: 50px;">별점</h3>
			</div>
			<form:form action="${root }/mypage/archive_pro?user_id=${loginUserBean.user_id}" method="post" modelAttribute="reviewBean">		<!-- form -->
			<form:hidden path="reserve_id" value="${ArchiveOneInfoBean.reserve_id }"/>
				<div style="margin:auto;">
					<div style="text-align: center; font-size: 35px;" class="star-rating">
						<form:radiobutton id="star1" path="rating" value="1" style="display: none;"/><label for="star1">&#9733;</label>
					    <form:radiobutton id="star2" path="rating" value="2" style="display: none;"/><label for="star2">&#9733;</label>
					    <form:radiobutton id="star3" path="rating" value="3" style="display: none;"/><label for="star3">&#9733;</label>
					    <form:radiobutton id="star4" path="rating" value="4" style="display: none;"/><label for="star4">&#9733;</label>
					    <form:radiobutton id="star5" path="rating" value="5" style="display: none;"/><label for="star5">&#9733;</label>
					</div>
			</div>
			
			
			<hr style="margin: auto; margin-top: 50px; width: 1000px;" />
			<div>
				<h3 style="margin-left: 180px; margin-top: 50px;">리뷰</h3>
			</div>
			
			
			<div class="text-center">
				<div style="margin:auto;">
					<form:textarea path="contents" style="width:800px; height:300px;"/>
				</div>
			
			
			<div class="checkbox-wrapper-17" style="margin-top: 30px; margin-left:250px; display: flex; align-items: center;">
			  <input type="hidden" name="checkboxValue" id="hiddenCheckboxValue" value="0" />
			  <input type="checkbox" id="switch-17" onchange="updateCheckboxValue(this)" />
			  <label for="switch-17"></label>
			  <span style="margin-left: 10px;">공개 여부</span>
			  <button type="button" onclick="submitForm();" class="btn btn-dark" style="margin-left: 580px;" role="button">저장하기</button>
			</div>

			
			</div>
			</form:form>
		</div>
	</section>



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
	
function updateCheckboxValue(checkbox) {
    var hiddenInput = document.getElementById('hiddenCheckboxValue');
    if (checkbox.checked) {
        hiddenInput.value = "1";
    } else {
        hiddenInput.value = "0";
    }
}

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
    
    <script>
	function submitForm() {
	    Swal.fire({
	        title: '아카이브를 저장하시겠습니까?',
	        icon: 'question', 
	        showCancelButton: true,
	        confirmButtonText: '저장',
	        cancelButtonText: '취소',
	    }).then((result) => {
	        if (result.isConfirmed) {
	            Swal.fire({
	                title: '저장되었습니다!',
	                icon: 'success' 
	            }).then(() => {
	                document.forms[0].submit();
	            });
	        }
	    });
	}
	</script>

</body>

</html>