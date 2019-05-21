<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.withdrawalrecord.model.*"%>

<%
	WithdrawalRecordService withdrawalRecordSvc = new WithdrawalRecordService();
	List<WithdrawalRecordVO> list = withdrawalRecordSvc.getAll();
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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/back-end/css/G4.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/back-end/css/point.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<title>WeShare | 最棒的教育共享平台</title>
<style type="text/css">




</style>
</head>
<body>
	<!-------------------------------------------------------------------------headerStart------------------------------------------------------------------------->

	<!-------------------------------------------------------------------------headerEnd------------------------------------------------------------------------->
	<div class="container">
	<div class="row">
	<div class="col-2">
	</div>
	<div class="col-10">
		<h3>交易紀錄</h3>	
		<FORM METHOD=GET ACTION="<%=request.getContextPath()%>/WithdrawalRecordServlet" name="form1">
		         <input type="hidden" name="action" value="findByKey2">
				 <input type="text" name="wrnum" > 
				
				
				<input type="submit" value="送出">
			</FORM>
		<table class="table table-bordered track_tbl">
			<thead>
				<tr>
					<th></th>
					<th></th>
					<th>訂單編號</th>
					<th>會員帳號</th>
					<th>交易金額</th>
					<th>交易日期</th>
				</tr>
			</thead>
		

			<%@ include file="page11.file"%>
			<c:forEach var="withdrawalRecordVO" items="${list}"
				begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
				<tbody>
					<tr class="active">
					<td></td>
				
						<td class="track_dot"><span class="track_line"></span></td>
			
						<td>${withdrawalRecordVO.wrnum}</td>
						<td>${withdrawalRecordVO.memid}</td>
						<td>${withdrawalRecordVO.wrmoney}</td>
						<td>${withdrawalRecordVO.wrtime}</td>
					</tr>

				</tbody>
				
			</c:forEach>
		</table>
		<%@ include file="page22.file"%>
	</div>
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
