<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ${root }board 두번 방지 -->
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
<meta charset="utf-8" />
<meta name="viewport"content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<!-- 메뉴바 -->
<link rel="icon" type="image/x-icon" href="assets/ARTMEE_PAGELOGO.png" />

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet" />

<!-- Bootstrap core JS-->
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="../js/scripts.js"></script>

<!-- CSS -->
<link href="../css/board/main.css" rel="stylesheet" />

<!-- JQuery 자바스크립트-->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- Carousel 자바스크립트-->
<script src='https://www.gmarwaha.com/script/lib/jquery-1.11.1.js'></script>
<script src="https://www.gmarwaha.com/script/lib/jquery.easing-1.3.js"></script>
<script src="https://www.gmarwaha.com/script/lib/jquery.easing.compatibility.js"></script>
<script src="https://www.gmarwaha.com/script/lib/jquery.mousewheel-3.1.12.js"></script>
<script src="https://www.gmarwaha.com/jquery/jcarousellite/script/jquery.jcarousellite.js"></script>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
<!-- SweetAlert2 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style>

</style>
</head>
<body>
<body id="page-top">
   <!-- 메뉴바 -->
   <c:import url="/WEB-INF/views/include/header.jsp" />

   <div id="contents" class="contents_customer area_movingvar litype5">
      <div class="board_title">
         <h2 style="margin-left: 30px;">
            <a href="${root }/board/main" style="font-size: 42px; margin-left: 8px; color: black; text-decoration: none;">게시판</a>
         </h2>
      </div>
      <div class="active contentshow" id="totalListContent">
         <div>
         <!-- 검색 폼 -->
         
            <ul class="tap_wrap inner">
                <fieldset class="search_wrap" id="search_wrap1" style="width: 930px; margin-left: 168px">
                    <form action="${root}/board/main" method="get" name="searchForm">
                        <select class="ty3" title="검색조건 제목 선택" id="selectCondition1" name="searchType">
                            <option value="" disabled selected >검색조건선택</option>
                            <option value="total" <c:if test="${param.searchType == 'total'}">selected</c:if>>전체</option> <!-- value 값을 컨트롤러와 일치시킵니다. -->
                            <option value="title" <c:if test="${param.searchType == 'title'}">selected</c:if>>제목</option> <!-- value 값을 컨트롤러와 일치시킵니다. -->
                            <option value="contents" <c:if test="${param.searchType == 'contents'}">selected</c:if>>내용</option> <!-- value 값을 컨트롤러와 일치시킵니다. -->
                        </select> 
                        <input type="text" name="searchText" placeholder="검색어를 입력해주세요." title="검색어를 입력해주세요" value="${param.searchText}"
                            id="searchKeyword1" style="width: 600px;">
                        <button type="submit" class="btn_col2" id="btnSearch1">검색</button>
                    </form>
                </fieldset>
            </ul>
      
            <div>
               <table class="tbl_list text_c">
                  <colgroup>
                     <col style="width: 10%;">
                     <col style="width: auto;">
                     <col style="width: 20%;">
                     <col style="width: 20%;">
                  </colgroup>
                  <thead>
                     <tr>
                        <th scope="col">번호</th>
                        <th scope="col" style="text-align:left">제목</th>
                        <th scope="col">작성자</th>
                        <th scope="col">등록일</th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:forEach items="${boardList}" var="board">
                        <tr>
                           <td>${board.rownum}</td>
                           <td class="text_l" style="text-align:left">
                              <a href="${root}/board/read?board_id=${board.board_id}" style="text-align:left; color: black; text-decoration: none">${board.title}</a>
                           </td>
                           <td style="font-size: 15px;">${board.nickname}</td>
                           <td>${board.update_date}</td>
                        </tr>
                     </c:forEach>
                  </tbody>
               </table>
               <div id="searchResults" style="display:none;">
                   <!-- AJAX로 검색 결과가 여기에 삽입됩니다. -->
               </div>
            </div>
            <br>
            
            <!-- 페이징처리 구현 -->
            <div
               style="display: flex; justify-content: center; margin-bottom: 30px; font-size: 15px;">
               <div class="d-none d-md-block">
                  <ul class="pagination justify-content-center">
                     <!-- 이전 페이지 버튼 -->
                     <c:choose>
                        <c:when test="${pageBean.prevPage <= 0}">
                           <li class="page-item disabled"><a href="#"
                              class="page-link">&lt;</a></li>
                        </c:when>
                        <c:otherwise>
                           <li class="page-item"><a
                              href="${root}/board/main?&page=${pageBean.prevPage}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}"
                              class="page-link">&lt;</a></li>
                        </c:otherwise>
                     </c:choose>

                     <!-- 페이지 번호 -->
                     <c:forEach begin="${pageBean.min}" end="${pageBean.max}"
                        var="idx">
                        <c:choose>
                           <c:when test="${idx == pageBean.currentPage}">
                              <li class="page-item active"><a
                                 href="${root}/board/main?&page=${idx}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}"
                                 class="page-link">${idx}</a></li>
                           </c:when>
                           <c:otherwise>
                              <li class="page-item"><a
                                 href="${root}/board/main?&page=${idx}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}"
                                 class="page-link">${idx}</a></li>
                           </c:otherwise>
                        </c:choose>
                     </c:forEach>

                     <!-- 다음 페이지 버튼 -->
                     <c:choose>
                        <c:when test="${pageBean.max >= pageBean.pageCnt}">
                           <li class="page-item disabled"><a href="#"
                              class="page-link">&gt;</a></li>
                        </c:when>
                        <c:otherwise>
                           <li class="page-item"><a
                              href="${root}/board/main?&page=${pageBean.nextPage}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}"
                              class="page-link">&gt;</a></li>
                        </c:otherwise>
                     </c:choose>
                  </ul>
                  
               </div>
               <div class="boardwritebtn" style="position: absolute; margin-left: 835px;;">
                  <a href="${root}/board/write" class="btn btn-dark">글쓰기</a>
               </div>
            </div>
         </div>
                  
      </div>
         <section style="margin-top: -8spx;">
            <div class="container px-1">
               <div class="d-flex justify-content-center">
                  <img src="../img/banner1.png" class="banner1" alt="banner1">
               </div>
            </div>
         </section>
      </div>
   </div>
   <!-- 푸터-->
   <c:import url="/WEB-INF/views/include/footer.jsp"/>

</body>
</html>