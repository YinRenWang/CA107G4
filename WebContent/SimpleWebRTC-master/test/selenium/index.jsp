<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService" />
<!DOCTYPE html>
<html>
    <head>
        <title>您正在直播 ${memberSvc.getOneMember(teacherVO.memId).memName} - Weshare</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/SimpleWebRTC-master/css/styles.css" type="text/css"/>
 		<link href="<%=request.getContextPath()%>/css/G4.css" rel="stylesheet" type="text/css">
 		<link href="//fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet" type="text/css">
 		<link href="https://cdn.bootcss.com/limonte-sweetalert2/7.33.1/sweetalert2.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/SimpleWebRTC-master/css/main.css" type="text/css"/>
    <script src="https://cdn.bootcss.com/limonte-sweetalert2/7.33.1/sweetalert2.all.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
         <style>
         
            .videoContainer {
                position: relative;
                width: 800px;
                height: 600px;
            }
            .videoContainer video {
                position: absolute;
                width: 100%;
                height: 100%;
            }
            .volume_bar {
                position: absolute;
                width: 5px;
                height: 0px;
                right: 0px;
                bottom: 0px;
                background-color: #12acef;
            }
            
.CustomCard {
  padding-top: 20px;
  margin: 10px 0 20px 0;
  background-color: rgba(214, 224, 226, 0.2);
  border-top-width: 0;
  border-bottom-width: 2px;
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 15px;
  -webkit-box-shadow: none;
  -moz-box-shadow: none;
  box-shadow: none;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

.CustomCard.hoverCustomCard {
  position: relative;
  padding-top: 0;
  overflow: hidden;
  text-align: center;
}

.CustomCard.hoverCustomCard .CustomCardheader {
  background-size: cover;
  height: 85px;
}

.CustomCard.hoverCustomCard .avatar {
  position: relative;
  top: -50px;
  margin-bottom: -50px;
}

.CustomCard.hoverCustomCard .avatar img {
  width: 100px;
  height: 100px;
  max-width: 100px;
  max-height: 100px;
  -webkit-border-radius: 50%;
  -moz-border-radius: 50%;
  border-radius: 50%;
  border: 5px solid rgba(255,255,255,0.5);
}

.CustomCard.hoverCustomCard .info {
  padding: 4px 8px 10px;
}

.CustomCard.hoverCustomCard .info .desc {
  overflow: hidden;
  font-size: 12px;
  line-height: 20px;
  color: #737373;
  text-overflow: ellipsis;
}

.CustomCard.hoverCustomCard .bottom {
  padding: 20px 5px;
  margin-bottom: -6px;
  text-align: center;
}

.btn{ width:100px; height:30px; line-height:18px;  }

html{
background:#f4f9f4}
        </style>
    </head>
    <body onload="connect();" >
  <%@ include file="/front-end/backHeaderFooter/header.jsp"%>      
 <br>
  <br>
   <br>
    <br>
    <div class="container">
  <div class="row">
  	 <div class="col col-sm-12">
        <div class="CustomCard hoverCustomCard">
            <div class="CustomCardheader text-white btn-primary">
            <input  type="hidden" id="myvalue" value="${teacherVO.teacherId}"/>
                <h5 class="col pt-2"><strong>${memberSvc.getOneMember(teacherVO.memId).memName}的直播間</strong></h5>
                <i id="count" class="far pt-2 pr-3 fa-heart float-right pointer" style="position:absolute;right:0;top:0"
                >在線觀看人數 0</i>
            </div>
            <div class="avatar">
		<img src="<%=request.getContextPath()%>/member/DBGifReader.do?memId=${teacherVO.memId}" width="120" height="120">
            </div>
            <div class="info">
                <div class="desc">${teacherVO.teacherText}</div>
                </div>  
                
<form id="createRoom">
<input  type="hidden" id="sessionInput" value="${teacherVO.teacherId}"/>
<input type="hidden" id="errorMsg" value=""/>
<button type="submit" class="btn btn-primary" id="start">開始直播</button>
</form>
      
<div class="bottom mx-auto">
        <button  class="btn btn-danger" id="record" >開始錄影</button>
          <button  class="btn btn-success" id="download" >儲存錄影</button>
        <button id="play" class="btn btn-success" style="display:none">播放</button>
        
        
         <div style="display:none">
        <p>Echo cancellation: <input type="checkbox" id="echoCancellation"></p>
        <div id="errorMsg"></div>
    	</div>
</div>
        </div>
    </div>
    	
   <div class="col-sm-9">
        <p hidden id="subTitle"></p>
        <div class="videoContainer">
            <video id="localVideo" style="weight: 400px;" oncontextmenu="return false;"></video>
            <div id="localVolume" class="volume_bar"></div>
        </div>
        <div id="remotes"></div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        <script src="<%=request.getContextPath()%>/SimpleWebRTC-master/out/simplewebrtc-with-adapter.bundle.js"></script>
        <script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
		<script src="<%=request.getContextPath()%>/SimpleWebRTC-master/out/main.js"></script>
        <script>
        	var count=0;
            // grab the room from the URL
            var room = location.search && location.search.split('?')[1];
            // create our webrtc connection
            var webrtc = new SimpleWebRTC({
                // the id/element dom element that will hold "our" video
                localVideoEl: 'localVideo',
                // the id/element dom element that will hold remote videos
                remoteVideosEl: '',
                // immediately ask for camera access
                autoRequestMedia: true,
                debug: false,
                detectSpeakingEvents: true
            });

            // when it's ready, join if we got a room from the URL
            webrtc.on('readyToCall', function () {
                // you can name it anything
                if (room) webrtc.joinRoom(room);
            });

            function showVolume(el, volume) {
                if (!el) return;
                if (volume < -45) { // vary between -45 and -20
                    el.style.height = '0px';
                } else if (volume > -20) {
                    el.style.height = '100%';
                } else {
                    el.style.height = '' + Math.floor((volume + 100) * 100 / 25 - 220) + '%';
                }
            }
            webrtc.on('channelMessage', function (peer, label, data) {
                if (data.type == 'volume') {
                    showVolume(document.getElementById('volume_' + peer.id), data.volume);
                }
            });
            webrtc.on('videoAdded', function () {
            	count++;
            	document.getElementById('count').innerHTML = "在線觀看人數"+" "+count;
            });
            webrtc.on('videoRemoved', function (video, peer) {
            	count--;
            	document.getElementById('count').innerHTML = "在線觀看人數"+count;
                console.log('video removed ', peer);
                var remotes = document.getElementById('remotes');
                var el = document.getElementById('container_' + webrtc.getDomId(peer));
                if (remotes && el) {
                    remotes.removeChild(el);
                }
            });
            webrtc.on('volumeChange', function (volume, treshold) {
                //console.log('own volume', volume);
                showVolume(document.getElementById('localVolume'), volume);
            });

            
            // Since we use this twice we put it here
            function setRoom(name) {
                $('form').remove();
                $('#subTitle').text('Link to join: ' + location.href);
                $('body').addClass('active');
       
            }

            if (room) {
                setRoom(room);
            } else {
                $('form').submit(function () {
                    var val = $('#sessionInput').val().toLowerCase().replace(/\s/g, '-').replace(/[^A-Za-z0-9_\-]/g, '');
                    webrtc.createRoom(val, function (err, name) {
                        console.log(' create room cb', arguments);
                        var newUrl = location.pathname + '?' + name;
                        if (!err) {
                            history.replaceState({foo: 'bar'}, null, newUrl);
                            setRoom(name);
                            
                            var flag = "true";
                            function onlyOne() {
                                if(flag) {
                                    webrtc.on('videoAdded', function (video, peer) {
                                        var remotes = document.getElementById('remotes');
                                        if (remotes) {
                                            var d = document.createElement('div');
                                            d.className = 'videoContainer';
                                            d.id = 'container_' + webrtc.getDomId(peer);
                                            d.appendChild(video);
                                            var vol = document.createElement('div');
                                            vol.id = 'volume_' + peer.id;
                                            vol.className = 'volume_bar';
                                            video.onclick = function () {
                                                video.style.width = video.videoWidth + 'px';
                                                video.style.height = video.videoHeight + 'px';
                                            };
                                            d.appendChild(vol);
                                            remotes.appendChild(d);
                                        }
                                    });
                                }
                                flag = "false";
                            }  
                      
                        } else {
                            console.log(err);
                        }
                    });
                    return false;
                });
            }

        </script>
    </div>
   
    <div class="col-3" style="height:600px">
      <h1>與我的觀眾聊天</h1>
        <textarea id="messagesArea" class="panel message-area" readonly ></textarea>
        <div class="panel input-area">
            <input id="userName" class="text-field" type="hidden" placeholder="暱稱" value="${memberSvc.getOneMember(teacherVO.memId).memName}"/>
            <input id="message"  class="text-field" type="text" placeholder="訊息" onkeydown="if (event.keyCode == 13) sendMessage();"/>
            <input type="submit" id="sendMessage" class="btn btn-warning btn-sm"  value="📣" onclick="sendMessage();" />
	    </div>
    </div>
   
  
 
  </div>
</div>
       
  <%@ include file="/front-end/backHeaderFooter/footer.jsp"%>     
    </body>
    
<script>

    var MyPoint = "/MyEchoServer/${teacherVO.teacherId}";
    var host = window.location.host;
    var path = window.location.pathname;
    var webCtx = path.substring(0, path.indexOf('/', 1));
    var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;
	var webSocket;
	
	function connect() {
		// 建立 websocket 物件
		webSocket = new WebSocket(endPointURL);
		
		webSocket.onopen = function(event) {
			document.getElementById('sendMessage').disabled = false;
		};

		webSocket.onmessage = function(event) {
			var messagesArea = document.getElementById("messagesArea");
	        var jsonObj = JSON.parse(event.data);
	        var message = jsonObj.userName + ": " + jsonObj.message + "\r\n";
	        var showCount = jsonObj.showCount;
	        messagesArea.value = messagesArea.value + message;
	        messagesArea.scrollTop = messagesArea.scrollHeight;
	
		};

		webSocket.onclose = function(event) {
			var teacherID = document.getElementById("messagesArea");
		     var jsonObj = {"teacherID" : userName, "message" : message};
		        webSocket.send(JSON.stringify(jsonObj));
		};
	}

	var inputUserName = document.getElementById("userName");
	inputUserName.focus();
	
	function sendMessage() {
	    var inputMessage = document.getElementById("message");
	    var message = inputMessage.value.trim();
	    
	    if (message === ""){
	        alert ("訊息請勿空白!");
	        inputMessage.focus();	
	    }else{
	        var jsonObj = {"userName" : userName, "message" : message};
	        webSocket.send(JSON.stringify(jsonObj));
	        inputMessage.value = "";
	        inputMessage.focus();
	    }
	}
    
</script>
</html>
