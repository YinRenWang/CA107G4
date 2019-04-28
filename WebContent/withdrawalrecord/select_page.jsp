<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>IBM WithdrawalRecord: Home</title>

<style>
table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
	border: 3px ridge Gray;
	height: 80px;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td><h3>IBM WithdrawalRecord: Home</h3>
				<h4>( MVC )</h4></td>
		</tr>
	</table>

	<p>This is the Home page for IBM WithdrawalRecord: Home</p>

	<h3>資料查詢:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<ul>
		<li><a href='listAllEmp.jsp'>List</a> all WithdrawalRecords. <br>
			<br></li>


		<li>
			<FORM METHOD="post" ACTION="withdrawalRecord.do">
				<b>輸入訂單編號 (如WI00001):</b> <input type="text" name="wrnum"> 
				<input type="hidden" name="action" value="findByKey">
				<!--value="findByKey" -->
				<input type="submit" value="送出">
			</FORM>
		</li>

		<jsp:useBean id="withdrawalRecordSvc" scope="page"
			class="com.withdrawalrecord.model.WithdrawalRecordService" />

		<li>
			<FORM METHOD="get" ACTION="withdrawalRecord.do">
				<b>選擇訂單編號:</b> <select size="1" name="wrnum">
					<c:forEach var="withdrawalRecordVO"
						items="${withdrawalRecordSvc.all}">
						<option value="${withdrawalRecordVO.wrnum}">${withdrawalRecordVO.wrnum}
					</c:forEach>
				</select> <input type="hidden" name="action" value="findByKey"> <input
					type="submit" value="送出">
			</FORM>
		</li>

		<li>
			<FORM METHOD="post" ACTION="withdrawalRecord.do">
				<b>選擇會員帳號:</b> <select size="1" name="wrnum">
					<c:forEach var="withdrawalRecordVO"
						items="${withdrawalRecordSvc.all}">
						<option value="${withdrawalRecordVO.wrnum}">${withdrawalRecordVO.memid}
					</c:forEach>
				</select> <input type="hidden" name="action" value="findByKey"> <input
					type="submit" value="送出">
			</FORM>
		</li>
	</ul>


	<h3>會員管理</h3>

	<ul>
		<li><a href='addWithdrawalRecord.jsp'>Add</a> a new
			WithdrawalRecord.</li>
	</ul>

</body>
</html>