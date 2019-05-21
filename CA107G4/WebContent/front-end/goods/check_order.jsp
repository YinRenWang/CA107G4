<%@page import="com.member.model.MemberService"%>
<%@page import="com.member.model.MemberVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import ="com.goods.model.GoodsVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<html>
<head>
<%@ include file="/front-end/backHeaderFooter/header.jsp"%>  
 <title>購物車訂單-check_order.jsp</title>
 <script src="<%=request.getContextPath()%>/tw-city-selector-master/dist/tw-city-selector.js"></script>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css" >
<link href="https://cdn.bootcss.com/limonte-sweetalert2/7.33.1/sweetalert2.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/limonte-sweetalert2/7.33.1/sweetalert2.all.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link   rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/front-end/css/G4.css ">
<style type="text/css">
body {
	margin:auto;
    padding:0;
    background: #f4f9f4;
    width: 100%;
}
#footer {
    background-color: green;
}
.cardPadding {
    padding-top: 5%;
    padding-bottom: 5%;
    padding-right: 10%;
    padding-left: 10%;
}
.cardPadding-title {
    padding-bottom: 3%;
    padding-left: 2%;
}
.cardPadding-title .img-thumbnail {
    display: inline;
}
.cardPadding-title h5 {
    display: inline;
}
.teacherImg {
    width: 120px;
    height: 120px;
     background-size:cover;
    border-radius: 60px;
	border: 2px #fff solid;
    line-height: 60px;
    font-size: 14px;
    text-align: center;
    top: -7.5%;
    position: absolute;
}
.search {
    background: -webkit-linear-gradient(left, #a7d7c5, #5c8d89);
    opacity: 0.5;
}
#df1 {
    padding-left: 30%;
}
#df4 {
    padding-right: 30%;
}
.form-control {
    margin-bottom: 2%;
}
.search-title {
    padding: 0.35%;
}
.context-dark, .bg-gray-dark, .bg-primary {
    color: rgba(255, 255, 255, 0.8);
}
.footer-classic a, .footer-classic a:focus, .footer-classic a:active {
    color: #ffffff;
}
.nav-list li {
    padding-top: 5px;
    padding-bottom: 5px;
}
.nav-list li a:hover:before {
    margin-left: 0;
    opacity: 1;
    visibility: visible;
}
ul, ol {
    list-style: none;
    padding: 0;
    margin: 0;
}
.social-inner {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 100%;
    padding: 23px;
    font: 900 13px/1 "Lato", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
    text-transform: uppercase;
    color: rgba(255, 255, 255, 0.5);
}
.social-container .col {
    border: 1px solid rgba(255, 255, 255, 0.1);
}
.nav-list li a:before {
    content: "\f14f";
    font: 400 21px/1 "Material Design Icons";
    color: #4d6de6;
    display: inline-block;
    vertical-align: baseline;
    margin-left: -28px;
    margin-right: 7px;
    opacity: 0;
    visibility: hidden;
    transition: .22s ease;
}
.reademe {
    margin-top: 11%;
}
.reademe2 {
    margin-top: 15%;
}
.brand {
}
.wrapCenter {
	margin: auto;
    margin-top: 4%;
	max-width: 1200px;
    justify-content: center;
    border: 2px solid #cccccc;
    border-radius: 10px;
    box-sizing: border-box;
    width: 100%;
    display: flex;
   
}
.itemCenter {
    width: calc(100% - 20px);
    margin: 10px;
    height: 120px;
}
.itemCenter {
    width: calc(100% - 20px);
    margin: 10px;
    height: 120px;
    display: flex;
}
.itemCenter img {
    margin-top: 8.5%;
    margin-left: 7.5%;
}
.itemCenter p {
    text-align: center;
    letter-spacing: 1px;
    line-height: 110px;
}
	.row {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    width: 100%
	
}
.row .card-header {
    text-align: center;
}
.course-deck {
  
    min-width:100%;
}
.img-fluid {
    width: 100%;
    border-radius: calc(.25rem - 1px);
}
.header{
		width: 100%;
		box-sizing: border-box;
		ma
}
#koko{
	
    margin-top:5.5%;
    margin-left:22.5%;
}
</style>

<c:if test="${not empty errorMsgs}">
<c:forEach var="message" items="${errorMsgs}">
<script>
Swal.fire(
		 '請檢查內容',
		  '${message}',
		  'error'
)
</script>
</c:forEach>
</c:if>  

 
 </head>
<body>

 <script>
  new TwCitySelector();
</script>

<div class="container" id="koko">
			<div class="row">
		<center><div><font size="+3"> 訂單確認</font></div>
		<div><form  id="form1" action="<%=request.getContextPath()%>/GoodsOrderServlet" method="GET"></div>			
		<input type="hidden" name="memId" value="${memberVO.memId}" class="userInput" id="g1">
		<div>收件人姓名:<input type="text" name="buyerName" id="buyerName" value="" class="userInput" id="byerName"></div>		
		<div>
			<div role="tw-city-selector">收件人地址:</div><input type="text" name="address"  id="address" value="" class="userInput">
		</div>
		<div>收件人電話:<input type="text" name="buyerPhone" id="buyerPhone" pattern="[0-9]{2}[0-9]{8}" class="userInput" id="buyerPhone" required></div></<center>


		
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
		<br>
		
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
       <input id="magic" name="magic" type="button" onclick="Magic()" class="btn btn-link">
       <center><input type="button" value="付款結帳" class="button" id="go" ></center>
       </form>
       </div>
 </div>
 <%@ include file="/front-end/backHeaderFooter/footer.jsp"%>       
</body>
</html>

<script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript">

			$('#go').click(function(){
			var x=$("#byerName").val();
			var y=$("#address").val();
			var z=$("#buyerPhone").val();
			if(x==""||x==null||y==""||y==null||z==""||z==null){
				Swal.fire(
						 '請檢查內容',
						  '請輸入資料',
						  'error'
				)
				
			}else{
				$('#form1').submit();
			}
				
				

			})
</script>

<script type="text/javascript">
		function Magic() {
			
			document.getElementById("buyerName").value = "高健甯";
			document.getElementById("buyerPhone").value = "0910862121";
			
		}	
		</script>	






