<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }" />
<head>
    <!-- SweetAlert 라이브러리 추가 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<script>
    window.onload = function() {
        Swal.fire({
            title: '에러!',
            text: '잘못된 접근입니다.',
            icon: 'error',
            confirmButtonText: '확인'
        }).then((result) => {
            if (result.isConfirmed) {
                location.href = '${root}/view/index';
            }
        });
    };
</script>
