<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form  method="get" action="<%= request.getContextPath()%>/MemberServlet" >
								<input type="hidden" name="action" value="updateStatus"> 
								<input type="hidden" name="memId" value="${param.memId}">
								<input type="hidden" name="verifyCode" value="${param.verifyCode}">  
								<input type="submit" class="btn btn-primary btn-lg btn-block">
	</form>
</body>
</html>