<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<title>공지사항</title>
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
<link href="css/styles.css" rel="stylesheet" />

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
<style>
.selected {
          opacity:1 !important;
}      
.ullist.visible {
   display: block ;
}   
      
.submenu{
   display: none;  align-items: center; list-style-type: none; padding: 0; margin: 0;position: relative;
}
.submenu li {display: inline-block; margin: 0 30px; height: 40px; text-align: center; line-height: 30px; cursor: pointer;
text-align: center; font-size: 30px; color: gray;}
      
      
.submenu li.sel {
   color: black;
}        
      
      
.submenu.visible {
   display: block ;
}   
.content > div{
      display: none ;
}
.content div.contentshow{
    display: block ;
}  
.ullist{justify-content: center;display: none; margin-left:30px ;
}  

button {
   border: none;
   font-size:20px;
   background: transparent;
}

#jcl-demo {
   text-align: center;
}

.custom-container.main, .custom-container.main1, .custom-container.main2
   {
   display: flex;
   justify-content: center;
   align-items: center;
}

.prev, .next, .prev1, .next1, .prev2, .next2 {
   margin: 0 10px;
}

.carousel ul li, .carousel1 ul li {
   margin-right: 10px;
}

.carousel ul li:last-child, .carousel1 ul li:last-child {
   margin-right: 0;
}

.carousel img, .carousel1 img {
   max-width: 100%;
}

section#scroll *, section#scroll *::before, section#scroll *::after {
   box-sizing: content-box;
}

body {
   font-family: 'Roboto', sans-serif;
   background-color: #f8f9fa;
}

#BoardNotice {
   margin-top: 20px;
}

.board_title {
   margin-top: 120px;
   text-align: Left;
   margin-bottom: 3px;
   padding-left: 55px;
   padding-bottom: 20px;
}

#totallist {
   font-size: 30px;
   margin-bottom: 0px;
   margin-right: 50px;
   padding-left: 180px;
   float: left;
}

#ExhibitionList {
   font-size: 30px;
   margin-bottom: 0px;
   margin-right: 50px;
   padding-left: 25%;
   padding-bottom: 1%;
}

#ExhibitionList:hover {
    color: red; /* Change to your preferred hover color */
}
table {
   border-collapse: collapse;
   max-width: 100%;
   width: 100%;
   margin-top: 10px;
   margin-left: auto;
   margin-right: auto;
    border-spacing: 0
}
thead{
    line-height: 2;
    letter-spacing: -0.03em;
    font-family: "Noto Sans KR", "Roboto", "dotum", "sans-serif";
    color: #000;
    border-collapse: collapse;
    border-spacing: 0;
    text-align: center !important;
}
tbody{
   line-height: 1.1;
    letter-spacing: -0.03em;
    font-family: "Noto Sans KR", "Roboto", "dotum", "sans-serif";
    font-size: 40px;
    color: #000;
    border-collapse: collapse;
    border-spacing: 0;
    text-align: center !important;
}
th, td {
   border-bottom: 1px solid #dee2e6;
   padding: 10px;
   text-align: center;
   font-size: 20px;
}
th {
   background-color: #f8f9fa;
   color: #000;
   font-size: 20px;
}
a {   /*링크*/
   text-decoration: none;
   color: black;
   font-size: 20px;
}
#contents {
   line-height: 1.1;
   letter-spacing: -0.03em;
   font-family: "Noto Sans KR", "Roboto", "dotum", "sans-serif";
   font-size: 15px;
   color: #000;
   width: 900px;
   margin: 0 auto;
}

div {
   display: block;
}

body, input, select, textarea {
   font-family: "Noto Sans KR", "Roboto", "dotum", "sans-serif";
   font-size: 12px;
   color: #000;
}

.tab_wrap.inner {
   display: flex;
   justify-content: center;
   align-items: center;
   margin-top: -30px;
   padding-top: 30px;
}

.tab_wrap {
   position: relative;
}

ul, ol {
   /* list-style: none; */
   
}

body, h1, h2, h3, h4, h5, h6, fieldset, ul, ol, dl, dt, dd, p, figure {
   margin: 0;
   padding: 0;
}

.search_wrap {
   position: relative;
   border: 1px solid #DDDDDD;
   border-radius: 4px;
   background: #F8F8F8;
   padding: 22px 22px;
   -webkit-border-radius: 4px;
   -moz-border-radius: 4px;
   -ms-border-radius: 4px;
   -o-border-radius: 4px;
}

fieldset {
   border: none;
}

body, h1, h2, h3, h4, h5, h6, fieldset, ul, ol, dl, dt, dd, p, figure {
   margin: 0;
   padding: 0;
}

body, textarea {
   line-height: 1.1;
   letter-spacing: -0.03em;
}

.search_wrap select {
   margin-right: 10px;
}

select.ty3 {
   background-image: url(../images/icon/arr_dw_9.png);
}

select {
   border-radius: 4px;
   -webkit-border-radius: 4px;
   -moz-border-radius: 4px;
   -ms-border-radius: 4px;
   -o-border-radius: 4px;
   border: 1px solid #DDD;
   background: #fff url(../images/icon/arr_dw_13.png);
   background-repeat: no-repeat;
   background-position: right 6px top 50%;
   height: 40px;
   line-height: 40px;
   padding: 0 34px 0 18px;
   font-size: 20px;
   box-sizing: border-box;
}

fieldset {
   display: block;
   margin-inline-start: 2px;
   margin-inline-end: 2px;
   padding-block-start: 0.35em;
   padding-inline-start: 0.75em;
   padding-inline-end: 0.75em;
   padding-block-end: 0.625em;
   min-inline-size: min-content;
   border-width: 2px;
   border-style: groove;
   border-color: rgb(133, 133, 133);
   border-image: initial;
}

element.style {
   width: 579.867px;
}

.search_wrap input[type="text"] {
   width: 400px;
   margin-right: 6px;
}

input[type="password"], input[type="text"], input[type="number"], input[type="tel"]
   {
   height: 40px;
   line-height: 40px;
   padding: 0 18px;
   border-radius: 4px;
   -webkit-border-radius: 4px;
   -moz-border-radius: 4px;
   -ms-border-radius: 4px;
   -o-border-radius: 4px;
   background-color: #fff;
   font-size: 20px;
   box-sizing: border-box;
   border: 1px solid #DDD;
}

input, select, button {
   vertical-align: middle;
   appearance: none;
   -webkit-appearance: none;
   -moz-appearance: none;
}

input[type="text" i] {
   writing-mode: horizontal-tb !important;
   padding-block: 1px;
   padding-inline: 2px;
}

input:not([type="file" i], [type="image" i], [type="checkbox" i], [type="radio"
   i]) {
   
}

input {
   text-rendering: auto;
   color: fieldtext;
   letter-spacing: normal;
   word-spacing: normal;
   line-height: normal;
   text-transform: none;
   text-indent: 0px;
   text-shadow: none;
   display: inline-block;
   text-align: start;
   appearance: auto;
   -webkit-rtl-ordering: logical;
   cursor: text;
   background-color: field;
   margin: 0em;
   padding: 1px 0px;
   border-width: 2px;
   border-style: inset;
   border-color: -internal-light-dark(rgb(118, 118, 118),
      rgb(133, 133, 133));
   border-image: initial;
   padding-block: 1px;
   padding-inline: 2px;
}

.search_wrap [class^="btn_col"] {
   width: 86px;
   height: 38px;
   line-height: 34px;
   vertical-align: middle;
}

.btn_col2 {
   display: inline-block;
   box-sizing: border-box;
   border-radius: 4px;
   border: 1px solid #414141;
   font-size: 20px;
   color: #ffffff !important;
   text-align: center;
   vertical-align: middle;
   background-color: #414141;
}


.center-content {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

.center-content > div {
    margin-top: 30px; /* 필요에 따라 조절 */
}
.banner1{
   border: 1px solid black; width : 900px; height : 100px; margin-left: 30px;
}
.pagination a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
    transition: background-color .3s;
}

.pagination a.active {
    background-color: dodgerblue;
    color: white;
}

.pagination a:hover:not(.active) {background-color: #ddd;}


a:hover {
   text-decoration: none;
   color: #000000;
}

</style>

</head>
<body>
<body id="page-top">
   <!-- 메뉴바 -->
   <c:import url="/WEB-INF/views/include/header.jsp" />

   <div id="contents" class="contents_customer area_movingvar litype5">

      <div class="board_title">
         <h2>
            <a href="${root }/notice/main"
               style="font-size: 42px; text-decoration-line: none; color: black;">공지사항</a>
         </h2>
      </div>
            <div>
               <div style="width:900px; display: flex; justify-content: center;">
               <form action="${root }/notice/main" method="get">
                  <c:choose>
                     <c:when test="${type == 'title' }">
                        <select name="type" style="width: 150px; height: 40px; margin-right: 30px; font-size: 15px;">
                           <option value="" disabled>검색조건선택</option>
                           <option value="title" selected>제목</option>
                           <option value="titlecontents">제목+내용</option>
                        </select>
                        <input type="text" name="keyword" value="${keyword }" style="width: 500px; height: 40px; margin-right: 30px;" placeholder="검색어를 입력해주세요" />
                        <button class="btn btn-dark" style="width: 80px; height: 40px;">검색</button>
                     </c:when>
                     
                     <c:when test="${type == 'titlecontents' }">
                        <select name="type" style="width: 150px; height: 40px; margin-right: 30px; font-size: 15px;">
                           <option value="" disabled>검색조건선택</option>
                           <option value="title">제목</option>
                           <option value="titlecontents" selected>제목+내용</option>
                        </select>
                        <input type="text" name="keyword" value="${keyword }" style="width: 500px; height: 40px; margin-right: 30px;" placeholder="검색어를 입력해주세요" />
                        <button class="btn btn-dark" style="width: 80px; height: 40px;">검색</button>
                     </c:when>
                     
                     <c:otherwise>
                        <select name="type" style="width: 150px; height: 40px; margin-right: 30px; font-size: 15px;">
                           <option value="" disabled selected>검색조건선택</option>
                           <option value="title">제목</option>
                           <option value="titlecontents">제목+내용</option>
                        </select>
                        <input type="text" name="keyword" style="width: 500px; height: 40px; margin-right: 30px;" placeholder="검색어를 입력해주세요" />
                        <button class="btn btn-dark" style="width: 80px; height: 40px;">검색</button>
                     </c:otherwise>
                     
                  </c:choose>
                  </form>
               </div>
               
               <div style="display: flex; justify-content: center; align-content: center; align-items: center;">
                  <table class="tbl_list text_c" style="margin-left: auto; margin-right: auto;">
                     <colgroup>
                        <col style="width: 10%;">
                        <col style="width: auto;">
                        <col style="width: 15%;">
                        <col style="width: 15%;">
                     </colgroup>
                     <thead>
                        <tr>
                           <th scope="col">번호</th>
                           <th scope="col">제목</th>
                           <th scope="col">등록일</th>
                           <th scope="col">상태</th>
                        </tr>
                     </thead>
                     <tbody>
                     
                        <c:forEach var="noticeList" items="${noticeList }">
                           <tr>
                              <td>${noticeList.notice_id}</td>
                              <td style="text-align: left;">
                              	<a href="${root }/notice/read?notice_id=${noticeList.notice_id}" style="color: black; text-decoration: none;">${noticeList.title}</a>
                              </td>
                              <td>${noticeList.create_date}</td>
                              <%-- <td>${noticeList.state }</td> --%>
                                 <c:choose>
                                    <c:when test="${noticeList.state == 2 }">
                                       <td style="background-color: gray;">중요!</td>
                                    </c:when>
                                    <c:when test="${noticeList.state == 1 }">
                                       <td style="background-color: white;">일반</td>
                                    </c:when>
                                    <c:otherwise>
                                    </c:otherwise>
                                 </c:choose>
                           </tr>
                        </c:forEach>
                        
                     </tbody>
                  </table>
               </div>
            <br>

            <!-- 페이징처리 구현 -->
            <div
               style="display: flex; justify-content: center; margin-bottom: 30px;">
               <c:choose>
                  <c:when test="${!empty pageBean }">
                     <div class="d-none d-md-block" style="margin-top: 50px;">
                        <ul class="pagination justify-content-center">
                           <c:choose>
                              <c:when test="${pageBean.prevPage <= 0 }">
                                 <li class="page-item disabled">
                                    <!-- 1페이지에 있으면 이전 버튼 비활성화 --> <a href="#" class="page-link">이전</a>
                                 </li>
                              </c:when>
                              <c:otherwise>
                                 <li class="page-item"><a
                                    href="${root }/notice/main?page=${pageBean.prevPage}"
                                    class="page-link">이전</a></li>
                              </c:otherwise>
                           </c:choose>

                           <c:forEach var="idx" begin="${pageBean.min}"
                              end="${pageBean.max}">
                              <!-- model로 가져온 pageBean의 최소페이지부터 최대페이지까지 반복 : idx 는 현재페이지-->
                              <c:choose>
                                 <c:when test="${idx == pageBean.currentPage }">
                                    <li class="page-item active"><a
                                       href="${root }/notice/main?page=${idx}"
                                       class="page-link"> ${idx } </a></li>
                                 </c:when>
                                 <c:otherwise>
                                    <li class="page-item"><a
                                       href="${root }/notice/main?page=${idx}"
                                       class="page-link"> ${idx } </a></li>
                                 </c:otherwise>
                              </c:choose>
                           </c:forEach>


                           <c:choose>
                              <c:when test="${pageBean.max >= pageBean.pageCnt  }">
                                 <!-- max페이지 > 전체페이지개수 일때  -->
                                 <li class="page-item disabled">
                                    <!-- 1페이지에 있으면 이전 버튼 비활성화 --> <a href="#" class="page-link">다음</a>
                                 </li>
                              </c:when>
                              <c:otherwise>
                                 <li class="page-item"><a
                                    href="${root }/notice/main?page=${pageBean.nextPage}"
                                    class="page-link">다음</a></li>
                              </c:otherwise>
                           </c:choose>
                        </ul>
                     </div>

                     <div class="d-block d-md-none">
                        <ul class="pagination justify-content-center">
                           <li class="page-item"><a href="#" class="page-link">이전</a>
                           </li>
                           <li class="page-item"><a href="#" class="page-link">다음</a>
                           </li>
                        </ul>
                     </div>
                  </c:when>

                  <c:when test="${!empty pageBean1}">
                     <div class="d-none d-md-block" style="margin-top: 50px;">
                        <ul class="pagination justify-content-center">
                           <c:choose>
                              <c:when test="${pageBean1.prevPage <= 0 }">
                                 <li class="page-item disabled">
                                    <!-- 1페이지에 있으면 이전 버튼 비활성화 --> <a href="#" class="page-link">이전</a>
                                 </li>
                              </c:when>
                              <c:otherwise>
                                 <li class="page-item"><a
                                    href="${root }/notice/main?type=${type}&keyword=${keyword}&page=${pageBean1.prevPage}"
                                    class="page-link">이전</a></li>
                              </c:otherwise>
                           </c:choose>

                           <c:forEach var="idx" begin="${pageBean1.min}"
                              end="${pageBean1.max}">
                              <!-- model로 가져온 pageBean의 최소페이지부터 최대페이지까지 반복 : idx 는 현재페이지-->
                              <c:choose>
                                 <c:when test="${idx == pageBean1.currentPage }">
                                    <li class="page-item active"><a
                                       href="${root }/notice/main?type=${type}&keyword=${keyword}&page=${idx}"
                                       class="page-link"> ${idx } </a></li>
                                 </c:when>
                                 <c:otherwise>
                                    <li class="page-item"><a
                                       href="${root }/notice/main?type=${type}&keyword=${keyword}&page=${idx}"
                                       class="page-link"> ${idx } </a></li>
                                 </c:otherwise>
                              </c:choose>
                           </c:forEach>


                           <c:choose>
                              <c:when test="${pageBean1.max >= pageBean1.pageCnt  }">
                                 <!-- max페이지 > 전체페이지개수 일때  -->
                                 <li class="page-item disabled">
                                    <!-- 1페이지에 있으면 이전 버튼 비활성화 --> <a href="#" class="page-link">다음</a>
                                 </li>
                              </c:when>
                              <c:otherwise>
                                 <li class="page-item"><a
                                    href="${root }/notice/main?type=${type}&keyword=${keyword}&page=${pageBean1.nextPage}"
                                    class="page-link">다음</a></li>
                              </c:otherwise>
                           </c:choose>
                        </ul>
                     </div>

                     <div class="d-block d-md-none">
                        <ul class="pagination justify-content-center">
                           <li class="page-item"><a href="#" class="page-link">이전</a>
                           </li>
                           <li class="page-item"><a href="#" class="page-link">다음</a>
                           </li>
                        </ul>
                     </div>
                  </c:when>

                  <c:when test="${!empty pageBean2 }">
                     <div class="d-none d-md-block" style="margin-top: 50px;">
                        <ul class="pagination justify-content-center">
                           <c:choose>
                              <c:when test="${pageBean2.prevPage <= 0 }">
                                 <li class="page-item disabled">
                                    <!-- 1페이지에 있으면 이전 버튼 비활성화 --> <a href="#" class="page-link">이전</a>
                                 </li>
                              </c:when>
                              <c:otherwise>
                                 <li class="page-item"><a
                                    href="${root }/notice/main?type=${type}&keyword=${keyword}&page=${pageBean2.prevPage}"
                                    class="page-link">이전</a></li>
                              </c:otherwise>
                           </c:choose>

                           <c:forEach var="idx" begin="${pageBean2.min}"
                              end="${pageBean2.max}">
                              <!-- model로 가져온 pageBean의 최소페이지부터 최대페이지까지 반복 : idx 는 현재페이지-->
                              <c:choose>
                                 <c:when test="${idx == pageBean2.currentPage }">
                                    <li class="page-item active"><a
                                       href="${root }/notice/main?type=${type}&keyword=${keyword}&page=${idx}"
                                       class="page-link"> ${idx } </a></li>
                                 </c:when>
                                 <c:otherwise>
                                    <li class="page-item"><a
                                       href="${root }/notice/main?type=${type}&keyword=${keyword}&page=${idx}"
                                       class="page-link"> ${idx } </a></li>
                                 </c:otherwise>
                              </c:choose>
                           </c:forEach>


                           <c:choose>
                              <c:when test="${pageBean2.max >= pageBean2.pageCnt  }">
                                 <!-- max페이지 > 전체페이지개수 일때  -->
                                 <li class="page-item disabled">
                                    <!-- 1페이지에 있으면 이전 버튼 비활성화 --> <a href="#" class="page-link">다음</a>
                                 </li>
                              </c:when>
                              <c:otherwise>
                                 <li class="page-item"><a
                                    href="${root }/notice/main?type=${type}&keyword=${keyword}&page=${pageBean2.nextPage}"
                                    class="page-link">다음</a></li>
                              </c:otherwise>
                           </c:choose>
                        </ul>
                     </div>

                     <div class="d-block d-md-none">
                        <ul class="pagination justify-content-center">
                           <li class="page-item"><a href="#" class="page-link">이전</a>
                           </li>
                           <li class="page-item"><a href="#" class="page-link">다음</a>
                           </li>
                        </ul>
                     </div>
                  </c:when>
                  <c:otherwise>
                  <p>asdf</p>
                  </c:otherwise>
               </c:choose>
               <!--  
            <div class="boardwritebtn"  style="position: absolute;">
               <a href="BoardWriteForm.jsp" style="text-decoration: none">글쓰기</a>
            </div>
            -->
            </div>


            

   </div>
   </div>
   
   <!-- 배너부분 -->
            <section style="margin-top: 100px;">
                   <div class="container px-1" style="width:1100px;">
                       <div id="bannerCarousel" class="carousel slide" data-bs-ride="carousel">
                           <!-- 캐러셀 인디케이터 -->
                           <div class="carousel-indicators">
                               <c:forEach items="${AllSubBannerInfo}" var="subBanner" varStatus="status">
                                   <button type="button" data-bs-target="#bannerCarousel" data-bs-slide-to="${status.index}" 
                                           class="${status.index == 0 ? 'active' : ''}" aria-label="Slide ${status.index + 1}">
                                   </button>
                               </c:forEach>
                           </div>
               
                           <!-- 캐러셀 슬라이드 -->
                           <div class="carousel-inner">
                               <c:forEach items="${AllSubBannerInfo}" var="subBanner" varStatus="status">
                                   <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                                       <a href='${root}/exhibition/exhibition_click?exhibition_id=${subBanner.exhibition_id}'>
                                           <img src="${subBanner.sub_banner_path}${subBanner.sub_banner_name}" class="d-block w-100" alt="Banner ${status.index + 1}" style="height:150px;">
                                       </a>
                                   </div>
                               </c:forEach>
                           </div>
               
                           <!-- 캐러셀 컨트롤 -->
                           <button class="carousel-control-prev" type="button" data-bs-target="#bannerCarousel" data-bs-slide="prev">
                               <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                               <span class="visually-hidden">Previous</span>
                           </button>
                           <button class="carousel-control-next" type="button" data-bs-target="#bannerCarousel" data-bs-slide="next">
                               <span class="carousel-control-next-icon" aria-hidden="true"></span>
                               <span class="visually-hidden">Next</span>
                           </button>
                       </div>
                   </div>
               </section>

   <!-- 푸터-->
   <c:import url="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>