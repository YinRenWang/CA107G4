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
  <%@ include file="/front-end/backHeaderFooter/header.jsp"%>  
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
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/friendnexus/friendnexus.do" name="form1" id="form1">
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
								<c:forEach var="friendVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
								  <c:if test="${friendVO.memId  != memberVO.memId}">
									<div class="card flex-row flex-wrap">
										<div class="card-header border-0">
											<img src="<%=request.getContextPath()%>/member/DBGifReader.do?memId=${friendVO.memId}"
												width="120" height="60">
										</div>
										<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/friendnexus/friendnexus.do" name="form1">
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
									<a href="<%=request.getContextPath()%>/front-end/member/viewAsMember.jsp?memId=${friendVO.memId}">查看個人資料</a>
										</div>
									</div>
									</c:if>
								</c:forEach>
								<%@ include file="page2.file"%>
							</div>

							<div class="col-4">

								<ul class="list-group mb-3">

									<div class="card p-2">
										<h6 class="my-1">搜尋好友</h6>
										<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/friendnexus/friendnexus.do">
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
									<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/friendnexus/friendnexus.do">
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
<%@ include file="/front-end/backHeaderFooter/footer.jsp"%> 
	<!-------------------------------------------------------------------------footerEnd------------------------------------------------------------------------->
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		
		<script src="bower_components/sweetalert2/dist/sweetalert2.min.js"></script>
<link rel="stylesheet" href="bower_components/sweetalert2/dist/sweetalert2.min.css">

<!-- Include a polyfill for ES6 Promises (optional) for IE11 and Android browser -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
	<script type="text/javascript">
	  
	
	$( document ).ready(function() {
 		if ("${success1}"!=""){
 			swal(
 					  '已送出好友申請！',
 					  '你點擊了按鈕！',
 					  'success'
 					)
 		}
	});
	
	
		

</script>
</body>
</html>