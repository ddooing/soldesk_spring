<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
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
<link href="../css/board/modify.css" rel="stylesheet" />

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
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap"
	rel="stylesheet">
</head>
<body>
<body id="page-top">
	<!-- 메뉴바 -->
	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div id="contents"
		class="contents_customer area_movingvar litype5 container mt-5">
		<div class="card">
			<h5 class="card-header" style="font-size: 25px;">수정</h5>
			<div class="card-body">
				<form:form action="${root}/board/modify_pro" method="post" modelAttribute="modifyContentBean">
					<div class="form-group" style="margin-top: 10px;">
						<form:hidden path="board_id"/>
						<div class="form-group">
							<form:label path="user_id">작성자</form:label>
							<form:input path="user_id" class="form-control" readonly="true" />
						</div>
						<div class="form-group">
							<form:label path="update_date">작성날짜</form:label>
							<form:input path="update_date" class="form-control" readonly="true" />
						</div>
						<form:label path="title" class="font-weight-bold"
							style="font-size:20px;">제목</form:label>
						<form:input path="title" id="title" placeholder="제목을 입력하세요."
							class="form-control form-control-sm"
							style="width: 100%; padding: 10px; margin-bottom: 10px; border: 1px solid #cccccc; border-radius: 5px;" />

					</div>

					<div class="form-group" style="margin-top: 20px;">
						<form:label path="contents" class="font-weight-bold"
							style="font-size:20px;">내용</form:label>
						<!-- SmartEditor2 텍스트 에디터 -->
						<form:input path="contents" class="form-control form-control-sm"
							placeholder="내용을 입력하세요."
							style="height:300px; width: 100%; padding:10px;" />
						<!-- <textarea name="contents" id="smarteditor" style="width:100%; height:300px;"></textarea> -->

					</div>
					<br />
					<!-- 생략된 파일 업로드 및 기타 폼 요소 -->

					<div class="text-center mt-4">
						<a href="javascript:;" onclick="confirmExit()"
							class="btn btn-primary btn-lg ml-2"
							style="border: 1px solid black; font-size: 25px; color: black; text-decoration: none;">취소</a>
						<form:button type="submit" class="btn btn-primary"
							style="text-decoration: none;border: 1px solid black; font-size: 25px; color: black;">완료</form:button>
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

	<!-- Smart Editor -->
	<!-- 
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