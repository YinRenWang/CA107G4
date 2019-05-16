<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>

<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
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
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/registered.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.twzipcode.min.js"></script>


<title>WeShare | 最棒的教育共享平台</title>
</head>
<body>
	<!------------------------------------------------------首頁頭------------------------------------------------------>
<%@ include file="/front-end/backHeaderFooter/header.jsp"%>      

	<!----------------------------------------------------------------------------------------------------------------->


	<div id="carouselExampleSlidesOnly" class="carousel slide"
		data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">

				<h1></h1>

			</div>
		</div>


		<div class="title TitleImg">
			<h1 class="hader-title" style="text-align: center; color: white;">建立您的
				WeShare&nbsp;帳戶</h1>
		</div>
		

		<c:if test="${not empty errorMsgs}">
		<div class="alert alert-danger" role="alert">
			<h4 style="color: red; text-align: center;">請修正以下錯誤:</h4>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red; text-align: center;">${message}</li>
				</c:forEach>
			</ul>
			</div>		
		</c:if>

		


<FORM method="post" action="<%=request.getContextPath()%>/MemberServlet" class="form-horizontal" name="addmemeber" id="addmemeber" enctype="multipart/form-data">

			<div class="container">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<hr>

						<div class="form-group">
							<label class="control-label col-sm-3">會員帳號 <span
								class="text-danger">*</span></label>
							<div class="col-md-11 col-sm-9">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-lock"></i></span> <input type="text"
										class="form-control" name="memId" id="memId"
										placeholder="請以半形輸入，6-12個英、數字組合。" value="${memberVO.memId}">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">電子信箱<span
								class="text-danger">*</span></label>
							<div class="col-md-11 col-sm-9">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-envelope"></i></span> <input type="email"
										class="form-control" name="memEmail" id="memEmail"
										placeholder="請以半形輸入，e-mail不能重複註冊。"
										value="${memberVO.memEmail}">
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-3">密碼 <span
								class="text-danger">*</span></label>
							<div class="col-md-11 col-sm-8">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-lock"></i></span> <input type="password"
										class="form-control" name="memPsw" id="memPsw"
										placeholder="6 位數以上，並且至少包含大寫字母、小寫字母、數字、符號各一"
										value="${memberVO.memPsw}">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">密碼提示<span
								class="text-danger">*</span></label>
							<div class="col-md-11 col-sm-8">
								<input type="text" class="form-control" name="memPswHint"
									id="memPswHint" placeholder="請輸入您的密碼提示不得更密碼一樣"
									value="${memberVO.memPswHint}">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">姓名<span
								class="text-danger">*</span></label>
							<div class="col-md-8 col-sm-9">
								<input type="text" class="form-control" name="memName"
									id="memName" placeholder="請輸入您的大名" value="${memberVO.memName}">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">身分證字號<span
								class="text-danger">*</span></label>
							<div class="col-md-5 col-sm-8">
								<div>

									<input type="text" name="memIdCard" id="memIdCard"
										placeholder="請輸入您的身分證字號" class="form-control label-warning"
										value="${memberVO.memIdCard}" />
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-3">會員生日<span
								class="text-danger">*</span></label>
							<div class="col-md-8 col-sm-9">
								<input type="date" class="form-control" name="memBirth"
									id="memBirth" value="${memberVO.memBirth}">
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-3">性別 <span
								class="text-danger">*</span></label>
							<div class="col-md-8 col-sm-9">
								<label> <input name="memSex" type="radio" value="0"
									checked > 男生
								</label><label> <input name="memSex" type="radio" value="1">
									女生
								</label>
								
							</div>


						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">手機號碼<span
								class="text-danger">*</span></label>
							<div class="col-md-5 col-sm-8">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-phone"></i></span> <input type="text"
										class="form-control" name="memPhone" id="memPhone"
										placeholder="請輸入您的手機號碼" value="${memberVO.memPhone}">
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-3">地址<br></label>
							<div class="form-inline">
								<div id="zipcode2" class="col-md-6 col-sm-8 col-xl-12">
									<script>
										$("#zipcode2").twzipcode(
												{
													zipcodeIntoDistrict : true, // 郵遞區號自動顯示在地區
													css : [ "form-control",
															"form-control" ], // 自訂 "城市"、"地區" class 名稱 
													countyName : "city", // 自訂城市 select 標籤的 name 值
													districtName : "town" // 自訂地區 select 標籤的 name 值

												});
									</script>

									<input type="text" class="form-control" name="address"
										id="address" placeholder="請輸入地址" value="" size="35"> <input
										type="hidden" id="memAdd" name="memAdd"
										value="${memberVO.memAdd}">
								</div>



							</div>
						</div>



						<div class="form-group">
							<label class="control-label col-sm-3">會員頭貼<br></label>
							<div class="col-md-5 col-sm-8">
								<div class="input-group">
									<span class="input-group-addon" id="file_upload"><i
										class="glyphicon glyphicon-upload"></i></span>
									<p>
										<input type="file" name="memImage" id="file"
											class="form-control upload" placeholder=""
											aria-describedby="file_upload" value="${memberVO.memImage}" />
									</p>
									<p>
										<img id="demo" />
									</p>
								</div>
							</div>
						</div>

						<script type="text/javascript">
							$('#file').change(function() {
								var file = $('#file')[0].files[0];
								var reader = new FileReader;
								reader.onload = function(e) {
									$('#demo').attr('src', e.target.result);
								};
								reader.readAsDataURL(file);
							});
						</script>


						<div class="form-group">
							<div class="col-xs-offset-3 col-md-8 col-sm-9 col-xl-12">
								<input type="checkbox" id="cbox1" value="first_checkbox"
									onclick="Send()"><span class="text-muted"><span
									class="label label-danger">我已</span> 詳細閱讀<a href="#">條款</a>
									並且同意我們所有 <a href="#">規章</a>,包含讓我們使用您的 <a href="#">Cookie</a>.</span>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-offset-3 col-xs-10">

								<script type="text/javascript">
									function Magic() {
										document.getElementById("memId").value = "weshare";
										document.getElementById("memEmail").value = "n1036434@ntub.edu.tw";
										document.getElementById("memPsw").value = "123456";
										document.getElementById("memPswHint").value = "123***";
										document.getElementById("memName").value = "板橋億載金城";
										document.getElementById("memIdCard").value = "A181313047";
										document.getElementById("memBirth").value = "2019-05-23";
										document.getElementById("memPhone").value = "0970313604";
										document.getElementById("memAdd").value = "新北市板橋區西門街9號";
									}
								</script>

								<input id="magic" name="magic" type="button" onclick="Magic()"
									class="btn btn-link">


								<script type="text/javascript">
									var city = "";
									var town = "";
									var address = "fuck";
									var memAdd = "";

									$("select[name='city']").change(
											function() {
												city = $('option:selected',
														this).val();
											});

									$("select[name='town']").change(
											function() {
												town = $('option:selected',
														this).val();
											});

									$("#address").change(function() {
										address = $("#address", this).val();
									});

									function Send() {
										address = document
												.getElementById("address").value;
										memAdd = city + town + address;
										document.getElementById("memAdd").value = memAdd;
										
										if(document.getElementById("cbox1").checked==false){
										    alert("請勾選同意");
										}
									}
									
								</script>
							
								<input type="hidden" name="action" value="insert"> <input
									id="signUp" name="submit" type="submit" value="註冊"
									onmousedown="Send()" class="btn btn-primary">
									
								<script>
							
								</script>

							</div>

						</div>

					</div>
				</div>
			</div>
		</form>
	</div>




	<!------------------------------------------------------首頁尾------------------------------------------------------>
<%@ include file="/front-end/backHeaderFooter/footer.jsp"%> 
	<!----------------------------------------------------------------------------------------------------------------->
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->


	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>
