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
<title>WeShare | 最棒的教育共享平台</title>
</head>
<body>

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

	
</body>
</html>