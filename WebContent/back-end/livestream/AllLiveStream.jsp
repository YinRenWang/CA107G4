<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<jsp:useBean id="liveStreamSvc" scope="page" class="com.livestream.model.LiveStreamService" />
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
<script src="https://cdn.bootcss.com/limonte-sweetalert2/7.33.1/sweetalert2.all.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
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
	
	 $('#delete').click(function(){
		 Swal.fire({
			  title: '確認刪除該影片嗎?',
			  text: "確認刪除後將無法進行復原",
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes'
			}).then((result) => {
			  if (result.value) {
			    Swal.fire(
			      '刪除',
			      '該影片已刪除完畢',
			      'success'
			    )
			    $('#ddl').submit();
			  }
			})
	 });		


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
    
});

</script>
  
<title>WeShare | 最棒的教育共享平台</title>
</head>
<body>
	<!-------------------------------------------------------------------------headerStart------------------------------------------------------------------------->
	<!-------------------------------------------------------------------------headerEnd------------------------------------------------------------------------->
<div class="container" style="width:800px;">
	<div class="row">
		<section class="content" id="mytable">
			<div class="col-12">
				<div class="panel panel-default" >
					<div class="panel-body" >
						<div class="pull-right">
							<div class="btn-group">
								<button type="button" class="btn btn-default btn-filter" data-target="all">所有影片</button>
							</div>
						</div>
						<div class="table-container">
							<table class="table table-filter">
								<tbody>
								

				<jsp:useBean id="teacherSvc2" scope="page" class="com.teacher.model.TeacherService" />				
					<c:forEach var="liveStreamVO" items="${liveStreamSvc.getAllnoNull()}">			
									<tr data-status="pagado">
										<td>
								<form id="ddl" action="<%= request.getContextPath()%>/LiveStreamServlet" method="POST">
								<input type="hidden" name="action"  id="action" value="delete">
								<input type="hidden" name="lsId"  value="${liveStreamVO.lsId}">
								<button type="button" id="delete" class="btn btn-danger">刪除</button>
       							</form>
										</td>
										<td>
											<a href="javascript:;" class="star">
												<i class="glyphicon glyphicon-star"></i>
											</a>
										</td>
										<td>
											<div class="media">
												<a class="pull-left">
													<video width="240" height="160" id="${liveStreamVO.lsId}"  src="<%= request.getContextPath()%>/WebmDBServlet?lsId=${liveStreamVO.lsId}" controls="controls"  muted>
														您的瀏覽器不支援Video標籤QQ
												</video>
												</a>
												<div class="media-body" style="inline-block;">
												
													<br>
												
													<br>
														<h5 class="title" class="pull-left">
													上傳會員：${teacherSvc2.findOneById(liveStreamVO.teacherId).memId}
													</h5>
													<h5 class="title" class="pull-left">
													上傳日期：<fmt:formatDate value="${liveStreamVO.lsDate}" pattern="yyyy年MM月dd日 HH點mm分ss秒"/>
													</h5>
													
													<h5 class="summary pull-left">觀看次數：${liveStreamVO.lsViewNum}人次觀看</h5>
												
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
						<br>
<br>
<br>
					<br>
<br>
<br>
					<br>
<br>
<br>
					<br>
<br>
<br>
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
