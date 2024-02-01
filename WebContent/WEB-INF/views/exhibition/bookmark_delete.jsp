<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<script>
   alert('북마크가 삭제되었습니다.');
   location.href='${root}/exhibition/exhibition_click?exhibition_id=${exhibition_id}&user_id=${user_id}';
</script>
