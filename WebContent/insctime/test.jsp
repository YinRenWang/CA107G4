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
	<table class="table1" border="1" >
		<thead>
			<tr>
				<th>筆數</th>
				<th>開始時間:</th>
				<th>結束時間:</th>
			</tr>
		</thead>
		
		<tbody>
		<c:forEach var="insCourseTimeVO" items="${timeList}">
			<tr style='background-color:#fee;'>
				<td class="rank"></td>
				<td><input class="start_dateTime" name="start_dateTime" type="text" value="${insCourseTimeVO.inscMFD}"></td>
				<td><input class="end_dateTime" name="end_dateTime" type="text" value="${insCourseTimeVO.inscEXP}"></td>
				<td>
 			<button class="add"disabled="disabled">新增</button> 
			<form action="<%= request.getContextPath()%>/InsCourseTimeServlet" method="GET">
            <input type="hidden" name="action"  value="delete"> 
            <input type="hidden" name="inscTimeId"  value="${insCourseTimeVO.inscTimeId}"> 
			<input type="submit" class="remove" value="刪除">
			</form>	
			<button class="check"disabled="disabled">確認</button>
				</td>
			</tr>
		</c:forEach>
	</tbody>



	<tfoot>	
<div>
<form>
		 <tr>
		 <td class="rank"></td>
		 <td><input class="start_dateTime" name="start_dateTime" type="text" value=""></td>
		 <td><input class="end_dateTime" name="end_dateTime" type="text" value=""></td>
		 <td><input type="button" class="add" value="新增"><input type="button" class="remove" value="刪除" disabled="disabled"></td>
		 </tr>
<input type="hidden" name="action"  value="insert">
<input type="submit" class="remove" value="fuck">
</form>
</div>
	
	</tfoot>
	
	</table>

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
	  format:'Y-m-d H:i',
	  onShow:function(){
	   this.setOptions({
	    maxDate:$('.end_dateTime').val()?$('.end_dateTime').val():false
	   })
	  },
	  timepicker:true,
	  step: 60,
	 });
	 
	 $('.end_dateTime').datetimepicker({
	  format:'Y-m-d H:i',
	  onShow:function(){
	   this.setOptions({
	    minDate:$('.start_dateTime').val()?$('.start_dateTime').val():false
	   })
	  },
	  timepicker:true,
	  step: 60
	 });
	 
	$('.table1').on('click', '.add', function(){
		$(this).closest('tr').after('<tr><td class="rank"></td><td><input class="start_dateTime" name="start_dateTime" type="text" ></td>	<td><input class="end_dateTime" name="end_dateTime" type="text" ></td><td><input type="button" class="add" value="新增"> <input type="button" class="remove" value="刪除"></tr>');
		refreshItem();
		 $('.start_dateTime').datetimepicker({
			  format:'Y-m-d H:i',
			  onShow:function(){
			   this.setOptions({
			    maxDate:$('.end_dateTime').val()?$('.end_dateTime').val():false
			   })
			  },
			  timepicker:true,
			  step: 60,

			 });
			 
			 $('.end_dateTime').datetimepicker({
			  format:'Y-m-d H:i',
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
					$(this).find('.rank').text(index);
				});	
			};

			function isNumber(numb){
				return /^\d+$/.test(numb);
			}
			 
	});
</script>

</html>