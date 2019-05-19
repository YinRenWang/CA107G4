<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
      <c:if test="${not empty listEmps_ByCompositeQuery}" >
<c:remove var="listEmps_ByCompositeQuery" scope="session"/>
</c:if>  
<jsp:useBean id="teacherSvc" scope="page" class="com.teacher.model.TeacherService" />
<jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService" />
<jsp:useBean id="LiveStreamSvc" scope="page" class="com.livestream.model.LiveStreamService" />
<html lang="en">
<head> 
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="https://cdn.bootcss.com/limonte-sweetalert2/7.33.1/sweetalert2.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/limonte-sweetalert2/7.33.1/sweetalert2.all.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
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
</style>
<title>WeShare | 最棒的教育共享平台</title>
</head>
<body onLoad="connect();">
  <%@ include file="/front-end/backHeaderFooter/header.jsp"%>   

  
  <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active"> <img src="<%=request.getContextPath()%>/images/homePage/carosel_1.jpg" class="d-block w-100" alt="..."> </div>
      <div class="carousel-item"> <img src="<%=request.getContextPath()%>/images/homePage/carosel_2.png" class="d-block w-100" alt="..."> </div>
      <div class="carousel-item"> <img src="<%=request.getContextPath()%>/images/homePage/carosel_3.png" class="d-block w-100" alt="..."> </div>
      <div class="carousel-item"> <img src="<%=request.getContextPath()%>/images/homePage/carosel_4.png" class="d-block w-100" alt="..."> </div>
      <div class="carousel-item"> <img src="<%=request.getContextPath()%>/images/homePage/carosel_5.png" class="d-block w-100" alt="..."> </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev"> <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span> </a> <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next"> <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span> </a> </div>
  <div class="search">
    <div class="search-title" align="center">
      <h5 class="seat">這裡總有一位適合您的老師!</h5>
    </div>
     
      
<FORM METHOD="get" ACTION="<%=request.getContextPath()%>/inscourse/inscourse.do" >
 <div class="row">
      <div class="col-5">
        <div class="d-flex justify-content-around" id="df1">
          <input class="form-control" type="text" name="courseId" placeholder="請輸入課程關鍵字......" value="">
        </div>
      </div>
      <div class="col-3">
        <div class="d-flex justify-content-around" id="df2">
          <input class="form-control" type="text" name="inscLoc" placeholder="請輸入上課地點" value="">
        </div>
      </div>
        <div class="col-2">
        <div class="d-flex justify-content-around" id="df3">
          <select class="form-control" name=inscType value="" >
            <option  value="" disabled selected >選擇課程類型</option>
            <option value=0>個人課程</option>
            <option value=1>團體課程</option>
          </select>
        </div>
      </div>
      <div class="col-1">
        <div class="d-flex justify-content-around" id="df4">
        <input type="hidden" name="inscStatus" value="0">
        <input type="hidden" name="action" value="listEmps_ByCompositeQuery">
          <input class="btn btn-success"  type="submit" height="30" id="sbtn" value="搜尋">
        </div>
      </div>
	</div>
</FORM> 

  </div>

<div class="wrapCenter">
  <div class="itemCenter"> <img src="<%=request.getContextPath()%>/images/homePage/handshake.png" width="60" height="60" alt=""/>
    <p class="col-xl-9">自由分享，您所擅長的技能。</p>

  </div>
  <div class="itemCenter"> <img src="<%=request.getContextPath()%>/images/homePage/time-management.png" width="60" height="60" alt=""/>
    <p class="col-xl-9">隨意安排，您所空餘的時間。</p>

  </div>
  <div class="itemCenter"> <img src="<%=request.getContextPath()%>/images/homePage/diploma.png" width="60" height="60" alt=""/>
    <p class="col-xl-9">保障安全，您所預約的課程。</p>

  </div>
</div>
<div class="cardPadding" >
  <div class="cardPadding-title" > <img src="<%=request.getContextPath()%>/images/homePage/book.png" alt="" width="80" height="80"  />
    <h5>最受歡迎的課程</h5>
  </div>
  <div class="row">
    <div class="col-md-3">
      <div class="course-deck" >
        <div class="card border-light mb-3" style="max-width: 23rem ;">
          <div class="card-header">Java</div>
          <img src="<%=request.getContextPath()%>/images/homePage/course/java.png" class="img-fluid" alt="..."> </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="course-deck" >
        <div class="card border-light mb-3" style="max-width: 23rem;">
          <div class="card-header">Android</div>
          <img src="<%=request.getContextPath()%>/images/homePage/course/android.png" class="img-fluid" alt="..."> </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="course-deck" >
        <div class="card border-light mb-3" style="max-width: 23rem;">
          <div class="card-header">SQL</div>
          <img src="<%=request.getContextPath()%>/images/homePage/course/sql.png" class="img-fluid" alt="..."> </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="course-deck" >
        <div class="card border-light mb-3" style="max-width: 23rem;">
          <div class="card-header">Python</div>
          <img src="<%=request.getContextPath()%>/images/homePage/course/python.png" class="img-fluid" alt="..."> </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="course-deck" >
        <div class="card border-light mb-3" style="max-width: 23rem;">
          <div class="card-header">甜品</div>
          <img src="<%=request.getContextPath()%>/images/homePage/course/honey.png" class="img-fluid" alt="..."> </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="course-deck" >
        <div class="card border-light mb-3" style="max-width: 23rem;">
          <div class="card-header">鋼琴</div>
          <img src="<%=request.getContextPath()%>/images/homePage/course/piano.png" class="img-fluid" alt="..."> </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="course-deck" >
        <div class="card border-light mb-3" style="max-width: 23rem;">
          <div class="card-header">吉他</div>
          <img src="<%=request.getContextPath()%>/images/homePage/course/guitar.png" class="img-fluid" alt="..."> </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="course-deck" >
        <div class="card border-light mb-3" style="max-width: 23rem;">
          <div class="card-header">日文</div>
          <img src="<%=request.getContextPath()%>/images/homePage/course/japan.png" class="img-fluid" alt="..."> </div>
      </div>
    </div>
  </div>
</div>
<div class="cardPadding" style="padding-top: 0%">
  <div class="cardPadding-title" > <img src="<%=request.getContextPath()%>/images/homePage/live.png" alt="" width="80" height="80"  />
    <h5>熱門直播</h5>
  </div>
  <div class="card-deck" >
  
  <c:forEach var="teacherVO" items="${teacherSvc.getAllStatus(1)}">	
  <c:if test="${not empty LiveStreamSvc.getLastVideo(teacherVO.teacherId)}">
  <c:set var="liveStreamVO" value="${LiveStreamSvc.getLastVideo(teacherVO.teacherId)}" scope="page" />
    <div class="card">
      <a href="<%=request.getContextPath()%>/front-end/member/viewAsMember.jsp?memId=${teacherVO.memId}">
      <div class="teacherImg" style="background-image:url(<%=request.getContextPath()%>/member/DBGifReader.do?memId=${teacherVO.memId});"></div></a>
      <div class="card-body">
      <br>
       <br>
       <br>
        <br>
        <a href="<%=request.getContextPath()%>/SimpleWebRTC-master/test/selenium/onlyWatch.jsp?${teacherVO.teacherId}">
        <h4 class="card-title">${memberSvc.getOneMember(teacherVO.memId).memName}</h4></a>
        <p class="card-text">
        
       

<video width="320" height="160" id="${liveStreamVO.lsId}"  src="<%= request.getContextPath()%>/WebmDBServlet?lsId=${liveStreamVO.lsId}" controls="controls"  muted>
您的瀏覽器不支援Video標籤QQ
</video>


<script>
$('#${liveStreamVO.lsId}').mousemove(function(e){
	document.getElementById('${liveStreamVO.lsId}').play();
	});
	
$('#${liveStreamVO.lsId}').mouseout(function(e){
	document.getElementById('${liveStreamVO.lsId}').pause();
	});

</script>
  
        
        
        </p>
      </div>
    </div>
 </c:if>
 </c:forEach>
  </div>
</div>
	
  <%@ include file="/front-end/backHeaderFooter/footer.jsp"%> 
 
<script>
		var MyPoint = "/LiveStreamWS";
		var host = window.location.host;
		var path = window.location.pathname;
		var webCtx = path.substring(0, path.indexOf('/', 1));
		var endPointURL = "wss://" + window.location.host + webCtx + MyPoint;

		var webSocket;
		var myID;

		function connect() {
			// 建立 websocket 物件
			webSocket = new WebSocket(endPointURL);

			webSocket.onmessage = function(event) {
				var data = event.data;

				if(data=='open'){
					swal({
						  title: '<span class="title">有一則新的直播開始囉！</span>',
						  html: '<span class="text"><a href="<%=request.getContextPath()%>/SimpleWebRTC-master/test/selenium/onlyWatch.jsp?tc00001">觀看直播</a></span>'
						});
				}
			};

			webSocket.onerror = function(event) {
				console.log("Error ", event);
			}

			webSocket.onclose = function(event) {
			
			};
		}

		function sendMessage() {
			webSocket.send('open');
		}

		function disconnect() {
			webSocket.close();
		}
		
		
		
	
		
	</script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> 
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
