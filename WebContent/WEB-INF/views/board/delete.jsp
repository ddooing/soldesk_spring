<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }/"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.min.css">
<!-- SweetAlert2 CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<script>
document.addEventListener('DOMContentLoaded', function() {
    Swal.fire({
        position: 'center', // 위치 설정
        icon: 'success', // 아이콘 타입
        title: '삭제되었습니다.', // 메시지 제목
        showConfirmButton: false, // 확인 버튼 숨김
        timer: 1500 // 1.5초 후에 알림창 닫힘
    }).then((result) => {
        // 알림이 닫힌 후 리다이렉트 실행
    	location.href='${root}board/main?board_id=${board_id}';
    });
});
</script>7