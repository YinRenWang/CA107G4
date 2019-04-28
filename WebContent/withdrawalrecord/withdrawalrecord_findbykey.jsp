<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>

<%@ page import="com.withdrawalrecord.model.*"%>

<%
	WithdrawalRecordService withdrawalRecordSvc = new WithdrawalRecordService();
	List<WithdrawalRecordVO> list = withdrawalRecordSvc.findByKey(request.getParameter("wrnum"));
	pageContext.setAttribute("list", list);
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
<link rel="stylesheet" type="text/css" href="css/G4.css ">
<link rel="stylesheet" type="text/css" href="css/point.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<title>WeShare | 最棒的教育共享平台</title>
</head>
<body>

	<!-------------------------------------------------------------------------headerStart------------------------------------------------------------------------->
	<div class="header headerImg">
		<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
			<img src="img/icon/logo.png" width="80" height="60" alt="" /><a
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
	<div class="container">
	<div class="p-4">
		<h3>個人交易紀錄</h3>

		<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
		
		

		
		<table class="table table-bordered track_tbl">
			<thead>
				<tr>
					<th></th>
					<th>訂單編號</th>
					<th>會員帳號</th>
					<th>交易金額</th>
					<th>交易日期</th>
				</tr>
			</thead>

			<%@ include file="page1.file"%>
			<c:forEach var="withdrawalRecordVO" items="${list}"
				begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">


				<tbody>
					<tr class="active">
						<td class="track_dot"><span class="track_line"></span></td>
						<td>${withdrawalRecordVO.wrnum}</td>
						<td>${withdrawalRecordVO.memid}</td>
						<td>${withdrawalRecordVO.wrmoney}</td>
						<td>${withdrawalRecordVO.wrtime}</td>
					</tr>

				</tbody>
				
			</c:forEach>
		</table>
		<%@ include file="page2.file"%>
	
	</div>
</div>


	<!-------------------------------------------------------------------------footerStart------------------------------------------------------------------------->
	<footer
		class="section footer-classic context-dark bg-image fixed-bottom"
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