<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.friendnexus.model.*"%>




<jsp:useBean id="courseSvc" scope="page"
	class="com.course.model.CourseService" />

<jsp:useBean id="friendnexusSvc" scope="page"
	class="com.friendnexus.model.FriendNexusService" />
<jsp:useBean id="memberSvc" scope="page"
	class="com.member.model.MemberService" />

<c:set var="list" value="${friendnexusSvc.friendNexus1(memberVO.memId)}" />

<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/front-end/css/G4.css ">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/css/amazeui.min.css" />

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/css/main.css" />
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"
	rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>

	


<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"
	rel="stylesheet">
	
<title>WeShare | 最棒的教育共享平台</title>
<style type="text/css">
.headName {
	margin-top: 10px;
	margin-left: 10px;
}

.box {
	background-image: url(<%=request.getContextPath()%>/front-end/team/images/bg.jpg);
	background-repeat: no-repeat;
	width: 100%;
	height: 100%;
	background-position: center center;
	background-size: cover;
	display: flex;
	justify-content: center;
	align-items: center; .
	input_icon a: nth-child(2){
}

}
.input_icon a:nth-child(1) {
	background: url(<%=request.getContextPath()%>/front-end/friend/img/icon/icon13.png)
		no-repeat center center;
}

.input_icon a:nth-child(1):hover {
	background: url(<%=request.getContextPath()%>/front-end/friend/img/icon/icon13_1.png)
		no-repeat center center;
}

.input_icon a:nth-child(2) {
	background: url(<%=request.getContextPath()%>/front-end/friend/img/icon/icon13.png)
		no-repeat center center;
}

.input_icon a:nth-child(2):hover {
	background: url(<%=request.getContextPath()%>/front-end/friend/img/icon/icon13_1.png)
		no-repeat center center;
}

.input_icon a:nth-child(3) {
	background: url(<%=request.getContextPath()%>/front-end/friend/img/icon/icon15.png)
		no-repeat center center;
}

.input_icon a:nth-child(3):hover {
	background: url(<%=request.getContextPath()%>/front-end/friend/img/icon/icon15_1.png)
		no-repeat center center;
}

.input_icon a:nth-child(4) {
	background: url(<%=request.getContextPath()%>/front-end/friend/img/icon/icon16.png)
		no-repeat center center;
}

.input_icon a:nth-child(4):hover {
	background: url(<%=request.getContextPath()%>/front-end/friend/img/icon/icon16_1.png)
		no-repeat center center;
}

.input_icon a:nth-child(6) {
	background: url(<%=request.getContextPath()%>/front-end/friend/img/icon/icon17.png)
		no-repeat center center;
	float: right;
}

.input_icon a:nth-child(6):hover {
	background: url(<%=request.getContextPath()%>/front-end/friend/img/icon/icon17_1.png)
		no-repeat center center;
}

.input_icon a:nth-child(5) {
	background: url(<%=request.getContextPath()%>/front-end/friend/img/icon/icon18.png)
		no-repeat center center;
	float: right;
}

.input_icon a:nth-child(5):hover {
	background: url(<%=request.getContextPath()%>/front-end/friend/img/icon/icon18_1.png)
		no-repeat center center;
}



.user_head {
	background: #999;
	height: 40px;
	width: 40px;
	border-radius: 2px;
	float: left;
	overflow: hidden;
	border-radius: 50%;
}

.me span img {
	float: right;
	max-height: 200px;
	max-width: 200px;
	border-radius: 2px;
}

.aaa {
	float: left;
	height: 34px;
	width: 34px;
	border-radius: 50%;
}


element.style {
    height: 40px;
    width: 40px;
    background-color: rgb(238, 238, 238);
}
input[type=file] {
    display: block;
    margin-top: 15px;
    margin-left: 1px;
}
.input_box textarea {
    width: calc(100% - 56px);
    height: 100px;
    border: none;
    outline: 0;
    background: #f5f5f5;
    resize: none;
    margin-left: 28px;
    font-size: 14px;
    line-height: 20px;
}
</style>


</head>
<body onload="connect();" onunload="disconnect();">
	<!-------------------------------------------------------------------------headerStart------------------------------------------------------------------------->
  <%@ include file="/front-end/backHeaderFooter/header.jsp"%>  
	<!-------------------------------------------------------------------------headerEnd------------------------------------------------------------------------->
	<div class="box">
		<div class="wechat">
			<div class="sidestrip">
				<div class="am-dropdown" data-am-dropdown>
					<!--圖片-->
					<div class="own_head am-dropdown-toggle"></div>
				</div>
				<!---->
				<div class="sidestrip_icon">
					<a id="si_1"></a>
				</div>
				<!--底部-->
				<div id="doc-dropdown-justify-js">
					<div class="am-dropdown" id="doc-dropdown-js"
						style="position: initial;">
						<ul class="am-dropdown-content" style="">
						</ul>
					</div>
				</div>
			</div>
			<!--聊天列表-->
			<div class="middle on">
				<div class="wx_search">
					<input type="text" placeholder="搜索" />
					<button>+</button>
				</div>
				<div class="office_text">
					<c:forEach var="friendNexusVO" items="${list}">
						<ul class="user_list">
							<li class="bg">
								<div class="user_head">
									<img
										src="<%=request.getContextPath()%>/member/DBGifReader.do?memId=${friendNexusVO.friendAcc}" />
								</div>
								<div class="user_text">
									<p class="intername">${memberSvc.getOneMember(friendNexusVO.friendAcc).memName}</p>
									<p class="infor" id="${friendNexusVO.friendAcc}"
										value="${friendNexusVO.friendAcc}">${friendNexusVO.friendAcc}</p>
								</div>
							</li>
						</ul>

						<c:set var="friendmemId" value="${friendNexusVO.friendAcc}"></c:set>

					</c:forEach>
				</div>
			</div>
			<!--聊天窗口-->
			<div class="talk_window">
				<div class="windows_top">
					<div class="windows_top_box">

						<div class="headName"></div>
					</div>
				</div>
				<!--聊天内容-->
				<div class="windows_body" style="overflow: auto;">
					<div class="office_text" id="who" style="height: 100%;">
						<ul class="content" id="chatbox" style="overflow: auto;">

						</ul>
					</div>
				</div>


				<div class="windows_input" id="talkbox">

<!-- <!-- 					<div class="input_icon"> --> 
<!-- <!-- 						<div class="emjon"> --> 
<!-- <!-- 							 -->
<!-- <!-- 						</div> --> 
<!-- 						<a href="javascript:;" class="ExP"></a> <a href="javascript:;"></a> -->
<!-- 						<a href="javascript:;"></a> <a href="javascript:;"></a> <a -->
<!-- 							href="javascript:;"></a> <a href="javascript:;"></a> -->
<!-- 					</div> -->
					<div class="input_box">

						<!-- 輸入框在這 -->
						<textarea name="" rows="" cols="" id="input_box" 
							onkeydown="if (event.keyCode == 13) sendMessage();" ></textarea>
						<input type="hidden" class="button" id="sendMessage" value="送出"
							onclick="sendMessage();" />
							<div class="field">
    
						<!--                          <input type="button" value="sendFile" onclick="sendFile()"/>  -->
						<!--   		                 <input type="file" id="file" /> -->
						<input type="file" id="sendPicture" class="button" value="圖片"
							onchange="sendPicture();" />
					</div>
				</div>

			</div>
		</div>
	</div>
	</div>
	<!-------------------------------------------------------------------------footerStart------------------------------------------------------------------------->
  <%@ include file="/front-end/backHeaderFooter/footer.jsp"%> 
	<!-------------------------------------------------------------------------footerEnd------------------------------------------------------------------------->
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


	<script type="text/javascript">
		var messageType;

		var MyPoint = "/FriendWS/${memberVO.memId}";
		var host = window.location.host;
		var path = window.location.pathname;
		var webCtx = path.substring(0, path.indexOf('/', 1));
		var endPointURL = "wss://" + window.location.host + webCtx + MyPoint;
		var webSocket;

		var memberMap = new Map();
		var receiver;
		var intername;

		var chat = document.getElementById('chatbox');
		
	
		function connect() {
			// create a websocket
			webSocket = new WebSocket(endPointURL);

			webSocket.onopen = function(event) {

			};

			webSocket.onmessage = function(event) {
				
				
				var reader = new FileReader();
				reader.onload = function() {
					
					

					
				var jsonArray = JSON.parse(reader.result);

				if(jsonArray.sender == undefined){
					$.each(jsonArray,function(i, item) {
						 setMessage(jsonArray[i]);
					});
				}else{
					 setMessage(reader.result);
				}
				
					
				   
				}
				 

				if (typeof (event.data) != "string") {
					reader.readAsText(event.data);
					
				} else {
					setMessage(event.data);
				}
			

			};
			webSocket.onclose = function(event) {
				connect();
				
			};
		}
		
		function setMessage(result){
			
			
			
                  
             var jsonObj = JSON.parse(result);
             var message = jsonObj.message + "\r\n";
			if (jsonObj.sender == undefined) {
				return;
			}
			
			if (jsonObj.tOrm == "image"
					&& jsonObj.sender == '${memberVO.memId}') {

				chat.innerHTML += '<li class="me"><span><img src="data:image/png;base64,'+ message +'"></span></li>';
				$('.windows_body').scrollTop(
						$('.windows_body')[0].scrollHeight);
			} else {
				if (jsonObj.tOrm == "image") {
					
					chat.innerHTML += '<li class="other"><img class="aaa" src="'
							+ '/CA107G4/member/DBGifReader.do?memId='+intername+''
							+ '"><span><img src="data:image/png;base64, '+ message +'"></span></li>';
					$('.windows_body').scrollTop(
							$('.windows_body')[0].scrollHeight);
				}
			}

			if (jsonObj.sender == '${memberVO.memId}'
					&& jsonObj.tOrm == "text") {
				chat.innerHTML += '<li class="me"><span> ' + message
						+ '</span> </li>';
				$('.windows_body').scrollTop(
						$('.windows_body')[0].scrollHeight);
			} else {
				if (jsonObj.tOrm == "text") {
					chat.innerHTML += '<li class="other"><img class="aaa" src="'
							+ '/CA107G4/member/DBGifReader.do?memId='+intername+''
							+ '"><span>' + message + '</span></li>';
					$('.windows_body').scrollTop(
							$('.windows_body')[0].scrollHeight);
				}

			}
		 
		}
		
		
		function sendMessage() {

			var text = document.getElementById('input_box');
			var talk = document.getElementById('talkbox');

			if (text.value == '') {
				alert('請輸入訊息');
				return;
			} else {
				chat.innerHTML + text.value + '</span> </li>';

				$('.windows_body')
						.scrollTop($('.windows_body')[0].scrollHeight);
				chat.scrollTop = chat.scrollHeight;
				talk.style.background = "#fff";
				text.style.background = "#fff";
				var jsonObj = {
					"type" : "chat",
					"sender" : "${memberVO.memId}",
					"receiver" : intername,
					"message" : text.value,
					"tOrm" : "text"
				};
				webSocket.send(JSON.stringify(jsonObj));
				text.value = '';

			}

		};
		function readFile() {
			if (this.files && this.files[0]) {
				var FR = new FileReader();
				FR
						.addEventListener(
								"load",
								function(e) {

									var message = e.target.result;
									chat.innerHTML
											+ '<li class="me"><img class="aaa" src="'
											+ '/CA107G4/member/DBGifReader.do?memId=${memberVO.memId}'
											+ '"><span>"<img src= '+ message +'></span> </li>';
									var jsonObj = {
										"type" : "chat",
										"sender" : "${memberVO.memId}",
										"receiver" : intername,
										"message" : message,
										"tOrm" : "image"
									};
									//                         The JSON.stringify() method converts a JavaScript object or value to a JSON string, 
									webSocket.send(JSON.stringify(jsonObj));
								});
				FR.readAsDataURL(this.files[0]);
			}
		}

		document.getElementById("sendPicture").addEventListener("change",
				readFile);

		function disconnect() {
			webSocket.close();
			document.getElementById('sendMessage').disabled = true;
			document.getElementById('connect').disabled = false;
			document.getElementById('disconnect').disabled = true;
		}
		function updateStatus(newStatus) {
			statusOutput.innerHTML = newStatus;
		}
		$('.conLeft li').on(
				'click',
				function() {
					$(this).addClass('bg').siblings().removeClass('bg');
					var intername = $(this).children('.liRight').children(
							'.intername').text();
					$('.headName').text(intername);
					$('.newsList').html('');
				})
		$("#input_box").keypress(function(e) {
			code = (e.keyCode ? e.keyCode : e.which);
			if (code == 13) {
				//targetForm是表單的ID
				$("sendMessage").submit();
			}
		});
		$('.office_text li').on(
				'click',
				function() {
					intername = $(this).children('.user_text').children(
							'.infor').text();

				})
		jQuery(document).ready(function() {
			//  		connect();
			$(".bg").click(function() {
				$(this).addClass('bg');

				$('.headName').text(intername);
				$('.content').html('');
				var jsonObj = {
					"type" : "history",
					"sender" : "${memberVO.memId}",
					"receiver" : intername,
				};
				webSocket.send(JSON.stringify(jsonObj));
			});
		})
		//  	貼圖
		// $('.ExP').on('mouseenter',function(){
		// 		$('.emjon').show();
		// 	})
		// 	$('.emjon').on('mouseleave',function(){
		// 		$('.emjon').hide();
		// 	})
		// 	$('.emjon li').on('click',function(){
		// 		var text =$(this).children('img').attr('src');

		// 		chat.innerHTML + '<li class="me"><img src="' + '/CA107G4/member/DBGifReader.do?memId=${memberVO.memId}' + '"><span class=""><img src="' + text + '"></span> </li>';
		// 		var jsonObj = {
		// 				   "type": "chat",
		// 				   "sender" : "${memberVO.memId}",
		// 				   "receiver": intername,
		// 				   "message" : text
		// 			};
		// 		webSocket.send(JSON.stringify(jsonObj));
		// 	    text.value = '';
		// 		$('.newsList').append(chat);
		// 		$('.emjon').hide();
		// 		$('.windows_body').scrollTop($('.windows_body')[0].scrollHeight );
		// 		chat.scrollTop = chat.scrollHeight;
		// 		talk.style.background = "#fff";
		//         text.style.background = "#fff";

		// 	})

		function disconnect() {
			webSocket.close();
   commet
		}
		
		
		
		
	</script>




	
</body>
</html>