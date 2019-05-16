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
<title>${memberVO.memName}的個人資料</title></head>

	<!-------------------------------------------------------------------------headerStart------------------------------------------------------------------------->

<%@ include file="/front-end/backHeaderFooter/header.jsp"%>  
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
    <c:when test="${memberSvc.getOneMemberNoImg(memberVO.memId).memStatus==1}">
	 會員信箱 已驗證
    </c:when>
    <c:when test="${memberSvc.getOneMemberNoImg(memberVO.memId).memStatus==0}">
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

<c:if test="${!empty teacherVO}">						
							<li id="goods" >
						<form id="form4" action="<%= request.getContextPath()%>/MemberServlet" method="get">
								<input type="hidden" name="inCludeVO"  value="goods"> 
								<input type="hidden" name="action" value="changeValue">
							</form>	
							<a href="#" onclick="document.getElementById('form4').submit();return false;">	
							<i class="glyphicon glyphicon-transactionRecord"></i>
							商品管理 </a>
						</li>
</c:if> 

							<li id="goodsOrder" >
						<form id="form5" action="<%= request.getContextPath()%>/MemberServlet" method="get">
								<input type="hidden" name="inCludeVO"  value="goodsOrder"> 
								<input type="hidden" name="action" value="changeValue">
							</form>	
							<a href="#" onclick="document.getElementById('form5').submit();return false;">	
							<i class="glyphicon glyphicon-transactionRecord"></i>
							訂單資訊 </a>
						</li>
						
						<li id="wallet" >
						<form id="form8" action="<%= request.getContextPath()%>/MemberServlet" method="get">
								<input type="hidden" name="inCludeVO"  value="wallet"> 
								<input type="hidden" name="action" value="changeValue">
							</form>	
							<a href="#" onclick="document.getElementById('form8').submit();return false;">	
							<i class="glyphicon glyphicon-transactionRecord"></i>
							We幣錢包 </a>
						</li>
						
						
<c:if test="${!empty teacherVO}">						
							<li id="liveStream" >
						<form id="form7" action="<%= request.getContextPath()%>/MemberServlet" method="get">
								<input type="hidden" name="inCludeVO"  value="liveStream"> 
								<input type="hidden" name="action" value="changeValue">
							</form>	
							<a href="#" onclick="document.getElementById('form7').submit();return false;">	
							<i class="glyphicon glyphicon-transactionRecord"></i>
							直播管理 </a>
						</li>
</c:if> 
						
						
						
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
     <c:when test="${inCludeVO=='goods'}">
  <%@ include file="/front-end/goods/listAllGoods.jsp"%>     
    </c:when>
     <c:when test="${inCludeVO=='goodsOrder'}">
  <%@ include file="/front-end/goodsorder/select_order.jsp"%>     
    </c:when>
    <c:when test="${inCludeVO=='liveStream'}">
  <%@ include file="/front-end/livestream/allLiveStreamUser.jsp"%>     
    </c:when>
      <c:when test="${inCludeVO=='wallet'}">
  <%@ include file="/front-end/withdrawalrecord/withdrawalrecordforInclude.jsp"%>     
    </c:when>
    <c:otherwise>
    <%@ include file="/front-end/member/editMember.jsp"%>
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
<%@ include file="/front-end/backHeaderFooter/footer.jsp"%> 
<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<!-- 參考網站: https://xdsoft.net/jqplugins/datetimepicker/ -->
<link   rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
</html>