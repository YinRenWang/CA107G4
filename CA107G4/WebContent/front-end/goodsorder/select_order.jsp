<%@page import="com.member.model.MemberVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	margin-top: 5px;
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

.title {
	margin-top: 5%;
}
</style>

</head>



<body bgcolor='white'>



<!-- 	<div class="title"> -->
<%-- 		<h3>${mvo.memName}資料查詢:</h3> --%>
<%-- 		<h3>---${mvo.memName}---</h3> --%>
<!-- 	</div> -->

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

<!-- 	<ul> -->
<!-- 		<li><a href='listAllOrder.jsp'>List</a> all Orders. <br> <br></li> -->

		<jsp:useBean id="orderSvc" scope="page"
			class="com.goodsorder.model.GoodsOrderService" />


<!-- 		<li> -->
<!-- 			<FORM METHOD="post" ACTION="goodsorder.do"> -->
<!-- 				<b>輸入訂單編號 :</b> <input type="text" name="goodOrderId"> <input -->
<!-- 					type="hidden" name="action" value="getOneOrder"> <input -->
<!-- 					type="submit" value="送出"> -->
<!-- 			</FORM> -->
<!-- 		</li> -->

<!-- 		<li> -->
<!-- 			<FORM METHOD="Get" ACTION="goodsorder.do"> -->
<%-- 				<b>輸入會員帳號查詢會員有多少筆訂單 :</b> <input type="text" name="memId" value="${mvo.memId}"> <input --%>
<!-- 					type="hidden" name="action" value="getMemOrder"> <input -->
<!-- 					type="submit" value="送出"> -->
<!-- 			</FORM> -->
<!-- 		</li> -->
<!-- 	</ul> -->

	<jsp:include page="/front-end/goodsorder/listOneOrder.jsp?memId=${memberVO.memId}" />
	

		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

</html>