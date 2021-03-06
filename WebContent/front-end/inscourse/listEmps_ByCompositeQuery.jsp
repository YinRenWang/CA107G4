<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.inscourse.model.*"%>
<%-- 萬用複合查詢-可由客戶端select_page.jsp隨意增減任何想查詢的欄位 --%>
<%-- 此頁只作為複合查詢時之結果練習，可視需要再增加分頁、送出修改、刪除之功能--%>

<jsp:useBean id="listEmps_ByCompositeQuery" scope="session" type="java.util.List<InsCourseVO>" /> <!-- 於EL此行可省略 -->
<jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService" />
<jsp:useBean id="teacherSvc" scope="page" class="com.teacher.model.TeacherService" />
<jsp:useBean id="courseSvc" scope="page" class="com.course.model.CourseService" />
<jsp:useBean id="courseTypeSvc" scope="page" class="com.coursetype.model.CourseTypeService" />

    <!doctype html>
    <html lang="en">

    <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
 <link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/G4.css ">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
    <style type="text/css">

.mb20 { margin-bottom: 20px; } 

hgroup { padding-left: 15px; border-bottom: 1px solid #ccc; }
hgroup h1 { font: 500 normal 1.625em "Roboto",Arial,Verdana,sans-serif; color: #2a3644; margin-top: 0; line-height: 1.15; }
hgroup h2.lead { font: normal normal 1.125em "Roboto",Arial,Verdana,sans-serif; color: #2a3644; margin: 0; padding-bottom: 10px; }

.search-result .thumbnail { border-radius: 0 !important; }
.search-result:first-child { margin-top: 0 !important; }
.search-result { margin-top: 20px; }
.search-result .col-md-2 { border-left: 1px dotted #ccc; min-height: 140px; }
.search-result ul { padding-left: 0 !important; list-style: none;  }
.search-result ul li { font: 400 normal .85em "Roboto",Arial,Verdana,sans-serif;  line-height: 30px; }
.search-result ul li i { padding-right: 5px; }
.search-result .col-md-7 { position: relative; }
.search-result h3 { font: 500 normal 1.375em "Roboto",Arial,Verdana,sans-serif; margin-top: 0 !important; margin-bottom: 10px !important; }
.search-result h3 > a, .search-result i { color: #248dc1 !important; }
.search-result p { font: normal normal 1.125em "Roboto",Arial,Verdana,sans-serif; } 
.search-result span.plus { position: absolute; right: 0; top: 126px; }
.search-result span.plus a:hover { background-color: #414141; }
.search-result span.plus a i { color: #fff !important; }
.search-result span.border { display: block; width: 97%; margin: 0 15px; border-bottom: 1px dotted #ccc; }

.flight-engine {
    position: absolute;
    left: 0px;
    right: 0px;
    bottom: 50px;
    padding: 20px;
    z-index: 999;
}
.tab1.active {
    display: block
}
.tab1 {
    display: none
}
.tabing {
    float: left;
    width: 100%;
    background: rgba(0, 130, 185, .8);
    padding: 0 10px 10px 10px;
    color: #fff;
}
.tabing ul {
    margin: 0px;
    padding: 0px;
    list-style: none;
    width: 100%;
    float: left;
}
.tabing ul li {
    float: left;
}
.tabing ul li a {
    display: block;
    padding: 5px;
    text-decoration: none;
    color: #fff;
    background: rgba(0, 130, 185, .9);
    margin: 0 10px 0 0;
    padding: 5px 10px 5px 10px;
    border-radius: 0px 0px 5px 5px;
    font-size: 16px;
    text-align: left;
}
.tabing ul li a.active {
    background: #ba0400
}
.flight-tab {
    width: 100%;
    float: left;
    margin-top: 10px;
    padding: 15px
}
.flight-tab .textboxstyle {
    width: 100%;
    float: left;
    color: #191919;
    padding: 8px 10px 8px 35px;
    border: none;
    border-radius: 3px;
    background: #f5f5f5;
    font-size: 14px;
    line-height: 20px;
}
.persent-one {
    width: 19%;
    float: left;
    margin-right: 1%;
    position: relative;
    margin-bottom: 10px;
}
.persent-one i {
    position: absolute;
    left: 10px;
    top: 10px;
    color: #191919;
    font-size: 18px;
}
.persent-one.less-per {
    width: 16%;
    float: left;
    margin-right: 1%;
}
.persent-one.less-btn {
    width: 5%;
    float: left;
    margin-right: 1%;
}
.persent-one.less-btn .cst-btn {
    width: 85px;
    height: 85px;
    border-radius: 100%;
    position: absolute;
    top: -32px;
}
$('.tabing ul li a').click(function(e) {
         e.stopPropagation();
         e.preventDefault();
         var tabcont = $(this).attr('href');
         console.log(tabcont);
         $('.tabing a').removeClass('active');
         $(this).addClass('active');
         $('.tab1').hide();
         $(tabcont).show();
     });

.flight-engine{
  margin-bottom:50%; 
}

#krkr{
 margin-top:7%; 
margin-bottom:290px; 
}

.col-xs-12 .imgblob{

min-height:100%;
margin-left:40px;
 vertical-align : middle;
display: block; 
align-items:center;
justify-content:center;

}

footer{
    width: 100%;
    height:300px;   /* footer的高度一定要是固定值*/ 
    position:absolute;
    bottom:0px;
    left:0px;
}


    </style>
    <title>WeShare | 最棒的教育共享平台</title>
    </head>
    <body>
    <!-------------------------------------------------------------------------headerStart------------------------------------------------------------------------->	
 <%@ include file="/front-end/backHeaderFooter/header.jsp"%> 
    <!-------------------------------------------------------------------------headerEnd------------------------------------------------------------------------->

<div id="krkr">
<div class="container" >

<%@ include file="pages/page1_ByCompositeQuery.file" %>
	

    <hgroup class="mb20">
		<div class="lead"></div>						
	</hgroup>


<c:forEach var="insCourseVO" items="${listEmps_ByCompositeQuery}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
 <FORM METHOD="GET" ACTION="<%=request.getContextPath()%>/inscourse/inscourse.do" style="margin-bottom: 0px;">
	<div class="one-row">

    <section class="col-xs-12 col-sm-6 col-md-12 ">
		<article class="search-result row">
		

			
			<div class="col-xs-12 col-sm-12 col-md-3 border-bottom" >
<c:forEach var="teacherVO" items="${teacherSvc.getAll()}">

<c:if test="${teacherVO.teacherId==insCourseVO.teacherId}"> 
<a href="<%=request.getContextPath()%>/front-end/member/viewAsMember.jsp?memId=${teacherVO.memId}">
<img class="imgblob" src="<%=request.getContextPath()%>/member/DBGifReader.do?memId=${teacherVO.memId}" width="160" height="160" "/></a>
 </c:if>
</c:forEach>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-7 border-bottom border-left">
				
<c:forEach var="teacherVO" items="${teacherSvc.getAll()}">
<c:if test="${teacherVO.teacherId==insCourseVO.teacherId}"> 

<c:forEach var="memberVO" items="${memberSvc.getAll()}">
<c:if test="${memberVO.memId==teacherVO.memId}"> 
	      <h5> 
	      <b class="text-dark">${memberVO.memName}</b>
	      <input type="hidden" name="memId"  value="${memberVO.memId}">
	      <input type="hidden" name="memName"  value="${memberVO.memName}">
	      
	      <b class="text-primary">${teacherVO.teacherText}</b>
	      </h5>
 </c:if>
</c:forEach>

 </c:if>
</c:forEach>



<h6> 
<c:forEach var="courseVO" items="${courseSvc.getAll()}">
<c:if test="${insCourseVO.courseId==courseVO.courseId}"> 
	      
	      
	      課程&nbsp;<b class="text-info">${courseVO.courseName}</b>
	      <input type="hidden" name="courseName"      value="${courseVO.courseName}">
			 <input type="hidden" name="courseTypeName"  value="${courseTypeSvc.findOneById(courseVO.courseTypeId).courseTypeName}">      
	      
	      
 </c:if>
</c:forEach>








<c:forEach var="teacherVO" items="${teacherSvc.getAll()}">
<c:if test="${teacherVO.teacherId==insCourseVO.teacherId}"> 
	      地點&nbsp;<b class="text-secondary"> ${insCourseVO.inscLoc}</b>
	      <input type="hidden" name="teacherEdu"      value="${teacherVO.teacherEdu}">
	      <input type="hidden" name="teacherText"      value="${teacherVO.teacherText}">
	     <input type="hidden" name="teacherId"      value="${teacherVO.teacherId}">
 </c:if>
</c:forEach>
</h6>	
			
				
<p>${insCourseVO.inscCourser}</p>						
                
			</div>

			<div class="col-xs-12 col-sm-12 col-md-2 border-bottom">
				<ul class="meta-search">
					<li><i class="glyphicon glyphicon-calendar"></i>授課語言-<span>${insCourseVO.inscLang}</span></li>
					<li><i class="glyphicon glyphicon-time"></i>售價-<span>${insCourseVO.inscPrice}元</span></li>
					<li><i class="glyphicon glyphicon-tags"></i>上課人數- 
<span>
<c:out value="${insCourseVO.inscPeople}" default="1"/>人
			     <input type="submit" class="btn btn-success" value="上課去" name="submit">
			     <input type="hidden" name="inscId"      value="${insCourseVO.inscId}">
			     <input type="hidden" name="inscType"      value="${insCourseVO.inscType}">
			     <input type="hidden" name="teacherId"      value="${insCourseVO.teacherId}">
			     <input type="hidden" name="inscLoc"      value="${insCourseVO.inscLoc}">
			     <input type="hidden" name="inscPrice"      value="${insCourseVO.inscPrice}">
			     <input type="hidden" name="inscLang"      value="${insCourseVO.inscLang}">
			     <input type="hidden" name="inscCourser"      value="${insCourseVO.inscCourser}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
			     <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--送出當前是第幾頁給Controller-->
			     <input type="hidden" name="action"	    value="findValuebyId"></FORM>

</span></li>
				</ul>
			</div>
	    

			<span class="clearfix borda"></span>
		</article>		

	</section>

	
</div>

	</c:forEach>

<%@ include file="pages/page2_ByCompositeQuery.file" %>

</div>

</div>


</body>
    <!-------------------------------------------------------------------------footerStart------------------------------------------------------------------------->	
    <%@ include file="/front-end/backHeaderFooter/footer.jsp"%> 
    <!-------------------------------------------------------------------------footerEnd------------------------------------------------------------------------->	
    <!-- Optional JavaScript --> 
    <!-- jQuery first, then Popper.js, then Bootstrap JS --> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script> 
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  
    </html>
