<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.withdrawalrecord.model.*"%>
<%@ page import="com.member.model.*"%>
<%
	WithdrawalRecordVO withdrawalRecordVO = (WithdrawalRecordVO) request.getAttribute("withdrawalRecordVO");
%>

<%
	WithdrawalRecordService withdrawalRecordSvc = new WithdrawalRecordService();
	List<WithdrawalRecordVO> list = withdrawalRecordSvc.getAll();
	pageContext.setAttribute("list", list);
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
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/G4.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />

<!--引用SweetAlert2.js-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js"
	type="text/javascript"></script>


<title>WeShare | 最棒的教育共享平台</title>
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
		<img src="img/icon/logo.png" width="80" height="60" alt="" /><a
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
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
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
				<jsp:useBean id="memberSvc" scope="page"
					class="com.member.model.MemberService" />
			</ul>
			<a class="text-dark">餘額:</a>${memberSvc.getOneMember(withdrawalrecordVO.memid).memBalance}<a
				class="text-dark" id="wepoint"></a>
		</div>
	</nav>
	<!-- ----------------------------------------------------------------- -->



	<div class="container">
		<div class="py-5 text-center">
			<img class="d-block mx-auto mb-5" src="img/bigtree.png" alt=""
				width="400" height="400">
			<h2>WeShare儲值</h2>
		</div>

		<c:if test="${not empty errorMsgs}">
			<h4 style="color: red; text-align: center;">請修正以下錯誤:</h4>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red; text-align: center;">${message}</li>
				</c:forEach>
			</ul>
		</c:if>




		<div class="row">
			<div class="col-md-3 order-md-2 mb-4">

				<FORM METHOD="GET" ACTION="withdrawalrecord.do" name="form1">
					<h4 class="d-flex justify-content-between align-items-center mb-3">
						<span class="text-muted">查詢您的訂單</span>
					</h4>
					<ul class="list-group mb-1">
						<input type="hidden" name="action" value="findByKey">
						<button class="btn btn-primary" type="submit">查看交易紀錄</button>
					</ul>
<!-- 					//抓會員帳號 -->
					<input type="hidden" name="wrnum" value="weshare02">    <%-- "${param.memId}" --%>


				</FORM>
			</div>
			<!-- ---------------------表單-------------------------- -->


			<%--    <jsp:useBean id="withdrawalRecordSvc" scope="page" class="com.withdrawalrecord.model.WithdrawalRecordService" /> --%>

			<div class="col-md-8 order-md-1">
				<FORM METHOD="GET"
					ACTION="/CA107G4/withdrawalrecord/withdrawalrecord.do" name="form1">
					<h4 class="mb-3">信用卡付款</h4>

					<div class="money">

						<label for="memId">請輸入儲值金額</label> <input type="text"
							class="form-control" id="wrmoney" name="wrmoney"
							placeholder="輸入儲值金額"
							value="<%=(withdrawalRecordVO == null) ? "" : withdrawalRecordVO.getWrmoney()%>" />

					</div>

					<div class="needs-validation return checkForm()">
						<div class="row">
							<div class="col-md-6 mb-3">

								<label for="Memid">會員帳號</label> <input type="text"
									class="form-control" id="MEMID" name="memid"
									placeholder="請輸入會員帳號"
									value="<%=(withdrawalRecordVO == null) ? "" : withdrawalRecordVO.getMemid()%>" />

							</div>
							<div class="col-md-6 mb-3">
								<label for="cc-number">卡號</label> <input type="text"
									class="form-control" id="cc-name" name="cc-name"
									placeholder="請輸入卡號">

							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4 mb-3">
							<label for="date">到期日</label> <input class="form-control"
								type="date" id="wrtime" name="wrtime" page[end_date]="">
						</div>
						<div class=" col-md-4 mb-3">
							<label for="cc-cvv">CVV</label> <input type="text"
								class="form-control" id="cc-cvv" name="cc-cvv"
								placeholder="請輸入CVV碼">
						</div>
					</div>

					<hr class="mb-4">




					<input type="hidden" name="action" value="insert">

					<button class="btn btn-primary btn-lg btn-block" type="submit"
						id="submit">付款</button>


					<input id="magic" name="magic" type="button" onclick="Magic()"
						class="btn btn-link">
				</FORM>
				
			
				
				
				
				
				
				
			</div>
		</div>
	</div>



	<!-- -------------------------------------------------------------------------------------------------------------- -->
	<!-- -------------------------------------------------------------------------------------------------------------- -->
	<footer class="my-5 pt-5 text-muted text-center text-small"> </footer>

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

	<script>
		
	</script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script type="text/javascript">
		function Magic() {
			document.getElementById("MEMID").value = "weshare01";
			document.getElementById("wrmoney").value = "6000";
			document.getElementById("cc-name").value = "447708570857";
			document.getElementById("cc-cvv").value = "957";
		}

		//        $(function () {
		//             $(#submit).click(function () {
		//                 //alert範例
		//                 swal("已成功付款", "請至檢查您的餘額", "success");},100000);

		//             setTimeout(function(){window.location.reload(); },2000);
		//         });
	</script>

</body>
</html>
