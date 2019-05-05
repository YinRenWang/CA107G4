<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.member.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService" />
<jsp:useBean id="courseSvc" scope="page" class="com.course.model.CourseService" />

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
.page-header{
  text-align: center;    
}

/*social buttons*/
.btn-social{
  color: white;
  opacity:0.9;
}
.btn-social:hover {
  color: white;
    opacity:1;
}
.btn-facebook {
background-color: #3b5998;
opacity:0.9;
}
.btn-twitter {
background-color: #00aced;
opacity:0.9;
}
.btn-linkedin {
background-color:#0e76a8;
opacity:0.9;
}
.btn-github{
  background-color:#000000;
  opacity:0.9;
}
.btn-google {
  background-color: #c32f10;
  opacity: 0.9;
}
.btn-stackoverflow{
  background-color: #D38B28;
  opacity: 0.9;
}

/* resume stuff */

.bs-callout {
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    border-color: #eee;
    border-image: none;
    border-radius: 3px;
    border-style: solid;
    border-width: 1px 1px 1px 5px;
    margin-bottom: 5px;
    padding: 20px;
}
.bs-callout:last-child {
    margin-bottom: 0px;
}
.bs-callout h4 {
    margin-bottom: 10px;
    margin-top: 0;
}

.bs-callout-danger {
    border-left-color: #d9534f;
}

.bs-callout-danger h4{
    color: #d9534f;
}

.resume .list-group-item:first-child, .resume .list-group-item:last-child{
  border-radius:0;
}

/*makes an anchor inactive(not clickable)*/
.inactive-link {
   pointer-events: none;
   cursor: default;
}

.resume-heading .social-btns{
  margin-top:15px;
}
.resume-heading .social-btns i.fa{
  margin-left:-5px;
}



@media (max-width: 992px) {
  .resume-heading .social-btn-holder{
    padding:5px;
  }
}


/* skill meter in resume. copy pasted from http://bootsnipp.com/snippets/featured/progress-bar-meter */

.progress-bar {
    text-align: left;
	white-space: nowrap;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	cursor: pointer;
}

.progress-bar > .progress-type {
	padding-left: 10px;
}

.progress-meter {
	min-height: 15px;
	border-bottom: 2px solid rgb(160, 160, 160);
  margin-bottom: 15px;
}

.progress-meter > .meter {
	position: relative;
	float: left;
	min-height: 15px;
	border-width: 0px;
	border-style: solid;
	border-color: rgb(160, 160, 160);
}

.progress-meter > .meter-left {
	border-left-width: 2px;
}

.progress-meter > .meter-right {
	float: right;
	border-right-width: 2px;
}

.progress-meter > .meter-right:last-child {
	border-left-width: 2px;
}

.progress-meter > .meter > .meter-text {
	position: absolute;
	display: inline-block;
	bottom: -20px;
	width: 100%;
	font-weight: 700;
	font-size: 0.85em;
	color: rgb(160, 160, 160);
	text-align: left;
}

.progress-meter > .meter.meter-right > .meter-text {
	text-align: right;
}
</style>
<title>WeShare | 最棒的教育共享平台</title>
</head>
<body>
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
	<!-------------------------------------------------------------------------headerEnd------------------------------------------------------------------------->
<div class="container">
<div class="resume">
  <header class="page-header">
    <h1 class="page-title">${memberSvc.getOneMember(param.memId).memName}的個人介紹</h1>
  </header>
<div class="row">
  <div class="col-xs-12 col-sm-12 col-md-offset-1 col-md-10 col-lg-offset-2 col-lg-8">
    <div class="panel panel-default">
      <div class="panel-heading resume-heading">
        <div class="row">
          <div class="col-lg-12">
            <div class="col-xs-12 col-sm-4">
              <figure>
                <img class="img-circle img-responsive" alt="" src="<%=request.getContextPath()%>/member/DBGifReader.do?memId=${param.memId}">
              </figure>
              
              <div class="row">
                <div class="col-xs-12 social-btns">
                  
                   
                  
                    <div class="col-xs-3 col-md-1 col-lg-1 social-btn-holder">
                      <a href="#" class="btn btn-social btn-block btn-facebook">
                        <i class="fa fa-facebook"></i> </a>
                    </div>
                  
                    <div class="col-xs-3 col-md-1 col-lg-1 social-btn-holder">
                      <a href="#" class="btn btn-social btn-block btn-twitter">
                        <i class="fa fa-twitter"></i> </a>
                    </div>
                    
                     <div class="col-xs-3 col-md-1 col-lg-1 social-btn-holder">
                      <a href="#" class="btn btn-social btn-block btn-google">
                        <i class="fa fa-google"></i> </a>
                    </div>
                  <div class="col-xs-3 col-md-1 col-lg-1 social-btn-holder">
          <a class="btn icon-btn btn-warning" href="#" onclick="document.getElementById('addFriend').submit();return false;"> <span class="glyphicon btn-glyphicon glyphicon-plus img-circle text-warning"></span>加入好友</a>
                      </div>
                      
           <form id="addFriend" action="<%= request.getContextPath()%>/MemberServlet" method="get">
            <input type="hidden" name="inCludeVO"  value="member"> 
            <input type="hidden" name="action" value="changeValue">
            </form>	
                </div>
              </div>
              
            </div>

            <div class="col-xs-12 col-sm-8">
              <ul class="list-group">
                <li class="list-group-item">性別：
      			<c:choose>
    			<c:when test="${memberSvc.getOneMember(param.memId).memSex==0}">
    			男性
   				</c:when>
    			<c:otherwise>
    			女性
    			</c:otherwise>
				</c:choose>               
                </li>
                <li class="list-group-item">生日：
                <fmt:formatDate value="${memberSvc.getOneMember(param.memId).memBirth}" pattern="yyyy年MM月dd日"/>
                </li>
                <li class="list-group-item">來自：${fn:substring(memberSvc.getOneMember(param.memId).memAdd,0,6)}</li>
                <li class="list-group-item">信箱：${memberSvc.getOneMember(param.memId).memEmail}</li>
            
              </ul>
            </div>
          </div>
        </div>
      </div>
      
       <div class="bs-callout bs-callout-danger">
        <h4>擅長的技能</h4>
        <ul class="list-group">
            <div class="progress">
              <div data-placement="top" style="width: 80%;" 
              aria-valuemax="100" aria-valuemin="0" aria-valuenow="80" role="progressbar" class="progress-bar progress-bar-success">
                <span class="sr-only">90%</span>
                <span class="progress-type">${courseSvc.findOneById(memberSvc.getOneMember(param.memId).memSkill).courseName}</span>
              </div>
            </div>
        </ul>
      </div>
      
      <div class="bs-callout bs-callout-danger">
        <h4>想學的技能</h4>
        <ul class="list-group">
          <li class="list-group-item">${courseSvc.findOneById(memberSvc.getOneMember(param.memId).memWantSkill).courseName}</li>
        </ul>
      </div>
      
            <div class="bs-callout bs-callout-danger">
        <h4>個人介紹</h4>
        <p>
      ${memberSvc.getOneMember(param.memId).memText}
        </p>
      </div>
      
    </div>
  </div>
</div>
</div>
</div>
	<footer class="section footer-classic context-dark bg-image" style="background: #74b49b;">
  <div class="container">
    <div class="row row-30">
      <div class="col-md-4 col-xl-5">
        <div class="pr-xl-4"><a href="index.html"></a>
          <p class="reademe">我們是最佳的共享教育的平台，致力於在分享技能，保障交易，展現自我，使用戶得到最棒的學習體驗。</p>
          <!-- Rights-->
          <p class="rights"><span>©  </span><span class="copyright-year">2018</span><span> </span><span>WeShare教育共享平台</span><span>. </span><span>© All Rights Reserved.
            .</span></p>
        </div>
      </div>
      <div class="col-md-4" >
        <h5 class="reademe">聯絡我們</h5>
        <dl class="contact-list">
          <dt>地址:</dt>
          <dd>桃園市中壢區中大路300號</dd>
        </dl>
        <dl class="contact-list">
          <dt>信箱:</dt>
          <dd><a href="mailto:#">weshare@gmail.com</a></dd>
        </dl>
        <dl class="contact-list">
          <dt>電話:</dt>
          <dd><a href="tel:#">03-425-7387</a> </dd>
        </dl>
      </div>
      <div class="col-md-4 col-xl-3" >
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
    <div class="col"><a class="social-inner" href="#"><span class="icon mdi mdi-facebook"></span><span>Facebook</span></a></div>
    <div class="col"><a class="social-inner" href="#"><span class="icon mdi mdi-instagram"></span><span>instagram</span></a></div>
    <div class="col"><a class="social-inner" href="#"><span class="icon mdi mdi-twitter"></span><span>twitter</span></a></div>
    <div class="col"><a class="social-inner" href="#"><span class="icon mdi mdi-youtube-play"></span><span>google</span></a></div>
  </div>
</footer>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script> 
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>