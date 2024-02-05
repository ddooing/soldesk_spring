<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<script>
   alert('QnA 삭제처리 되었습니다.');
   location.href='${root}/admin/manager_QnAlist';
</script>