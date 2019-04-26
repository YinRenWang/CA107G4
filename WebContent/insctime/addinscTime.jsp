<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="inscCourseTimeSvc" scope="page" class="com.inscoursetime.model.InsCourseTimeService" />
<jsp:useBean id="insCourseSvc" scope="page" class="com.inscourse.model.InsCourseService" />
<jsp:useBean id="CourseSvc" scope="page" class="com.course.model.CourseService" />
<jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService" />
<%-- <jsp:useBean id="memberVO"  scope="session" type="com.member.model.MemberVO" /> --%>
<%-- <jsp:useBean id="teacherVO"  scope="session" type="com.teacher.model.TeacherVO" />  --%>

<!DOCTYPE html>
<html>
<head>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
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
<div class="container" id="tourpackages-carousel">
      <div class="row">
        <div class="col-lg-12"><h1>課程列表 <a class="btn icon-btn btn-primary pull-right" href="#"><span class="glyphicon btn-glyphicon glyphicon-plus img-circle"></span> 新增課程</a></h1></div>
        

	<c:forEach var="insCourseVO" items="${insCourseSvc.findByTeacher('TC00001')}">	
        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
          <div class="thumbnail">
              <div class="caption">
                <div class='col-lg-12'>
                    <span class="glyphicon glyphicon-credit-card"></span>
                    <button type="button" class="glyphicon glyphicon-trash pull-right text-primary"></button>
                </div>
               
                <div class='col-lg-12 well well-add-card'>
                    <h4> ${CourseSvc.findOneById(insCourseVO.courseId).courseName}</h4> 
                </div>
                <div class='col-lg-12'>
                    <p>上課地區-${insCourseVO.inscLoc}</p> 
                     <p class="text-muted">售價:${insCourseVO.inscPrice}</p> 
                </div>
                
                <form id="form1" action="<%= request.getContextPath()%>/InsCourseTimeServlet" method="GET">
                <input type="hidden" name="action"  value="getOne_For_Display">
                <input type="hidden" name="inscId"  value="${insCourseVO.inscId}"> 
                <input type="submit"class="showTime btn btn-primary btn-xs btn-update btn-add-card" value="上課時間">
                </form>
                
                <form id="form2" action="<%= request.getContextPath()%>/InsCourseTimeServlet" method="GET">
                <button type="button" class="btn btn-danger btn-xs btn-update btn-add-card">課程編輯</button>
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
				<th scope="col">開始時間:</th>
				<th scope="col">結束時間:</th>
				<th scope="col">選項</th>
			</tr>
		</thead>
		
		<tbody>
		<c:forEach var="insCourseTimeVO" items="${timeList}">
			<tr style='background-color:#fee;'>
				<td><input class="start_dateTime" name="start_dateTime" type="text" value="
				<fmt:formatDate value="${insCourseTimeVO.inscMFD}" pattern="yyyy:MM:dd HH:mm"/>
				" readonly="readonly"></td>
				<td><input class="end_dateTime" name="end_dateTime" type="text" value="${insCourseTimeVO.inscEXP}" readonly="readonly"></td>
				<td>
				<input type="hidden" name="inscId" id="inscId"  value="${insCourseTimeVO.inscId}" readonly="readonly"> 
			<form action="<%= request.getContextPath()%>/InsCourseTimeServlet" method="GET">
            <input type="hidden" name="action"  value="delete"> 
            <input type="hidden" name="inscTimeId"  id="inscTimeId" value="${insCourseTimeVO.inscTimeId} readonly="readonly""> 
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
				<td><input class="start_dateTime" name="start_dateTime" id="start_dateTime" type="text" ></td>
				<td><input class="end_dateTime" name="end_dateTime"   id="end_dateTime"   type="text" ></td>
				<td><input type="button" class="add" value="新增"> <input type="button" class="remove" value="刪除">
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
	  format:'Y-m-d H:i:s',
	  onShow:function(){
	   this.setOptions({
	    maxDate:$('.end_dateTime').val()?$('.end_dateTime').val():false
	   })
	  },
	  timepicker:true,
	  step: 60,
	 });
	 
	 $('.end_dateTime').datetimepicker({
	  format:'Y-m-d H:i:s',
	  onShow:function(){
	   this.setOptions({
	    minDate:$('.start_dateTime').val()?$('.start_dateTime').val():false
	   })
	  },
	  timepicker:true,
	  step: 60
	 });
	 
	$('.table1').on('click', '.add', function(){
		$(this).closest('tr').after('<tr><td><input class="start_dateTime" name="start_dateTime" type="text" ></td><td><input class="end_dateTime" name="end_dateTime" type="text" ></td><td><input type="button" class="add" value="新增"> <input type="button" class="remove" value="刪除"></tr>');
		refreshItem();
		 $('.start_dateTime').datetimepicker({
			  format:'Y-m-d H:i:s',
			  onShow:function(){
			   this.setOptions({
			    maxDate:$('.end_dateTime').val()?$('.end_dateTime').val():false
			   })
			  },
			  timepicker:true,
			  step: 60,

			 });
			 
			 $('.end_dateTime').datetimepicker({
			  format:'Y-m-d H:i:s',
			  onShow:function(){
			   this.setOptions({
			    minDate:$('.start_dateTime').val()?$('.start_dateTime').val():false
			   })
			  },
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