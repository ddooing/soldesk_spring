<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<!-- 메뉴바 -->
<link rel="icon" type="image/x-icon" href="assets/ARTMEE_PAGELOGO.png" />

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10">

<!-- Bootstrap core JS-->
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>

<!-- JQuery 자바스크립트-->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- CSS -->
<link href="../css/styles.css" rel="stylesheet" />
<link href="../css/board/read.css" rel="stylesheet" />

<!-- Carousel 자바스크립트-->
<script src='https://www.gmarwaha.com/script/lib/jquery-1.11.1.js'></script>
<script src="https://www.gmarwaha.com/script/lib/jquery.easing-1.3.js"></script>
<script	src="https://www.gmarwaha.com/script/lib/jquery.easing.compatibility.js"></script>
<script	src="https://www.gmarwaha.com/script/lib/jquery.mousewheel-3.1.12.js"></script>
<script	src="https://www.gmarwaha.com/jquery/jcarousellite/script/jquery.jcarousellite.js"></script>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
<!-- SweetAlert2 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.min.css">
<script	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	
</head>
<body>
<body id="page-top">
	<!-- 메뉴바 -->
	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div id="contents" class="contents_customer area_movingvar litype5">

		<div class="board_title"
			style="margin-top: 80px; margin-bottom: 15px;">
			<h3>
				<a href="${root}/board/main"
					style="font-size: 35px; margin-left: 20px; color: black; text-decoration: none;">게시판</a>
			</h3>
		</div>
		<div>
			<div class="active">
				<div class="tab_con">
						<table class="tbl_dtal" summary="게시판 상세내용에 대한 표입니다">
							<tr>
								<th scope="col" colspan="3" style="padding: 6px;">
									<input type="text" id="title" name="title"class="form-control" value="${readContentBean.title }"
									disabled="disabled" style="background: #f8f9fa; border: none;" />
								</th>
							</tr>
							<tbody>
								<tr style="text-align: center; background-color: rgb(200, 200, 200);">
									<td>
										<label for="user_id"> 
											<span class="tit" style="margin-left: 20px;">작성자</span>
										</label>
										<label class="form-control" style="background: #c8c8c8; border: none; width: 120px; display: inline; margin-right: 20px;">${readContentBean.nickname}</label>
									</td>
									<td style="text-align: right;">
										<label for="create_date"> 
											<span class="tit">등록일</span>
										</label> 
										<label style="background: #c8c8c8; border: none; width: 120px; display: inline; margin-right: 20px; font-size: 15px;">${readContentBean.update_date}</label>
									</td>
									<td style="text-align: right;">
										<label for="views"> 
											<span class="tit">조회수</span>
										</label> 
										<label style="background: #c8c8c8; border: none; width: 120px; display: inline; margin-right: 20px; font-size: 15px;">${readContentBean.views}</label>
									</td>
								</tr>
								<tr class="tb_content" style="height: 350px; vertical-align:text-top;">
									<td colspan="3">
										<div id="divNoticeContents">
											<!-- 내용 -->
											<textarea id="contents" name="contents"
												style="resize: none; border: hidden; background-color: white;" disabled="disabled">${readContentBean.contents }</textarea>
										</div>
									</td>
								</tr>
								<%-- 다음글 링크 --%>

								<tr class="tb_link">
									<td colspan="3">
										<a href="read?board_id=${NextBoard.board_id}" class="tb_next" style="text-decoration: none;"> <span style="margin-right: 10px; color:black; text-decoration: none;">다음글</span>
												<span style="color: black; text-decoration: none;">${NextBoard.title}</span> <!-- 수정: 제목 동적 표시 -->
										</a>
									</td>
								</tr>
								<tr class="tb_link">
									<td colspan="3">
										<a href="read?board_id=${PreviousBoard.board_id}" class="tb_prev" style="text-decoration: none;">
											<span style="margin-right: 10px; color:black; text-decoration: none;">이전글</span>
											<span style="color: black; text-decoration: none;">${PreviousBoard.title != null ? PreviousBoard.title : '이전 게시글 없음'}</span>
										</a>
									</td>
								</tr>
							</tbody>
						</table>
				</div>
				<div class="btn3" style="display: flex; justify-content: flex-end; margin-top: 20px;">
					<c:if test="${loginUserBean.user_id == readContentBean.user_id}">
						<a class="btn btn-dark" style="margin-right: 10px;" href="${root}/board/modify?board_id=${board_id}">수정</a>
						<a class="btn btn-dark" style="margin-right: 10px;" href="${root}/board/delete?board_id=${board_id}">삭제</a>
					</c:if>
						<a class="btn btn-dark" href="${root}/board/main">목록</a>
				</div>
			</div>

			<div class="comment-box">
				<div class="reply-form">
			        <h4>댓글 작성</h4>
			        <div class="row" style="margin-right: 0; margin-left: 0;">
			            <div class="col-md-11" style="border: 1px solid #c8c8c8; padding-right: 0; padding-left: 0;flex: 0 0 auto; width: 100%;">
			                <textarea id="commentText" class="form-control" rows="3" placeholder="댓글을 입력하세요." style="border-radius: 4px; border-color: #ced4da; outline: none;"></textarea>
			                <div style="border-top: 1px solid #c8c8c8; display: flex; justify-content: space-between; align-items: center; margin-top: 8px;">
			                    <div id="commentCounter" style="margin-left: 10px; color: #6c757d; font-size: 0.875rem;">0/500</div>
			                    <button id="submitReply" type="button" class="btn" style="background-color: #28a745; color: white; padding: .375rem .75rem; border-radius: 4px; border-color: #28a745;">등록</button>
			                </div>
			            </div>
			        </div>
			    </div>
				<div class="reply-section mt-4">
					<h4>댓글</h4>
					<div id="replySection"></div>
				</div>
				<div>

					<ul id="comments-list"></ul>
				</div>
				<div id="pagination" style="justify-content: center"></div>
			</div>
		</div>
	</div>

	<!-- 푸터-->
	<c:import url="/WEB-INF/views/include/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var commentTextArea = document.getElementById('commentText');
        var commentCounter = document.getElementById('commentCounter');
        var maxLength = 500; // 최대 글자 수

        function updateCommentCounter() {
            var textLength = commentTextArea.value.length;
            commentCounter.textContent = textLength + '/' + maxLength; // 글자 수 표시 업데이트
            // 글자 수 초과시 경고 및 초과분 자르기
            if (textLength > maxLength) {
                commentTextArea.value = commentTextArea.value.substring(0, maxLength);
                // SweetAlert2를 사용하여 경고창 표시
                Swal.fire({
                    icon: 'warning',
                    title: '경고',
                    text: '댓글은 최대 ' + maxLength + '자까지 입력 가능합니다.',
                    confirmButtonText: '확인'
                });
            }
        }

        commentTextArea.addEventListener('input', updateCommentCounter);

        // 페이지 로드 시 초기 글자 수 업데이트
        updateCommentCounter();
    });
</script>
User
<script>
$(document).ready(function() {
    $("#submitReply").click(function() {
        var commentText = $("#commentText").val();
        if (commentText.trim() === '') {
        	Swal.fire({
        	    title: '댓글 입력',
        	    input: 'text',
        	    inputLabel: '댓글을 입력하세요',
        	    showCancelButton: true,
        	    confirmButtonText: '확인',
        	    cancelButtonText: '취소',
        	    inputValidator: (value) => {
        	        if (!value) {
        	            return '댓글을 입력해주세요.';
        	        }
        	    }
        	})
        }
        
        $.ajax({
            url: '${root}/comments',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
               contents: commentText,
                board_id: ${board_id} 
            }),
            success: function(response) {
                $("#commentText").val(''); 
                Swal.fire({
                    icon: 'success',
                    title: '댓글 추가 성공',
                    text: '댓글이 성공적으로 추가되었습니다.',
                    confirmButtonText: '확인'
                }).then(function() {
                    // 댓글 추가 후 첫 페이지로 돌아가거나 현재 페이지를 유지하도록 수정 가능
                    updateReplyList(1);
                });
            },
            error: function(error) {
                console.log(error);
                Swal.fire({
                    icon: 'error',
                    title: '댓글 추가 실패',
                    text: '댓글 추가에 실패했습니다.',
                    confirmButtonText: '확인'
                });
            }
        });
    });

    function updateReplyList(page) {
        $.ajax({
            url: '${root}/comment_s?board_id=${board_id}&page=' + page,
            type: 'GET',
            dataType: 'json',
            success: function(response) {
                $("#replySection").empty(); 
                $.each(response.comment_s, function(index, comment) {
                    var commentHtml = '<div class="card mt-2">' +
                                        '<div class="card-body">' +
                                            '<p class="card-subtitle text-muted">작성자: ' + comment.nickname + '</p>' +
                                            '<p class="card-text">' + comment.contents + '</p>' +
                                            '<div>' +
                                                '<button class="btn btn-sm btn-primary edit-btn mr-2" data-id="' + comment.comment_id + '">수정</button>' +
                                                '<button class="btn btn-sm btn-danger delete-btn" data-id="' + comment.comment_id + '">삭제</button>' +
                                            '</div>' +
                                        '</div>' +
                                      '</div>';
                    $("#replySection").append(commentHtml); 
                });

                // 수정 및 삭제 버튼 이벤트 바인딩 로직
                bindCommentActions();
                
                // 페이징 처리 로직 호출
                updatePagination(response.pageBean);
            },
            error: function(error) {
                console.log(error);
            }
        });
    }
    var currentPage = 1;//현재 페이지 초기값
    
    function updatePagination(pageBean) {
        var paginationHtml = '<ul class="pagination justify-content-center">';

        // 이전 페이지 버튼
        if (pageBean.prevPage <= 0) {
            paginationHtml += '<li class="page-item disabled"><a href="#" class="page-link">&lt;</a></li>';
        } else {
           paginationHtml += '<li class="page-item"><a href="#" class="page-link" data-page="' + pageBean.prevPage + '">&lt;</a></li>';
        }

        for (var i = pageBean.min; i <= pageBean.max; i++) {
            if (i == pageBean.currentPage) {
                paginationHtml += '<li class="page-item active"><a href="#" class="page-link" data-page="' + i + '">' + i + '</a></li>';
            } else {
                paginationHtml += '<li class="page-item"><a href="#" class="page-link" data-page="' + i + '">' + i + '</a></li>';
            }
        }

        if (pageBean.max >= pageBean.pageCnt) {
            paginationHtml += '<li class="page-item disabled"><a href="#" class="page-link">&gt</a></li>';
        } else {
            paginationHtml += '<li class="page-item"><a href="#" class="page-link" data-page="' + pageBean.nextPage + '">&gt</a></li>';
        }

        paginationHtml += '</ul>';
        $("#pagination").html(paginationHtml);

        $(".pagination .page-link").on("click", function(e) {
            e.preventDefault(); // 새로고침 방지
            var selectedPage = $(this).data("page"); // 클릭한 페이지 번호 가져오기
            updateReplyList(selectedPage); // 해당 페이지의 댓글 목록 업데이트
            currentPage = selectedPage; // 현재 페이지 업데이트
        });
    }
   
    function bindCommentActions() {
        // 댓글 수정 버튼 이벤트
    	  $(".edit-btn").off('click').on('click', function() {
    	        var comment_id = $(this).data("id");
    	        var currentContents = $(this).closest('.card-body').find('.card-text').text();

    	        Swal.fire({
    	            title: '댓글 수정',
    	            input: 'text',
    	            inputValue: currentContents, // 기존 댓글 내용을 입력 필드에 표시합니다.
    	            inputLabel: '수정할 댓글 내용을 입력하세요',
    	            showCancelButton: true,
    	            confirmButtonText: '확인',
    	            cancelButtonText: '취소',
    	            inputValidator: (value) => {
    	                if (!value.trim()) {
    	                    return '댓글 내용을 입력해주세요.';
    	                }
    	            }
    	        }).then((result) => {
    	            if (result.isConfirmed) {
    	                $.ajax({
    	                    url: '${root}/modifyComment',
    	                    type: 'POST',
    	                    contentType: 'application/json',
    	                    data: JSON.stringify({
    	                        comment_id: comment_id,
    	                        contents: result.value
    	                    }),
    	                    success: function(response) {
    	                    	Swal.fire('성공', '댓글이 수정되었습니다.', 'success').then(() => {
    	                            location.reload();
    	                        });
    	                    },
    	                    error: function(error) {
    	                        console.log(error);
    	                        Swal.fire('실패', '댓글 수정에 실패했습니다.', 'error');
    	                    }
    	                });
    	            }
    	        });
    	    });

 
     // 댓글 삭제 버튼 이벤트
        $(".delete-btn").off('click').on('click', function() {
            var comment_id = $(this).data("id"); // 올바른 데이터 속성 사용
            var $this = $(this); // 현재 클릭된 삭제 버튼을 가리키는 jQuery 객체를 저장
            Swal.fire({
                title: '댓글을 삭제하시겠습니까?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '삭제',
                cancelButtonText: '취소'
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        url: '${root}/deleteComment?comment_id=' + comment_id,
                        type: 'POST',
                        success: function() {
                            Swal.fire(
                                '삭제 완료!',
                                '댓글이 삭제되었습니다.',
                                'success'
                            );
                            $this.closest('.card').remove(); // 삭제 버튼이 포함된 가장 가까운 '.card' 요소를 찾아 DOM에서 제거
                            // updateReplyList(); // 필요한 경우 댓글 리스트를 업데이트하는 함수를 호출
                        },
                        error: function(error) {
                            console.log(error);
                            Swal.fire(
                                '삭제 실패!',
                                '댓글 삭제에 실패했습니다.',
                                'error'
                            );
                        }
                    });
                }
            });
        });
    }
    updateReplyList(currentPage); // 페이지 로딩 시 첫 페이지의 댓글 목록을 로드
});
</script>
<script>
    // 작성자 이름 크기만큼 동적으로 늘어남
    var inputField = document.getElementById('user_id');

    function updateInputSize() {
        inputField.size = inputField.value.length + 1;
    }
    inputField.addEventListener('input', updateInputSize);

    updateInputSize();
</script>
</body>
</html>