<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>

<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/G4.css ">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/login.css ">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
/* Head */
.acc-col {
	min-height: 300px;
	margin-top: 5%;
	background-color:#F4F9F4;
	padding: 20px;
	/*      border:#333 solid 1px;*/
}

.acc-col>h3 {
	padding-bottom: 20px;
}

hr {
	border: solid 1px #d6d6d6;
}

section>form>div {
	padding: 5px;
}

.btn-div {
	margin-top: 10px;
	padding-bottom: 10px;
}

.ui-67 .ui-head {
	text-align: center;
	padding: 30px 0px;
	position: relative;
	border-bottom: 2px solid #fff;
	box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
	background-color: #a7d7c5;
}
/* Details */
.ui-67 .ui-head .ui-details {
	margin: 0px 0px 74px;
}

.ui-67 .ui-head .ui-details h3 {
	color: #fff;
	font-size: 40px;
	line-height: 60px;
	font-weight: 300;
}

@media ( max-width :400px) {
	.ui-67 .ui-head .ui-details h3 {
		font-size: 25px;
		line-height: 40px;
		font-weight: 400;
	}
}

.ui-67 .ui-head .ui-details h4 {
	color: #fff;
	font-size: 18px;
	line-height: 38px;
	font-weight: 400;
}
/* Image */
.ui-67 .ui-head .ui-image {
	width: 100%;
	position: absolute;
	bottom: -55px;
	z-index: 10;
}

.ui-67 .ui-head img {
	width: 120px;
	border-radius: 100%;
	margin: 0px auto;
	border: 4px solid #fff;
	box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
}
.ui-content{
margin-bottom:5%;
}
.col-sm-8 col-md-8 col-lg-8 col-lg-offset-2 acc-col{
background-color:#F4F9F4;
}
.row{
width:100%;
	
}


</style>
<title>WeShare | 最棒的教育共享平台</title>
</head>
<body>

	<!-------------------------------------------------------------------------headerEnd------------------------------------------------------------------------->
		<c:if test="${not empty errorMsgs}">
			<h4 style="color: red; text-align: center;">請修正以下錯誤:</h4>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red; text-align: center;">${message}</li>
				</c:forEach>
			</ul>
		</c:if>

<FORM method="post" action="<%= request.getContextPath()%>/MemberServlet" class="form-horizontal" name="form1" id="form1" enctype="multipart/form-data">	
	<div class="start">
		<!-- UI - X Starts -->
		<div class="ui-67">

			<!-- Content Starts -->
			<div class="ui-content">

				<div class="row">

					<div class="col-sm-8 col-md-8 col-lg-8 col-lg-offset-2 acc-col">
						<section>
						<h3>修改頭貼</h3>
						<input type="file" name="memImage" value="${memberVO.memImage}" />
							<h3>聯絡資訊</h3>
					
								<div class="row">
									<div class="col-sm-12">
										<label for="inputName" class="control-label">帳號:</label> <input
											type="text" class="form-control" readonly="readonly" id="inputName"
											name="memId" value="${memberVO.memId}">
									</div>
								</div>
								<div class="row">
									<div class="col-sm-6">
										<label for="inputEmail3" class="control-label">電子信箱:</label> <input
											type="email" class="form-control" readonly="readonly" id="inputEmail3"
											name="memEmail" value="${memberVO.memEmail}"
											readonly="readonly">
									</div>
									<div class="col-sm-6">
										<label for="inputPassword3" class="control-label">手機號碼:</label>
										<input type="text" class="form-control" readonly="readonly" id="inputPassword3"
											name="memPhone" value="${memberVO.memPhone}">
									</div>
								</div>

								<div class="row">
									<div class="col-sm-12">
										<label for="inputEmail3" class="control-label">地址:</label>
										<input type="text" class="form-control" id="inputEmail3" name="memAdd" value="${memberVO.memAdd}">
									</div>
									<div class="col-sm-6">
										<label for="inputPassword3" class="control-label">銀行帳號:</label>
										<input type="text" class="form-control" id="inputPassword3" name="memBank" value="${memberVO.memBank}">
									</div>

								</div>



								<div class="col-sm-12">
									<div class="btn-div">
							
									</div>
								</div>
				
						</section>



						<section>
							<h3>登入資訊</h3>
				
								<div class="row">
									<div class="col-sm-12">
										<label for="inputEmail3" class="control-label">修改密碼:</label>
										<div class="">
											<input type="password" class="form-control" id="inputEmail3" name="memPsw" value="${memberVO.memPsw}">
										</div>
									</div>
									<div class="col-sm-12">
										<label for="inputPassword3" class="control-label">確認密碼:</label>
										<div class="">
											<input type="password" class="form-control"  value="${memberVO.memPsw}"
												id="memPswDouble">
										</div>
									</div>
									<div class="col-sm-12">
										<div class="btn-div">
									
										</div>
									</div>
								</div>
						
						</section>


						<section>

							<h3>個人介紹</h3>
						
								<div class="row">
									
									<div class="col-sm-6">
										<label for="inputEmail3" class="control-label">擅長的課程</label>
							<jsp:useBean id="courseSvc" scope="page" class="com.course.model.CourseService" />			
										<div class="">
											<select class="form-control" id="Skill" name="memSkill" >
											<c:forEach var="courseVO" items="${courseSvc.all}">
										<option value="${courseVO.courseId}" ${(memberVO.memSkill==courseVO.courseId)?'selected':'' } >${courseVO.courseName}
											</c:forEach>
											</select>
										</div>
									</div>
									
									<div class="col-sm-6">
										<label for="inputEmail3" class="control-label">想學課程</label>
											<div class="">
											<select class="form-control" id="memWantSkill" name="memWantSkill" >
											<c:forEach var="courseVO" items="${courseSvc.all}">
										<option value="${courseVO.courseId}" ${(memberVO.memWantSkill==courseVO.courseId)?'selected':'' } >${courseVO.courseName}
											</c:forEach>
											</select>
										</div>
									</div>
										
									<div class="col-sm-12">
										<label for="inputPassword3" class="col-sm-12 control-label">編輯自介</label>
										<div class="">
											<textarea rows="5" class="form-control" id="inputPassword3" name="memText" value="${memberVO.memText}"></textarea>
										</div>
									</div>
									<div class="col-sm-12">
										<div class="btn-div">
									
										</div>
									</div>
								</div>
			
						</section>

<div class="ui-content">
<div class="row">
<div class="col-5">	</div>
<div class="col-5">	</div>
<div class="col-2">		
<input type="hidden" name="action" value="update"> 
<input id="signUp" name="submit" type="submit" value="儲存修改" class="btn btn-success d-flex justify-content-end" style="align-center"> 
</div>	

</div>
</div>
</div>






</FROM>
						
					</div>
					<!-- col-8 -->
				</div>

			</div>		
			<!-- Content Ends -->
		</div>
		<!-- UI - X Ends -->
	</div>

	
	<!-------------------------------------------------------------------------footerEnd------------------------------------------------------------------------->
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
