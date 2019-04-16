<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>

<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
	
%>


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
<link rel="stylesheet" type="text/css"
	href="https://bootswatch.com/paper/bootstrap.min.css">
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
	background-color: #ffffff;
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

.start {
	margin-bottom: 25%;
}
</style>
<title>WeShare | 最棒的教育共享平台</title>
</head>
<body>
	<!-------------------------------------------------------------------------headerStart------------------------------------------------------------------------->
<div class="header">
      <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top"> <img src="<%= request.getContextPath()%>/images/icon/logo.png" width="80" height="60" alt=""/><a class="navbar-brand" href="<%= request.getContextPath()%>">教育共享平台</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active"> <a class="nav-link" href="#">成為老師 <span class="sr-only">(current)</span></a> </li>
            <li class="nav-item dropdown"> <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">探索課程</a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink"> <a class="dropdown-item" href="<%= request.getContextPath()%>/Inscourse/NewFile.jsp">所有課程</a> <a class="dropdown-item" href="#">音樂</a> <a class="dropdown-item" href="#">語言</a> <a class="dropdown-item" href="#">運動</a> <a class="dropdown-item" href="#">藝術</a> <a class="dropdown-item" href="#">設計</a> <a class="dropdown-item" href="#">人文</a> <a class="dropdown-item" href="#">行銷</a> <a class="dropdown-item" href="#">程式語言</a> <a class="dropdown-item" href="#">投資理財</a> <a class="dropdown-item" href="#">職場技能</a> <a class="dropdown-item" href="#">手作</a> <a class="dropdown-item" href="#">烹飪</a> </div>
            </li>
            <li class="nav-item"> <a class="nav-link" href="<%= request.getContextPath()%>/member/loginMember.jsp">登入</a> </li>
            <li class="nav-item"> <a class="nav-link" href="<%= request.getContextPath()%>/member/addMember.jsp">註冊</a> </li>
            <li class="nav-item"> <a class="nav-link " href="<%= request.getContextPath()%>/member/listAllMember.jsp">關於我們</a> </li>
          </ul>
        </div>
      </nav>
    </div>	
	<!-------------------------------------------------------------------------headerEnd------------------------------------------------------------------------->
		<c:if test="${not empty errorMsgs}">
			<h4 style="color: red; text-align: center;">請修正以下錯誤:</h4>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red; text-align: center;">${message}</li>
				</c:forEach>
			</ul>
		</c:if>

<FORM method="post" action="member.do" class="form-horizontal" name="form1" id="form1" enctype="multipart/form-data">	
	<div class="start">
		<!-- UI - X Starts -->
		<div class="ui-67">

			<!-- Head Starts -->
			<div class="ui-head bg-lblue">
				<!-- Details -->
				<div class="ui-details">
					<!-- Name -->
					<h3 id="name-header" >${memberVO.memName}</h3>
					<!-- Designation -->
					<h4>個人資料</h4>
					

				</div>
				<!-- Image -->
				<div class="ui-image">
					
					<!-- User Image -->
<img src="<%=request.getContextPath()%>/member/DBGifReader.do?memId=${memberVO.memId}" alt="Profile Picture" 
class="img-responsive"  name="memImage" width="120" height="120">

				</div>
			</div>
			<!-- Head Ends -->

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
<input id="signUp" name="submit" type="submit" value="儲存修改"class="btn btn-success d-flex justify-content-end" style="align-center"> 
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
	


	<!-------------------------------------------------------------------------footerStart------------------------------------------------------------------------->
	<footer
		class="section footer-classic context-dark bg-image footer navbar-fixed-bottom"
		style="background: #74b49b;">
		<div class="container">
			<div class="row row-30">
				<div class="col-md-4 col-xl-5">
					<div class="pr-xl-4">
						<a href="index.html"></a>
						<p class="reademe">我們是最佳的共享教育的平台，致力於在分享技能，保障交易，展現自我，使用戶得到最棒的學習體驗。</p>
						<!-- Rights-->
						<p class="rights">
							<span>©  </span><span class="copyright-year">2018</span><span> </span><span>WeShare教育共享平台</span><span>. </span><span>©
								All Rights Reserved. .</span>
						</p>
					</div>
				</div>
				<div class="col-md-4">
					<h5 class="reademe">聯絡我們</h5>
					<dl class="contact-list">
						<dt>地址:</dt>
						<dd>桃園市中壢區中大路300號</dd>
					</dl>
					<dl class="contact-list">
						<dt>信箱:</dt>
						<dd>
							<a href="mailto:#">weshare@gmail.com</a>
						</dd>
					</dl>
					<dl class="contact-list">
						<dt>電話:</dt>
						<dd>
							<a href="tel:#">03-425-7387</a>
						</dd>
					</dl>
				</div>
				<div class="col-md-4 col-xl-3">
					<h5 class="reademe2">關於</h5>
					<ul class="nav-list">
						<li><a href="#">關於我們</a></li>
						<li><a href="#">團隊成員</a></li>
						<li><a href="#">加入WeShare</a></li>
						<li><a href="#">隱私權政策</a></li>
						<li><a href="#">功能更新</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="row no-gutters social-container">
			<div class="col">
				<a class="social-inner" href="#"><span
					class="icon mdi mdi-facebook"></span><span>Facebook</span></a>
			</div>
			<div class="col">
				<a class="social-inner" href="#"><span
					class="icon mdi mdi-instagram"></span><span>instagram</span></a>
			</div>
			<div class="col">
				<a class="social-inner" href="#"><span
					class="icon mdi mdi-twitter"></span><span>twitter</span></a>
			</div>
			<div class="col">
				<a class="social-inner" href="#"><span
					class="icon mdi mdi-youtube-play"></span><span>google</span></a>
			</div>
		</div>
	</footer>
	<!-------------------------------------------------------------------------footerEnd------------------------------------------------------------------------->
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
