<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService" />
<!DOCTYPE html>
<html>
    <head>
        <title>${memberSvc.getOneMember(teacherVO.memId).memName} - Weshare</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/SimpleWebRTC-master/css/styles.css" type="text/css"/>
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

.btn{ border-radius: 50%; width:30px; height:30px; line-height:18px;  }

        </style>
    </head>
    <body onload="connect();" >
    <div class="container">
  <div class="row">
  	 <div class="col col-sm-12">
        <div class="CustomCard hoverCustomCard">
            <div class="CustomCardheader text-white btn-primary">
                <h5 class="col pt-2"><strong>${memberSvc.getOneMember(teacherVO.memId).memName}的直播間</strong></h5>
                <i class="far pt-2 pr-3 fa-heart float-right pointer" style="position:absolute;right:0;top:0"
                >在線觀看人數</i>
            </div>
            <div class="avatar">
		<img src="<%=request.getContextPath()%>/member/DBGifReader.do?memId=${teacherVO.memId}" width="120" height="120">
            </div>
            <div class="info">
                <div class="desc">${teacherVO.teacherText}</div>
                <footer class="blockquote-footer float-right">Someone in <cite title="Source Title">Source
                        Title</cite></footer>
            </div>
            <div class="bottom mx-auto">
            <form id="createRoom">
            <input  type="hidden" id="sessionInput" value="${teacherVO.teacherId}"/>
            <button type="submit" class="btn btn-primary">開始直播</button>
        </form>
                <a class="btn btn-secondary btn-twitter btn-sm">
                    <i class="fas fa-user-lock text-white pointer"></i>
                </a>
                <a class="btn btn-primary btn-sm mx-2" rel="publisher">
                    <i class="fas fa-globe-africa text-white pointer"></i>
                </a>
                <a class="btn btn-warning btn-sm" rel="publisher">
                    <i class="fas fa-exclamation-circle text-white pointer"></i>
                </a>
                <a class="btn btn-danger btn-sm ml-2" rel="publisher" href="https://plus.google.com/shahnuralam">
                    <i class="fas fa-trash-alt text-white pointer"></i>
                </a>
            </div>
        </div>
    </div>
    	
   <div class="col-sm">
        <p hidden id="subTitle"></p>
        <div class="videoContainer">
            <video id="localVideo" style="weight: 400px;" oncontextmenu="return false;"></video>
            <div id="localVolume" class="volume_bar"></div>
        </div>
        <div id="remotes"></div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        <script src="<%=request.getContextPath()%>/SimpleWebRTC-master/out/simplewebrtc-with-adapter.bundle.js"></script>
        <script>
      
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
            webrtc.on('videoAdded', function (video, peer) {
                console.log('video added', peer);
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
            webrtc.on('videoRemoved', function (video, peer) {
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
                $('h1').text('${memberSvc.getOneMember(teacherVO.memId).memName}的直播間');
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
                        } else {
                            console.log(err);
                        }
                    });
                    return false;
                });
            }

        

       
        </script>
    </div>
    <div class="col">
    <div class="col-sm" style="height:600px">
      <h1> 聊天室 </h1>
        <textarea id="messagesArea" class="panel message-area" readonly ></textarea>
        <div class="panel input-area">
            <input id="userName" class="text-field" type="hidden" placeholder="使用者名稱" value="${memberSvc.getOneMember(teacherVO.memId).memName}"/>
            <input id="message"  class="text-field" type="text" placeholder="訊息" onkeydown="if (event.keyCode == 13) sendMessage();"/>
            <input type="submit" id="sendMessage" class="button" value="送出" onclick="sendMessage();" class="btn btn-success"/>
	    </div>
    </div>
   
  
  </div>
  </div>
</div>
       
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
	        messagesArea.value = messagesArea.value + message;
	        messagesArea.scrollTop = messagesArea.scrollHeight;
		};

		webSocket.onclose = function(event) {
			 var teacherId=${teacherVO.teacherId};
			
		};
	}
	
	
	var inputUserName = document.getElementById("userName");
	inputUserName.focus();
	
	function sendMessage() {
	    var userName = inputUserName.value.trim();
	    if (userName === ""){
	        alert ("使用者名稱請勿空白!");
	        inputUserName.focus();	
			return;
	    }
	    
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
