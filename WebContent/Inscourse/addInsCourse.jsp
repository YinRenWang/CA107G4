<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.inscourse.model.*"%>

<%
InsCourseVO insCourseVO = (InsCourseVO) request.getAttribute("insCourseVO"); 
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>課程資料新增 - addEmp.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
    width: 100%;
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
	form{
	margin: 1px auto;
	}
  table {
	width: 450px;
	background-color: white;
	margin: 1px auto;
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
		 <h3>課程資料新增 - addEmp.jsp</h3></td><td>
		 <h4><a href="select_page.jsp"><img src="images/tomcat.png" width="100" height="100" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3 align="center">資料新增:</h3>

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
		<td>老師:</td>
		<td><input type="TEXT" name="teacherId" size="45"
			 value="<%= (insCourseVO==null)? "TC00001" : insCourseVO.getTeacherId()%>" /></td>
	</tr>
	<tr>
		<td>課程種類:</td>
		<td><input type="TEXT" name="courseId" size="45"
			 value="<%= (insCourseVO==null)? "0005" : insCourseVO.getCourseId()%>" /></td>
	</tr>
	<tr>
		<td>可上課地點:</td>
		<td><input type="TEXT" name="inscLoc" size="45"
			 value="<%= (insCourseVO==null)? "桃園市中壢區" : insCourseVO.getInscLoc()%>" /></td>
	</tr>
	<tr>
		<td>課程類型:</td>
		<td><input type="TEXT" name="inscType" size="45"
			 value="<%= (insCourseVO==null)? "1" : insCourseVO.getInscType()%>" /></td>
	</tr>
	<tr>
		<td>人數:</td>
		<td><input type="TEXT" name="inscPeople" size="45"
			 value="<%= (insCourseVO==null)? "10" : insCourseVO.getInscPeople()%>" /></td>
	</tr>
	<tr>
		<td>語言:</td>
		<td><input type="TEXT" name="inscLang" size="45"
			 value="<%= (insCourseVO==null)? "法文" : insCourseVO.getInscLang()%>" /></td>
	</tr>
	<tr>
		<td>價錢:</td>
		<td><input type="TEXT" name="inscPrice" size="45"
			 value="<%= (insCourseVO==null)? "1000" : insCourseVO.getInscPrice()%>" /></td>
	</tr>
	<tr>
		<td>課綱::</td>
		<td><input type="TEXT" name="inscCourser" size="45"
			 value="<%= (insCourseVO==null)? "我真的很厲害快來" : insCourseVO.getInscCourser()%>" /></td>
	</tr>
	<tr>
		<td>狀態:</td>
		<td><input type="TEXT" name="inscStatus" size="45"
			 value="<%= (insCourseVO==null)? "0" : insCourseVO.getInscStatus()%>" /></td>
	</tr>

	

</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增" ></FORM>
</body>
</html>