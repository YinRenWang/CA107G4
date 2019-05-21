<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.goodsorder.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    GoodsOrderService orderSvc = new GoodsOrderService();
    List<GoodsOrderVO> list = orderSvc.getAllOrder();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>所有訂單資料 - listAllOrder.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
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

<style>
  table {
	width: 800px;
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

<h4>此頁練習採用 EL 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>所有員工資料 - listAllEmp.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>訂單編號</th>
		<th>會員</th>
		<th>總價格</th>
		<th>訂單日期</th>
		<th>收件人</th>
		<th>收件地址</th>
		<th>電話</th>
		<th>訂單狀態</th>
	
	</tr>
	<%@ include file="pages/page1.file" %> 
	<c:forEach var="orderVO" items="${list}" >
		
		<tr>
			<td>${orderVO.goodOrderId}</td>
			<td>${orderVO.memId}</td>
			<td>${orderVO.goodTotalPrice}</td>
			<td>${orderVO.goodDate}</td>
			<td>${orderVO.buyerName}</td>
			<td>${orderVO.buyerAddress}</td> 
			<td>${orderVO.buyerPhone}</td>
			<td>${orderVO.goodOrdStatus}</td>
			
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/goodsorder/goodsorder.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="goodOrderId"  value="${orderVO.goodOrderId}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			
			
		</tr>
	</c:forEach>
</table>
<%@ include file="pages/page2.file" %>

</body>
</html>