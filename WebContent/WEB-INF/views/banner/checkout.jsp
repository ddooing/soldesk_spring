<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath }" />  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>결제하기</title>
   <!-- 토스페이먼츠 결제창 SDK 추가 -->
    <script src="https://js.tosspayments.com/v1/payment"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</head>

<body>

	<script>
	    function initiatePayment() {
	        // 클라이언트 키로 객체 초기화
	        var clientKey = 'test_ck_mBZ1gQ4YVXKORgvZXBwR3l2KPoqN';
	        var tossPayments = TossPayments(clientKey);
	        var msg = "";
	        
	        // 결제창 띄우기
	        tossPayments.requestPayment('카드', {
	            amount: ${applybannerBean.payment}, // 서버에서 받은 금액 사용
	            orderId: '${orderid}', // 주문 ID
	            orderName: '${title}', // 주문명 
	            customerName: '${loginUserDetailBean.name}', // 구매자 이름
	            successUrl: 'http://localhost:8080/Spring_Project_Dream/banner/success',
	            failUrl: 'http://localhost:8080/Spring_Project_Dream/banner/bannerapply'
	        }).catch(function (error) {
	            handlePaymentError(error);    
	        });
	    }
	
	    function moveWhatBannerType(){
	    	var banner_type =${applybannerBean.banner_type};
	    	var url="";
	    	
	    	if(banner_type == 1){//메인배너
	    		url="${root }/banner/mainbannerapplyform";
	    	}else if(banner_type == 2){//서브배너
	    		url="${root }/banner/subbannerapplyform";
	    	}
	    	window.location.href=url;	
	    	
	    }
	    function handlePaymentError(error) {
	        console.log(error.code);
	
	        if (error.code === 'USER_CANCEL') {
	            Swal.fire({
	                title: "결제를 취소하셨습니다.",
	                icon: "warning",
	                confirmButtonText: "확인"
	            }).then((result) => {
	                if (result.isConfirmed) {
	                	moveWhatBannerType();
	                }
	            });
	            return;
	        } else if (error.code === 'INVALID_CARD_COMPANY') {
	            msg = "유효하지 않는 카드사입니다.";
	        } else if (error.code === 4001) {
	            msg = "토큰이 만료되었습니다.";
	        } 
	        
	        /* 
	        	error.code === 'DUPLICATED_ORDER_ID' 는 위젯에서 표기되므로, 
	        	위젯 닫기 누르면 failUrl로 이동함
	        */
            Swal.fire({
                title: "결제 오류",
                text: msg + "<br><br>  결제를 다시 진행해주세요.",
                icon: "warning",
                confirmButtonText: "확인"
            }).then((result) => {
                if (result.isConfirmed) {
                	window.location.href="${root }/banner/bannerapply";
                }
            });
	        
	    }
	
	    window.onload = initiatePayment;
	</script>

</body>
</html>