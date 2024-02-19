<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }"/>
<head>
    <!-- SweetAlert 라이브러리 추가 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<script>
window.onload = function() {
    Swal.fire({
        title: '성공!',
        text: '수정을 성공하였습니다.',
        icon: 'success',
        confirmButtonText: '확인'
    }).then((result) => {
        if (result.isConfirmed) {
            location.href = '${root}/admin/manager_accountdetail?user_id=${u1.user_id}';
        }
    });
};
</script>
