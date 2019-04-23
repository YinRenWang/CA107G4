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
<!-- Ajax是簡單的! -->
<script type="text/javascript">

	$(document).ready(function(){
		 $('#inputSuccess').change(function(){
			 $('#form1').submit();
		 })
		 
		 $(":radio").click(function(){
			 var inscid=$(this).val();
			 $('#inscTimeId').val(inscid);
			 $('#form3').submit();
			  });
		 
		 $('#readyGo').click(function(){
			 var error=$('#crvTotalPrice').val();
			 
			 if(error==0||error==null){
				 alert("請選擇日期!");
			 }else{
				 $('#form2').submit();
			 }
		 })
	        //表示後台選取的星數(1代表0.5)
	     window.onload=showStar(${point});
         function showStar(n){
             var con_wid=document.getElementById("star_con").offsetWidth;
             var del_star=document.getElementById("del_star");
             console.log(con_wid);
             
     //透明星星移動的像素
             var del_move=(n*con_wid)/10;
             
             del_star.style.backgroundPosition=-del_move+"px 0px";
             del_star.style.left=del_move+"px";
         }
	
		 

	})
	
</script>
<body>
<!------------------------------------------------------首頁頭------------------------------------------------------>
<div class="header">
  <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top"> <img src="<%=request.getContextPath()%>/images/icon/logo.png" width="80" height="60" alt=""/><a class="navbar-brand" href="#">教育共享平台</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active"> <a class="nav-link" href="#">成為老師 <span class="sr-only">(current)</span></a> </li>
        <li class="nav-item dropdown"> <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">探索課程</a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink"> <a class="dropdown-item" href="#">所有課程</a> <a class="dropdown-item" href="#">音樂</a> <a class="dropdown-item" href="#">語言</a> <a class="dropdown-item" href="#">運動</a> <a class="dropdown-item" href="#">藝術</a> <a class="dropdown-item" href="#">設計</a> <a class="dropdown-item" href="#">人文</a> <a class="dropdown-item" href="#">行銷</a> <a class="dropdown-item" href="#">程式語言</a> <a class="dropdown-item" href="#">投資理財</a> <a class="dropdown-item" href="#">職場技能</a> <a class="dropdown-item" href="#">手作</a> <a class="dropdown-item" href="#">烹飪</a> </div>
        </li>
        <li class="nav-item"> <a class="nav-link" href="#">登入</a> </li>
        <li class="nav-item"> <a class="nav-link" href="#">註冊</a> </li>
        <li class="nav-item"> <a class="nav-link disabled" href="#">關於我們</a> </li>
      </ul>
    </div>
  </nav>
</div>
<!----------------------------------------------------------------------------------------------------------------->
<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="#">課程類型</a></li>
    <li class="breadcrumb-item"><a href="#">程式語言</a></li>
    <li class="breadcrumb-item active" aria-current="page">${param.courseName}</li>
  </ol>
</nav>

<!------ Include the above in your HEAD tag ---------->


<form id="form1" action="<%= request.getContextPath()%>/InsCourseServlet" method="POST">
<input type="hidden" name="action"  id="action" value="updateDate">
<div class="content">

  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-8 col-sm-7 col-xs-12">
        <div class="box d-flex" id="tc1">
          <div class="tcimg"><img src="<%=request.getContextPath()%>/member/DBGifReader.do?memId=${param.memId}" width="120" height="120" alt=""/> </div>
          <div class="teachName">
            <h4>${param.memName}</h4>
<input type="hidden" name="memName"  value="${param.memName}">
<input type="hidden" name="teacherId" value="${param.teacherId}"> 
<input type="hidden" name="memId"  value="${param.memId}">    

       
 		 <div id="star_con" class="star-vote">
            <span id="add_star" class="add-star"></span>
            <span id="del_star" class="del-star"></span>
        </div>  
	      <img src="http://localhost:8081/CA107G4/images/inscourse/connection.png" width="180" height="45" class="fakeimg"/> </div>
 
			<span><h5 class="howPeople">${really}(${howPeople}人評分)</h5></span>
        </div>
		  
        <div class="box">
          <h3 class="box-title" badge badge-light>科目</h3>

          <div class="accordion" id="heading">


            <div class="card">
              <div class="card-header" >
                <h2 class="mb-0">
                  <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" value=""> ${param.courseName}</button>
                </h2>
              </div>
              <div  class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                <div class="card-body">
                    <p><span class="badge badge-pill badge-info">類型</span>
              	<c:if test="${param.inscType==0}">
              		個人課程
              	</c:if>
              	<c:if test="${param.inscType==1}">
              		團體課程
              	</c:if>
                    <p/>
                   <p><span class="badge badge-pill badge-success">地點</span>${param.inscLoc} <p/>
                   <p> <span class="badge badge-pill badge-primary">授課語言</span>${param.inscLang}<p/>
                   <p> <span class="badge badge-pill badge-warning">價錢</span>$${param.inscPrice}元(每小時)<p/>
                   <p> <span class="badge badge-pill badge-secondary">課程大綱</span>${param.inscCourser}<p/>
                   
<input type="hidden" name="inscType"  value="${param.inscType}">   
<input type="hidden" name="inscLoc"  value="${param.inscLoc}"> 
<input type="hidden" name="inscLang"  value="${param.inscLang}">    
<input type="hidden" name="inscPrice"  value="${param.inscPrice}">    
<input type="hidden" name="inscCourser"  value="${param.inscCourser}">  
                   
                 </div>
              </div>
            </div>


          </div>
        </div>
        <div class="box">

          <h3 class="box-title">關於</h3>
          <p>${param.teacherText}</p>
<input type="hidden" name="teacherText"  value="${param.teacherText}">    
           <h3 class="box-title">學歷</h3>
          <p>${param.teacherEdu}</p>
<input type="hidden" name="teacherEdu"  value="${param.teacherEdu}">    

        </div>


       <div class="box">
          <h3 class="box-title">對他的評價</h3>



        <div class="container">
    <div class="row text-center"> 
 <c:forEach var="courseReservationVO" end="2" items="${courseReservationSvc.findByRate(param.inscId)}">	    
                    <div class="col-sm-6 col-md-4">                                                                     
                        <div class="testimonial-box">                           
                           <img src="<%=request.getContextPath()%>/member/DBGifReader.do?memId=${courseReservationVO.memId}" width="120" height="120" alt=""/>
                            <div class="ratings-icons">
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                            </div>
                            <h4>${memberSvc.getOneMember(courseReservationVO.memId).memName}</h4>
                            <p>${courseReservationVO.crvRate}</p> 
                        </div>                  
                    </div>                           
 </c:forEach>                   
                </div>
		</div>
       </div>       
        
        
        
        

        
        
   </div>
 <div class="col-lg-4 col-md-4 col-sm-5 col-xs-12">

<input type="hidden" name="inscId"  value="${param.inscId}">   	
      
		
<div class="contatiner" id="insctime">
<div class="row">
<div class="col-12">
<div class="datePicker">
<span class="badge badge-primary">請選擇日期</span>
<input type="text" class="form-control"  name="inputSuccess" id="inputSuccess"  >  <!-- f_date1見第30行  -->

<script>

        $.datetimepicker.setLocale('zh'); // kr ko ja en
        $('#inputSuccess').datetimepicker({
           theme: '',          //theme: 'dark',
           timepicker: false,   //timepicker: false,
           step: 1,            //step: 60 (這是timepicker的預設間隔60分鐘)
	       format: 'Y-m-d',
           //disabledDates:    ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	        '2017/07/10',  // 起始日
           minDate:           '-1970-01-01', // 去除今日(不含)之前
           //maxDate:           '+1970-01-01'  // 去除今日(不含)之後
        });
</script>
</div>
</div>

<div class="timePicker">
</div>	

</form>	
</div>	


<form id="form3" action="<%= request.getContextPath()%>/InsCourseServlet" method="POST"> 
<input type="hidden" name="action"  id="action" value="updateTime"> 
<div class="row">	
 <c:forEach var="inscCourseTimeVO" items="${list}">	
 
<div class="col-1"></div>
<div class="col-5">
<div class="form-check">
<input class="form-check-input" type="radio" name="inscDate" value="${inscCourseTimeVO.inscTimeId}" />
<label class="form-check-label" for="exampleRadios1">
   				 <fmt:formatDate value="${inscCourseTimeVO.inscMFD}" pattern="HH:mm"/>
    			 <fmt:formatDate value="${inscCourseTimeVO.inscEXP}" pattern="HH:mm"/>			 
</label>

</div>
</div>

 </c:forEach>
 </div>
 
<input type="hidden" name="inscTimeId"  id="inscTimeId" value="">
<input type="hidden" name="memName"  value="${param.memName}">
<input type="hidden" name="teacherId" value="${param.teacherId}"> 
<input type="hidden" name="memId"  value="${param.memId}">    
<input type="hidden" name="inscType"  value="${param.inscType}">   
<input type="hidden" name="inscLoc"  value="${param.inscLoc}"> 
<input type="hidden" name="inscLang"  value="${param.inscLang}">    
<input type="hidden" name="inscPrice"  value="${param.inscPrice}">    
<input type="hidden" name="inscCourser"  value="${param.inscCourser}">  
<input type="hidden" name="teacherText"  value="${param.teacherText}"> 
<input type="hidden" name="teacherEdu"  value="${param.teacherEdu}">   
<input type="hidden" name="inscId"  value="${param.inscId}">  
 
</form>

  
</div>
		  
 

   
	  

 

	  
<form id="form2" action="<%= request.getContextPath()%>/coursereservation/coursereservation.do" method="POST">	
 <input type="hidden" name="action" value="addOrder">     
 <input type="hidden" name="memName"  value="${param.memName}">
<input type="hidden" name="teacherId" value="${param.teacherId}"> 
<input type="hidden" name="memId"  value="${param.memId}"> 
 <input type="hidden" name="inscId"  value="${param.inscId}">
<input type="hidden" name="crvMFD"  value="${inscMFD}">
 <input type="hidden" name="crvEXP"  value="${inscEXP}">
  <input type="hidden" name="crvLoc"  value="${param.inscLoc}">
    <input type="hidden" name="TotalTime"  value="${param.crvTotalTime}">
      <input type="hidden" name="TotalPrice"  value="${param.crvTotalPrice}">
        <div class="widget">
          <h4 class="widget-title">預訂課程</h4>
          
        <div class="summary-block">
            <div class="summary-content">
              <div class="summary-head">
                <h5 class="summary-title">上課時段</h5>
              </div>
              <div class="summary-price">
                <p class="summary-text">
<fmt:formatDate value="${inscMFD}" pattern="yyyy-MM-dd"/>
<fmt:formatDate value="${inscMFD}" pattern="HH:mm"/>-
<fmt:formatDate value="${inscEXP}" pattern="HH:mm"/>
                </p>
            </div>
          </div>
                 
          <div class="summary-block">
            <div class="summary-content">
              <div class="summary-head">
                <h5 class="summary-title">價格</h5>
              </div>
              <div class="summary-price">
                <p class="summary-text">
                $<c:out value="${crvPrice}" default="0"/></p>
                 <input type="hidden" name="crvTotalTime"  id="crvTotalTime" value="<c:out value="${crvTotalTime}"/>">  
                <span class="summary-small-text pull-right">元(總計小時)</span> </div>
            </div>
          </div>
          <div class="summary-block">
            <div class="summary-content">
              <div class="summary-head">
                <h5 class="summary-title">手續費</h5>
              </div>
              <div class="summary-price">
                <p class="summary-text">
                $<c:out value="${crvTax}" default="0"/>
                </p>
                <span class="summary-small-text pull-right">手續費(10%)</span> </div>
            </div>
          </div>
          <div class="summary-block">
            <div class="summary-content">
              <div class="summary-head">
                <h5 class="summary-title">總金額</h5>
              </div>
              <div class="summary-price">
                <p class="summary-text" >
                $<c:out value="${crvTotalPrice}" default="0"/>
                <input type="hidden" name="crvTotalPrice"  id="crvTotalPrice" value="<c:out value="${crvTotalPrice}" />">     
                </p>
                <span class="summary-small-text pull-right">元</span> </div>
            </div>
          </div><br>



            <div class="d-flex justify-content-center" id="orderSumit"><input type="button" id="readyGo"  class="btn btn-success" value="送出預定 "></div>

        </div>
        
        
 </form>       
      </div>
    </div>
  

  </div>
</div>

<!------------------------------------------------------首頁尾------------------------------------------------------>
<footer class="section footer-classic context-dark bg-image" style="background: #74b49b;">
  <div class="container">
    <div class="row row-30">
      <div class="col-md-4 col-xl-5">
        <div class="pr-xl-4"><a href="index.html"></a>
          <p class="reademe">我們是最佳的共享教育的平台，致力於在分享技能，保障交易，展現自我，使用戶得到最棒的學習體驗。</p>
          <!-- Rights-->
          <p class="rights"><span>©  </span><span class="copyright-year">2018</span><span> </span><span>WeShare教育共享平台</span><span>. </span><span>© All Rights Reserved.
            .</span></p>
        </div>
      </div>
      <div class="col-md-4" >
        <h5 class="reademe">聯絡我們</h5>
        <dl class="contact-list">
          <dt>地址:</dt>
          <dd>桃園市中壢區中大路300號</dd>
        </dl>
        <dl class="contact-list">
          <dt>信箱:</dt>
          <dd><a href="mailto:#">weshare@gmail.com</a></dd>
        </dl>
        <dl class="contact-list">
          <dt>電話:</dt>
          <dd><a href="tel:#">03-425-7387</a> </dd>
        </dl>
      </div>
      <div class="col-md-4 col-xl-3" >
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
    <div class="col"><a class="social-inner" href="#"><span class="icon mdi mdi-facebook"></span><span>Facebook</span></a></div>
    <div class="col"><a class="social-inner" href="#"><span class="icon mdi mdi-instagram"></span><span>instagram</span></a></div>
    <div class="col"><a class="social-inner" href="#"><span class="icon mdi mdi-twitter"></span><span>twitter</span></a></div>
    <div class="col"><a class="social-inner" href="#"><span class="icon mdi mdi-youtube-play"></span><span>google</span></a></div>
  </div>
</footer>
	
 
         
         

<!-----------------------------------------------------------------------------------------------------------------> 
<!-- Optional JavaScript --> 
<!-- jQuery first, then Popper.js, then Bootstrap JS --> 

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script> 
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
