<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="root" value="${pageContext.request.contextPath }" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.min.css">
<!-- SweetAlert2 CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<title>게시판 글쓰기</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<!-- 메뉴바 -->
<link rel="icon" type="image/x-icon" href="assets/ARTMEE_PAGELOGO.png" />

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
   crossorigin="anonymous"></script>

<!-- Google fonts-->
<link
   href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900"
   rel="stylesheet" />
<link
   href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
   rel="stylesheet" />

<!-- Bootstrap core JS-->
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="../js/scripts.js"></script>

<!-- JQuery 자바스크립트-->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- CSS -->
<link href="../css/styles.css" rel="stylesheet" />

<!-- CSS -->
<link href="../css/board/write.css" rel="stylesheet" />

<!-- Carousel 자바스크립트-->
<script src='https://www.gmarwaha.com/script/lib/jquery-1.11.1.js'></script>
<script src="https://www.gmarwaha.com/script/lib/jquery.easing-1.3.js"></script>
<script
   src="https://www.gmarwaha.com/script/lib/jquery.easing.compatibility.js"></script>
<script
   src="https://www.gmarwaha.com/script/lib/jquery.mousewheel-3.1.12.js"></script>
<script
   src="https://www.gmarwaha.com/jquery/jcarousellite/script/jquery.jcarousellite.js"></script>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
</head>
<body>
<body id="page-top">
   <!-- 메뉴바 -->
   <c:import url="/WEB-INF/views/include/header.jsp" />
  
   <div id="contents" class="contents_customer area_movingvar litype5 container mt-5">
    <div class="card">
        <h5 class="card-header" style="font-size:25px;">새 글 작성</h5>
        <div class="card-body">
				<form:form action="${root}/board/write_pro" method="post"
					modelAttribute="boardBean">
					<div class="form-group" style="margin-top: 10px;">
						<form:label path="title" class="font-weight-bold" style="font-size:20px;">제목</form:label>
						<form:input path="title" id="title" placeholder="제목을 입력하세요." class="form-control form-control-sm" required="required"
							style="width: 100%; padding: 10px; margin-bottom: 10px; border: 1px solid #cccccc; border-radius: 5px;" />
						<form:errors path="title" />
					</div>

					<div class="form-group" style="margin-top: 20px;">
						<form:label path="contents" class="font-weight-bold"
							style="font-size:20px;">내용</form:label>
						<!-- SmartEditor2 텍스트 에디터 -->
						<%-- <form:input path="contents" class="form-control form-control-sm"
							placeholder="내용을 입력하세요."
							style="height:300px; width: 100%; padding:10px;" /> --%>
						<form:textarea required="required" path="contents" style="width:100%; height:300px; resize: none; padding-top:10px; padding-left: 10px;" placeholder="내용을 입력하세요"></form:textarea>
						<form:errors path="contents" />
					</div>
					<br />
					<!-- 생략된 파일 업로드 및 기타 폼 요소 -->

					<div class="text-center mt-4">
						<a href="javascript:;" onclick="confirmExit()"
							class="btn btn-danger"
							style="font-size: 25px; text-decoration: none;">취소</a>
						<form:button type="submit" class="btn btn-dark"
							style="text-decoration: none; font-size: 25px;">완료</form:button>
					</div>
				</form:form>
			</div>
    </div>
</div>
<script>
function confirmExit() {
    Swal.fire({
        title: '사이트에서 나가시겠습니까?',
        text: '변경사항이 저장되지 않을 수 있습니다.',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '나가기',
        cancelButtonText: '취소'
    }).then((result) => {
        if (result.isConfirmed) {
            // 사용자가 '나가기'를 클릭한 경우, 원하는 페이지로 리다이렉션
            window.location.href = "${root}/board/main";
        }
        // 사용자가 '취소'를 클릭한 경우, 아무것도 하지 않음 (자동으로 처리됨)
    });
}
</script>

<!-- Smart Editor --><!-- 
<script type="text/javascript">
   var oEditors = [];
   nhn.husky.EZCreator.createInIFrame({
       oAppRef: oEditors,
       elPlaceHolder: "smarteditor",
       sSkinURI: "../se2/SmartEditor2Skin.html",
       fCreator: "createSEditor2"
   });
    
    function submitContents(elClickedObj) {
        oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
        try {
            elClickedObj.form.submit();
        } catch(e) {}
    }
    
    function pasteHTML(filepath){
        var sHTML = '<img src="${pageContext.request.contextPath}/uploadFolder/' + filepath + '">';
        oEditors.getById["smarteditor"].exec("PASTE_HTML", [sHTML]);
    }
</script>
 -->
<!-- 푸터-->
<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>
</html>