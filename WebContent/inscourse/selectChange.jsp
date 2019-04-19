<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
<title>三階層動態選單</title>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		 $('#grade').change(function(){
			 $('#form1').submit();
		 })
		 $('#class').change(function(){
			 $('#form1').submit();
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
	<form id="form1" action="<%= request.getContextPath()%>/servletResponse" method="POST">
	<input type="hidden" name="action" value="getSelect">
		<c:set scope="page" var="gradeSelect" value="${classList.get(0).gradeId}"></c:set>
		<c:set scope="page" var="classSelect" value="${userList.get(0).classId}"></c:set>
		年級：
		<select name="gradeId" id="grade">
			<option value="-1">請選擇</option>
			<option value="grade3" ${(gradeSelect=="grade3")? 'selected':'' }>三年級</option>
			<option value="grade2" ${(gradeSelect=="grade2")? 'selected':'' }>二年級</option>
			<option value="grade1" ${(gradeSelect=="grade1")? 'selected':'' }>一年級</option>
		</select>
		班別：
		<select name="classId" id="class">
			<option value="-1">請選擇</option>
			<c:forEach var="item" items="${classList}">
				<option value="${item.classId}" ${(item.classId==classSelect)? 'selected':'' } >${item.className}</option>
			</c:forEach>
		</select>
		姓名:
		<select name="nameId">
			<option value="-1">請選擇</option>
			<c:forEach var="item" items="${userList}">
				<option value="${item.nameId}">${item.name}</option>
			</c:forEach>
		</select>
	</form>
	<br><br>

</body>
</html>