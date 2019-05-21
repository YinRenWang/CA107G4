<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.goodsorder.model.*"%>
<%@ page import="java.util.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<jsp:useBean id="goodsOrderSvc" scope="page" class="com.goodsorder.model.GoodsOrderService" />
<html>
<head>
<title>Order資料 - listOneOrder.jsp</title>


<style>
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
	margin-top: 5%;
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

<style>
table {
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 5px;
	text-align: center;
}



</style>

</head>
<body bgcolor='white'>

<center>
<br>
<br>
<br>

	
		<table>
			<tr>
				<th>訂單編號</th>
				<th>會員編號</th>
				<th>總價格</th>
				<th>訂單日期</th>
				<th>收件人</th>
				<th>收件地址</th>
				<th>電話</th>
				<th>訂單狀態</th>
			</tr>
	
			<c:forEach var="goodsOrderVO" items="${goodsOrderSvc.getMemOrder(memberVO.memId)}">
				<tr>
					<td>${goodsOrderVO.goodOrderId}</td>
					<td>${goodsOrderVO.memId}</td>
					<td>${goodsOrderVO.goodTotalPrice}</td>
					<td>${goodsOrderVO.goodDate}</td>
					<td>${goodsOrderVO.buyerName}</td>
					<td>${goodsOrderVO.buyerAddress}</td>
					<td>${goodsOrderVO.buyerPhone}</td>
					<td><c:choose>
							<c:when test="${goodsOrderVO.goodOrdStatus==0}">取消訂單</c:when>
							<c:when test="${goodsOrderVO.goodOrdStatus==1}">未出貨</c:when>
							<c:when test="${goodsOrderVO.goodOrdStatus==2}">出貨中</c:when>
							<c:otherwise>訂單完成</c:otherwise>
						</c:choose></td>
				</tr>
			</c:forEach>

		</table>
	</div>
	<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
</center>


</body>
</html>