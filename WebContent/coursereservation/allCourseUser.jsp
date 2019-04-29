<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="teacherSvc" scope="page" class="com.teacher.model.TeacherService" />
<jsp:useBean id="CourseReservationSvc" scope="page" class="com.coursereservation.model.CourseReservationService" />

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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
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

#down{
padding-top:20px;
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
	 $("#basicModal").modal({show: true});


 });
</script>
  
<title>WeShare | 預約資訊</title>
</head>
<body>
	<!-------------------------------------------------------------------------headerStart------------------------------------------------------------------------->
	<!-------------------------------------------------------------------------headerEnd------------------------------------------------------------------------->
<div class="container" >
	<div class="row">
		<section class="content" id="mytable">
			<div class="col-8">
				<div class="panel panel-default" >
					<div class="panel-body">
						<div class="pull-right">
							<div class="btn-group">
								<button type="button" class="btn btn-success btn-filter" data-target="pagado">您預定的</button>
								<button type="button" class="btn btn-warning btn-filter" data-target="pendiente">您收到的</button>
								<button type="button" class="btn btn-default btn-filter" data-target="all">所有狀態</button>
							</div>
						</div>
						<div class="table-container">
							<table class="table table-filter">
								<tbody>
									
					<c:forEach var="listMember" items="${CourseReservationSvc.findByPrimaryKey((1),(memberVO.memId))}">	
									<tr data-status="pagado">
										<td>
											<div class="media">
												<div class="pull-left">
													<img src="<%=request.getContextPath()%>/member/DBGifReader.do?memId=${teacherSvc.findOneById(listMember.teacherId).memId}" 
													 											width="120" height="120"class="media-photo">
												</div>
												<div class="media-body" >
													<h5 class="title">
													<A href="<%= request.getContextPath()%>/coursereservation/courseOrder.jsp?crvId=${listMember.crvId}">
													
														<span class="pull-right pagado">檢視詳情</span>
														<span class="pull-right pagado">
			<img src="<%=request.getContextPath()%>/teacher/DBGifReader_VER2.do?memId=${teacherVO0.memId}" width="120" height="120"class="media-photo"></span>
													</a>
													</h5>
													<h5 class="title">老師姓名：
														${memberSvc.getOneMember(teacherSvc.findOneById(listMember.teacherId).memId).memName}			
													</h5>
													<h5 class="summary">
														<span class="pull-center pagado">上課時間：</span>
													<span class="pull-center pagado">
													 <fmt:formatDate value="${listMember.crvMFD}" pattern="yyyy年M月dd日 HH時mm分"/>-
													 <fmt:formatDate value="${listMember.crvEXP}" pattern="HH時mm分"/></span>
														</h5>
												<h5 class="summary">
													<span class="pull-right pagado">
													<c:choose>
    												<c:when test="${listMember.classStatus==1}">
													 已上課
   													</c:when>
    												<c:otherwise>
    												未上課
    												</c:otherwise>
													</c:choose></span>
													<span class="pull-right pagado">課程狀態：</span>
														</h5>	
												</div>
											</div>
										</td>
									</tr>
							</c:forEach>
							
							
							<c:forEach var="listMember" items="${CourseReservationSvc.findByPrimaryKey((1),(teacherVO.teacherId))}">	
									<tr data-status="pendiente">
										<td>
											<div class="media">
												<div class="pull-left">
													<img src="<%=request.getContextPath()%>/member/DBGifReader.do?memId=${listMember.memId}" 
													 											width="120" height="120"class="media-photo">
												</div>
												<div class="media-body" >
													<h5 class="title">
													<A href="<%= request.getContextPath()%>/coursereservation/courseOrder.jsp?crvId=${listMember.crvId}">
														
														<span class="pull-right pendiente">檢視詳情</span>
														<span class="pull-right pendiente">
			<img src="<%=request.getContextPath()%>/teacher/DBGifReader_VER2.do?memId=${teacherVO0.memId}" width="120" height="120"class="media-photo"></span>
													</a>
													</h5>
													<h5 class="title">學生姓名：
														${memberSvc.getOneMember(listMember.memId).memName}			
													</h5>
													<h5 class="summary">
														<span class="pull-center pendiente">上課時間：</span>
													<span class="pull-center pendiente">
													 <fmt:formatDate value="${listMember.crvMFD}" pattern="yyyy年M月dd日 HH時mm分"/>-
													 <fmt:formatDate value="${listMember.crvEXP}" pattern="HH時mm分"/></span>
														</h5>
												<h5 class="summary">
													<span class="pull-right pendiente">
													<c:choose>
    												<c:when test="${listMember.classStatus==1}">
													 已上課
   													</c:when>
    												<c:otherwise>
    												未上課
    												</c:otherwise>
													</c:choose></span>
													<span class="pull-right pendiente">課程狀態：</span>
														</h5>	
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
		<c:if test="${openModal!=null}">

<div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
				
			<div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3 class="modal-title" id="myModalLabel">The Bootstrap modal-header</h3>
            </div>
			
			<div class="modal-body">
<!-- =========================================以下為原listOneEmp.jsp的內容========================================== -->
               <jsp:include page="/coursereservation/courseOrder.jsp" />
<!-- =========================================以上為原listOneEmp.jsp的內容========================================== -->
			</div>
			
			<div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
		
		</div>
	</div>
</div>
 </c:if>
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
