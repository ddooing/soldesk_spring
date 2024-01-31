<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!-- 삭제 메시지가 존재하면 JavaScript Alert로 표시 -->
<c:if test="${not empty deleteMessage}">
    <script>
        alert('${deleteMessage}');
        location.href = '${root}/board/main'; // 필요한 경우 이 부분을 제거
    </script>
</c:if>