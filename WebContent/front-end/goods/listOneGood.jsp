<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.goods.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
  GoodsVO goodVO = (GoodsVO) request.getAttribute("goodVO"); //EmpServlet.java(Concroller), �s�Jreq��empVO����
%>

<html>
<head>
<title>���u��� - listMemEmp.jsp</title>

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
	width: 600px;
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

<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4>
<br><%= goodVO==null %><---[false�N��������goodVO����--true�h�S��]
<table id="table-1">
	<tr><td>
		 <h3>���u��� - ListOneGood.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>�ӫ~�s��</th>
		<th>�Юv�s��</th>
		<th>�ѦW</th>
		<th>����</th>
		<th>�ӫ~��T</th>
		<th>�ӫ~�Ϥ�</th>
		<th>�ӫ~���A</th>
	</tr>
	<tr>
		<td><%=goodVO.getGoodId()%></td>
		<td><%=goodVO.getTeacherId()%></td>
		<td><%=goodVO.getGoodName()%></td>
		<td><%=goodVO.getGoodPrice()%></td>
		<td><%=goodVO.getGoodInfo()%></td>
		<td><img src="<%= request.getContextPath()%>/goods/DBGifReaderGoods.do?goodId=${goodVO.goodId}"></td>
		<td><%=goodVO.getGoodStatus()%></td>
	</tr>
</table>

</body>
</html>