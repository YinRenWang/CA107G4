<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.member.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>loginSuccess.jsp</title>
</head>
<body>

${memberVO}

	<br>
	<table border='1' cellpadding='5' cellspacing='0' width='400'>
		<tr bgcolor='orange' align='center' valign='middle' height='20'>
			<td>
				<h3>登入成功的頁面 - loginSuccess.jsp</h3>
				<h3>
					歡迎:<font color=red> ${memberVO.memName} </font>您好
				</h3>
			</td>
		</tr>
	</table>
	<b> <br> <br> 以下留空....
	</b>

</body>
</html>