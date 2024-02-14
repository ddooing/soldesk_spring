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
<script src="js/scripts.js"></script>

<!-- JQuery 자바스크립트-->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- CSS -->
<link href="../css/styles.css" rel="stylesheet" />
<link href="../css/board/read.css" rel="stylesheet" />

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
<!-- SweetAlert2 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
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
					style="font-size: 35px; margin-left: 20px;">게시판</a>
			</h3>
		</div>
		<div>
			<div class="active">
				<div class="tab_con">
					<ul class="tab_wrap inner">
						<table class="tbl_dtal" summary="게시판 상세내용에 대한 표입니다">
							<tr>
								<th scope="col" style="padding: 6px;">
									<!-- 제목 --> <input type="text" id="title" name="title"
									class="form-control" value="${readContentBean.title }"
									disabled="disabled" />
								</th>
							</tr>
							<tbody style="border: 1px solid black;">
								<tr class="tb_info">
									<td
										style="background-color: rgb(200, 200, 200); border: 1px solid rgb(200, 200, 200);">
										<label for="user_id"> <span class="tit"
											style="margin-left: 20px;">작성자</span>
									</label> <input type="text" id="user_id" name="cont unvisible"
										class="form-control" value="${readContentBean.user_name}"
										style="width: 45px; display: inline; margin-right: 20px;"
										disabled="disabled" /> <label for="create_date"> <span
											class="tit">등록일</span>
									</label> <input type="text" id="create_date" name="create_date"
										class="form-control" value="${readContentBean.create_date}"
										style="width: 270px; display: inline; margin-right: 20px;"
										disabled="disabled" /> <label for="views"> <span
											class="tit">조회수</span>
									</label> <input type="text" id="views" name="views" class="cont"
										value="${readContentBean.views}"
										style="width: 45px; display: inline;" disabled="disabled" />
									</td>
								</tr>
								<tr class="tb_content" style="height: 350px;">
									<td>
										<div id="divNoticeContents">
											<!-- 내용 -->
											<textarea id="contents" name="contents"
												style="resize: none; border: hidden;" disabled="disabled">${readContentBean.contents }</textarea>
										</div>
									</td>
								</tr>
								<%-- 다음글 링크 --%>

								<tr class="tb_link">
									<td><a href="read?board_id=${NextBoard.board_id}"
										class="tb_next"> <span style="margin-right: 10px;">다음글</span>
											<span>${NextBoard.title}</span> <!-- 수정: 제목 동적 표시 -->
									</a></td>
								</tr>
								<tr class="tb_link">
									<td><a href="read?board_id=${PreviousBoard.board_id}"
										class="tb_prev"> <span style="margin-right: 10px;">이전글</span>
											<span>${PreviousBoard.title != null ? PreviousBoard.title : '이전 게시글 없음'}</span>
									</a></td>
								</tr>
							</tbody>
						</table>
				</div>
				</li>
				<div class="btn3"
					style="width: 1000px; margin-left: 680px; margin-top: 20px;">
					<button>
						<a href="${root}/board/main">목록</a>
					</button>
					<button>
						<a href="${root}/board/modify?board_id=${board_id}">수정</a>
					</button>
					<button>
						<a href="${root}/board/delete?board_id=${board_id}">삭제</a>
					</button>
				</div>
				</ul>
			</div>

			<div class="comment-box">
				<div class="reply-form">
					<h4>댓글 작성</h4>
					<div class="row" style="-bs-gutter-x: 5.5rem;">
						<!-- Bootstrap의 row 클래스를 사용하여 행을 생성 -->
						<div class="col-md-10">
							<!-- 10열 크기의 텍스트 영역 -->
							<textarea id="commentText" class="form-control" rows="3"
								placeholder="댓글을 입력하세요."></textarea>
						</div>
						<div class="col-md-2">
							<!-- 2열 크기의 버튼 -->
							<button id="submitReply" type="button"
								class="btn btn-primary mt-2">댓글 달기</button>
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
	<!-- 
<script>
// 댓글 입력 글자 수 체크 및 입력창 높이 조절 스크립트
document.getElementById('comments').addEventListener('input', function() {
    var commentInput = this.value; // 사용자가 입력한 댓글
    var charCount = commentInput.length; // 입력된 글자 수
    var maxChar = 500; // 최대 글자 수

    // 'comment-count' 클래스를 가진 div의 내용을 업데이트합니다.
    document.querySelector('.comment-count').textContent = charCount + '/500';

    // 글자 수가 최대치를 초과했는지 검사합니다.
    if (charCount > maxChar) {
        // 최대 글자 수를 초과한 경우, 초과된 글자 수만큼 글자를 잘라냅니다.
        this.value = commentInput.substring(0, maxChar);
        // 업데이트된 글자 수를 반영합니다.
        document.querySelector('.comment-count').textContent = maxChar + '/500';
    }
});

</script>
 -->
	<script>
    $(document).ready(function() {
        $("#submitReply").click(function() {
            var commentText = $("#commentText").val();
            if (commentText.trim() === '') {
                alert('댓글을 입력해주세요.');
                return;
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
                    alert('댓글이 성공적으로 추가되었습니다.');
                    updateReplyList(1); // 댓글 추가 후 첫 페이지로 돌아가거나 현재 페이지를 유지하도록 수정 가능
                },
                error: function(error) {
                    console.log(error);
                    alert('댓글 추가에 실패했습니다.'); 
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
                                                '<p class="card-subtitle text-muted">작성자: ' + comment.user_name + '</p>' +
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
                e.preventDefault();//이전, 다음, 페이지번호 링크 클릭 시 새로고침 방지
                var selectedPage = $(this).data("page");//클릭한 링크를(페이지번호) page 파라미터에 담기 
                updateReplyList(selectedPage);//해당 페이지의 댓글 목록 함수 수행
                currentPage = selectedPage; //현재 페이지 변수 값을 클릭한 링크의 값으로 
            });
        }
	    
        function bindCommentActions() {
        	 // 댓글 수정 버튼 이벤트
            $(".edit-btn").off('click').on('click', function() {
            	var comment_id = $(this).data("id");
                var currentContents = $(this).closest('.card-body').find('.card-text').text();
                var newContents = prompt("댓글 내용을 수정하세요:", currentContents);
                
                if (newContents !== null && newContents.trim() !== "") {
                    $.ajax({
                        url: '${root}/modifyComment',
                        type: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify({
                            comment_id: comment_id,
                            contents: newContents
                        }),
                        success: function(response) {
                            alert("댓글이 수정되었습니다.");
                            updateReplyList();
                        },
                        error: function(error) {
                            console.log(error);
                            alert("댓글 수정에 실패했습니다.");
                        }
                    });
                } else if (newContents.trim() === "") {
                    alert("댓글 내용을 입력해주세요.");
                }
            });

            // 댓글 삭제 버튼 이벤트
         // 댓글 삭제 버튼 이벤트
            $(".delete-btn").off('click').on('click', function() {
                var comment_id = $(this).data("id"); // 올바른 데이터 속성 사용
                var $this = $(this); // 현재 클릭된 삭제 버튼을 가리키는 jQuery 객체를 저장
                if (confirm("댓글을 삭제하시겠습니까?")) {
                    $.ajax({
                        url: '${root}/deleteComment?comment_id=' + comment_id,
                        type: 'POST',
                        success: function() {
                            alert("댓글이 삭제되었습니다.");
                            $this.closest('.card').remove(); // 삭제 버튼이 포함된 가장 가까운 '.card' 요소를 찾아 DOM에서 제거
                            // updateReplyList(); // 필요한 경우 댓글 리스트를 업데이트하는 함수를 호출
                        },
                        error: function(error) {
                            console.log(error);
                            alert("댓글 삭제에 실패했습니다.");
                        }
                    });
                }
            });
        }

        updateReplyList(currentPage); // 페이지 로딩 시 첫 페이지의 댓글 목록을 로드
    });
</script>
</body>
</html>