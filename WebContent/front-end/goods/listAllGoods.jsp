<%@page import="com.member.model.MemberService"%>
<%@page import="com.member.model.MemberVO"%>
<%@page import="com.teacher.model.TeacherVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.goods.model.*"%>


<%
	TeacherVO teacherVO = (TeacherVO) request.getSession().getAttribute("teacherVO");

	GoodsService goodsSvc = new GoodsService();
	List<GoodsVO> list = goodsSvc.getGoodsByteacher(teacherVO.getTeacherId());
	pageContext.setAttribute("list", list);

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
<link rel="stylesheet" type="text/css" href="css/G4.css ">
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
<body>
	
	<!-------------------------------------------------------------------------headerEnd------------------------------------------------------------------------->

	<br>
	<br>
	<table >
		<tr>
			<td>
				<a class="nav-item nav-link"
					href="<%=request.getContextPath()%>/front-end/goods/addGoods.jsp">新增商品</a>
				
		
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>商品編號</th>

			<th>商品名稱</th>
			<th>商品價格</th>
			<th>商品資訊</th>
			<th>商品圖片</th>
			<th>商品狀態</th>
			<th>商品修改</th>
			<!-- 			<th>刪除</th>	 -->
		</tr>

		<c:forEach var="goodVO" items="${list}">
			<tr>
				<td>${goodVO.goodId}</td>
				<td>${goodVO.goodName}</td>
				<td>${goodVO.goodPrice}</td>
				<td>${goodVO.goodInfo}</td>
				<td><img
					src="<%= request.getContextPath()%>/goods/DBGifReaderGoods.do?goodId=${goodVO.goodId}"></td>

				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/goods/goods.do"
						style="margin-bottom: 0px;">
						<input type="radio" name="goodStatus" value="1"
							${(goodVO.goodStatus==1)? 'checked="checked"':''}>上架 <br>
						<input type="radio" name="goodStatus" value="0"
							${(goodVO.goodStatus==0)? 'checked="checked"':''}>下架 <input
							type="hidden" name="goodId" value="${goodVO.goodId}"> <input
							type="hidden" name="action" value="updateStatus">
					</FORM>
				</td>

				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/goods/goods.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="修改"> <input type="hidden"
							name="goodId" value="${goodVO.goodId}">
						<input type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
			</tr>
		</c:forEach>
		

	</table>
	<br>
	<br>
	<br>
	
<!-------------------------------------------------------------------------footerStart------------------------------------------------------------------------->

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