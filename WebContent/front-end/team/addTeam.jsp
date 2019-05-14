<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.team.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.course.model.*"%>
<%@ page import="com.joingroup.model.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.inscourse.model.*"%>

<%
	TeamVO teamVO = (TeamVO) request.getAttribute("teamVO");
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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/front-end/css/G4.css ">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<title>WeShare | 最棒的教育共享平台</title>
<style type="">
.friend {
	margin-top: auto;
}

.title.TitleImg {
	background-size: cover;
	background-image: url(<%=request.getContextPath()%>/front-end/Images/hero-image-wrapper.png);
	padding: 40px;
	margin-top: 76px;
}

.col-8 {;
	border: 1px solid;
	height: 800px;
	width: 900px;
}

h1 {
	margin-top: 0;
	margin-bottom: .5rem;
	color: white;
}

.container {
	margin-top: 3%;
}

img {
	width: 60px;
}

.row1 {
	margin-left: 250px;
	margin-top: -55px;
}

p {
	margin-top: 0;
	margin-bottom: 1rem;
	margin-left: 3px;
}

.flex-wrap {
	-ms-flex-wrap: wrap !important;
	flex-wrap: wrap !important;
	margin-top: 15px;
	background-color: #f4f9f4;
	color: brown;
}

.row {
	margin-bottom: 15px;
}

.col-4 {
	margin-top: 30px;
}

h6 {
	margin-left: 2px;
}

textarea {
	height: 500px;
	width: 700px;
}

.btn1 {
	margin-left: 260px;
	margin-top: -60px;;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<title>WeShare | 最棒的教育共享平台</title>
</head>

<!-------------------------------------------------------------------------headerStart------------------------------------------------------------------------->
<%@ include file="/front-end/backHeaderFooter/header.jsp"%>   
<!-------------------------------------------------------------------------headerEnd------------------------------------------------------------------------->
<div class="title TitleImg">
	<h1 class="hader-title" style="text-align: center">創建揪團</h1>
</div>


<div class="container">



	<c:if test="${not empty errorMsgs}">
			<h4 style="color: red; text-align: center;">請修正以下錯誤:</h4>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red; text-align: center;">${message}</li>
				</c:forEach>
			</ul>
		</c:if>


	<FORM METHOD="GET" ACTION="/CA107G4/team/team.do" name="form2">
		<div class="form-row">

			<div class="form-group col-md-6">
				<label for="inputPassword4">請輸入會員帳號</label> <input type="text"
					class="form-control" id="inputPassword4" readonly="readonly" name="leaderID" value="${memberVO.memId}"
					placeholder="請輸入會員帳號">
			</div>

			<div class="form-group col-md-6">
				<label for="inputPassword4">請輸入課程編號</label> <input type="text"
					class="form-control" id="inputPassword4" name="inscID" value="${inscID}" readonly="readonly"
					placeholder="請輸入課程編號">
			</div>
		</div>
		<div class="form-row">
			
                   
			<div class="form-group col-md-6">
				<label for="date">截團日期</label> <input class="form-control"
					type="date" id="teamEXP" name="teamEXP" page[end_date]="">
			</div>
		</div>
         <input type="hidden" name="action" value="insert1">
		<button type="submit" class="btn btn-primary">送出</button>

	</Form>

</div>


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
