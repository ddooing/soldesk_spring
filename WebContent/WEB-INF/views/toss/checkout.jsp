<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>결제하기</title>
   <!-- 토스페이먼츠 결제창 SDK 추가 -->
    <script src="https://js.tosspayments.com/v1/payment"></script>
</head>
<body>
    <script>
        function initiatePayment() {
            var amount = 100;//${amount}; // 서버에서 전달받은 amount 값 사용

            // 클라이언트 키로 객체 초기화
            var clientKey = 'test_ck_mBZ1gQ4YVXKORgvZXBwR3l2KPoqN';
            
            var tossPayments = TossPayments(clientKey);
            
         	var payment = '${ReserveBean.payment}';
            var orderid = '${orderid}';
            var title= '${title}';
          
            console.log("checkout - payment : "+payment);
            console.log("checkout - orderid : "+orderid);
            console.log("checkout - title : "+title);
            // 결제창 띄우기
            tossPayments.requestPayment('카드', {
                amount: payment, // 서버에서 받은 금액 사용
                orderId: orderid,//필수 )'7_XR8395y-HtJQb7Wb60L', // 주문 ID
                orderName: title, // 필수 )주문명 
                customerName: '김도영', // 구매자 이름
                successUrl: 'http://localhost:8080/Spring_Project_Dream/toss/success',//필수
                failUrl: 'http://localhost:8080/Spring_Project_Dream/toss/fail',//필수
            }).catch(function (error) {// 에러 처리
            	
            	console.log(error.code)
          
            	// 결제 고객이 결제창을 닫았을 때 에러 처리
                if (error.code === 'USER_CANCEL') {
                	alert('결제를 취소하셨습니다.');
                	
                	// payment 창으로 가야하는데 이때, 
                	//window.location.href = 'http://localhost:8080/Spring_Project_Dream/exhibition/payment?exhibition_id=${exhibitionBean.exhibition_id}';
                	
		      } else if (error.code === 'INVALID_CARD_COMPANY') {
		        // 유효하지 않은 카드 코드에 대한 에러 처리
		      }	else if(error.code === 'INVALID_REQUEST'){
		    	  alert('INVALID_REQUEST 오류로 결제를 취소합니다.');
		      }
		    	  
            });
        }

        // 페이지 로드 시 결제창 초기화
        window.onload = initiatePayment;
    </script>
</body>
</html>