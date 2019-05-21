<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.friendnexus.model.*"%>

<%MemberVO memberVO = (MemberVO) request.getSession().getAttribute("memberVO");%>

<%MemberVO friendVO = (MemberVO) request.getSession().getAttribute("friendVO");%>



<jsp:useBean id="courseSvc" scope="page"
	class="com.course.model.CourseService" />

<jsp:useBean id="friendnexusSvc" scope="page"
	class="com.friendnexus.model.FriendNexusService" />
<jsp:useBean id="memberSvc" scope="page"
	class="com.member.model.MemberService" />

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
.col-8 {;
	border: 1px solid;
	height: 800px;
	width: 900px;
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
textarea {
	height: 200px;
	width: 700px;
}
.btn1 {
    margin-left: 260px;
    margin-top: -60px;;
	
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<title>WeShare | 最棒的教育共享平台</title>
</head>

<!-------------------------------------------------------------------------headerStart------------------------------------------------------------------------->
  <%@ include file="/front-end/backHeaderFooter/header.jsp"%> 
<!-------------------------------------------------------------------------headerEnd------------------------------------------------------------------------->
<div class="title TitleImg">
	<h1 class="hader-title" style="text-align: center">我的好友列表</h1>
</div>
<div class="container">
	<div class="row">
		<div class="col-3">
			<div class="list-group" id="list-tab" role="tablist">
<a class="btn btn-secondary" href="<%=request.getContextPath()%>/front-end/friend/allfriend.jsp" role="button">返回推薦的好友</a>
				
			</div>
		</div>
		<div class="col-9">
			<div class="tab-content" id="nav-tabContent">
				<!-- ----------------------------------------------------------第一頁---------------------------------------------- -->
				<div class="tab-pane fade show active" id="list-home"
					role="tabpanel" aria-labelledby="list-home-list">
					<div class="row">
						<div class="col-8">
							
							
								<div class="card flex-row flex-wrap">
									<div class="card-header border-0">
										<img 
											src="<%=request.getContextPath()%>/member/DBGifReader.do?memId=${friendVO.memId}"
											width="100" height="50">
									</div>
									<FORM METHOD="get"
										ACTION="<%=request.getContextPath()%>/friendnexus/friendnexus.do"
										name="form1">
										<div class="card-block px-2">
											<div class="d-flex">
												<div>
<!-- 												自己 -->
													<input type="hidden" name="memId" value="${memberVO.memId}">
													<input type="hidden" name="friendstatus" value="${friendNexusVO.friendstatus}"> 
														
<!-- 														朋友帳號 -->
													<input type="hidden" name="friendAcc" value="${friendVO.memId}"> 
													<div class="wrod">
													<a class="user_name">姓名:${friendVO.memName}&nbsp;&nbsp;&nbsp;&nbsp;</a>
													<a class="user_name">ID:${friendVO.memId}</a><br>
													<a class="user_name">專長:${courseSvc.findOneById(friendVO.memSkill).courseName}&nbsp;</a><br>
								                    <a class="user_name">想學的課:${courseSvc.findOneById(friendVO.memWantSkill).courseName}&nbsp;</a>
												</div>
										<div class="btn1">
											<input type="hidden" name="action" value="insert1"> 
											<input type="submit" value="加入好友" class="btn btn-primary">
											
										</div>		
												</div>	
											</div>
										</div>
									</FORM>
									<div class="w-10"></div>
									<div class="card-footer w-100 text-muted ">
										<a href="yahoo.com.tw">查看個人資料</a>
										
									</div>
								</div>
						
						
						</div>

						<div class="col-4">

							<ul class="list-group mb-3">

								<div class="card p-2">
									<h6 class="my-1">搜尋好友</h6>
									<div class="input-group">
									<FORM METHOD="get" ACTION="<%=request.getContextPath()%>/friendnexus/friendnexus.do">
									<div class="input-group">
								<input type="text" class="form-control" name="memName" placeholder="請輸入姓名">
								<div class="input-group-append">
								<button type="submit" class="btn btn-secondary">尋找</button>
								<input type="hidden" name="action" value="getOne_For_Display">
								</FORM>
										</div>
									</div>
								</div>
								
							</ul>
							<div class="but">
									<FORM METHOD="get" ACTION="<%=request.getContextPath()%>/friendnexus/friendnexus.do">
									<input type="hidden" name="action" value="getmyFriendCheck">
									<input type="hidden" name="friendAcc" value="${friendVO.memId}">
									<input class="btn btn-info" type="submit" value="確認好友列表"></div>
								    </FORM>
								</div>
						</div>
					</div>
				</div>
			</div>
			<!-- ----------------------------------------------------------第二頁---------------------------------------------- -->
		</div>
	</div>
</div>
<!-------------------------------------------------------------------------footerStart------------------------------------------------------------------------->
<%@ include file="/front-end/backHeaderFooter/footer.jsp"%> 
<!-------------------------------------------------------------------------footerEnd------------------------------------------------------------------------->
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>