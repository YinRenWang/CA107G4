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
<link rel="stylesheet" type="text/css" href="css/G4.css ">
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
	<div class="header headerImg">
		<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
			<img src="images/icon/logo.png" width="80" height="60" alt="" /><a
				class="navbar-brand" href="#">教育共享平台</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="#">成為老師
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">探索課程</a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="#">所有課程</a> <a
								class="dropdown-item" href="#">音樂</a> <a class="dropdown-item"
								href="#">語言</a> <a class="dropdown-item" href="#">運動</a> <a
								class="dropdown-item" href="#">藝術</a> <a class="dropdown-item"
								href="#">設計</a> <a class="dropdown-item" href="#">人文</a> <a
								class="dropdown-item" href="#">行銷</a> <a class="dropdown-item"
								href="#">程式語言</a> <a class="dropdown-item" href="#">投資理財</a> <a
								class="dropdown-item" href="#">職場技能</a> <a class="dropdown-item"
								href="#">手作</a> <a class="dropdown-item" href="#">烹飪</a>
						</div></li>
					<li class="nav-item"><a class="nav-link" href="#">登入</a></li>
					<li class="nav-item"><a class="nav-link" href="#">註冊</a></li>
					<li class="nav-item"><a class="nav-link disabled" href="#">關於我們</a>
					</li>
				</ul>
			</div>
		</nav>
	</div>
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
					 <input type="submit" value="刪 除" class="button">
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


	<form name="checkoutForm" action="<%= request.getContextPath()%>/goods/goods.do" method="POST">
		<center><input type="hidden" name="action" value="check_order"> <input
			type="submit" value="確認訂單" class="button"></center>
	</form>

<%-- 		<c:forEach var="GoodsVO" items="${goodlist}"> --%>
<%-- 			<li style="color:red">${GoodsVO.goodId}</li> --%>
<%-- 		</c:forEach> --%>

	<!-------------------------------------------------------------------------footerStart------------------------------------------------------------------------->
	<footer class="section footer-classic context-dark bg-image"
		style="background: #74b49b;">
		<div class="container">
			<div class="row row-30">
				<div class="col-md-4 col-xl-5">
					<div class="pr-xl-4">
						<a href="index.html"></a>
						<p class="reademe">我們是最佳的共享教育的平台，致力於在分享技能，保障交易，展現自我，使用戶得到最棒的學習體驗。</p>
						<!-- Rights-->
						<p class="rights">
							<span>©  </span><span class="copyright-year">2018</span><span> </span><span>WeShare教育共享平台</span><span>. </span><span>©
								All Rights Reserved. .</span>
						</p>
					</div>
				</div>
				<div class="col-md-4">
					<h5 class="reademe">聯絡我們</h5>
					<dl class="contact-list">
						<dt>地址:</dt>
						<dd>桃園市中壢區中大路300號</dd>
					</dl>
					<dl class="contact-list">
						<dt>信箱:</dt>
						<dd>
							<a href="mailto:#">weshare@gmail.com</a>
						</dd>
					</dl>
					<dl class="contact-list">
						<dt>電話:</dt>
						<dd>
							<a href="tel:#">03-425-7387</a>
						</dd>
					</dl>
				</div>
				<div class="col-md-4 col-xl-3">
					<h5 class="reademe2">關於</h5>
					<ul class="nav-list">
						<li><a href="#">關於我們</a></li>
						<li><a href="#">團隊成員</a></li>
						<li><a href="#">加入WeShare</a></li>
						<li><a href="#">隱私權政策</a></li>
						<li><a href="#">功能更新</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="row no-gutters social-container">
			<div class="col">
				<a class="social-inner" href="#"><span
					class="icon mdi mdi-facebook"></span><span>Facebook</span></a>
			</div>
			<div class="col">
				<a class="social-inner" href="#"><span
					class="icon mdi mdi-instagram"></span><span>instagram</span></a>
			</div>
			<div class="col">
				<a class="social-inner" href="#"><span
					class="icon mdi mdi-twitter"></span><span>twitter</span></a>
			</div>
			<div class="col">
				<a class="social-inner" href="#"><span
					class="icon mdi mdi-youtube-play"></span><span>google</span></a>
			</div>
		</div>
	</footer>
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

