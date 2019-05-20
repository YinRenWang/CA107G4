
<%@page import="com.teacher.model.TeacherService"%>
<%@page import="com.teacher.model.TeacherVO"%>
<%@page import="org.apache.catalina.Session"%>
<%@page import="com.member.model.MemberVO"%>
<%@page import="com.member.model.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.goods.model.*"%>


<%
	GoodsService goodsSvc = new GoodsService();
	List<GoodsVO> list = goodsSvc.getGoodByStatus(1);
	pageContext.setAttribute("list", list);
%>

<jsp:useBean id="GoodsSvc" scope="page"
	class="com.goods.model.GoodsService" />

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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>

<title>WeShare | 最棒的教育共享平台</title>
<style type="text/css">
.row {
	margin-top: 30px;
}

.goodsTitle {
	margin-top: 100px;
	text-align: center;
	margin-left: 30%
}

.goodsTitle2 {
	margin-top: 5px;
	text-align: center;
	margin-left: 35%
}

.cart1 {
	margin-right: 5px;
	margin-bottom: 10px;
}

.changepage {
	margin-left: 35%;
}

.page {
	text-align: center;
}
</style>
</head>


<body>
	<!-------------------------------------------------------------------------headerStart------------------------------------------------------------------------->
<%@ include file="/front-end/backHeaderFooter/header.jsp"%>  
	<!-------------------------------------------------------------------------headerEnd------------------------------------------------------------------------->
	<div class="goodsTitle">
		<div class="row">
			<div class="nameTitle">
				<h1>  歡迎來到 WeShare 教材商城</h1>
				<a class="nav-item nav-link" href="<%=request.getContextPath()%>/front-end/goods/shoppingcart.jsp">
				<img src="<%=request.getContextPath()%>/front-end/goodsdetail/images/shopping-cart.png" width="30" height="30" border="0"></a>
			</div>
		</div>
	</div>
	
	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>



	<%@ include file="page/page1.file"%>

	<div class="container">
		<div class="col-lg-12">

			<div class="row">


				<c:forEach var="goodVO" items="${list}" begin="<%=pageIndex%>"
					end="<%=pageIndex+rowsPerPage-1%>">

					<div class="col-3">
						<div class="card">
							<form ACTION="<%=request.getContextPath()%>/goods/goods.do"
								method="get">
								<a href=""> <img class="card-img-top"
									src="<%= request.getContextPath()%>/goods/DBGifReaderGoods.do?goodId=${goodVO.goodId}"
									style="height: 300px;"></a>
								<div class="card-body " style="height: 330px;">
									<h4 class="card-title">
										<a href="">${goodVO.goodName}</a>
									</h4>
									<h5 class="price">$${goodVO.goodPrice}</h5>
									<p class="card-text">${goodVO.goodInfo}</p>
								</div>
								<div class="card-footer ">
									<span class="row"> <input type="hidden" name="action"
										value="add_shoppingcart"> <input type="submit"
										name="Submit" value="加入購物車" onClick="alert('已加入購物車')" />
									</span> 
								</div>   
								<input type="hidden" name="quantity" value=1> <input
									type="hidden" name="goodId" value="${goodVO.goodId}"> <input
									type="hidden" name="goodName" value="${goodVO.goodName}">
								<input type="hidden" name="goodPrice"
									value="${goodVO.goodPrice}"> <input type="hidden"
									name="goodImg" value="${goodVO.goodImg}">


							</form>
						</div>
					</div>

				</c:forEach>

			</div>

		</div>
	</div>
	<center><%@ include file="page/page2.file"%></center>

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