<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.inscourse.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    InsCourseService insCourseSvc = new InsCourseService();
    List<InsCourseVO> list = insCourseSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>所有員工資料 - listAllInsCourse.jsp</title>

<style>
	div{
	margin: 5px auto;
	}
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
<div>

<h4>此頁練習採用 EL 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>所有員工資料 - listAllInsCourse.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

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
		<th>修改</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="InsCourseVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${InsCourseVO.inscId}</td>
			<td>${InsCourseVO.teacherId}</td>
			<td>${InsCourseVO.courseId}</td>
			<td>${InsCourseVO.inscLoc}</td>
			<td>${InsCourseVO.inscType}</td>
			<td>${InsCourseVO.inscPeople}</td> 
			<td>${InsCourseVO.inscLang}</td>
			<td>${InsCourseVO.inscPrice}</td>
			<td>${InsCourseVO.inscCourser}</td>
			<td>${InsCourseVO.inscStatus}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Inscourse/InsCourse.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="inscId"  value="${InsCourseVO.inscId}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>
</div>
</body>
</html>