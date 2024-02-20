<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">

<head>
</head>

<body class="sb-nav-fixed">
	<c:import url="/WEB-INF/views/include/admin_header.jsp"/>

		<!--실제 내용(대시보드) 부분-->
		<div id="layoutSidenav_content">
			<main style="background-color: ivory;">
				<div class="container-fluid px-4">
				<div style="margin-top: 30px; margin-left:20px;">
						<h3>사용자 정보</h3>
					</div>
					<form:form action="${root }/admin/acmanager" method="post" modelAttribute="acModifyBean">
					<form:hidden path="user_id" />
				<div>
					<div style="display: flex; width: 100%;">
						<div style="flex: 1; margin: 10px; border: 1px solid black;  background-color: white;">
							<div style="text-align: center;">
								<img src="../img/level/profile_Lv1.png"
									style="width: 85px; height: 85px; margin-top: 15px; border-radius: 4em; box-shadow: 5px 5px rgb(0, 0, 0, 0.1);" />
								<h4 style="margin-top: 15px;">회원정보</h4>
							</div>
							<div style="margin-top: 50px; text-align: center;">
								<h5	style="margin-left: 100px; margin-top: 50px; text-align: left;">닉네임</h5>
								<form:input type="text"	style="background-color: transparent; border: none; border-bottom: 1px solid black; width: 600px; margin-top: 20px;"
								path="nickname" />
								<h5	style="margin-left: 100px; margin-top: 30px; text-align: left;">아이디</h5>
								<form:input type="text" style="background-color: transparent; border: none; border-bottom: 1px solid black; width: 600px; margin-top: 20px;"
								path="id" />
								<h5	style="margin-left: 100px; margin-top: 30px; text-align: left;">이메일</h5>
								<form:input type="text" style="background-color: transparent; border: none; border-bottom: 1px solid black; width: 600px; margin-top: 20px; margin-bottom:20px;"
								path="email" />
							</div>
						</div>
						<div
							style="display: flex; flex-direction: column; flex: 1; margin: 10px;">
							<div style="flex: 2; border: 1px solid black; background-color: white;">
								<h3 style="margin-top:20px; margin-left:30px;">활동정보</h3>

								<div style="display: flex; justify-content: center;">
									<div>
										<div style="text-align:center;">
											<h5 style="color: #e2e2e2;">가입일</h5>
											<h5 style="margin-top:15px;">${temp1.create_date}</h5>
										</div>
									</div>
								</div>
								
								<div>
									<h5 style="color: #e2e2e2; text-align:center; margin-top:30px;">작성</h5>
									<div style="display: flex; justify-content: center;">
										<div style="margin-right:100px;">
											<h5>게시글</h5>
											<h5>댓글</h5>
											<h5>문의</h5>
											<h5>전시회신청</h5>
											<h5>배너신청</h5>
										</div>
										<div>
											<h5>${countBean.board_count }</h5>
											<h5>${countBean.comment_count}</h5>
											<h5>${countBean.qna_count}</h5>
											<h5>${countBean.banner_apply_count}</h5>
											<h5>${countBean.exhibition_enroll_count}</h5>											
										</div>
									</div>
								</div>
							</div>
							<div style="flex: 1; margin-top: 10px; border: 1px solid black;  background-color: white;">
								<div style="margin-left:30px; margin-top:15px;">
									<h3>상태</h3>
									<c:if test="${temp1.state == 1}">
										<input type="radio" name="state" value="1" id="level1" style="margin-top:20px; width: 15px; height: 15px;" checked>
										<label for="level1" style="font-size: 20px; margin-left: 30px;">활동</label> <br />
										<input type="radio" name="state" value="2" id="level2" style="margin-top:20px; width: 15px; height: 15px;"> 
										<label for="level2" style="font-size: 20px; margin-left: 30px;">비활성화</label> <br />
										<input type="radio" name="state" value="3" id="level3" style="margin-top:20px; width: 15px; height: 15px;">
										<label for="level3" style="font-size: 20px; margin-left: 30px;">관리자</label>
									</c:if>
									
									<c:if test="${temp1.state == 2}">
										<input type="radio" name="state" value="1" id="level1" style="margin-top:20px; width: 15px; height: 15px;" >
										<label for="level1" style="font-size: 20px; margin-left: 30px;">활동</label> <br />
										<input type="radio" name="state" value="2" id="level2" style="margin-top:20px; width: 15px; height: 15px;" checked> 
										<label for="level2" style="font-size: 20px; margin-left: 30px;">비활성화</label> <br />
										<input type="radio" name="state" value="3" id="level3" style="margin-top:20px; width: 15px; height: 15px;">
										<label for="level3" style="font-size: 20px; margin-left: 30px;">관리자</label>
									</c:if>
									
									<c:if test="${temp1.state == 3}">
										<input type="radio" name="state" value="1" id="level1" style="margin-top:20px; width: 15px; height: 15px;" >
										<label for="level1" style="font-size: 20px; margin-left: 30px;">활동</label> <br />
										<input type="radio" name="state" value="2" id="level2" style="margin-top:20px; width: 15px; height: 15px;"> 
										<label for="level2" style="font-size: 20px; margin-left: 30px;">비활성화</label> <br />
										<input type="radio" name="state" value="3" id="level3" style="margin-top:20px; width: 15px; height: 15px;" checked>
										<label for="level3" style="font-size: 20px; margin-left: 30px;">관리자</label>
									</c:if>
								</div>
							</div>
						</div>
					</div>
						<div style="float:right; margin-right:30px; margin-top:20px;">
							<form:button class="btn btn-dark" style="margin-right:20px;">저장</form:button>
						</div>
					</div>
					</form:form>


				

				</div>
			</main>

			
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
</body>
</html>