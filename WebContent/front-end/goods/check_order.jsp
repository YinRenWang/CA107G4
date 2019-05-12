<%@page import="com.member.model.MemberService"%>
<%@page import="com.member.model.MemberVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import ="com.goods.model.GoodsVO" %>


<%
//會員
	MemberVO mvo = (MemberVO) request.getSession().getAttribute("memberVO");
	if (mvo == null) {
		MemberService MScv = new MemberService();
		mvo = MScv.getOneMember("weshare02");
		request.getSession().setAttribute("mvo", mvo);
	}
	
	
	
	
%>




<html>
<head>

 <title>購物車訂單-check_order.jsp</title>
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ShoppingCart.css">
 <script src="<%=request.getContextPath()%>/tw-city-selector-master/dist/tw-city-selector.js"></script>


 
 </head>
<body>

 <script>
  new TwCitySelector();
</script>

		<div>
			<div class="row">
				<center><font size="+3"> 購物車訂單</font>
		<form  id="form1" action="<%=request.getContextPath()%>/GoodsOrderServlet" method="GET">				
		<input type="hidden" name="memId" value="${mvo.memId}" class="userInput" id="g1">
		<div>收件人姓名:<input type="text" name="buyerName" value="" class="userInput"></div>		
		<div>
			<div role="tw-city-selector">收件人地址:</div><input type="text" name="address" value="" class="userInput">
		</div>
		<div>收件人電話:<input type="text" name="buyerPhone" value="" class="userInput"></div></<center></div></div>

		
<hr><p>

<table id="table-1" style="margin: auto;">
	<tr>
		<th width="200">商品圖片</th>
		<th width="200">商品名稱</th>
		<th width="200">單價</th>
		<th width="200">數量	</th>
		
	</tr>

	<%  @SuppressWarnings("unchecked")
		Vector<GoodsVO> goodlist = (Vector<GoodsVO>) session.getAttribute("shoppingcart");
		String totalPrice =  (String) request.getAttribute("totalPrice");
	%>	
	<%	for (int i = 0; i < goodlist.size(); i++) {
			GoodsVO order = goodlist.get(i);
			byte[] img = order.getGoodImg();
			String name = order.getGoodName();
			Integer price = order.getGoodPrice();
			Integer quantity = order.getQuantity();
			
	%>
	<tr>
		<td width="200"><img src="<%= request.getContextPath()%>/goods/DBGifReaderGoods.do?goodId=<%=order.getGoodId()%>"></td>
		<td width="200"><%= name%>    </td>
		<td width="200"><%= price%>   </td>
		<td width="200"><%= quantity%></td>
		
	</tr>
	<%
		}
	%>
	 
	
	<tr>
		<td colspan="6" style="text-align:right;"> 
		   <font size="+3">總金額：${totalPrice}</font><br>
		   <input type="hidden" name = "goodTotalPrice" value="${totalPrice}" class="userInput">
		   <a class="nav-item nav-link" href="<%=request.getContextPath()%>/front-end/goods/shoppingcart.jsp">返回購物車</a>
	    </td>
	</tr>
</table>
		
       
       <input type="hidden" name="action" value="Detail">
       <center><input type="button" value="付款結帳" class="button" id="go" ></center>
       </form>
       
</body>
</html>

<script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript">

		$(document).ready(function() {
			$('#go').click(function(){
			var xxx=$(".userInput").val();
			if(xxx==""||xxx==null){
				alert("請輸入資料");
			}else{
				$('#form1').submit();
			}
				
				

			})
			
			
			}); 

</script>