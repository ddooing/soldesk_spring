<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<script>
	alert('수정을 성공하였습니다.')
	location.href = '${root}/admin/manager_accountdetail?user_id=${u1.user_id}'
</script>