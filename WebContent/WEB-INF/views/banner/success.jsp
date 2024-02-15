<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>  
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	
	<div>banner_apply_form_id : ${bannerPaymentInfoBean.banner_apply_form_id }</div>
	<div>apply_person_id : ${bannerPaymentInfoBean.apply_person_id }</div>
	<div>start_date : ${bannerPaymentInfoBean.start_date }</div>
	<div>end_date : ${bannerPaymentInfoBean.end_date }</div>
	<div>command : ${bannerPaymentInfoBean.command}</div>
	<div>payment : ${bannerPaymentInfoBean.payment }</div>
	<div>banner_type : ${bannerPaymentInfoBean.banner_type }</div>
	<div>requested_at : ${bannerPaymentInfoBean.requested_at }</div>
	<div>order_id : ${bannerPaymentInfoBean.order_id }</div>
	<div>payment_method : ${bannerPaymentInfoBean.payment_method }</div>
	<div>pay_state : ${bannerPaymentInfoBean.pay_state }</div>
	<div>pay_approval_state : ${bannerPaymentInfoBean.pay_approval_state }</div>
	
	<script>
      Swal.fire({
          title: "결제 완료",
          text: "결제가 성공적으로 되었습니다",
          icon: "success",
          showConfirmButton: false,
          timer: 2000
      });
  	</script>
</body>
</html>