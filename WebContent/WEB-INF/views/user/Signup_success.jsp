<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- ${root }board 두번 방지 -->
<c:set var="root" value="${pageContext.request.contextPath }" />

<script>
	alert("회원가입이 완료되었습니다.")
	location.href = "${root}/user/login"
</script>