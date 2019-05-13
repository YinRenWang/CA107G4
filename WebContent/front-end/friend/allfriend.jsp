<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.friendnexus.model.*"%>

<% MemberVO memberVO = (MemberVO) request.getSession().getAttribute("memberVO"); %>

<%  
	MemberService memberSvc = new MemberService(); 
	List<MemberVO> list = memberSvc.getAll();
	pageContext.setAttribute("list", list);
%>


<jsp:useBean id="courseSvc" scope="page"
	class="com.course.model.CourseService" />
	
	<jsp:useBean id="friendnexusSvc" scope="page"
	class="com.friendnexus.model.FriendNexusService" />

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

<link href="https://cdn.bootcss.com/limonte-sweetalert2/7.33.1/sweetalert2.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/limonte-sweetalert2/7.33.1/sweetalert2.all.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<style type="text/css">
.friend {
	margin-top: auto;
}

.title.TitleImg {
	background-size: cover;
	
	background-image: url(<%=request.getContextPath()%>/front-end/Images/hero-image-wrapper.png);
	padding: 40px;
	margin-top: 76px;
}

.col-9 {;
	border: 1px solid;
}

h1 {
	margin-top: 0;
	margin-bottom: .5rem;
	color: white;
}

.container {
	margin-top: 3%;
}

img {
	width: 60px;
}

.row1 {
	margin-left: 250px;
	margin-top: -55px;
}

p {
	margin-top: 0;
	margin-bottom: 1rem;
	margin-left: 3px;
}

.flex-wrap {
	-ms-flex-wrap: wrap !important;
	flex-wrap: wrap !important;
	margin-top: 15px;
	background-color: #f4f9f4;
	color: brown;
}

.row {
	margin-bottom: 15px;
}

.col-4 {
	margin-top: 30px;
}

h6 {
	margin-left: 2px;
}
textarea{
   height:500px;
   width:700px;
}
.btn-primary {

    margin-left: 70px;
}
.btn-info {
    margin-top: 30px;
}
.btn btn-secondary {
     magin-top:30px;

}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<title>WeShare | 最棒的教育共享平台</title>
</head>
 <body>
	<!-------------------------------------------------------------------------headerStart------------------------------------------------------------------------->
	<div class="header headerImg">
		<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
			 <img src="<%= request.getContextPath()%>/front-end/Images/icon/logo.png" width="80" height="60" alt="" /><a
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
	<div class="title TitleImg">
		<h1 class="hader-title" style="text-align: center">建立您的&nbsp;好友關係</h1>
	</div>



	<c:if test="${not empty errorMsgs}">
		<c:forEach var="message" items="${errorMsgs}">
			<script>
				Swal.fire('請檢查內容', '${message}', 'error')
			</script>
		</c:forEach>
	</c:if>




	<div class="container">
			<div class="row">
				<div class="col-3">
			<FORM METHOD="get" ACTION="<%=request.getContextPath()%>/friendnexus/friendnexus.do" name="form1" id="form1">
				<div class="list-group" id="list-tab" role="tablist">	
		<!----------------------------------------------------------------------------------需登入帳號	--------------------------------------------------------------------------------------------->		
						<input type="hidden" name="memId" value="${memberVO.memId}">
					    <input type="hidden" name="action" value="getmyFriend">
						<input class="btn btn-secondary" type="submit" value="我的好友列表">
						<input type="hidden" name="action" value="getmyFriend">
						
						<a class="btn btn-secondary" href="<%=request.getContextPath()%>/front-end/friend/chatroom.jsp" role="button">聊天室</a>
						</Form>
						
				</div>
				
<!-- 				<input class="btn btn-secondary" type="submit" value="聊天室"> -->
				
			</div>
			<div class="col-9">
				<div class="tab-content" id="nav-tabContent">
					<!-- ----------------------------------------------------------第一頁---------------------------------------------- -->
					<div class="tab-pane fade show active" id="list-home"
						role="tabpanel" aria-labelledby="list-home-list">
						<div class="row">
							<div class="col-8">
								<%@ include file="page1.file"%>
								<c:forEach var="friendVO" items="${list}" begin="<%=pageIndex%>"
									end="<%=pageIndex+rowsPerPage-1%>">
									<div class="card flex-row flex-wrap">
										<div class="card-header border-0">
											<img src="<%=request.getContextPath()%>/member/DBGifReader.do?memId=${friendVO.memId}"
												width="100" height="50">
										</div>
										<FORM METHOD="get"
											ACTION="<%=request.getContextPath()%>/friendnexus/friendnexus.do"
											name="form1">
											<div class="card-block px-2">
												<div class="d-flex">
													<div>
														<input type="hidden" name="memId" value="${memberVO.memId}">
														<a class="user_name">姓名:${friendVO.memName}&nbsp;&nbsp;&nbsp;&nbsp;</a>
													<br> <input type="hidden" name="friendAcc" value="${friendVO.memId}">
														<a class="user_name">專長:&nbsp;${courseSvc.findOneById(friendVO.memSkill).courseName}</a><br>
														<a class="user_name">想學的課:&nbsp;${courseSvc.findOneById(friendVO.memWantSkill).courseName}</a>
													</div>
												</div>
												<div class="row1">
													<input type="hidden" name="action" value="insert1">
													<input type="submit" value="加入好友" class="btn btn-primary">
												</div>
											</div>
										</FORM>
										<div class="w-10"></div>
										<div class="card-footer w-100 text-muted ">
										<a href="yahoo.com.tw">查看個人資料</a>
										</div>
									</div>
								</c:forEach>
								<%@ include file="page2.file"%>
							</div>

							<div class="col-4">

								<ul class="list-group mb-3">

									<div class="card p-2">
										<h6 class="my-1">搜尋好友</h6>
										<FORM METHOD="get" ACTION="<%=request.getContextPath()%>/friendnexus/friendnexus.do">
									<div class="input-group">
								<input type="text" class="form-control" name="memName" placeholder="請輸入姓名">
								<div class="input-group-append">
								<button type="submit" class="btn btn-secondary">尋找</button>
								<input type="hidden" name="action" value="getOne_For_Display">
											</div>		
										</div>
										</FORM>
									</div>
									<div>
									
<!----------------------------------------------------------------------------------需登入帳號	--------------------------------------------------------------------------------------------->
									<FORM METHOD="get" ACTION="<%=request.getContextPath()%>/friendnexus/friendnexus.do">
									<input type="hidden" name="action" value="getmyFriendCheck">
									<input type="hidden" name="friendAcc" value="${memberVO.memId}">
									<input class="btn btn-info" type="submit" value="確認好友列表"></div>
								    </FORM>
								    
								</ul>
							</div>
						</div>
					</div>
					<!-- ----------------------------------------------------------聊天室---------------------------------------------- -->
					<div class="tab-pane fade" id="list-profile" role="tabpanel"
						aria-labelledby="list-profile-list">

						
	<h3 id="statusOutput" class="statusOutput"></h3>

	
					</div>
				</div>
			</div>
		</div>
	</div>
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