<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.goods.model.*"%>

<%
  GoodsVO goodVO = (GoodsVO) request.getAttribute("goodVO");
//GoodsServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的goodVO, 也包括輸入資料錯誤時的goodVO物件)
%>

<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/front-end/css/G4.css ">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>

<title>WeShare | 最棒的教育共享平台</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 80px;
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

<style>
  table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>

<body >
	<!-------------------------------------------------------------------------headerStart------------------------------------------------------------------------->
  <%@ include file="/front-end/backHeaderFooter/header.jsp"%>    
	<!-------------------------------------------------------------------------headerEnd------------------------------------------------------------------------->
      <form id="form4" action="<%= request.getContextPath()%>/MemberServlet" method="get">
								<input type="hidden" name="inCludeVO"  value="goods"> 
								<input type="hidden" name="action" value="changeValue">
							</form>	
<center><table id="table-1">
	<tr><td>
		 <h3>商品資料修改</h3></td><td>
		 <h4><a onclick="document.getElementById('form4').submit();return false;"><img src="<%=request.getContextPath()%>/front-end/goods/images/home-icon.png" width="50" height="50" border="0">回上頁</a></h4>
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

<FORM METHOD="post" ACTION="goods.do" name="form1" enctype="multipart/form-data">
<table>
	
	<tr>
		<td>商品編號:<font color=red><b>*</b></font></td>
		<td><%=goodVO.getGoodId()%></td>
	</tr>
	<tr>
		<td>商品名稱:</td>
		<td><input type="TEXT" name="goodName" size="45" 
			 value="<%= (goodVO==null)? "我是一本書" : goodVO.getGoodName()%>" /></td>
	</tr>
	<tr>
		<td>商品價格:</td>
		<td><input type="TEXT" name="goodPrice" size="45"
			 value="<%= (goodVO==null)? "9090" : goodVO.getGoodPrice()%>" /></td>
	</tr>
	<tr>
		<td>商品資訊:</td>
		<td><input type="TEXT" name="goodInfo" size="45" 
			 value="<%= (goodVO==null)? "缺貨中" : goodVO.getGoodInfo()%>" /></td>
	</tr>
	<tr>
		<td>商品圖片:</td>
		<td><img src="<%= request.getContextPath()%>/goods/DBGifReaderGoods.do?goodId=${goodVO.goodId}"></td>
	</tr>
	
	<tr>
		<td><input type="file" name = "goodImg" value="<%= (goodVO==null)? "null" : goodVO.getGoodImg()%>"></td>
	</tr>
	
	
	<tr>
		<td>商品狀態:</td>
		<td>
			<input type="radio" name="goodStatus" size="45"
			value="1"${(goodVO.goodStatus==1)? 'checked="checked"':''}/>上架
			<input type="radio" name="goodStatus" size="45"
			value="0"${(goodVO.goodStatus==0)? 'checked="checked"':''}/>下架
		</td>
	</tr>
	

	
</table></center>
<br>
 			<input type="hidden" name="goodId"  value="${goodVO.goodId}">
		    <input type="hidden" name="teacherId"  value="${goodVO.teacherId}">
		    <input type="hidden" name="goodName"  value="${goodVO.goodName}">
		    <input type="hidden" name="goodPrice"  value="${goodVO.goodPrice}">
		    <input type="hidden" name="goodInfo"  value="${goodVO.goodInfo}">
		    <input type="hidden" name="goodStatus"  value="${goodVO.goodStatus}">
			<input type="hidden" name="action" value="updateGood">
			<center><input type="submit" value="送出修改"></FORM></center>
 
 
	<!-------------------------------------------------------------------------footerStart------------------------------------------------------------------------->
	<%@ include file="/front-end/backHeaderFooter/footer.jsp"%> 
	<!-------------------------------------------------------------------------footerEnd------------------------------------------------------------------------->
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

</html>