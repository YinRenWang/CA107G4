<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="teacherSvc" scope="page" class="com.teacher.model.TeacherService" />
<jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService" />
<%int pagado=0; %>
<%int pendiente=0; %>
<%int cancelado=0; %>
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
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script 
	src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<script 
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>	
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    
<style>
body {
	font-family: 'Open Sans', sans-serif;
	color: #353535;
}
.content h1 {
	text-align: center;
}
.content .content-footer p {
	color: #6d6d6d;
    font-size: 12px;
    text-align: center;
}
.content .content-footer p a {
	color: inherit;
	font-weight: bold;
}

/*	--------------------------------------------------
	:: Table Filter
	-------------------------------------------------- */
.panel {
	border: 1px solid #ddd;
	background-color: #fcfcfc;
}
.panel .btn-group {
	margin: 15px 0 30px;
}
.panel .btn-group .btn {
	transition: background-color .3s ease;
}
.table-filter {
	background-color: #fff;
	border-bottom: 1px solid #eee;
}
.table-filter tbody tr:hover {
	cursor: pointer;
	background-color: #eee;
}
.table-filter tbody tr td {
	padding: 10px;
	vertical-align: middle;
	border-top-color: #eee;
}
.table-filter tbody tr.selected td {
	background-color: #eee;
}
.table-filter tr td:first-child {
	width: 38px;
}
.table-filter tr td:nth-child(2) {
	width: 35px;
}
.ckbox {
	position: relative;
}
.ckbox input[type="checkbox"] {
	opacity: 0;
}
.ckbox label {
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}
.ckbox label:before {
	content: '';
	top: 1px;
	left: 0;
	width: 18px;
	height: 18px;
	display: block;
	position: absolute;
	border-radius: 2px;
	border: 1px solid #bbb;
	background-color: #fff;
}
.ckbox input[type="checkbox"]:checked + label:before {
	border-color: #2BBCDE;
	background-color: #2BBCDE;
}
.ckbox input[type="checkbox"]:checked + label:after {
	top: 3px;
	left: 3.5px;
	content: '\e013';
	color: #fff;
	font-size: 11px;
	font-family: 'Glyphicons Halflings';
	position: absolute;
}
.table-filter .star {
	color: #ccc;
	text-align: center;
	display: block;
}
.table-filter .star.star-checked {
	color: #F0AD4E;
}
.table-filter .star:hover {
	color: #ccc;
}
.table-filter .star.star-checked:hover {
	color: #F0AD4E;
}
#mytable{
width:100%;
margin-bottom:280px;
}



</style>

<script>
$(document).ready(function () {

	$('.star').on('click', function () {
      $(this).toggleClass('star-checked');
    });

    $('.ckbox label').on('click', function () {
      $(this).parents('tr').toggleClass('selected');
    });

    $('.btn-filter').on('click', function () {
      var $target = $(this).data('target');
      if ($target != 'all') {
        $('.table tr').css('display', 'none');
        $('.table tr[data-status="' + $target + '"]').fadeIn('slow');
      } else {
        $('.table tr').css('display', 'none').fadeIn('slow');
      }
    });
    

	 $("#select1").change(function(){
		 $('#form1').submit();
		  });
	 $("#select2").change(function(){
		 $('#form2').submit();
		  });
	 $("#select3").change(function(){
		 $('#form3').submit();
		  });

 });
</script>
  
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
<div class="container" >
	<div class="row">
		<section class="content" id="mytable">
			<h1>老師列表</h1>
			<div class="col-12">
				<div class="panel panel-default" >
					<div class="panel-body">
						<div class="pull-right">
							<div class="btn-group">
								<button type="button" class="btn btn-success btn-filter" data-target="pagado">已審核</button>
								<button type="button" class="btn btn-warning btn-filter" data-target="pendiente">待審核</button>
								<button type="button" class="btn btn-danger btn-filter" data-target="cancelado">已停權</button>
								<button type="button" class="btn btn-default btn-filter" data-target="all">所有狀態</button>
							</div>
						</div>
						<div class="table-container">
							<table class="table table-filter">
								<tbody>
								

								
					<c:forEach var="teacherVO0" items="${teacherSvc.getAllStatus(1)}">			
									<tr data-status="pagado">
										<td>
								<form id="form1" action="<%= request.getContextPath()%>/TeacherServlet" method="GET">
								<input type="hidden" name="action"  id="action" value="updateStatus">
								<input type="hidden" name="teacherId"  value="${teacherVO0.teacherId}">
								<select size="1" name="teacherStatus" id="select1">
          									<option value="1"> 已審核
         									 <option value="2"> 已停權
         									 <option value="0"> 待審核
       							</select>
       							</form>
										</td>
										<td>
											<a href="javascript:;" class="star">
												<i class="glyphicon glyphicon-star"></i>
											</a>
										</td>
										<td>
											<div class="media">
												<a href="#" class="pull-left">
													<img src="<%=request.getContextPath()%>/member/DBGifReader.do?memId=${teacherVO0.memId}" 
													 											width="120" height="120"class="media-photo">
												</a>
												<div class="media-body" style="inline-block;">
													<h4 class="title">
														${memberSvc.getOneMember(teacherVO0.memId).memName}
														<span class="pull-right pagado">文件證明</span>
														<span class="pull-right pagado">
			<img src="<%=request.getContextPath()%>/teacher/DBGifReader_VER2.do?memId=${teacherVO0.memId}" width="120" height="120"class="media-photo"></span>
													</h4>
													
													<h5 class="summary">教育程度-${teacherVO0.teacherEdu}</h5>
												
													<h5 class="summary">個人介紹-${teacherVO0.teacherText}</h5>
												</div>
											</div>
										</td>
									</tr>
							</c:forEach>
							
							
							
							<c:forEach var="teacherVO0" items="${teacherSvc.getAllStatus(0)}">	
							<input type="hidden" name="inscType"  value="${param.inscType}">		
									<tr data-status="pendiente">
										<td>
								<form id="form2" action="<%= request.getContextPath()%>/TeacherServlet" method="GET">
								<input type="hidden" name="action"  id="action" value="updateStatus">
								<input type="hidden" name="teacherId"  value="${teacherVO0.teacherId}">		
										<select size="1" name="teacherStatus" id="select2">
          									<option value="0"> 待審核
         									 <option value="1"> 已審核
         									 <option value="2"> 已停權
       									</select>
       							</form>		
										</td>
										<td>
											<a href="javascript:;" class="star">
												<i class="glyphicon glyphicon-star"></i>
											</a>
										</td>
										<td>
											<div class="media">
												<a href="#" class="pull-left">
													<img src="<%=request.getContextPath()%>/member/DBGifReader.do?memId=${teacherVO0.memId}" 
													 											width="120" height="120"class="media-photo">
												</a>
												<div class="media-body" style="inline-block;">
													<h4 class="title">
														${memberSvc.getOneMember(teacherVO0.memId).memName}
														<span class="pull-right pendiente">文件證明</span>
														<span class="pull-right pendiente">
			<img src="<%=request.getContextPath()%>/teacher/DBGifReader_VER2.do?memId=${teacherVO0.memId}" width="120" height="120"class="media-photo"></span>
													</h4>
													
													<h5 class="summary">教育程度-${teacherVO0.teacherEdu}</h5>
												
													<h5 class="summary">個人介紹-${teacherVO0.teacherText}</h5>
												</div>
											</div>
										</td>
									</tr>
							</c:forEach>	
							
							
								<c:forEach var="teacherVO0" items="${teacherSvc.getAllStatus(2)}">			
									<tr data-status="cancelado">
										<td>
								<form id="form3" action="<%= request.getContextPath()%>/TeacherServlet" method="GET">
								<input type="hidden" name="action"  id="action" value="updateStatus">
								<input type="hidden" name="teacherId"  value="${teacherVO0.teacherId}">	
										<select size="1" name="teacherStatus" id="select3">
          									 <option value="2"> 已停權
         									 <option value="1"> 已審核
         									 <option value="0"> 待審核
       										</select>
								</form>
										</td>
										<td>
											<a href="javascript:;" class="star">
												<i class="glyphicon glyphicon-star"></i>
											</a>
										</td>
										<td>
											<div class="media">
												<a href="#" class="pull-left">
													<img src="<%=request.getContextPath()%>/member/DBGifReader.do?memId=${teacherVO0.memId}" 
													 											width="120" height="120"class="media-photo">
												</a>
												<div class="media-body" style="inline-block;">
													<h4 class="title">
														${memberSvc.getOneMember(teacherVO0.memId).memName}
														<span class="pull-right cancelado">文件證明</span>
														<span class="pull-right cancelado">
			<img src="<%=request.getContextPath()%>/teacher/DBGifReader_VER2.do?memId=${teacherVO0.memId}" width="120" height="120"class="media-photo"></span>
													</h4>
													
													<h5 class="summary">教育程度-${teacherVO0.teacherEdu}</h5>
												
													<h5 class="summary">個人介紹-${teacherVO0.teacherText}</h5>
												</div>
											</div>
										</td>
									</tr>
							</c:forEach>						
							
					
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="content-footer">
					<p>
					
					</p>
				</div>
			</div>
		</section>
		
	</div>
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
