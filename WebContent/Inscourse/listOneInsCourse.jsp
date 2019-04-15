<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.inscourse.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  InsCourseVO insCourseVO = (InsCourseVO) request.getAttribute("insCourseVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<head>
<title>員工資料 - listOneInsCourse.jsp</title>

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
	width: 100%;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<h4>此頁暫練習採用 Script 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>員工資料 - ListOneInsCourse.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>課程編號</th>
		<th>老師</th>
		<th>課程種類</th>
		<th>可上課地點</th>
		<th>課程類型</th>
		<th>人數</th>
		<th>語言</th>
		<th>價錢</th>
		<th>課綱</th>
		<th>狀態</th>
	</tr>
	<tr>
		<td><%=insCourseVO.getInscId()%></td>
		<td><%=insCourseVO.getTeacherId()%></td>
		<td><%=insCourseVO.getCourseId()%></td>
		<td><%=insCourseVO.getInscLoc()%></td>
		<td><%=insCourseVO.getInscType()%></td>
		<td><%=insCourseVO.getInscPeople()%></td>
		<td><%=insCourseVO.getInscLang()%></td>
		<td><%=insCourseVO.getInscPrice()%></td>
		<td><%=insCourseVO.getInscCourser()%></td>
		<td><%=insCourseVO.getInscStatus()%></td>
	</tr>
</table>

</body>
</html>