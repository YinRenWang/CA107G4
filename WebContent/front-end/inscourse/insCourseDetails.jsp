<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.coursereservation.model.*"%>
<%@ page import="java.util.Base64"%>

<jsp:useBean id="now" scope="page" class="java.util.Date" />  
<jsp:useBean id="inscCourseTimeSvc" scope="page" class="com.inscoursetime.model.InsCourseTimeService" />
<jsp:useBean id="courseReservationSvc" scope="page" class="com.coursereservation.model.CourseReservationService" />
<jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService" />

<%
	String inscid=request.getParameter("inscId");
	CourseReservationService xxx = new CourseReservationService();
	List<CourseReservationVO> yyy = xxx.findByRate(inscid);
	Double zzz=0.0;
	Double point=0.0;
	Double really=0.0;
	int howPeople=yyy.size();
	for(int i=0;i<yyy.size();i++){
		CourseReservationVO obj = yyy.get(i);
		zzz+=obj.getCrvScore();
	}
	point=(zzz/yyy.size())*2;
	really=point/2;
	pageContext.setAttribute("point",point);
	pageContext.setAttribute("howPeople",howPeople);
	pageContext.setAttribute("really",really);
%>


<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css" >
<link href="https://cdn.bootcss.com/limonte-sweetalert2/7.33.1/sweetalert2.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/limonte-sweetalert2/7.33.1/sweetalert2.all.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link   rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
<style type="text/css">
.xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
body {
    background: #f4f9f4;
    width: 100%;
    height: 100%;
    font-family: 'Roboto', sans-serif;
    color: #333;
    line-height: 22px;
}
#footer {
    background-color: green;
}
.header {
    margin-top: 76px;
}
.cardPadding {
    padding-top: 5%;
    padding-bottom: 5%;
    padding-right: 10%;
    padding-left: 10%;
}
.cardPadding-title {
    padding-bottom: 3%;
    padding-left: 2%;
}
.cardPadding-title .img-thumbnail {
    display: inline;
}
.cardPadding-title h5 {
    display: inline;
}
.teacherImg {
    width: 60px;
    height: 60px;
    border-radius: 30px;
    border: 2px #fff solid;
    line-height: 60px;
    font-size: 14px;
    background-image: url("/img/blob/01.jpg");
    text-align: center;
    top: -7.5%;
    position: absolute;
}
.search {
    background: -webkit-linear-gradient(left, #a7d7c5, #5c8d89);
    opacity: 0.5;
}
#df1 {
    padding-left: 30%;
}
#df4 {
    padding-right: 30%;
}
.form-control {
    margin-bottom: 2%;
}
.search-title {
    padding: 0.35%;
}
.context-dark, .bg-gray-dark, .bg-primary {
    color: rgba(255, 255, 255, 0.8);
}
.footer-classic a, .footer-classic a:focus, .footer-classic a:active {
    color: #ffffff;
}
.nav-list li {
    padding-top: 5px;
    padding-bottom: 5px;
}
.nav-list li a:hover:before {
    margin-left: 0;
    opacity: 1;
    visibility: visible;
}
ul, ol {
    list-style: none;
    padding: 0;
    margin: 0;
}
.social-inner {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 100%;
    padding: 23px;
    font: 900 13px/1 "Lato", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
    text-transform: uppercase;
    color: rgba(255, 255, 255, 0.5);
}
.social-container .col {
    border: 1px solid rgba(255, 255, 255, 0.1);
}
.nav-list li a:before {
    content: "\f14f";
    font: 400 21px/1 "Material Design Icons";
    color: #4d6de6;
    display: inline-block;
    vertical-align: baseline;
    margin-left: -28px;
    margin-right: 7px;
    opacity: 0;
    visibility: hidden;
    transition: .22s ease;
}
.reademe {
    margin-top: 11%;
}
.reademe2 {
    margin-top: 15%;
}
.brand {
}
.wrapCenter {
    margin-right: 20%;
    margin-left: 20%;
    margin-top: 4%;
    justify-content: center;
    border: 2px solid #cccccc;
    border-radius: 10px;
    box-sizing: border-box;
    width: 100%;
    max-width: 1200px;
    display: flex;
    flex-wrap: wrap;
}
.itemCenter {
    width: calc(100% - 20px);
    margin: 10px;
    height: 120px;
}
.itemCenter {
    width: calc(100% - 20px);
    margin: 10px;
    height: 120px;
    display: flex;
}
.itemCenter img {
    margin-top: 8.5%;
    margin-left: 7.5%;
}
.itemCenter p {
    text-align: center;
    letter-spacing: 1px;
    line-height: 110px;
}
.row .card-header {
    text-align: center;
}
.course-deck {
    margin-bottom: 6%;
    width: 500px;
}
.img-fluid {
    width: 100%;
    border-radius: calc(.25rem - 1px);
}
h1, h2, h3, h4, h5, h6 {
    font-family: 'Roboto Condensed', sans-serif;
    font-weight: 400;
    color: #111;
    margin-top: 5px;
    margin-bottom: 5px;
}
h1, h2, h3 {
    text-transform: uppercase;
}
input.upload {
    position: absolute;
    top: 0;
    right: 0;
    margin: 0;
    padding: 0;
    font-size: 12px;
    cursor: pointer;
    opacity: 1;
    filter: alpha(opacity=1);
}
.form-inline .form-group {
    margin-left: 2%;
    margin-right: 0;
}
.control-label {
    color: #333333;
}
#signUp {
    margin-left: 2.5%;
}
#carouselExampleSlidesOnly {
    margin-top: 4.4%;
}
#demo {
    width: 100%;
}
.carousel-item h1 {
    text-align: center;
}
.title.TitleImg {
    background-size: cover;
    background-image: url('img/hero-image-wrapper.png');
    padding: 40px;
}
body {
    -webkit-font-smoothing: antialiased;
    text-rendering: optimizeLegibility;
    font-family: 'Noto Sans', sans-serif;
    letter-spacing: 0px;
    font-size: 14px;
    color: #2e3139;
    font-weight: 400;
    line-height: 26px;
}
h1, h2, h3, h4, h5, h6 {
    letter-spacing: 0px;
    font-weight: 400;
    color: #1c1e22;
    margin: 0px 0px 15px 0px;
    font-family: 'Noto Sans', sans-serif;
}
h1 {
    font-size: 42px;
    line-height: 50px;
}
h2 {
    font-size: 36px;
    line-height: 42px;
}
h3 {
    font-size: 20px;
    line-height: 32px;
}
h4 {
    font-size: 18px;
    line-height: 32px;
}
h5 {
    font-size: 14px;
    line-height: 20px;
}
h6 {
    font-size: 12px;
    line-height: 18px;
}
p {
    margin: 0 0 20px;
    line-height: 1.8;
}
p:last-child {
    margin: 0px;
}
ul, ol {
}
a {
    text-decoration: none;
    color: #2e3139;
    -webkit-transition: all 0.3s;
    -moz-transition: all 0.3s;
    transition: all 0.3s;
}
a:focus, a:hover {
    text-decoration: none;
    color: #0943c6;
}
.content {
    padding-top: 80px;
    padding-bottom: 80px
}
;
/*------------------------
Radio & Checkbox CSS
-------------------------*/
.form-control {
    border-radius: 4px;
    font-size: 14px;
    font-weight: 500;
    width: 100%;
    height: 70px;
    padding: 14px 18px;
    line-height: 1.42857143;
    border: 1px solid #dfe2e7;
    background-color: #dfe2e7;
    text-transform: capitalize;
    letter-spacing: 0px;
    margin-bottom: 16px;
    -webkit-box-shadow: inset 0 0px 0px rgba(0, 0, 0, .075);
    box-shadow: inset 0 0px 0px rgba(0, 0, 0, .075);
    -webkit-appearance: none;
}
input[type=radio].with-font, input[type=checkbox].with-font {
    border: 0;
    clip: rect(0 0 0 0);
    height: 1px;
    margin: -1px;
    overflow: hidden;
    padding: 0;
    position: absolute;
    width: 1px;
}
input[type=radio].with-font~label:before, input[type=checkbox].with-font~label:before {
    font-family: FontAwesome;
    display: inline-block;
    content: "\f1db";
    letter-spacing: 10px;
    font-size: 1.2em;
    color: #dfe2e7;
    width: 1.4em;
}
input[type=radio].with-font:checked~label:before, input[type=checkbox].with-font:checked~label:before {
    content: "\f00c";
    font-size: 1.2em;
    color: #0943c6;
    letter-spacing: 5px;
}
input[type=checkbox].with-font~label:before {
    content: "\f096";
}
input[type=checkbox].with-font:checked~label:before {
    content: "\f046";
    color: #0943c6;
}
input[type=radio].with-font:focus~label:before, input[type=checkbox].with-font:focus~label:before, input[type=radio].with-font:focus~label, input[type=checkbox].with-font:focus~label {
}
.box {
    background-color: #fff;
    border-radius: 8px;
    border: 2px solid #e9ebef;
    padding: 50px;
    margin-bottom: 40px;
}
.box-title {
    margin-bottom: 30px;
    text-transform: uppercase;
    font-size: 16px;
    font-weight: 700;
    color: #094bde;
    letter-spacing: 2px;
}
.plan-selection {
    border-bottom: 2px solid #e9ebef;
    padding-bottom: 25px;
    margin-bottom: 35px;
}
.plan-selection:last-child {
    border-bottom: 0px;
    margin-bottom: 0px;
    padding-bottom: 0px;
}
.plan-data {
    position: relative;
}
.plan-data label {
    font-size: 20px;
    margin-bottom: 15px;
    font-weight: 400;
}
.plan-text {
    padding-left: 35px;
}
.plan-price {
    position: absolute;
    right: 0px;
    color: #094bde;
    font-size: 20px;
    font-weight: 700;
    letter-spacing: -1px;
    line-height: 1.5;
    bottom: 43px;
}
.term-price {
    bottom: 18px;
}
.secure-price {
    bottom: 68px;
}
.summary-block {
    border-bottom: 2px solid #d7d9de;
}
.summary-block:last-child {
    border-bottom: 0px;
}
.summary-content {
    padding: 28px 0px;
}
.summary-price {
    color: #094bde;
    font-size: 20px;
    font-weight: 400;
    letter-spacing: -1px;
    margin-bottom: 0px;
    display: inline-block;
    float: right;
}
.summary-small-text {
    font-weight: 700;
    font-size: 12px;
    color: #8f929a;
}
.summary-text {
    margin-bottom: -10px;
}
.summary-title {
    font-weight: 700;
    font-size: 14px;
    color: #1c1e22;
}
.summary-head {
    display: inline-block;
    width: 120px;
}
.widget {
    margin-bottom: 30px;
    background-color: #e9ebef;
    padding: 50px;
    border-radius: 6px;
}
.widget:last-child {
    border-bottom: 0px;
}
.widget-title {
    color: #094bde;
    font-size: 16px;
    font-weight: 700;
    text-transform: uppercase;
    margin-bottom: 25px;
    letter-spacing: 1px;
    display: table;
    line-height: 1;
}
.btn {
    font-family: 'Noto Sans', sans-serif;
    font-size: 16px;
    text-transform: capitalize;
    font-weight: 700;
    padding: 12px 36px;
    border-radius: 4px;
    line-height: 2;
    letter-spacing: 0px;
    -webkit-transition: all 0.3s;
    -moz-transition: all 0.3s;
    transition: all 0.3s;
    word-wrap: break-word;
    white-space: normal !important;
}
.btn-default {
    background-color: #0943c6;
    color: #fff;
    border: 1px solid #0943c6;
}
.btn-default:hover {
    background-color: #063bb3;
    color: #fff;
    border: 1px solid #063bb3;
}
.btn-default.focus, .btn-default:focus {
    background-color: #063bb3;
    color: #fff;
    border: 1px solid #063bb3;
}
	.teachName{
		padding-left: 20px;
		padding-top: 10px;
	}
	
	.howPeople{
		margin-left: -50px;
		padding-top: 57px;
	}
	
	.fakeimg{
		margin-top:8%;
		margin-left: -2%;
		
	}
	
    .badge-pill{
    font-size: 18px;
    margin-bottom:5px: 
    }
    .box-title{
    font-size: 20px; 
    }
 	
    .orderSumit{
        width:20px;
    }
    
        	.star-vote{
                width:120px;
                height:20px;
                position:relative;
                overflow:hidden;
            }
            .star-vote>span{
                position:absolute;
                width:120px;
                height:20px;
                background-size:cover;
                background-repeat:no-repeat;
                left:0px;
                top:0px;
            }
            .star-vote>.add-star{
                background-image:url("<%=request.getContextPath()%>/images/inscourse/yellow-star.png");
            }
            .star-vote>.del-star{
                background-image:url("<%=request.getContextPath()%>/images/inscourse/white-star.png");
                background-color:white;
             }
    
	
@media screen and (min-width: 768px) {
.itemCenter {
}
.itemCenter {
    width: calc(100% / 3 - 20px);
}
}
	
</style>

<title>WeShare | 最棒的教育共享平台</title>
</head>


<body onload="connect();">
<!------------------------------------------------------首頁頭------------------------------------------------------>
<%@ include file="/front-end/backHeaderFooter/header.jsp"%>  	
<!----------------------------------------------------------------------------------------------------------------->
<jsp:include page="/front-end/inscourse/courseBody.jsp"></jsp:include>
<!------------------------------------------------------首頁尾------------------------------------------------------>
<%@ include file="/front-end/backHeaderFooter/footer.jsp"%> 

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script> 
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>