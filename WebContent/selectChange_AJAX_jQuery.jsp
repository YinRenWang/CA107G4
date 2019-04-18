<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<title>三階層動態選單</title>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		 $('#grade').change(function(){
			 $.ajax({
				 type: "GET",
				 url: "/inscourse/ajaxResponse.do",
				 data: creatQueryString($(this).val(), ""),
				 dataType: "json",
				 success: function (data){
					clearSelect();
					$.each(data, function(i, item){
						$('#class').append("<option value='"+item.classId+"'>"+item.className+"</option>");
					});
// 					$(data).each(function(i, item){
// 						$('#class').append("<option value='"+item.classId+"'>"+item.className+"</option>");
// 					});
// 					jQuery.each(data, function(i, item){
// 						$('#class').append("<option value='"+item.classId+"'>"+item.className+"</option>");
// 					});
			     },
	             error: function(){alert("AJAX-grade發生錯誤囉!")}
	         })
		 })
		 $('#class').change(function(){
			$.ajax({
				 type: "POST",
				 url: "/inscourse/ajaxResponse.do",
				 data: creatQueryString($('#grade').val(), $(this).val()),
				 dataType: "json",
				 success: function (data){
					 clearSelect2();
					 $.each(data, function(i, item){
						 $('#name').append("<option value='"+data[i].nameId+"'>"+data[i].name+"</option>");
					 });
			     },
	            error: function(){alert("AJAX-class發生錯誤囉!")}
	        })
		})
	})
	
	function creatQueryString(paramGrade, paramClass){
		console.log("paramGrade:"+paramGrade+"; paramClass:"+paramClass);
		var queryString= {"action":"getSelect", "gradeId":paramGrade, "classId":paramClass};
		return queryString;
	}
	function clearSelect(){
		$('#class').empty();
		$('#class').append("<option value='-1'>請選擇</option>");
		$('#name').empty();
		$('#name').append("<option value='-1'>請選擇</option>");
	}
	function clearSelect2(){
		$('#name').empty();
		$('#name').append("<option value='-1'>請選擇</option>");
	}
</script>
<body>
	年級：
	<select id="grade">
		<option value="-1">請選擇</option>
		<option value="grade3">三年級</option>
		<option value="grade2">二年級</option>
		<option value="grade1">一年級</option>
	</select>
	班別：
	<select id="class">
		<option value="-1">請選擇</option>
	</select>
	姓名:
	<select id="name">
		<option value="-1">請選擇</option>
	</select>
	<br><br>
	<iframe width="860" height="615" src="https://www.youtube.com/embed/aVmZpcrQBU4?autoplay=1" frameborder="0" allowfullscreen></iframe>
</body>
</html>