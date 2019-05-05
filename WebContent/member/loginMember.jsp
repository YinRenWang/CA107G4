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
<div class="header">
       <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top"> <img src="<%= request.getContextPath()%>/images/icon/logo.png" width="80" height="60" alt=""/><a class="navbar-brand" href="<%= request.getContextPath()%>">教育共享平台</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active"> <a class="nav-link" href="<%= request.getContextPath()%>/teacher/joinTeacher.jsp">成為老師 <span class="sr-only">(current)</span></a> </li>
            <li class="nav-item dropdown"> <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">探索課程</a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink"> <a class="dropdown-item" href="<%= request.getContextPath()%>/inscourse/inscourse.do?courseId=&inscLoc=&action=listEmps_ByCompositeQuery">所有課程</a> <a class="dropdown-item" href="#">音樂</a> <a class="dropdown-item" href="#">語言</a> <a class="dropdown-item" href="#">運動</a> <a class="dropdown-item" href="#">藝術</a> <a class="dropdown-item" href="#">設計</a> <a class="dropdown-item" href="#">人文</a> <a class="dropdown-item" href="#">行銷</a> <a class="dropdown-item" href="#">程式語言</a> <a class="dropdown-item" href="#">投資理財</a> <a class="dropdown-item" href="#">職場技能</a> <a class="dropdown-item" href="#">手作</a> <a class="dropdown-item" href="#">烹飪</a> </div>
            </li>           
                <c:choose>
    			<c:when test="${!empty memberVO}">
				            <li class="nav-item"> <a class="nav-link " href="#" onclick="document.getElementById('viewAllMember').submit();return false;">${memberVO.memName}</a> </li> 
				            <li class="nav-item"> <a class="nav-link" href="<%= request.getContextPath()%>/MemberServlet?action=logout">登出</a> </li>
   				</c:when>
    			<c:otherwise>
    			<li class="nav-item"> <a class="nav-link" href="<%= request.getContextPath()%>/member/loginMember.jsp">登入</a> </li>
    		    <li class="nav-item"> <a class="nav-link" href="<%= request.getContextPath()%>/member/addMember.jsp">註冊</a> </li>
    			</c:otherwise>
				</c:choose>
            <li class="nav-item"> <a class="nav-link " href="<%= request.getContextPath()%>/member/listAllMember.jsp">關於我們</a> </li>
              <form id="viewAllMember" action="<%= request.getContextPath()%>/MemberServlet" method="get">
            <input type="hidden" name="inCludeVO"  value="member"> 
            <input type="hidden" name="action" value="changeValue">
            </form>	
          </ul>
        </div>
      </nav>
    </div>	
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
					<form data-toggle="validator" role="form" method="post" action="member.do" >
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
					<i class="fa fa-user fa-fw"></i> 還沒有帳號嗎? <a href="<%=request.getContextPath()%>/member/addMember.jsp">註冊</a><br>

					<i class="fa fa-undo fa-fw"></i> 忘記密碼了嗎? <a href="#">重置密碼</a><br>
				</div>
			</div>
		</div>
	</div>



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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
