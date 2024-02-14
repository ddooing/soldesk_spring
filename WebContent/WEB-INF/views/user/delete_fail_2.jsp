<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<script>
	alert('회원탈퇴가 실패하였습니다. \r\n 사유 : 비밀번호 오류')
	location.href = '${root}/mypage/reservelist?user_id=${loginUserBean.user_id}'
</script>