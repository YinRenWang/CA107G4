<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>

<%@ page import="com.withdrawalrecord.model.*"%>
<jsp:useBean id="withdrawalRecordSvc" scope="page" class="com.withdrawalrecord.model.WithdrawalRecordService" />
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
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/point.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<title>WeShare | 最棒的教育共享平台</title>
</head>
<body>

	<!-------------------------------------------------------------------------headerStart------------------------------------------------------------------------->

	<!-------------------------------------------------------------------------headerEnd------------------------------------------------------------------------->
	<div class="container">
	<div class="row">
	<div class="col-2">
	</div>
	<div class="col-10">
				<br>
					<br>
						<br>
							<br>
			<h3>交易紀錄</h3>	
			    <form id="transactionRecord" action="<%= request.getContextPath()%>/AdministratorServlet" method="get">
				<input type="hidden" name="inCludeVO"  value="transactionRecord"> 
				<input type="hidden" name="action" value="changeValue">
				</form>	
			<a href="" onclick="document.getElementById('transactionRecord').submit();return false;" >
		
			<button type="button" class="btn btn-secondary">回上頁</button>
				<br>
					<br>
			</a>
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

            
           <c:forEach var="withdrawalRecordVO" items="${withdrawalRecordSvc.findByKey(param.wrnum)}">	
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
		
	
	</div>
</div>
</div>
	<!-------------------------------------------------------------------------footerEnd------------------------------------------------------------------------->
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>