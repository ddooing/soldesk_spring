<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>ARTMEE</title>
<link rel="icon" type="image/x-icon" href="../img/ARTMEE_PAGELOGO.png" />

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

<style>
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

.divider:after, .divider:before {
   content: "";
   flex: 1;
   height: 1px;
   background: #eee;
}

.form-check-input[type="checkbox"] {
   background-color: #fff;
   border: 1px solid #000;
   border-radius: 4px;
}

.form-check-input[type="checkbox"]:checked {
   background-color: #000;
   border: 1px solid #000;
   color: #fff;
}

.age_btn {
   float: left;
   width: 100px; /* 원하는 너비로 조절 */
   height: 40px; /* 원하는 높이로 조절 */
   cursor: pointer;
   font-weight: 300;
   color: #757575;
   background-color: #fff;
   border: 1px solid #E7E7E7;
   height: 40px; /* 원하는 높이로 조절 */
   cursor: pointer;
   font-weight: 300;
   color: #757575;
}

#birth:read-only, #birth:read-only:hover, #birth:read-only:focus {
   border: none;
   outline: none;
   box-shadow: none;
}

#name:read-only, #name:read-only:hover, #name:read-only:focus {
   border: none;
   outline: none;
   box-shadow: none;
}

#id:read-only, #id:read-only:hover, #id:read-only:focus {
   border: none;
   outline: none;
   box-shadow: none;
}

#telephone:read-only, #telephone:read-only:hover, #telephone:read-only:focus
   {
   border: none;
   outline: none;
   box-shadow: none;
}

.asdf tr {
   height: 50px;
}
</style>
<script>
   function checkNickExist() {
      var nickname = $("#nickname").val();

      if (nickname.length == 0) {
         alert('닉네임을 입력해주세요');
         return;
      }

      $.ajax({
         url : '${root}/user/checkNickExist/' + nickname,
         type : 'get',
         dataType : 'text',
         success : function(result) {
            if (result.trim() == 'true') {
               alert('사용할 수 있는 닉네임입니다.');
               $("#NickExist").val('true');
               console.log('NickExist: true'); // 디버그 메시지
            } else if (result.trim() == 'false') {
               alert('사용할 수 없는 닉네임입니다.');
               $("#NickExist").val('false');
               console.log('NickExist: false'); // 디버그 메시지
            }
         }
      });
   }

   function resetNickExist() {
      $("#NickExist").val('false');
      console.log('NickExist reset: false'); // 디버그 메시지
   }
</script>

</head>

<body id="page-top">
   <!-- 메뉴바 -->

   <c:import url="/WEB-INF/views/include/header.jsp" />

   <!--로그인 부분-->
   <section class="text-center" style="margin-top: 100px;">
      <h2>회원정보수정</h2>
      <hr style="margin: auto; margin-top: 50px; width: 1000px;" />

      <form:form action="${root}/user/InfoChange_pro" method="post"
         modelAttribute="modifyUserBean">
         <form:hidden path="NickExist" />
         <form:hidden path="gender" />
         <form:hidden path="user_id"/>
         <div
            style="display: flex; justify-content: center; align-content: center; text-align: left;">
            <table class="asdf" style="margin-top: 50px;">

               <tr>
                  <th style="width:200px;"><form:label path="name" style="font-size: 20px;">성함</form:label>
                  </th>

                  <td><form:input path="name" id="name"
                        value="${IC.name }" class="form-control"
                        style="border: none; outline:none;" readonly="true" /></td>


               </tr>

               <tr>
                  <th style="width:200px;"><form:label path="id" style="font-size: 20px;">아이디</form:label>
                  </th>

                  <td><form:input path="id" id="id"
                        value="${IC.id }" style="border: none; outline:none;"
                        class="form-control" readonly="true" /></td>
               </tr>
               <tr>
                  <th style="width:200px;"><form:label path="birth" style="font-size: 20px;">생년월일</form:label>
                  </th>

                  <td><form:input path="birth" id="birth" value="${IC.birth }"
                        style="border: none; outline:none;" class="form-control"
                        readonly="true" /></td>
               </tr>

               <tr>
                  <th style="width:200px;"><form:label path="telephone" style="font-size: 20px;">전화번호</form:label>
                  </th>

                  <td><form:input path="telephone" value="${IC.telephone }"
                        style="border: none; outline:none;" class="form-control"
                        readonly="true" /></td>
               </tr>

               <tr>
                  <th style="width:200px;"><form:label path="email" style="font-size: 20px;">이메일</form:label>
                  </th>

                  <td><form:input path="email" class="form-control" /></td>
               </tr>

               <tr>
                  <th style="width:200px;"><form:label path="nickname" style="font-size: 20px;">닉네임</form:label>
                  </th>

                  <td><form:input path="nickname" id="nickname"
                        class="form-control" onfocus="resetNickExist()" /> <form:errors path="nickname"
                        style="color:red" /></td>
                  <td>
                     <button type="button" style="margin-left: 15px;"
                        class="btn btn-dark" onclick="checkNickExist()">중복확인</button>
                  </td>
               </tr>





               <tr>
                  <th><form:label path="password" style="font-size: 20px;">현재 비밀번호</form:label>
                  </th>

                  <td><form:password path="password" class="form-control" />
                     <form:errors path="password" style="color:red" /></td>
               </tr>

               <tr>
                  <th><form:label path="icpassword" style="font-size: 20px;">새 비밀번호</form:label>
                  </th>

                  <td><form:password path="icpassword" class="form-control" />
                     <form:errors path="icpassword" style="color:red" /></td>

               </tr>

               <tr>
                  <th><form:label path="icpasscheck" style="font-size: 20px;">새 비밀번호 확인</form:label>
                  </th>

                  <td><form:password path="icpasscheck" class="form-control" />
                     <form:errors path="icpasscheck" style="color:red" /></td>
               </tr>
            </table>
         </div>
         <!-- 확인 버튼 -->
         <div style="display:flex; justify-content: center; align-items: center;">
            <a href="${root}/view/index" class="btn btn-danger" style="margin-top:30px; margin-right:15px;">취소</a>
            <button type="submit" class="btn btn-dark" style="margin-top:30px;">확인</button>
         </div>

      </form:form>
   </section>
   <!-- 푸터-->
   <c:import url="/WEB-INF/views/include/footer.jsp" />

</body>

</html>