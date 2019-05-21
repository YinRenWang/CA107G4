<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>

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
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/G4.css ">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/login.css ">
<link 
	href="https://cdn.bootcss.com/limonte-sweetalert2/7.33.1/sweetalert2.css" rel="stylesheet">
<script 
	src="https://cdn.bootcss.com/limonte-sweetalert2/7.33.1/sweetalert2.all.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<title>WeShare | 最棒的教育共享平台</title>
</head>
<body>
	<!-------------------------------------------------------------------------headerStart------------------------------------------------------------------------->
<%@ include file="/front-end/backHeaderFooter/headerForLogin.jsp"%>  
	<!-------------------------------------------------------------------------headerEnd------------------------------------------------------------------------->

	<div class="container h-100" id="login">
		<div class="row h-100 justify-content-center align-items-center">
			<div class="card">
				<h4 class="card-header">登入</h4>
				<div class="card-body">
<c:if test="${not empty successMsgs}">
<c:forEach var="success" items="${successMsgs}">
<script>
Swal.fire(
		 '還差一步!',
		 '${success}',
		  'success'
)
</script>
</c:forEach>
</c:if> 
					<form data-toggle="validator" role="form" method="post" action="<%=request.getContextPath()%>/MemberServlet" >
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label>帳號</label>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"><i
												class="fa fa-envelope-open-o" aria-hidden="true"></i></span>
										</div>
										<input type="text" class="form-control" name="memId" value="${memberVO.memId}"
											pattern=".{4,}" title="Cuatro(4) o mas caracteres"
											required="">
									</div>
									<div class="help-block with-errors text-danger"></div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label>密碼</label>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"><i class="fa fa-unlock"
												aria-hidden="true"></i></span>
										</div>
										<input type="password" name="memPsw" class="form-control"
											pattern=".{4,}" title="Cuatro(4) o mas caracteres"
											required="" value="${memberVO.memPsw}"> 
									</div>
									<div class="help-block with-errors text-danger"></div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="checkbox checkbox-primary">
								<input id="checkbox_remember" type="checkbox" name="remember" checked >
								<label for="checkbox_remember">記住我的登入</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<input type="hidden" name="action" value="login"> 
								<input type="submit" class="btn btn-primary btn-lg btn-block" value="Login" name="submit">
							</div>
						</div>
					</form>
					<div class="clear"></div>
					<i class="fa fa-user fa-fw"></i> 還沒有帳號嗎? <a href="<%=request.getContextPath()%><%=request.getContextPath()%>/front-end/member/addMember.jsp">註冊</a><br>

					<i class="fa fa-undo fa-fw"></i> 忘記密碼了嗎? <a href="#">重置密碼</a><br>
				</div>
			</div>
		</div>
	</div>



	<!-------------------------------------------------------------------------footerStart------------------------------------------------------------------------->
<%@ include file="/front-end/backHeaderFooter/footer.jsp"%> 
	<!-------------------------------------------------------------------------footerEnd------------------------------------------------------------------------->
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
