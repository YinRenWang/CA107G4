<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.withdrawalrecord.model.*"%>
<%@ page import="com.member.model.*"%>
<%
	WithdrawalRecordVO withdrawalRecordVO = (WithdrawalRecordVO) request.getAttribute("withdrawalRecordVO");
%>

<%
	WithdrawalRecordService withdrawalRecordSvc = new WithdrawalRecordService();
	List<WithdrawalRecordVO> list = withdrawalRecordSvc.getAll();
	pageContext.setAttribute("list", list);
%>


<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<link 
	href="<%=request.getContextPath()%>/css/G4.css" rel="stylesheet" type="text/css">

<!--引用SweetAlert2.js-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js"
	type="text/javascript"></script>


<title>WeShare | 最棒的教育共享平台</title>
</head>

<body>
	<!-- ----------------------------------------------------------------- -->



	<div class="container">
		<div class="py-5 text-center">
			<img class="d-block mx-auto mb-5" src="<%=request.getContextPath()%>/front-end/withdrawalrecord/img/bigtree.png" alt=""
				width="400" height="400">
			<h2>WeShare儲值</h2>
		</div>

		<c:if test="${not empty errorMsgs}">
			<h4 style="color: red; text-align: center;">請修正以下錯誤:</h4>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red; text-align: center;">${message}</li>
				</c:forEach>
			</ul>
		</c:if>




		<div class="row">
			<div class="col-md-3 order-md-2 mb-4">

				<FORM METHOD="GET" action="<%= request.getContextPath()%>/MemberServlet" name="form1">
					<h4 class="d-flex justify-content-between align-items-center mb-3">
						<span class="text-muted">查詢您的訂單</span>
					</h4>
					<ul class="list-group mb-1">
								<input type="hidden" name="inCludeVO"  value="transactionRecord"> 
								<input type="hidden" name="action" value="changeValue">
						<button class="btn btn-primary" type="submit">查看交易紀錄</button>
					</ul>
<!-- <--------------------------------------------------sessionID--------------> 
					<input type="hidden" name="wrnum" value="${memberVO.memId}">   


				</FORM>
			</div>
			<!-- ---------------------表單-------------------------- -->


		 

			<div class="col-md-8 order-md-1">
				<FORM METHOD="GET"
					ACTION="<%=request.getContextPath()%>/WithdrawalRecordServlet" name="form1">
					<h4 class="mb-3">信用卡付款</h4>

					<div class="money">

						<label for="memId">請輸入儲值金額</label> <input type="text"
							class="form-control" id="wrmoney" name="wrmoney"
							placeholder="輸入儲值金額"
							value="<%=(withdrawalRecordVO == null) ? "" : withdrawalRecordVO.getWrmoney()%>" />

					</div>

					<div class="needs-validation return checkForm()">
						<div class="row">
							<div class="col-md-6 mb-3">

								<label for="Memid">會員帳號</label> <input type="text"
									class="form-control" id="MEMID" name="memid"
									value="${memberVO.memId}" readonly="readonly"
									placeholder="請輸入會員帳號"
									value="<%=(withdrawalRecordVO == null) ? "" : withdrawalRecordVO.getMemid()%>" />

							</div>
							<div class="col-md-6 mb-3">
								<label for="cc-number">卡號</label> <input type="text"
									class="form-control" id="cc-name" name="cc-name"
									placeholder="請輸入卡號">

							</div>
						</div>
					</div>
					<div class="row">
					
						<div class=" col-md-4 mb-3">
							<label for="cc-cvv">CVV</label> <input type="text"
								class="form-control" id="cc-cvv" name="cc-cvv"
								placeholder="請輸入CVV碼">
						</div>
					</div>

					<hr class="mb-4">




					<input type="hidden" name="action" value="insert2">

					<input type="hidden" name="wrnum" value="${memberVO.memId}">
                    <input type="submit" id="pay" value="付款" class="btn btn-primary btn-lg btn-block" data-disable-with="find" />

					<input id="magic" name="magic" type="button" onclick="Magic()"
						class="btn btn-link">
				</FORM>
				
			
				
				
				
				
				
				
			</div>
		</div>
	</div>



	<!-- -------------------------------------------------------------------------------------------------------------- -->
	
	<!-- -------------------------------------------------------------------------------------------------------------- -->
	<script>
		
	</script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 <!--引用jQuery -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
<!--     引用SweetAlert2.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.0/sweetalert2.all.js"></script>

	<script type="text/javascript">
		function Magic() {
			
			document.getElementById("wrmoney").value = "6000";
			document.getElementById("cc-name").value = "447708570857";
			document.getElementById("cc-cvv").value = "957";
		}

	
// 		//自訂預設值
// 		swal.setDefaults({
// 		    confirmButtonText: "確定",
// 		    cancelButtonText: "取消"
// 		});
// 		swal.resetDefaults();//清空自訂預設值

// 		$(function () {
// 		    $("#pay").click(function () {
// 		        //confirm dialog範例
// 		        swal({ 
// 		            title: "將會進行扣款!",
// 		            html: "按下確定後進行儲值，並產生訂單明細",
// 		            type: "question",
// 		            showCancelButton: true//顯示取消按鈕
// 		        }).then(
// 		            function (result) {
// 		                if (result.value) {
// 		                    //使用者按下「確定」要做的事
// 		                    swal("完成!", "交易已完成交易", "success")
// 		                    $("#pay").submit();
		                    
// 		                } else if (result.dismiss === "cancel")  
// 		                {
// 		                     //使用者按下「取消」要做的事
// 		                    swal("取消", "已取消交易", "error");
// 		                }//end else  
// 		            });//end then 
// 		    });
// 		});

		
	
	</script>

</body>
</html>
