<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.team.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.course.model.*"%>
<%@ page import="com.joingroup.model.*"%>


<%
	TeamService teamSvc = new TeamService();
	List<TeamVO> list = teamSvc.getAll();
	pageContext.setAttribute("list", list);
	
%>

<%
	JoinGroupVO joinGroupVO = (JoinGroupVO) request.getAttribute("joinGroupVO");
%>

 <jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService" />
 <jsp:useBean id="incourseSvc" scope="page" class="com.inscourse.model.InsCourseService" />
 <jsp:useBean id="courseSvc" scope="page" class="com.course.model.CourseService" />
 <jsp:useBean id="teamSvc1" scope="page" class="com.team.model.TeamService" />
 <jsp:useBean id="teacherSvc" scope="page" class="com.teacher.model.TeacherService" />	
	
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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/front-end/css/G4.css ">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<title>WeShare | 最棒的教育共享平台</title>
<style type="">
}
.breadcrumb-item+.breadcrumb-item::before {
	content: "|";
}

.page-link:hover {
	background-color: #8af;
	color: #fff;
	border-color: #00f;
	transform: scale(2);
}

.head {
	display: none;
}

.jumbotron {
	border-radius: 0;
}

.jumbotron {
	background-image: url(01.jpg);
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center center;
}

.JumboHeaderImg {
	background-size: cover;
	background-image: url(<%=request.getContextPath()%>/front-end/Images/333.jpg);
}

#quick_form {
	margin-top: 60px;
	margin-left: 35px;
}

.plan {
	padding: 10px;
	border: 1px #ccc solid;
	border-radius: 10px;
	margin: 10px;
}

.plan_iamge {
	width: 200px;
	height: 150px;
	float: left;
	margin-top: -2px;
}

.container {
	width: 100%;
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
	max-width: 1140px;
}

.row {
	display: flex;
	flex-wrap: wrap;
	margin-right: -15px;
	margin-left: -15px;
}

.button-group {
	margin-left: 900px;
	margin-top: -40px;
}

.page2 {
	text-align: center;
	width: 500px;
	margin: auto;
}

.form-row {
	margin-left: 5px;
	margin-top: 5px;
}

.btn-info {
	margin-top: 5px;
}
.class1{
   margin-left: 200px;

}
.picture{
   margin-top:-120px;
   margin-left:250px;
}

</style>
</head>
<body>
	<!-------------------------------------------------------------------------headerStart------------------------------------------------------------------------->
	<div class="header headerImg">
		<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
			<img src="images/icon/logo.png" width="80" height="60" alt="" /><a
				class="navbar-brand" href="#">教育共享平台</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="#">成為老師
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">探索課程</a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="#">所有課程</a> <a
								class="dropdown-item" href="#">音樂</a> <a class="dropdown-item"
								href="#">語言</a> <a class="dropdown-item" href="#">運動</a> <a
								class="dropdown-item" href="#">藝術</a> <a class="dropdown-item"
								href="#">設計</a> <a class="dropdown-item" href="#">人文</a> <a
								class="dropdown-item" href="#">行銷</a> <a class="dropdown-item"
								href="#">程式語言</a> <a class="dropdown-item" href="#">投資理財</a> <a
								class="dropdown-item" href="#">職場技能</a> <a class="dropdown-item"
								href="#">手作</a> <a class="dropdown-item" href="#">烹飪</a>
						</div></li>
					<li class="nav-item"><a class="nav-link" href="#">登入</a></li>
					<li class="nav-item"><a class="nav-link" href="#">註冊</a></li>
					<li class="nav-item"><a class="nav-link disabled" href="#">關於我們</a>
					</li>
				</ul>
			</div>
		</nav>
	</div>

	<!-------------------------------------------------------------------------headerEnd------------------------------------------------------------------------->
	<div class="jumbotron JumboHeaderImg">

		<div id="quick_form">
			<h1>
				<font face="fantasy" color="#855600">想揪什麼團呢？</font>
			</h1>




			<div class="form-row">
				<div class="form-group col-md-4">
				
					<FORM METHOD="get" ACTION="<%=request.getContextPath()%>/team/team.do">
						<b>請輸入課程</b> <input type="text" name="str">

						<div class="form-row">
							<input type="hidden" name="action" value="Search_One"> 
							<input type="submit" name="commit" value="查詢"
								class="btn btn-info submit" data-disable-with="find" />
						</div>
					</FORM>
				</div>
			</div>
		</div>
	</div>
	                
	               
	
	

		<%@ include file="page1.file"%>
	<c:forEach var="insCourseVO" items="${insCourseVOList}" begin="<%=pageIndex%>"
		end="<%=pageIndex+rowsPerPage-1%>">
		<div class="container">
			<div class="plan">
				<div class="plan_iamge">
 					<img src="<%=request.getContextPath()%>/member/DBGifReader.do?memId=${teacherSvc.findOneById(insCourseVO.teacherId).memId}"width="175" height="185"/>  
				</div>
				<div class="plan_info"> 					
			<h4> 
              ${courseSvc.findOneById(insCourseVO.courseId).courseName}
						<span class="badge badge-light">團體課程</span>
					</h4>
					<div>
						<i class="far fa-calendar-alt"></i>
  						  <div>課程大綱:  ${insCourseVO.inscCourser} </div>
  						  <div>上課語言:  ${insCourseVO.inscLang}</div>
  						  <div>${teacherSvc.findOneById(insCourseVO.teacherId).memId}</div>               
				   </div>
				
					<hr>
					<div>
						<span class="badge badge-light">收費模式</span> <span
							class="badge badge-success">預先扣款</span> <span
							class="badge badge-lisght"> <i class="fas fa-dollar-sign"></i>
						</span>每人 ${insCourseVO.inscPrice}元$<br>
					</div>

					<div class="class1">
						<span class="badge badge-light"> 隊伍型態 </span>
						<span class="badge badge-info">自主性揪團</span> 
						<span class="badge badge-info">揪團編號</span>
					</div>
				</div>
				<div class="button-group">

					<!-- Button trigger modal -->
					<button type="button" class="btn btn-info submit"
						data-toggle="modal" data-target="#teamclass">詳情</button>

					<!-- Modal -->
					<div class="modal fade" id="teamclass" tabindex="-1" role="dialog"
						aria-labelledby="teamclassTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLongTitle">揪團詳情</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<!------Modal body------>
								<div class="modal-body">
 									<a>團主姓名:${memberSvc.getOneMember(teamSvc1.getOneTeam(insCourseVO.inscId).leaderID).memName}</a><br> 
								<a>連絡電話:${memberSvc.getOneMember(teamSvc1.getOneTeam(insCourseVO.inscId).leaderID).memPhone}</a><br> 
									<a>預扣金額:</a>${insCourseVO.inscPrice}<br>
									<a>開團時間:${teamSvc1.getAll().get(0).getTemaMFD()}</a><br>
									<a>截團時間:${teamSvc1.getAll().get(0).getTeamEXP()}</a><br>
                                     <div class="picture">
					
	<img src="<%=request.getContextPath()%>/member/DBGifReader.do?memId=${memberSvc.getOneMember(teamSvc1.getOneTeam(insCourseVO.inscId).leaderID).memId}"width="175" height="150" >
	
		 	
				</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-info" data-dismiss="modal">關閉</button>

								</div>
							</div>
						</div> 
					</div>


					<button type="button" class="btn btn-info submit"
						data-toggle="modal" data-target="#myModal">加入揪團</button>
				</div>
				<!-- 				------------------------------------------------------ -->
				<!-- The Modal -->

				<div class="modal fade" id="myModal">
					<div class="modal-dialog">
						<div class="modal-content">
							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">加入揪團</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>
							<!-- Modal body -->
							<div class="modal-body">

								<%-- 錯誤表列 --%>
								<c:if test="${not empty errorMsgs}">
									<font style="color: red">請修正以下錯誤:</font>
									<ul>
										<c:forEach var="message" items="${errorMsgs}">
											<li style="color: red">${message}</li>
										</c:forEach>
									</ul>
								</c:if>


								<FORM METHOD="post" ACTION="team.do" name="form1">
									<table>
										<tr>
											<td>帳號:</td>
											<td><input class="form-control" type="text"
												placeholder="請輸入帳號" name="memId" size="45"
												value="<%=(joinGroupVO == null) ? "weshare04" : joinGroupVO.getMemId()%>" /></td>
										</tr>
										<tr>
											<td>編號:</td>
											<td><input type="TEXT" class="form-control "
												name="teamId" size="35"
												value="<%=(joinGroupVO == null) ? "TM00004" : joinGroupVO.getTeamId()%>" /></td>
										</tr>
									</table>
<!-- 									Modal footer -->


									<div class="modal-footer">
										<button type="button" class="btn btn-info"
											data-dismiss="modal">取消</button>

										<input type="hidden" name="action" value="insert">
										<button type="submit" class="btn btn-info"
											data-dismiss="insert">加入</button>
									</div>
								</Form>
							</div>
						</div>
					</div>



				</div>

			</div>
		</div>



	</c:forEach>
	<%@ include file="page2.file"%>
	<!-------------------------------------------------------------------------footerStart------------------------------------------------------------------------->
	<footer class="section footer-classic context-dark bg-image"
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