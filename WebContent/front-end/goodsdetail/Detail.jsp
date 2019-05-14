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
<%@ include file="/front-end/backHeaderFooter/header.jsp"%> 
 <title>購物車明細-Detail.jsp</title>
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ShoppingCart.css">
 <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style>
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
 </head>
<body>

<br>
<br>
<br>
<br>
	
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
       <%@ include file="/front-end/backHeaderFooter/footer.jsp"%> 
</body>
</html>