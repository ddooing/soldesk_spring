<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />

	 
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>ARTMEE</title>
	
	<link rel="icon" type="image/x-icon" href="assets/ARTMEE_PAGELOGO.png" />

	<!-- Google fonts-->
	<link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900"
		rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
		rel="stylesheet" />

	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Carousel 자바스크립트-->
	<script src='https://www.gmarwaha.com/script/lib/jquery-1.11.1.js'></script>
	<script src="https://www.gmarwaha.com/script/lib/jquery.easing-1.3.js"></script>
	<script src="https://www.gmarwaha.com/script/lib/jquery.easing.compatibility.js"></script>
	<script src="https://www.gmarwaha.com/script/lib/jquery.mousewheel-3.1.12.js"></script>
	<script src="https://www.gmarwaha.com/jquery/jcarousellite/script/jquery.jcarousellite.js"></script>
	
		<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
	
		<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
	
	
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	
	<script src="js/mypage.js"></script> 
	<!-- JQuery 자바스크립트-->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>


	<!-- CSS -->
	<link href="css/styles.css" rel="stylesheet" />
	<link href="css/Mypage.css" rel="stylesheet" />
	
	
	
   <!-- Font Awesome icons (free version) -->
  <!--   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
-->

	<script type="text/javascript">   
	$(document).ready( function() {
	
	$("#headers").load("component/header.html");  
	$("#footer").load("component/footer.html");
	});
	</script>
	


<link  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
<title>Insert title here</title>
<style>
#header{
  text-align:center;
  margin: 10px 30px 20px 30px;
}

a:hover{
  color:#000000;
  text-decoration: underline;
  
}
a{
  color:#000000;
  text-decoration:none;
  font:12px sans-serif;
}

a:hover{
  color:#000000;
  text-decoration: underline;
  
}

.logo{
  float:left;
}
h1{
  padding-top:10px;
}
.clear{
  clear:both;
}

#content{
  display: flex;
  justify-content: center;
  align-items: center;
}

.view{
  width:92%;
  border:1px solid #666666;
  background:#ffffff;
  padding:4%;

}

.view .title{
  font-size:14px;
  font-weight: bold;
}

.view .bbsCategory a{
  font-size:11px;
  color:#666666;
}

.view .bbsCategory a:hover{
 text-decoration:none;
  color:#ff4400;
}

.view .divider{
  color:#666666;
}

.view .titleRightBox{
  font-size:11px;
  color:#666666;
  float:right;
}

.titleContainer{
  padding-bottom:10px;
  border-bottom:1px dashed #999999;
}

.view .articleContainer p{
  font-size:13px;
  color:#333333;
  line-height:20px;
  margin-top: 20px;
}

.view .articleContainer a{
 font-size:12px;
  color:#333333;
}

.view .articleContainer a:hover{
  text-decoration:none;
    color:#333333;
}

.view .articleContainer img{
  max-width:100%;
  width:80%;
  margin-top:10px;
  margin-bottom:10px;
  border: 1px solid #444444;
}

.view .profileContainer img{
  width:100%;
}

.view .profileContainer .blogLink{
  vertical-align:top;
  text-align:right;
  padding-right:10px;
}

.view .profileContainer{
  float:right;
  margin-top:50px;
  width:40%;

}
.view .profileContainer table{
  border-spacing:0;
  width:100%;
}

.view .profileContainer .utilBtn a{
  font-size:12px;
}

.view .profileContainer .moreLinkTd{width:100%}

.view .profileContainer .utilBtn td{
  border-bottom:1px solid #aaaaaa;
  text-align: right;
  font-size:12px;
  padding-bottom:10px;
}

.view .profileContainer .blogBox td{
  padding-top:15px;
}


.view .profileContainer .imageBox{
  width:100%;
}

.view .commentContainer{
  width:100%;
  min-height:100px;
  background:#dddddd;
  margin-top:50px;
  padding:2%;
  
}
.view .commentContainer table{width:100%}

.commentContainer .cmt_author{
  font-size:12px;
  font-weight:bold;
  margin-right:10px;
}

.commentContainer .cmt_date{
  font-size:12px;
  color:#555555;
  
}

.commentContainer .cmt_icon img{
  width:30px;
}

.commentContainer .cmt_reply{
  padding-left:20px;
  background:url("http://gfmarket.phinf.naver.net/sally_special/original_11.png?type=p50_5") no-repeat;
  background-position:center;
  background-width:10px;
  margin-left:10px;
  font-size:12px;
  font-weight:bold;
}

.view .commentContainer .cmt_util {
  text-align:right;
}

.commentContainer .cmt_icon {
  width:60px;
}

.commentContainer p{
  font-size:12px;
  color:#666666;
}

li{
  list-style:none;
  padding:0px;
  margin:0px;
}
ul{
  padding:0px;
  margin:0px;
}

.view .commentContainer ul li{
  padding:10px 0px;
}

#footer{
  margin-bottom:100px;
}

.view .commentContainer .cmt_re_table table{
  width:96%;
  float:right;
}

.view .commentContainer .cmt_re_table .cmt_icon{
  width:60px;
}

.view .commentContainer .cmtWriteContainer{
  margin-top:10px;
}

.view .commentContainer .cmtWriteContainer a{
  margin-top:10px;
}


.view .commentContainer .cmtWriteButton{
  width:10%;
  height:16px;
  display: inline-block;
  background:#eeeeee;
  vertical-align:center;
  padding:20px;
  text-align:center;
  border: 1px solid #444444;
  float:right;
}
</style>
<script type="text/javascript">
      $(document).ready(function () {

         $("#headers").load("component/header.html");
         $("#footer").load("component/footer.html");
      });
   </script>
</head>
<body id="page-top">
<!-- 메뉴바 -->
	<c:import url="/WEB-INF/views/include/header.jsp"/>
	
  <div id="wrap" style="display: flex;
    justify-content: center;
    width: 80%;
    margin: auto;
    margin-top: 88px;
    padding-top: calc(3rem + 40px); flex-direction: column; ">
    <div id="header">
    <h2>내가 쓴 문의</h2>
      <div class="clear"></div>
    </div>
    <div id="content">
      <div class="view">
        <div class="titleContainer">
          <span class="title">
            이거이거 신청했는데 언제되나요?</span>
          
          <span class="titleRightBox">
          	<span class="titleDate">2024.01.15</span>
          </span>
          <div class="clear"></div>
        </div>
      
        <div class="articleContainer">
          <p>안녕하세요 몇일전에 어쩌구저쩌구 했는데 이거 언제되나요</p>
        </div>
        <div class="profileContainer">
          <table>
            <tbody>
              <tr class="blogBox">
                <td class="blogLink">
                </td>
                </tr> 
                </tbody>
          </table>
        </div>
        
        <div class="clear"></div>
        <div class="commentContainer">
          <ul>
            <li>
            <table>
            <tbody>
              <tr>
              <td class="cmt_icon">
              <img class="imageBox" src="./assets/img/profile_Lv3.png" alt="Level_Image">
              </td>
                <td>
                <a href="#" style="color:black;" class="cmt_author">관리자1</a><span class="cmt_date">2024.01.15</span><a href="#" style="color:black;" class="cmt_reply">답글</a>
                </td>
              </tr>
              
              <tr>
              <td></td>
                <td colspan="2">
                <p style="margin-top:10px; font-size:20px;">돈 더주셔야해요</p>
                </td>
              </tr>
            </tbody>
          </table>
          </li>
          </ul>
        </div>
      </div>
    </div>
    </div>
    <c:import url="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>