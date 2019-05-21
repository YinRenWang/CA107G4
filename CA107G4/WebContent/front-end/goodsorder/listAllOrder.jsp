<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.goodsorder.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
    GoodsOrderService orderSvc = new GoodsOrderService();
    List<GoodsOrderVO> list = orderSvc.getAllOrder();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>�Ҧ��q���� - listAllOrder.jsp</title>

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
	width: 800px;
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

<h4>�����m�߱ĥ� EL ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>�Ҧ����u��� - listAllEmp.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>�q��s��</th>
		<th>�|��</th>
		<th>�`����</th>
		<th>�q����</th>
		<th>����H</th>
		<th>����a�}</th>
		<th>�q��</th>
		<th>�q�檬�A</th>
	
	</tr>
	<%@ include file="pages/page1.file" %> 
	<c:forEach var="orderVO" items="${list}" >
		
		<tr>
			<td>${orderVO.goodOrderId}</td>
			<td>${orderVO.memId}</td>
			<td>${orderVO.goodTotalPrice}</td>
			<td>${orderVO.goodDate}</td>
			<td>${orderVO.buyerName}</td>
			<td>${orderVO.buyerAddress}</td> 
			<td>${orderVO.buyerPhone}</td>
			<td>${orderVO.goodOrdStatus}</td>
			
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/goodsorder/goodsorder.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="goodOrderId"  value="${orderVO.goodOrderId}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			
			
		</tr>
	</c:forEach>
</table>
<%@ include file="pages/page2.file" %>

</body>
</html>