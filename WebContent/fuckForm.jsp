<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>DateTimePicker.jsp</title></head>
<body>
		<form action="<%= request.getContextPath()%>/InsCourseTimeServlet" method="get">
	<table class="table1" border="1" cellpadding="1">

		
		<thead>
			<tr>
				<th>筆數</th>
				<th>開始日期時間:</th>
				<th>結束日期時間:</th>
			</tr>
		</thead>
	
		<tbody>
			<tr style='background-color:#fee;'>
				<td class="rank">1</td>
				<td><input class="start_dateTime" name="start_dateTime" id="start_dateTime" type="text" ></td>
				<td><input class="end_dateTime" name="end_dateTime"   id="end_dateTime"   type="text" ></td>
				<td><input type="button" class="add" value="新增"> <input type="button" class="remove" value="刪除">
			</tr>
		</tbody>
		
	
	</table>
	<input type="hidden" name="action" value="insert">
	<input type="submit" class="btn btn-success" value="送出申請">
	</form>
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
		$(this).closest('tr').after('<tr><td class="rank"></td><td><input class="start_dateTime" name="start_dateTime"id="start_dateTime"type="text"></td><td><input class="end_dateTime" name="end_dateTime"id="end_dateTime"type="text"></td><td><button class="add">新增</button> <button class="remove">刪除</button></td></tr>');
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
</script>

</html>