<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script 
	src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<script 
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>	

    
<style>
html {
  background: #f4f9f4;
  box-sizing: border-box;
  font-family: 'Lato', sans-serif;
  font-size: 14px;
  font-weight: 400;
}
body{
		background-color: #f4f9f4;
	}
	


*, *:before, *:after {
  box-sizing: inherit;
}

.u-clearfix:before,
.u-clearfix:after {
  content: " ";
  display: table;
}

.u-clearfix:after {
  clear: both;
}

.u-clearfix {
  *zoom: 1;
}

.subtle {
  color: #aaa;
}

.card-container {
  margin: 25px auto 0;
  position: relative;
  width: 692px;
}

.card {
  background-color: #fff;
  padding: 30px;
  position: relative;
  box-shadow: 0 0 5px rgba(75, 75, 75, .07);
  z-index: 1;
}

.card-body {
  display: inline-block;
  float: left;
  width: 310px;
}

.card-number {
  margin-top: 15px;
}

.card-circle {
  border: 1px solid #aaa;
  border-radius: 50%;
  display: inline-block;
  line-height: 22px;
  font-size: 12px;
  height: 25px;
  text-align: center;
  width: 25px;
}

.card-author {
  display: block;
  font-size: 12px;
  letter-spacing: .5px;
  margin: 15px 0 0;
  text-transform: uppercase;
}

.card-title {
  font-family: 'Cormorant Garamond', serif;
  font-size: 60px;
  font-weight: 300;
  line-height: 60px;
  margin: 10px 0;
}

.card-description {
  display: inline-block;
  font-weight: 300;
  line-height: 22px;
  margin: 10px 0;
}

.card-read {
  cursor: pointer;
  font-size: 14px;
  font-weight: 700;
  letter-spacing: 6px;
  margin: 5px 0 20px;
  position: relative;
  text-align: right;
  text-transform: uppercase;
}

.card-read:after {
  background-color: #b8bddd;
  content: "";
  display: block;
  height: 1px;
  position: absolute;
  top: 9px;
  width: 75%;
}

.card-tag {
  float: right;
  margin: 5px 0 0;
}

.card-media {
  float: right;
}

.card-shadow {
  background-color: #fff;
  box-shadow: 0 2px 25px 2px rgba(0, 0, 0, 1), 0 2px 50px 2px rgba(0, 0, 0, 1), 0 0 100px 3px rgba(0, 0, 0, .25);
  height: 1px;
  margin: -1px auto 0;
  width: 80%;
  z-index: -1;
}

.card-body2 {
  display: inline-block;
  float: right;
  width: 310px;
}

#joinTeacher{
		margin-bottom:350px;
}
.plese{
display: flex;
  align-items: center;
  justify-content: center;
}

#gogo{
    margin: 130px -170px; 
    position:relative;
    top:50%; 
    left:50%;

}
</style>
  
<title>WeShare | 最棒的教育共享平台</title>
</head>
<body>
	<!-------------------------------------------------------------------------headerStart------------------------------------------------------------------------->	
<%@ include file="/front-end/backHeaderFooter/header.jsp"%>   	
	<!-------------------------------------------------------------------------headerEnd------------------------------------------------------------------------->
<form id="form1" action="<%= request.getContextPath()%>/front-end/member/loginMember.jsp" method="POST">
<div class="card-container" >
  <div class="card u-clearfix" id="joinTeacher">
  <div class=container>
  <div class="row">
  <div class=col-3>
    <div class="card-body"> 
      <span class="card-author subtle">&nbsp;透過WeShare分享您的技能、知識</span>
      <h2 class="card-title">成為老師 輕鬆賺取業外收益</h2>
     <span class="card-description subtle">&nbsp;現在就申請成為老師，開始授課！</span>   
    </div>
    </div>
      <div class=col-6>
      <div class="plese">
      </div>
       <button id="gogo" type="summit" class="btn btn-success btn-lg">成為老師</button>
       </div>
    </div>
    </div>
    <img src="<%=request.getContextPath()%>/images/teacher/joinTeacher.jpg" alt="" class="card-media" width="600px"/>
  </div>
  <div class="card-shadow"></div>
</div>
</form>
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
