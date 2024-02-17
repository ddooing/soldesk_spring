<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	
<c:set var="root" value="${pageContext.request.contextPath }"/>  
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="icon" type="image/x-icon" href="../img/ARTMEE_PAGELOGO.png" />
<title>관리자 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="../css/styles_manager.css" rel="stylesheet" />
<!--부트스트랩 아이콘 사용-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"
	rel="stylesheet">

<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>

<!-- sweet alert 2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- JQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
    $("#allcheck").click(function(){
        if($(this).is(":checked")) {
            $("tbody tr th input[type='checkbox']").prop("checked", true);
        } else {
            $("tbody tr th input[type='checkbox']").prop("checked", false);
        }
    });
});

</script>


<style>
.filebox .upload-name {
	display: inline-block;
	height: 40px;
	padding: 0 10px;
	vertical-align: middle;
	border: 1px solid #dddddd;
	width: 90%;
	color: #999999;
	
}

.filebox label {
	display: inline-block;
	padding: 10px 20px;
	color: #fff;
	vertical-align: middle;
	background-color: #999999;
	cursor: pointer;
	height: 40px;
	margin-left: 10px;
}

.filebox input[type="file"] {
	position: absolute;
	width: 0;
	height: 0;
	padding: 0;
	overflow: hidden;
	border: 0;
}
</style>
</head>

<body class="sb-nav-fixed">
	<c:import url="/WEB-INF/views/include/admin_header.jsp"/>

		<!--실제 내용(대시보드) 부분-->
		<div id="layoutSidenav_content">
			<main style="background-color: ivory;">
				<div class="container-fluid px-4">
					<div style="margin-top: 30px; margin-left:20px;">
						<h3>QnA 작성</h3>
					</div>
					<div style="position: relative; margin:20px; display: flex; justify-content: start; height: 80px; align-items: center; background-color: #E8E8E8; margin-top: 20px;">
						<button class="btn btn-dark" style="margin-left: 20px;" onclick="location.href='${root}/admin/manager_QnAlist'">QnA 목록</button>
					</div>
					
					<div
						style="background-color: white; margin-top: 30px; margin: 20px;">
						
						<table class="table table-bordered">
							<tr style="align-items: center; height: 75px;">
								<th style="vertical-align: middle; text-align:center; font-size:20px;">작성자</th>
								<td style="vertical-align: middle;">
									${oneQnaInfo.nickname }
								</td>
								<th style="vertical-align: middle; text-align:center; font-size:20px;">등록일</th>
								<td style="vertical-align: middle;">
									${oneQnaInfo.regdate }
								</td>
							</tr>
							<tr style="align-items: center; height: 75px;">
								<th style="width: 200px; vertical-align: middle; text-align:center; font-size:20px;">제목</th>
								<td style="vertical-align: middle;" colspan="4">
									${oneQnaInfo.title }
								</td>
							</tr>
							<tr style="align-items: center; height: 300px; ">
								<th style="vertical-align: middle; text-align:center; font-size:20px;">내용</th>
								<td colspan="4">
									${oneQnaInfo.contents }
								</td>
							</tr>
						</table>	
						<div>
							<c:choose>
								<c:when test="${oneQnaInfo.state == 2 }">
										
								</c:when>
								<c:otherwise>
									<button class="btn btn-danger" onclick="confirmDeletion('${root}/admin/manager_QnAdelete?qna_id=${oneQnaInfo.qna_id}')" style="float:right; margin-right: 20px;">삭제</button>
								</c:otherwise>
							</c:choose>
							
						</div>
						
					</div>
					
					<div style="margin-top: 80px; margin-left:20px; display:flex; align-items: center;">
   						 <h3 style="margin-right: 50px;">답변등록</h3>
   						 <c:choose>
   						 	<c:when test="${oneQnaInfo.state == 1 }">
   						 		<span class="badge text-bg-success rounded-pill" style="font-size:15px;">답변완료</span>
   						 	</c:when>
   						 	<c:when test="${oneQnaInfo.state == 0 }">
   						 		<span class="badge text-bg-danger rounded-pill" style="font-size:15px;">답변전</span>	
   						 	</c:when>
   						 	<c:when test="${oneQnaInfo.state == 2 }">
   						 		<span class="badge text-bg-warning rounded-pill" style="font-size:15px;">삭제처리</span>	
   						 	</c:when>
   						 </c:choose>
					</div>


					<div
						style="background-color: white; margin-top: 30px; margin: 20px;">


						<script>
							  tinymce.init({
   								 selector: '#contents',
   								 width: '100%',  // 에디터의 너비를 100%로 설정
   								 height: 400     // 에디터의 높이를 400픽셀로 설정
 								});
						</script>
						<form:form action="${root }/admin/qna_reply_enroll" method="post" modelAttribute="oneQnaInfo" id="form">
						<form:hidden path="qna_id"/>
						<table class="table table-bordered">
							<tr style="align-items: center; height: 100px; ">
								<th style="vertical-align: middle; font-size:20px; width: 200px; text-align:center;">답변</th>
								<td>
									<c:choose>
										<c:when test="${oneQnaInfo.state == 2 }">
	   						 				<form:textarea path="reply" rows="15" cols="133" name="reply" style="resize:none;" readonly="true" />
	   						 			</c:when>
	   						 			<c:otherwise>
	   						 				<form:textarea path="reply" rows="15" cols="133" name="reply" style="resize:none;"/>	
	   						 			</c:otherwise>
	   						 		</c:choose>
									
								</td>
							</tr>
						</table>	
							
							<div style="float:right; margin-bottom:50px;">
								<c:choose>
									<c:when test="${oneQnaInfo.state == 2 }">	<!-- state 2일때만 취소 복구 버튼 -->
										<a href="${root}/admin/manager_QnAlist" class="btn btn-danger" style="margin-right: 15px;">취소</a>
										<button class="btn btn-info" type="button" onclick="confirmRecovery('${root}/admin/QnA_recovery?qna_id=${oneQnaInfo.qna_id}&reply=${oneQnaInfo.reply}')">복구하기</button>
									</c:when>
									<c:otherwise>	<!-- 나머지 일때 state 0, 1 취소 등록하기 버튼 -->
										<a href="${root}/admin/manager_QnAlist" class="btn btn-danger" style="margin-right: 15px;">돌아가기</a>
										<button type="button" class="btn btn-dark" style="margin-right: 30px;" onclick="submitForm()">등록하기</button>
									</c:otherwise>
								</c:choose>
							</div>
						</form:form>
					</div>
				</div>
			</main>


		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	
	<script>

    function submitForm() {
        Swal.fire({
            title: '등록하시겠습니까?',
            text: '변경 사항을 저장합니다.',
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '등록',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire(
                    '등록되었습니다!',
                    '변경 사항이 저장되었습니다.',
                    'success'
                ).then((result) => {
                    if (result.isConfirmed) {
                        // 폼 제출
                        $("form").submit();
                    }
                });
            }
        });
    }
    

    function confirmDeletion(url) {
        Swal.fire({
            title: '삭제하시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            confirmButtonText: '삭제',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire(
                    '삭제되었습니다!',
                    '항목이 삭제되었습니다.',
                    'success'
                ).then((result) => {
                    if (result.isConfirmed) {
                        // 삭제 처리 URL로 리디렉션
                        window.location.href = url;
                    }
                });
            }
        });
    }


	</script>
	
	<script>
function confirmRecovery(url) {
    Swal.fire({
        title: '복구하시겠습니까?',
        text: '선택한 항목을 복구합니다.',
        icon: 'question',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '복구',
        cancelButtonText: '취소'
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire(
                '복구되었습니다!',
                '항목이 복구되었습니다.',
                'success'
            ).then((result) => {
                if (result.isConfirmed) {
                    // 복구 처리 URL로 리디렉션
                    window.location.href = url;
                }
            });
        }
    });
}
</script>
	

</body>

</html>