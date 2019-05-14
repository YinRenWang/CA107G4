<%@page import="com.teacher.model.TeacherVO"%>
<%@page import="com.teacher.model.TeacherService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.goods.model.*"%>

<%
	GoodsVO goodsVO = (GoodsVO) request.getAttribute("GoodsVO");
%>

<!doctype html>
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

<title>WeShare | 商品資料新增</title>

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

.title {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 80px;
	margin-bottom: 10px;
	border: 3px ridge Gray;
	height: 80px;
	text-align: center;
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
<body>
	<!-------------------------------------------------------------------------headerStart------------------------------------------------------------------------->
<%@ include file="/front-end/backHeaderFooter/header.jsp"%>   
	<!-------------------------------------------------------------------------headerEnd------------------------------------------------------------------------->

	<center><table class="title">
		<tr>
			<td>
				<h3>新增商品資料 :</h3>
			
			</td>
		</tr>
	</table>
	<hr>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<div>
		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/GoodsServlet" name="form1"
			enctype="multipart/form-data">
			<table>
				
					
						<td> <input type="hidden" name="teacherId" value="${teacherVO.teacherId}" readonly>
					 
			
				<tr>
					<td>商品名稱 :</td>
					<td><input type="TEXT" name="goodName" size="30"
						value="${goodsVO.getGoodName}" /></td>
				</tr>
				<tr>
					<td>商品價格 :</td>
					<td><input type="number" name="goodPrice" min="1" size="30"
						value="${goodsVO.getGoodPrice}" /></td>
				</tr>
				<tr>
					<td>商品資訊 :</td>
					<td><textarea type="TEXT" name="goodInfo" size="30" row="3"
							cols="30" value="${goodsVO.goodInfo}"></textarea></td>
				</tr>
				<tr>
					<td>商品圖片 :</td>
					<td><input type="file" name="goodImg"></td>
				</tr>

				<input type="hidden" name="goodStatus" value="1" checked="checked">



			</table></center>
			<center><br> <input type="hidden" name="action" value="insert">
			<input type="submit" value="送出新增"></center>
		</FORM>
	</div>






	<!-------------------------------------------------------------------------footerStart-------------------------------------------------------------------------
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