<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="inscCourseTimeSvc" scope="page" class="com.inscoursetime.model.InsCourseTimeService" />
<jsp:useBean id="insCourseSvc" scope="page" class="com.inscourse.model.InsCourseService" />
<jsp:useBean id="CourseSvc" scope="page" class="com.course.model.CourseService" />
<jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService" />


<!DOCTYPE html>
<html>
<head>
<link 
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<link 
	href="<%=request.getContextPath()%>/css/G4.css" rel="stylesheet" type="text/css">
<link 
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link 
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link 
	href="https://cdn.bootcss.com/limonte-sweetalert2/7.33.1/sweetalert2.css" rel="stylesheet">
<script 
	src="https://cdn.bootcss.com/limonte-sweetalert2/7.33.1/sweetalert2.all.min.js"></script>
<script 
	src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script 
	src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script 
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>	
<script 
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script 
	src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<style>

.profile {
  margin: 20px 0;
}

/* Profile sidebar */
.profile-sidebar {
  padding: 20px 0 10px 0;
  background: #fff;
}

.profile-userpic img {
  float: none;
  margin: 0 auto;
  width: 50%;
  height: 50%;
  -webkit-border-radius: 50% !important;
  -moz-border-radius: 50% !important;
  border-radius: 50% !important;
}

.profile-usertitle {
  text-align: center;
  margin-top: 20px;
}

.profile-usertitle-name {
  color: #5a7391;
  font-size: 16px;
  font-weight: 600;
  margin-bottom: 7px;
}

.profile-usertitle-job {
  text-transform: uppercase;
  color: #5b9bd1;
  font-size: 12px;
  font-weight: 600;
  margin-bottom: 15px;
}

.profile-userbuttons {
  text-align: center;
  margin-top: 10px;
}

.profile-userbuttons .btn {
  text-transform: uppercase;
  font-size: 11px;
  font-weight: 600;
  padding: 6px 15px;
  margin-right: 5px;
}

.profile-userbuttons .btn:last-child {
  margin-right: 0px;
}
    
.profile-usermenu {
  margin-top: 30px;
}

.profile-usermenu ul li {
  border-bottom: 1px solid #f0f4f7;
}

.profile-usermenu ul li:last-child {
  border-bottom: none;
}

.profile-usermenu ul li a {
  color: #93a3b5;
  font-size: 14px;
  font-weight: 400;
}

.profile-usermenu ul li a i {
  margin-right: 8px;
  font-size: 14px;
}

.profile-usermenu ul li a:hover {
  background-color: #fafcfd;
  color: #5b9bd1;
}

.profile-usermenu ul li.active {
  border-bottom: none;
}

.profile-usermenu ul li.active a {
  color: #5b9bd1;
  background-color: #f6f9fb;
  border-left: 2px solid #5b9bd1;
  margin-left: -2px;
}

/* Profile Content */
.profile-content {
  padding: 20px;
  background: #fff;
  min-height: 460px;
}    
#classification li{
  width:1000px;
}
#body {
	background-color:#F4F9F4;
	min-height: 100%, padding-bottom: footer;
	margin-bottom: 15%;
}
footer{
    width: 100%;
    height:300px;   /* footer的高度一定要是固定值*/ 
    bottom:0px;
    left:0px;
}
</style>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>DateTimePicker.jsp</title></head>

	<!-------------------------------------------------------------------------headerStart------------------------------------------------------------------------->

<div class="header">
     <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top"> <img src="<%= request.getContextPath()%>/images/icon/logo.png" width="80" height="60" alt=""/><a class="navbar-brand" href="<%= request.getContextPath()%>">教育共享平台</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active"> <a class="nav-link" href="<%= request.getContextPath()%>/teacher/joinTeacher.jsp">成為老師 <span class="sr-only">(current)</span></a> </li>
            <li class="nav-item dropdown"> <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">探索課程</a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink"> <a class="dropdown-item" href="<%= request.getContextPath()%>/inscourse/inscourse.do?courseId=&inscLoc=&action=listEmps_ByCompositeQuery">所有課程</a> <a class="dropdown-item" href="#">音樂</a> <a class="dropdown-item" href="#">語言</a> <a class="dropdown-item" href="#">運動</a> <a class="dropdown-item" href="#">藝術</a> <a class="dropdown-item" href="#">設計</a> <a class="dropdown-item" href="#">人文</a> <a class="dropdown-item" href="#">行銷</a> <a class="dropdown-item" href="#">程式語言</a> <a class="dropdown-item" href="#">投資理財</a> <a class="dropdown-item" href="#">職場技能</a> <a class="dropdown-item" href="#">手作</a> <a class="dropdown-item" href="#">烹飪</a> </div>
            </li>           
                <c:choose>
    			<c:when test="${!empty memberVO}">
				            <li class="nav-item"> <a class="nav-link " href="#" onclick="document.getElementById('viewAllMember').submit();return false;">${memberVO.memName}</a> </li> 
				            <li class="nav-item"> <a class="nav-link" href="<%= request.getContextPath()%>/MemberServlet?action=logout">登出</a> </li>
   				</c:when>
    			<c:otherwise>
    			<li class="nav-item"> <a class="nav-link" href="<%= request.getContextPath()%>/member/loginMember.jsp">登入</a> </li>
    		    <li class="nav-item"> <a class="nav-link" href="<%= request.getContextPath()%>/member/addMember.jsp">註冊</a> </li>
    			</c:otherwise>
				</c:choose>
            <li class="nav-item"> <a class="nav-link " href="<%= request.getContextPath()%>/member/listAllMember.jsp">關於我們</a> </li>
              <form id="viewAllMember" action="<%= request.getContextPath()%>/MemberServlet" method="get">
            <input type="hidden" name="inCludeVO"  value="member"> 
            <input type="hidden" name="action" value="changeValue">
            </form>	
          </ul>
        </div>
      </nav>
    </div>	
	<!-------------------------------------------------------------------------headerEnd------------------------------------------------------------------------->
<body>	
<c:if test="${not empty errorMsgs}">
<c:forEach var="message" items="${errorMsgs}">
<script>
Swal.fire(
		 '請檢查內容',
		  '${message}',
		  'error'
)
</script>
</c:forEach>
</c:if>  

<c:if test="${not empty successMsgs}">
<c:forEach var="successYa" items="${successMsgs}">
<script>
Swal.fire(
		 '恭喜您',
		 '${successYa}',
		  'success'
)
</script>
</c:forEach>
</c:if> 
		  
  <div class="container" id="body">
    <div class="row profile">
    	<div class="col-md-3">
    	<br>
			<div class="profile-sidebar">
				<div class="profile-usertitle">
					<div class="profile-usertitle-name">
					 <c:choose> 
 					 <c:when test="${teacherVO.teacherStatus==1}">${memberVO.memName} 老師 </c:when> 
  					 <c:otherwise>${memberVO.memName} 學生 </c:otherwise> 
					</c:choose> 
					</div>
						<div class="profile-usertitle-job">
<c:choose>
    <c:when test="${memberVO.memStatus==1}">
	 會員信箱 已驗證
    </c:when>
    <c:when test="${memberVO.memStatus==0}">
 	 會員信箱 待驗證
    </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>						
					</div>
				<div class="profile-usertitle-img" >
					<img style="display:block; margin:auto;" src="<%=request.getContextPath()%>/member/DBGifReader.do?memId=${memberVO.memId}" alt="Profile Picture" 
					class="img-responsive"  name="memImage" width="120" height="120">
					</div>			
				</div>
		
				<div class="profile-usermenu">
					<ul class="nav" id="classification">
						<li>
							<form id="form1" action="<%= request.getContextPath()%>/MemberServlet" method="get">
								<input type="hidden" name="inCludeVO"  value="member"> 
								<input type="hidden" name="action" value="changeValue">
							</form>	
							<a href="#" onclick="document.getElementById('form1').submit();return false;">							
							<i class="glyphicon glyphicon-member"></i>
							個人資料 </a>
						</li>
		
<c:if test="${!empty teacherVO}">
							<li id="teacher" >
							<form id="form2" action="<%= request.getContextPath()%>/MemberServlet" method="get">
								<input type="hidden" name="inCludeVO"  value="teacher"> 
								<input type="hidden" name="action" value="changeValue">
							</form>	
							<a href="#" onclick="document.getElementById('form2').submit();return false;">	
							<i class="glyphicon glyphicon-teacher"></i>
							課程管理 </a>
						</li>
</c:if> 
						<li id="inscourse" >
							<form id="form3" action="<%= request.getContextPath()%>/MemberServlet" method="get">
								<input type="hidden" name="inCludeVO"  value="inscourse"> 
								<input type="hidden" name="action" value="changeValue">
							</form>	
							<a href="#" onclick="document.getElementById('form3').submit();return false;">	
							<i class="glyphicon glyphicon-inscourse"></i>
							預約資訊</a>
						</li>
						<li id="record" >
						<form id="form4" action="<%= request.getContextPath()%>/MemberServlet" method="get">
								<input type="hidden" name="inCludeVO"  value="transactionRecord"> 
								<input type="hidden" name="action" value="changeValue">
							</form>	
							<a href="#" onclick="document.getElementById('form4').submit();return false;">	
							<i class="glyphicon glyphicon-transactionRecord"></i>
							交易紀錄 </a>
						</li>
					</ul>
				</div>
				<!-- END MENU -->
			</div>
		</div>
		<div class="col-md-9">
            <div class="profile-content">
<c:choose>
    <c:when test="${inCludeVO=='member'}">
   <%@ include file="/front-end/member/editMember.jsp"%>
    </c:when>
    <c:when test="${inCludeVO=='teacher'}">
  <%@ include file="/front-end/insctime/addinscTime.jsp"%>
    </c:when>
      <c:when test="${inCludeVO=='inscourse'}">
 <%@ include file="/front-end/coursereservation/allCourseUser.jsp"%>
    </c:when>
      <c:when test="${inCludeVO=='transactionRecord'}">
  <%@ include file="/front-end/withdrawalrecord/withdrawalrecord_findbykey.jsp"%>     
    </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>

			</div>
		</div>
	</div>
	
	
</div>
	</body>
<script>



</script>	
	
	
	<!-------------------------------------------------------------------------footerStart------------------------------------------------------------------------->
	 <footer class="section footer-classic context-dark bg-image footer navbar-fixed-bottom" style="background: #74b49b;">
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

<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<!-- 參考網站: https://xdsoft.net/jqplugins/datetimepicker/ -->
<link   rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
</html>