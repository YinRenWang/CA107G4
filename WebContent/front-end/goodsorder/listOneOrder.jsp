<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.goodsorder.model.*"%>
<%@ page import="java.util.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<jsp:useBean id="goodsOrderSvc" scope="page" class="com.goodsorder.model.GoodsOrderService" />
<html>
<head>
<title>Order��� - listOneOrder.jsp</title>


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
				<th>�q��s��</th>
				<th>�|���s��</th>
				<th>�`����</th>
				<th>�q����</th>
				<th>����H</th>
				<th>����a�}</th>
				<th>�q��</th>
				<th>�q�檬�A</th>
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
							<c:when test="${goodsOrderVO.goodOrdStatus==0}">�����q��</c:when>
							<c:when test="${goodsOrderVO.goodOrdStatus==1}">���X�f</c:when>
							<c:when test="${goodsOrderVO.goodOrdStatus==2}">�X�f��</c:when>
							<c:otherwise>�q�槹��</c:otherwise>
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