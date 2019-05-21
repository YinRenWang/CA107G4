<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>

<%@ page import="com.withdrawalrecord.model.*"%>
<%@ page import="com.member.model.*"%>

<%
	WithdrawalRecordService withdrawalRecordSvc = new WithdrawalRecordService();
	MemberVO memberVO=(MemberVO)request.getSession().getAttribute("memberVO");
	List<WithdrawalRecordVO> list = withdrawalRecordSvc.findByKey(memberVO.getMemId());
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
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/G4.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/withdrawalrecord/css/point.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<style type="text/css">
body {
	margin:auto;
    padding:0;
    background: #f4f9f4;
    width: 100%;
}
#footer {
    background-color: green;
}
.cardPadding {
    padding-top: 5%;
    padding-bottom: 5%;
    padding-right: 10%;
    padding-left: 10%;
}
.cardPadding-title {
    padding-bottom: 3%;
    padding-left: 2%;
}
.cardPadding-title .img-thumbnail {
    display: inline;
}
.cardPadding-title h5 {
    display: inline;
}
.teacherImg {
    width: 120px;
    height: 120px;
     background-size:cover;
    border-radius: 60px;
	border: 2px #fff solid;
    line-height: 60px;
    font-size: 14px;
    text-align: center;
    top: -7.5%;
    position: absolute;
}
.search {
    background: -webkit-linear-gradient(left, #a7d7c5, #5c8d89);
    opacity: 0.5;
}
#df1 {
    padding-left: 30%;
}
#df4 {
    padding-right: 30%;
}
.form-control {
    margin-bottom: 2%;
}
.search-title {
    padding: 0.35%;
}
.context-dark, .bg-gray-dark, .bg-primary {
    color: rgba(255, 255, 255, 0.8);
}
.footer-classic a, .footer-classic a:focus, .footer-classic a:active {
    color: #ffffff;
}
.nav-list li {
    padding-top: 5px;
    padding-bottom: 5px;
}
.nav-list li a:hover:before {
    margin-left: 0;
    opacity: 1;
    visibility: visible;
}
ul, ol {
    list-style: none;
    padding: 0;
    margin: 0;
}
.social-inner {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 100%;
    padding: 23px;
    font: 900 13px/1 "Lato", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
    text-transform: uppercase;
    color: rgba(255, 255, 255, 0.5);
}
.social-container .col {
    border: 1px solid rgba(255, 255, 255, 0.1);
}
.nav-list li a:before {
    content: "\f14f";
    font: 400 21px/1 "Material Design Icons";
    color: #4d6de6;
    display: inline-block;
    vertical-align: baseline;
    margin-left: -28px;
    margin-right: 7px;
    opacity: 0;
    visibility: hidden;
    transition: .22s ease;
}
.reademe {
    margin-top: 11%;
}
.reademe2 {
    margin-top: 15%;
}
.brand {
}
.wrapCenter {
	margin: auto;
    margin-top: 4%;
	max-width: 1200px;
    justify-content: center;
    border: 2px solid #cccccc;
    border-radius: 10px;
    box-sizing: border-box;
    width: 100%;
    display: flex;
   
}
.itemCenter {
    width: calc(100% - 20px);
    margin: 10px;
    height: 120px;
}
.itemCenter {
    width: calc(100% - 20px);
    margin: 10px;
    height: 120px;
    display: flex;
}
.itemCenter img {
    margin-top: 8.5%;
    margin-left: 7.5%;
}
.itemCenter p {
    text-align: center;
    letter-spacing: 1px;
    line-height: 110px;
}
	.row {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    width: 100%
	
}
.row .card-header {
    text-align: center;
}
.course-deck {
  
    min-width:100%;
}
.img-fluid {
    width: 100%;
    border-radius: calc(.25rem - 1px);
}
.header{
		width: 100%;
		box-sizing: border-box;
		ma
}
</style>
	
<title>WeShare | 最棒的教育共享平台</title>
</head>
<body>
  <%@ include file="/front-end/backHeaderFooter/header.jsp"%>   

	<!-------------------------------------------------------------------------headerStart------------------------------------------------------------------------->
	<!-------------------------------------------------------------------------headerEnd------------------------------------------------------------------------->
	<div class="container">
	<div class="p-4">
		<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
			
	
				<br>
					<br>
						<br>
							<br>
								<br>

		<table class="table table-bordered track_tbl">
		<a  href="<%=request.getContextPath()%>/front-end/team/team.jsp" >
				<button type="button" class="btn btn-info">返回揪團</button>
				</a>
				<br>
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
	
	
  <%@ include file="/front-end/backHeaderFooter/footer.jsp"%> 

	<!-------------------------------------------------------------------------footerStart------------------------------------------------------------------------->

	
</body>
</html>