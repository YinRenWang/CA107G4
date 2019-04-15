<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.inscourse.model.*"%>

<%
  InsCourseVO insCourseVO = (InsCourseVO) request.getAttribute("insCourseVO"); //EmpServlet.java (Concroller) 存入req的insCourseVO物件 (包括幫忙取出的insCourseVO, 也包括輸入資料錯誤時的insCourseVO物件)
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>課程資料修改 - InsCourse.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>課程資料修改 - update_InsCourse_input.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料修改:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="InsCourse.do" name="form1">


<table>
	<tr>
		<td>課程編號:<font color=red><b>*</b></font></td>
		<td><%=insCourseVO.getInscId()%></td>
	</tr>
	<tr>
		<td>老師:</td>
		<td><input type="TEXT" name="teacherId" size="45" value="<%=insCourseVO.getTeacherId()%>" /></td>
	</tr>
	<tr>
		<td>課程種類:</td>
		<td><input type="TEXT" name="courseId" size="45"	value="<%=insCourseVO.getCourseId()%>" /></td>
	</tr>
	<tr>
		<td>可上課地點:</td>
		<td><input type="TEXT" name="inscLoc" size="45"	value="<%=insCourseVO.getInscLoc()%>" /></td>
	</tr>
	<tr>
		<td>課程類型:</td>
		<td><input type="TEXT" name="inscType" size="45"	value="<%=insCourseVO.getInscType()%>" /></td>
	</tr>
	<tr>
		<td>人數:</td>
		<td><input type="TEXT" name="inscPeople" size="45"	value="<%=insCourseVO.getInscPeople()%>" /></td>
	</tr>
	<tr>
		<td>語言:</td>
		<td><input type="TEXT" name="inscLang" size="45" value="<%=insCourseVO.getInscLang()%>" /></td>
	</tr>
	<tr>
		<td>價錢:</td>
		<td><input type="TEXT" name="inscPrice" size="45" value="<%=insCourseVO.getInscPrice()%>" /></td>
	</tr>
	<tr>
		<td>課綱:</td>
		<td><input type="TEXT" name="inscCourser" size="45" value="<%=insCourseVO.getInscCourser()%>" /></td>
	</tr>
	<tr>
		<td>狀態:</td>
		<td><input type="TEXT" name="inscStatus" size="45" value="<%=insCourseVO.getInscStatus()%>" /></td>


</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="inscId" value="<%=insCourseVO.getInscId()%>">
<input type="submit" value="送出修改"></FORM>
</body>



</html>