<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.goodsorder.model.*"%>

<%
  GoodsOrderVO orderVO = (GoodsOrderVO) request.getAttribute("orderVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�ӫ~��Ʒs�W - addOrder.jsp</title>

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
		 <h3>�ӫ~��Ʒs�W - addOrder.jsp</h3></td><td>
		 <h4><a href="select_page.jsp"><img src="images/tomcat.png" width="100" height="100" border="0">�^����</a></h4>
	</td></tr>
</table>
<%= orderVO==null %> 
<h3>�ӫ~�s�W:</h3>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="goodsorder.do" name="form1" enctype="multipart/form-data" >
<table>

	<tr>
		<td>memId:</td>
		<td><input type="TEXT" name="memId" size="45" 
			 value="<%= (orderVO==null)? "weshare01" : orderVO.getMemId()%>" /></td>
	</tr>
	<tr>
		<td>goodTotalPrice:</td>
		<td><input type="TEXT" name="goodTotalPrice" size="45" 
			 value="<%= (orderVO==null)? "1008" : orderVO.getGoodTotalPrice()%>" /></td>
	</tr>
	<tr>
		<td>goodDate:</td>
		<td><input type="TEXT" name="goodDate" size="45"
			 value="<%= (orderVO==null)? "2019/07/08" : orderVO.getGoodDate()%>" /></td>
	</tr>
	<tr>
		<td>buyerName:</td>
		<td><input type="TEXT" name="buyerName" size="45"
			 value="<%= (orderVO==null)? "���j�v" : orderVO.getBuyerName()%>" /></td>
	</tr>
	<tr>
		<td>buyerAddress:</td>
		<td><input type="TEXT" name="buyerAddress" size="45"
			 value="<%= (orderVO==null)? "��ٰ�" : orderVO.getBuyerAddress()%>" /></td>
	</tr>
	<tr>
		<td>buyerPhone:</td>
		<td><input type="TEXT" name="buyerPhone" size="45"
			 value="<%= (orderVO==null)? "0936167890" : orderVO.getBuyerPhone()%>" /></td>
	</tr>

	<tr>
		<td>goodOrdStatus:</td>
		 <td><input type="TEXT" name="goodOrdStatus" size="45"
			 value="<%= (orderVO==null)? "1" : orderVO.getGoodOrdStatus()%>" /></td>
<!-- 	<td> -->
<!-- 		<select name="goodOrdStatus" size="1" > -->
<!-- 		�@<option value="0">�����q��</option> -->
<!-- 		�@<option value="1" selected="selected">���X�f</option> -->
<!-- 		�@<option value="2">�w�X�f</option> -->
		
<!-- 		</select> -->
<!-- 	</td> -->
	</tr>
	
	
</table>
<br>
<input type="hidden" name="action" value="addOrder">
<input type="submit" value="�e�X�s�W"></FORM>



</body>

</html>