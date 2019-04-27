<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="inscCourseTimeSvc" scope="page" class="com.inscoursetime.model.InsCourseTimeService" />
<jsp:useBean id="insCourseSvc" scope="page" class="com.inscourse.model.InsCourseService" />
<jsp:useBean id="CourseSvc" scope="page" class="com.course.model.CourseService" />
<jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService" />
<jsp:useBean id="memberVO"  scope="session" type="com.member.model.MemberVO" />
<jsp:useBean id="teacherVO"  scope="session" type="com.teacher.model.TeacherVO" />

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/G4.css ">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<link href="https://cdn.bootcss.com/limonte-sweetalert2/7.33.1/sweetalert2.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/limonte-sweetalert2/7.33.1/sweetalert2.all.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script 
	src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script 
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>	
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
body {
    background: #f4f9f4;
    width: 100%;
    height: 100%;
    font-family: 'Roboto', sans-serif;
    color: #333;
    line-height: 22px;
}
.well {
    min-height: 20px;
    padding: 0px;
    margin-bottom: 20px;
    background-color: #D9D9D9;
    border: 1px solid #D9D9D9;
    border-radius: 0px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
    padding-left: 15px;
    border:0px;
}
.thumbnail .caption {
    padding: 9px;
    color: #333;
    padding-left: 0px;
    padding-right: 0px;
}
.icon-style
{
    margin-right:15px;
    font-size:18px;
    margin-top:20px;
}
p
{
    margin:3px;
}
.well-add-card
{
    margin-bottom:10px;
}
.btn-add-card
{
    margin-top:20px;
}
.thumbnail {
    display: block;
    padding: 4px;
    margin-bottom: 20px;
    line-height: 1.42857143;
    background-color: #fff;
    border: 6px solid #D9D9D9;
    border-radius: 15px;
    -webkit-transition: border .2s ease-in-out;
    -o-transition: border .2s ease-in-out;
    transition: border .2s ease-in-out;
    padding-left: 0px;
    padding-right: 0px;
}
.btn
{
    border-radius:0px;
}
.btn-update
{
    margin-left:15px;
}

#tourpackages-carousel{
 margin-bottom:500px;
}    
</style>
<script>

$(document).ready(function(){
	 
	 $('.showTime').click(function(){
		 var inscId=$('#inscId').val();
		 $('#userId').val(inscId);
		  $('#istime').show(1000);
		  });

});
</script>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>DateTimePicker.jsp</title></head>
<body>
	<!-------------------------------------------------------------------------headerStart------------------------------------------------------------------------->
<div class="header">
      <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top"> <img src="<%= request.getContextPath()%>/images/icon/logo.png" width="80" height="60" alt=""/><a class="navbar-brand" href="<%= request.getContextPath()%>">教育共享平台</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active"> <a class="nav-link" href="#">成為老師 <span class="sr-only">(current)</span></a> </li>
            <li class="nav-item dropdown"> <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">探索課程</a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink"> <a class="dropdown-item" href="<%= request.getContextPath()%>/Inscourse/NewFile.jsp">所有課程</a> <a class="dropdown-item" href="#">音樂</a> <a class="dropdown-item" href="#">語言</a> <a class="dropdown-item" href="#">運動</a> <a class="dropdown-item" href="#">藝術</a> <a class="dropdown-item" href="#">設計</a> <a class="dropdown-item" href="#">人文</a> <a class="dropdown-item" href="#">行銷</a> <a class="dropdown-item" href="#">程式語言</a> <a class="dropdown-item" href="#">投資理財</a> <a class="dropdown-item" href="#">職場技能</a> <a class="dropdown-item" href="#">手作</a> <a class="dropdown-item" href="#">烹飪</a> </div>
            </li>
            <li class="nav-item"> <a class="nav-link" href="<%= request.getContextPath()%>/member/loginMember.jsp">登入</a> </li>
            <li class="nav-item"> <a class="nav-link" href="<%= request.getContextPath()%>/member/addMember.jsp">註冊</a> </li>
            <li class="nav-item"> <a class="nav-link " href="<%= request.getContextPath()%>/member/listAllMember.jsp">關於我們</a> </li>
          </ul>
        </div>
      </nav>
    </div>	
	<!-------------------------------------------------------------------------headerEnd------------------------------------------------------------------------->
<c:if test="${not empty errorMsgs}">
<c:forEach var="message" items="${errorMsgs}">
<script>
Swal.fire(
		 '請檢查內容',
		  '${message}',
		  'error'
)
</script>
</c:forEach>
</c:if>  

<c:if test="${not empty successMsgs}">
<c:forEach var="successYa" items="${successMsgs}">
<script>
Swal.fire(
		 '恭喜您',
		 '${successYa}',
		  'success'
)



</script>
</c:forEach>
</c:if> 
		  
<div class="container" id="tourpackages-carousel">
      <div class="row">
        <div class="col-lg-12"><h1>課程資訊-課程時間<a class="btn icon-btn btn-primary pull-right" href="http://localhost:8081/CA107G4/inscourse/addInsCourse.jsp" target="_self">
        <span class="glyphicon btn-glyphicon glyphicon-plus img-circle" ></span> 新增課程</a></h1></div>      
	<c:forEach var="insCourseVO" items="${insCourseSvc.findByTeacher(teacherVO.teacherId)}">	
        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
          <div class="thumbnail">
              <div class="caption">
                <div class='col-lg-12'>
                    <span class="glyphicon glyphicon-credit-card"></span>
                          <form action="<%= request.getContextPath()%>/InsCourseServlet" method="GET">
                  <input type="hidden" name="inscId"  value="${insCourseVO.inscId}"> 
                <input type="hidden" name="action"  value="updateStatus">
                 <input type="submit" class="glyphicon glyphicon-trash pull-right text-primary" value="<c:if test="${insCourseVO.inscStatus==0}">下架</c:if><c:if test="${insCourseVO.inscStatus==1}">上架</c:if>">
               </form>
                </div>
               
                <div class='col-lg-12 well well-add-card'>
                    <h4> ${CourseSvc.findOneById(insCourseVO.courseId).courseName}</h4> 
                </div>
                <div class='col-lg-12'>
                    <p>上課地區-${insCourseVO.inscLoc}</p> 
                     <p class="text-muted">售價:$${insCourseVO.inscPrice}</p> 
                </div>
                
                <form id="form1" action="<%= request.getContextPath()%>/InsCourseTimeServlet" method="GET">
                <input type="hidden" name="action"  value="getOne_For_Display">
                <input type="hidden" name="inscId"  value="${insCourseVO.inscId}"> 
                <input type="submit"class="showTime btn btn-primary btn-xs btn-update btn-add-card" value="上課時間">
                </form>
                
                <form action="<%= request.getContextPath()%>/InsCourseServlet" method="GET">
                  <input type="hidden" name="inscId"  value="${insCourseVO.inscId}"> 
                <input type="hidden" name="action"  value="updateStatus">
                <input type="submit" class="btn btn-danger btn-xs btn-update btn-add-card" value="課程編輯">
               </form>
               
            </div>
          </div>
        </div>
    </c:forEach>
      </div>

      
      <div class="row" id=istime >
     <div class="col-6">
	<table class="table1 table" border="1" >
	<caption>已新增時間</caption>
		<thead>
			<tr>
				<th scope="col" size="35" >開始時間:</th>
				<th scope="col" size="35" >結束時間:</th>
				<th scope="col" size="35" >選項</th>
			</tr>
		</thead>
		
		<tbody>
		<c:forEach var="insCourseTimeVO" items="${timeList}">
			<tr style='background-color:#fee;'>
				<td><input class="start_dateTime" name="start_dateTime" type="text" size="35" value="
				<fmt:formatDate value="${insCourseTimeVO.inscMFD}" pattern="yyyy-MM-dd HH:mm"/>
				" readonly="readonly"></td>
				<td><input class="end_dateTime" name="end_dateTime" type="text" size="35" value="
				<fmt:formatDate value="${insCourseTimeVO.inscEXP}" pattern="yyyy-MM-dd HH:mm"/>
				" readonly="readonly"></td>
				<td>
				<input type="hidden" name="inscId" id="inscId"  value="${insCourseTimeVO.inscId}" readonly="readonly"> 
			<form action="<%= request.getContextPath()%>/InsCourseTimeServlet" method="GET">
            <input type="hidden" name="action"  value="delete"> 
            <input type="hidden" name="inscTimeId"  id="inscTimeId" value="${insCourseTimeVO.inscTimeId}" readonly="readonly" > 
			<input type="submit" class="remove" value="刪除"> 
			</form>	
				</td>
			</tr>
		</c:forEach>
	</tbody>
		  </table>
		  
		  
<form action="<%= request.getContextPath()%>/InsCourseTimeServlet" method="get">
    <input type="hidden" name="inscId"  id="userId" value="${param.inscId}"> 
	<table class="table1 table" border="1" cellpadding="1">
		<caption>新增時間</caption>
		<thead>
			<tr>
				<th scope="col">開始時間:</th>
				<th scope="col">結束時間:</th>
				<th scope="col">選項</th>
			</tr>
		</thead>
		<tbody>
			<tr style='background-color:#fee;'>
				<td><input class="start_dateTime" name="start_dateTime" id="start_dateTime" type="text" size="35"  ></td>
				<td><input class="end_dateTime" name="end_dateTime"   id="end_dateTime"   type="text"  size="35" ></td>
				<td><input type="button" class="add" value="新增" > <input type="button" class="remove" value="刪除">
			</tr>
		</tbody>
		
	
	</table>
	<input type="hidden" name="action" value="insert">
	<input type="submit" class="btn btn-success" value="確認時間">
	</form>
			  
	 	</div>
      </div>
      
    </div>
</body>
	<!-------------------------------------------------------------------------footerStart------------------------------------------------------------------------->
	<footer
		class="section footer-classic context-dark bg-image footer navbar-fixed-bottom"
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
<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<!-- 參考網站: https://xdsoft.net/jqplugins/datetimepicker/ -->
<link   rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
$.datetimepicker.setLocale('zh'); // kr ko ja en
$(function(){	
	 $('.start_dateTime').datetimepicker({
	  format:'Y-m-d H:i',
	  minDate:'-1970-01-01',
	  maxDate:'2019-04-30',
	  timepicker:true,
	  step: 60,
	 });
	 
	 $('.end_dateTime').datetimepicker({
	  format:'Y-m-d H:i',
	  minDate:'-1970-01-01',
	  maxDate:'2019-04-30',
	  timepicker:true,
	  step: 60
	 });
	 
	$('.table1').on('click', '.add', function(){
		$(this).closest('tr').after('<tr style="background-color:#fee"><td><input class="start_dateTime" name="start_dateTime" type="text"  size="35"></td><td><input class="end_dateTime" name="end_dateTime" type="text"  size="35"></td><td><input type="button" class="add" value="新增"> <input type="button" class="remove" value="刪除"></tr>');
		refreshItem();
		 $('.start_dateTime').datetimepicker({
			  format:'Y-m-d H:i',
			  minDate:'-1970-01-01',
			  maxDate:'2019-04-30',
			  timepicker:true,
			  step: 60,
			 });
			 
		 $('.end_dateTime').datetimepicker({
			  format:'Y-m-d H:i',
			  minDate:'-1970-01-01',
			  maxDate:'2019-04-30',
			  timepicker:true,
			  step: 60
			 });
			 
				$('.table1').on('click', '.remove', function(){
					$(this).closest('tr').remove();
					refreshItem();
				});
			 
			});

			function refreshItem(){
				$('.table1 tr').each(function(index, item){
				});	
			};

			function isNumber(numb){
				return /^\d+$/.test(numb);
			}
			 
	});
</script>

</html>