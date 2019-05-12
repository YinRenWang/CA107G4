<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import ="com.goods.model.GoodsVO" %>
<%@ page import ="com.goodsorder.model.GoodsOrderVO" %>


<jsp:useBean id="GoodsSvc" scope="page" class="com.goods.model.GoodsService" />
<jsp:useBean id="GoodsDetailsSvc" scope="page" class="com.goodsdetails.model.GoodsDetailsService" />
<jsp:useBean id="GoodsOrderSvc" scope="page" class="com.goodsorder.model.GoodsOrderService" />

<html>
<head>
 <title>購物車明細-Detail.jsp</title>
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ShoppingCart.css">
 </head>
<body>
	
	<font size="+3">訂單明細 ${goodsOrderVO.goodOrderId}</font>結帳時間
		<fmt:formatDate value="${GoodsOrderSvc.getOneOrder(goodsOrderVO.goodOrderId).goodDate}" pattern="yyyy年MM月dd日 HH時mm分"/>
	
<hr><p>


<table id="table-1" style="margin: auto;">
	<tr>	
		<th width="150">商品名稱</th>
		<th width="150">單價</th>
		<th width="150">數量</th>
	</tr></table>
	
<table id="table-1" style="margin: auto;">		
		<c:forEach var="goodsDetailsVO" items="${GoodsDetailsSvc.getFindByPKAll(goodsOrderVO.goodOrderId)}">
	<tr>	
		<th width="150">${GoodsSvc.getOneGood(goodsDetailsVO.goodId).goodName}</th>
		<th width="150">$${GoodsSvc.getOneGood(goodsDetailsVO.goodId).goodPrice}</th>
		<th width="150">${goodsDetailsVO.goodAmount}</th>
	</tr>
			</c:forEach></table>
	
	<hr><p>
	<center><th width="150">總金額${goodsOrderVO.goodTotalPrice}</th></center>
	
	<br><br><br><br><font size="+3">買家資訊</font>
	<hr><p>

<table id="table-1" style="margin: auto;">
	<tr>
		<th width="150">會員帳號</th>
		<th width="150">收件人姓名</th>
		<th width="150">收件人電話</th>
		<th width="150">收件人地址</th>			
	</tr></table>
	
	<hr><p>
	
	<table id="table-1" style="margin: auto;">
		<tr>
			<th width="150">${goodsOrderVO.memId}</th>
			<th width="150">${goodsOrderVO.buyerName}</th>
			<th width="150">${goodsOrderVO.buyerPhone}</th>
			<th width="150">${goodsOrderVO.buyerAddress}</th>		
		</tr></table>

		
        <form  action="<%= request.getContextPath()%>/goods/goods.do" method="GET">
        	<center><input type="hidden" name="action" value="go_home_page"> 
       		<input type="submit" value="訂單成功" class="button"></center></form> 
       
</body>
</html>