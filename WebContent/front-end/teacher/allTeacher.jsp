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
		 alert("有進來");
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
	<!-------------------------------------------------------------------------headerEnd------------------------------------------------------------------------->
<div class="container" >
	<div class="row">
		<section class="content" id="mytable">
			<div class="col-12">
				<div class="panel panel-default" >
					<div class="panel-body" style="width:900px">
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
	<!-------------------------------------------------------------------------footerEnd------------------------------------------------------------------------->
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
