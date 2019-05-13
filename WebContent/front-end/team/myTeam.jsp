<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.team.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.course.model.*"%>
<%@ page import="com.joingroup.model.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.inscourse.model.*"%>


<%
	JoinGroupService joinGroupSvc = new JoinGroupService();
    MemberVO memberVO=(MemberVO)request.getSession().getAttribute("memberVO");
	List<JoinGroupVO> list = joinGroupSvc.findByPrimaryKey(memberVO.getMemId());
	pageContext.setAttribute("list", list);
	
	TeamService teamSvc1 = new TeamService();
	List<TeamVO> list1 = teamSvc1.getAll();
	pageContext.setAttribute("list", list);
	
	
	JoinGroupService joinGroupSvc1 = new JoinGroupService();
	pageContext.setAttribute("joinGroupSvc1",joinGroupSvc1);
// 	List<JoinGroupVO> list2 = joinGroupSvc.findByTeamId("teamId");
	pageContext.setAttribute("list", list);
	
%>

<!--  	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO"); -->
<jsp:useBean id="memberSvc" scope="page"
	class="com.member.model.MemberService" />
<jsp:useBean id="incourseSvc" scope="page"
	class="com.inscourse.model.InsCourseService" />
<jsp:useBean id="courseSvc" scope="page"
	class="com.course.model.CourseService" />
<jsp:useBean id="teamSvc" scope="page"
	class="com.team.model.TeamService" />
<jsp:useBean id="teacherSvc" scope="page"
	class="com.teacher.model.TeacherService" />

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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js"
	type="text/javascript"></script>
<title>WeShare | 最棒的教育共享平台</title>
<style type="">
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

.form-row {
	margin-left: 5px;
	margin-top: 5px;
 }

.btn-info {
	margin-top: 5px;
 }

.class1 {
	margin-left: 200px;
 }

.picture {
	margin-top: -120px;
	margin-left: 250px;
 }

.btn-secondary {
	margin-top: -370px;
	margin-left: 976px;
 }

.btn-danger {
	margin-top: 5px;
	
	
	
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

					<FORM METHOD="get"
						ACTION="<%=request.getContextPath()%>/team/team.do">
						<b>請輸入課程</b> <input type="text" name="str">

						<div class="form-row">
							<input type="hidden" name="action" value="Search_One"> <input type="submit" name="commit" value="查詢"
								class="btn btn-info submit" data-disable-with="find" />
						</div>
					</FORM>
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-3">
					<FORM METHOD="get" ACTION="<%=request.getContextPath()%>/team/team.do">
						<div class="form-row">

							<a class="btn btn-info submit" href="<%=request.getContextPath()%>/front-end/team/team.jsp" role="button">返回揪團</a>

						</div>
					</FORM>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="page1.file"%>
	<c:forEach var="joinGroupVO" items="${list}" begin="<%=pageIndex%>"
		end="<%=pageIndex+rowsPerPage-1%>">
		<div class="container">
			<div class="plan">
				<div class="plan_iamge">

					<img
						src="<%=request.getContextPath()%>/member/DBGifReader.do?memId=${teacherSvc.findOneById(incourseSvc.findOneById(teamSvc.findByPrimaryKey1(joinGroupVO.teamId).inscID).teacherId).memId}"
						width="175" height="185">
				</div>
				<div class="plan_info">
					<h4>
						${courseSvc.findOneById(incourseSvc.findOneById(teamSvc.findByPrimaryKey1(joinGroupVO.teamId).inscID).courseId).courseName}

						<span class="badge badge-light">團體課程</span>
					</h4>
					<div>
						<i class="far fa-calendar-alt"></i>
						<div>課程大綱:${incourseSvc.findOneById(teamSvc.findByPrimaryKey1(joinGroupVO.teamId).inscID).inscCourser}
						</div>
						<div>上課語言:${incourseSvc.findOneById(teamSvc.findByPrimaryKey1(joinGroupVO.teamId).inscID).inscLang}
						</div>
						<div>上課地點:${incourseSvc.findOneById(teamSvc.findByPrimaryKey1(joinGroupVO.teamId).inscID).inscLoc}</div>
					</div>


					<hr>
					<div>
						<span class="badge badge-light">收費模式</span> <span
							class="badge badge-success">預先扣款</span> <span
							class="badge badge-lisght"> <i class="fas fa-dollar-sign"></i>
						</span>每小時${incourseSvc.findOneById(teamSvc.findByPrimaryKey1(joinGroupVO.teamId).inscID).inscPrice}
						元$<br>
					</div>
					<div class="class1">
						<span class="badge badge-light"> 隊伍型態 </span> <span
							class="badge badge-info">自主性揪團</span> <span
							class="badge badge-info">揪團編號</span>
					</div>
				</div>
				<!-- 				按鈕在這--------------------------------------------------------------------- -->
				<button type="button" id="${joinGroupVO.teamId}"
					class="btn btn-secondary" data-toggle="modal"
					data-target="#createModal1">成員</button>

				<div class="button-group">
					<div class="row">
						<FORM METHOD="get" ACTION="<%=request.getContextPath()%>/team/team.do" name="delete">
							<input type="hidden" name="memId" value="${memberVO.memId}">
							<input type="hidden" name="teamId" value="${joinGroupVO.teamId}">
							<input type="hidden" name="action" value="delete"> <input
								type="submit" value="退出揪團" class="btn btn-danger"
								data-disable-with="find" />
						</form>
						<button type="button"
							id="${teamSvc.findByPrimaryKey1(joinGroupVO.teamId).inscID}"
							class="btn btn-info" data-toggle="modal"
							data-target="#createModal">詳情</button>
						<input type="hidden"
							value="${teamSvc.findByPrimaryKey1(joinGroupVO.teamId).inscID}"
							class="ha">
						<!-- Modal -->
						<div class="modal fade" id="createModal" data-backdrop="false">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">揪團詳情</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">&times;</button>

									</div>

									<div class="modal-body">
										<jsp:include page="listOneEmp.jsp" />
									</div>

									<div class="modal-footer">
										<button type="button" class="btn btn-primary"
											data-dismiss="modal">關閉</button>

									</div>
								</div>
							</div>
						</div>






						<c:set var="list2"
							value="${joinGroupSvc1.findByTeamId(joinGroupVO.teamId)}"
							scope="request" />


						<input type="hidden" value="${joinGroupVO.teamId}" class="hr">
						<!-- Modal -->
						<div class="modal fade" id="createModal1" data-backdrop="false">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">揪團詳情</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">&times;</button>

									</div>

									<div class="modal-body">
										<jsp:include page="findTeamMember.jsp" />
									</div>

									<div class="modal-footer">
										<button type="button" class="btn btn-primary"
											data-dismiss="modal">關閉</button>

									</div>
								</div>
							</div>
						</div>


					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			//自訂預設值

			  $(document).ready(function(){

				  $("#${teamSvc.findByPrimaryKey1(joinGroupVO.teamId).inscID}").click(function(){
					 
					  $.ajax({
				            type: "get", //傳送方式
				            url:  "<%=request.getContextPath()%>/team/team.do" ,
				            data:  {"action": "include1",
				            	    "inscId": "${teamSvc.findByPrimaryKey1(joinGroupVO.teamId).inscID}"},
				          dataType:"json",
				            
				            success: function(data) {
				            	$.each(data,function(i,item){
				            		document.getElementsByClassName('subjectName')[i].innerHTML=item.member_name;
					            	document.getElementsByClassName('subjectPhone')[i].innerHTML=item.member_phone;
					            	document.getElementsByClassName('subjectTime')[i].innerHTML=item.team_MFD;
					            	document.getElementsByClassName('subjectPrice')[i].innerHTML=item.team_price;
				            	});     	
				            },
				            error: function() {
				                alert("有錯誤")
				            }
				        })
				    })        
				});


//自訂預設值
$(document).ready(function(){

	  $("#${joinGroupVO.teamId}").click(function(){
		  $.ajax({
	            type: "get", //傳送方式
	            url: "<%=request.getContextPath()%>/team/team.do",
	            data:  { "action": "include2",
	            	     "teamId": "${joinGroupVO.teamId}"},
	          dataType:"json",
	          
	            success:function(data) {
	            		
	            	console.info(data);
	            	$('#detail').empty();
	            	$.each(data,function(i,item){
	            		
	            		$('#detail').append('<tr><td class="subjectName2">'+item.member_Name+'</td><td class="subjectEmail2">'+item.member_Email+'</td></tr>');
	            	});     	
	            },
	            error: function() {
	                alert("有錯誤")
	            }
	        })
	    })        
	});

</script>
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
							<span>© </span><span class="copyright-year">2018</span><span>
							</span><span>WeShare教育共享平台</span><span>.</span><span>© All Rights
								Reserved. .</span>
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

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<!--引用jQuery -->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		type="text/javascript"></script>
	<!--     引用SweetAlert2.js -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.0/sweetalert2.all.js"></script>

</body>
</html>
