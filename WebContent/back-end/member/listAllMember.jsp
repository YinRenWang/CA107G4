<%@page import="java.io.BufferedInputStream"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="java.util.Base64"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    MemberService memberSvc = new MemberService();
    List<MemberVO> list = memberSvc.getAll();
    pageContext.setAttribute("list",list);
%>
<jsp:useBean id="courseSvc" scope="page" class="com.course.model.CourseService" />
<html>
<head>
<title>所有會員資料 - listAllMember.jsp</title>

<style>
  table#table-1 {
	background-color: #a7d7c5;
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
  body{
  background:#f4f9f4;
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
		<th>圖片</th>
		<th>帳號</th>
		<th>姓名</th>
		<th>身份證字號</th>
		<th>信箱</th>
		<th>電話</th>
		<th>生日</th>
		<th>地址</th>
		<th>專長</th>
		<th>想學的</th>
		<th>會員配對</th>
		<th>性別</th>
		<th>介紹</th>
		<th>剩餘點數</th>
		<th>預扣點數</th>
		<th>狀態</th>
		
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="memberVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td><img src="<%=request.getContextPath()%>/member/DBGifReader.do?memId=${memberVO.memId}" width="120" height="120"></td>
			<td>${memberVO.memId}</td>
			<td>${memberVO.memName}</td>
			<td>${memberVO.memIdCard}</td>
			<td>${memberVO.memEmail}</td>
			<td>${memberVO.memPhone}</td>
			<td>${memberVO.memBirth}</td>
			<td>${memberVO.memAdd}</td>
<td>
<c:forEach var="courseVO" items="${courseSvc.getAll()}">
<c:if test="${memberVO.memSkill==courseVO.courseId}"> 
	       ${courseVO.courseName}
 </c:if>
</c:forEach>
</td>
			
<td>
<c:forEach var="courseVO" items="${courseSvc.getAll()}">
<c:if test="${memberVO.memWantSkill==courseVO.courseId}"> 
	       ${courseVO.courseName}
 </c:if>
</c:forEach>
</td>
			
			<td>${memberVO.memPair}</td>
<td>		
 <c:choose>
<c:when test="${memberVO.memSex==0}">
男性
</c:when>
<c:otherwise>
女性
</c:otherwise>
</c:choose>		
</td>	
			
			<td>${memberVO.memText}</td>
			<td>${memberVO.memBalance}</td>
			<td>${memberVO.memBlock}</td>		
<td>		
 <c:choose>
<c:when test="${memberVO.memStatus==0}">
  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member/member.do" style="margin-bottom: 0px;">
			      
			      <input type="hidden" name="memId"  value="${memberVO.memId}">
			     <input type="hidden" name="action"	value="reverify">
			      <input type="submit" value="寄送">
			 </FORM>
</c:when>
<c:otherwise>
已驗證
</c:otherwise>
</c:choose>		
</td>			
	
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>