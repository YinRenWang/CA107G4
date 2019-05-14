<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.goods.model.*"%>

<%

	Vector<GoodsVO> goodlist = (Vector<GoodsVO>) session.getAttribute("shoppingcart");

	pageContext.setAttribute("goodlist",goodlist);

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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/front-end/css/G4.css ">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<title>我的購物車-shoppingcart.jsp</title>





</head>

<style type="text/css">
.goodsTitle {
	margin-top: 100px;
	text-align: center;
	margin-left: 40%
}
</style>


<body>
	<!-------------------------------------------------------------------------headerStart------------------------------------------------------------------------->
<%@ include file="/front-end/backHeaderFooter/header.jsp"%>   
	<!-------------------------------------------------------------------------headerEnd------------------------------------------------------------------------->

	<div class="goodsTitle">
		<div class="row">
			<div class="nameTitle">
				<h1>我的購物車</h1>
			</div>
			<div class="cart1">
				<a  href='good_home.jsp'><img src="<%=request.getContextPath()%>/front-end/goods/images/home-icon.png" width="30" height="30" border="0">回商店</a>
			</div>
		</div>
	</div>


<%-- --${goodlist}---<%= goodlist==null %> --%>


		
		

	<table class="table table-hover ">


		<tr>
			<th width="200">商品圖片</th>
			<th width="200">商品名稱</th>
			<th width="200">單價</th>
			<th width="200">數量</th>
			<th width="200">操作</th>

		</tr>

	</table>
	<table class="table table-hover ">
		
		<%
			if (goodlist != null && (goodlist.size() > 0)) {
		%>
		<%
			for (int index = 0; index < goodlist.size(); index++) {
					GoodsVO order = goodlist.get(index);
		%>
			
		<tr>
	
			
			<td width="200"><img src="<%= request.getContextPath()%>/goods/DBGifReaderGoods.do?goodId=<%=order.getGoodId()%>"></td>				
			<td width="200"><%=order.getGoodName()%></td>
			<td width="200">$<%=order.getGoodPrice()%></td>
			<td width="200">
	    	<form action="<%=request.getContextPath()%>/goods/goods.do" method="GET">
	    		<input type="hidden" name="action" value="QTY"> 
	    	 	<input type="hidden" name="qty" value="<%=index%>"> 
				<input type="number"  name="quantity" value=<%=order.getQuantity()%> min="1" size="1" /> 
				<input type="submit" value="確認數量" class="button">
			</form></td>
			
		   	<td width="200">
				<form action="<%=request.getContextPath()%>/goods/goods.do" method="GET">
					 <input type="hidden" name="action" value="DEL"> 
					 <input type="hidden" name="del" value="<%=index%>">
					 <input type="submit" value="刪除" class="button">
				</form>
			</td>
		</tr>
		<%
			}
		%>
		<%
			}
		%>
	</table>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<form name="checkoutForm" action="<%= request.getContextPath()%>/goods/goods.do" method="POST">
		<center><input type="hidden" name="action" value="check_order"> <input
			type="submit" value="確認訂單" class="button"></center>
	</form>

<%-- 		<c:forEach var="GoodsVO" items="${goodlist}"> --%>
<%-- 			<li style="color:red">${GoodsVO.goodId}</li> --%>
<%-- 		</c:forEach> --%>

	<!-------------------------------------------------------------------------footerStart------------------------------------------------------------------------->
<%@ include file="/front-end/backHeaderFooter/footer.jsp"%> 
	<!-------------------------------------------------------------------------footerEnd------------------------------------------------------------------------->
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	
	
	<script type="text/javascript">
	
	
	
	</script>
	
	<script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>

