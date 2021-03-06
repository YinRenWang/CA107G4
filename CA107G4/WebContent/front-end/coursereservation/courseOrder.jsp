<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.coursereservation.model.*"%>
<%
 	CourseReservationVO courseReservationVO = (CourseReservationVO) request.getAttribute("courseReservationVO");
	if(courseReservationVO==null){
		String crvId=request.getParameter("crvId");
		CourseReservationService crv=new CourseReservationService();
		courseReservationVO=crv.findByPK(crvId);
		request.setAttribute("courseReservationVO", courseReservationVO);
	}
%>

<jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService" />
<jsp:useBean id="teacherSvc" scope="page" class="com.teacher.model.TeacherService" />
<jsp:useBean id="insCourseSvc" scope="page" class="com.inscourse.model.InsCourseService" />
<jsp:useBean id="courseSvc" scope="page" class="com.course.model.CourseService" />
<jsp:useBean id="QRCode" scope="page" class="other.QRCode" />
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
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="https://bootswatch.com/paper/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script 
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC3teApdwmpN2yUfc6dftcDkHw1dLpV2B4&callback=initMap"></script>
<script 
 	src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<style>

	body{
		background-color: #f4f9f4;
	}
	
	#Information{
		margin-bottom:15%;
	}

</style>
    <script>

    $(function(){
    // 取得使用者輸入的地址
      var addr = $('#addr').val();
      // 建立 Geocoder() 物件
      var gc = new google.maps.Geocoder();
   // 用使用者輸入的地址查詢
      gc.geocode({'address': addr}, function(result, status){
        // 確認 OK
        if(status == google.maps.GeocoderStatus.OK) {
          var latlng = result[0].geometry.location;
          // 將查詢結果設為地圖的中心
          var LAT=latlng.lat(); //顯示經度
          var LNG=latlng.lng(); //顯示緯度
          
          var position = {
        		    lat: LAT,
        		    lng: LNG
        		  };
          
          var mymap = new google.maps.Map($('#map').get(0), {
              zoom: 15,
              center: {lat:LAT , lng:LNG}
    });
          
          var marker = new google.maps.Marker({
        	  position: position,
        	  map: mymap,
        	  animation: google.maps.Animation.BOUNCE
        	});
          
        }
      }); 
   
    });
    </script>
<title>WeShare | 最棒的教育共享平台</title>
</head>
<body>
	<!-------------------------------------------------------------------------headerStart------------------------------------------------------------------------->
  <%@ include file="/front-end/backHeaderFooter/header.jsp"%>  
	<!-------------------------------------------------------------------------headerEnd------------------------------------------------------------------------->
	
	<div class="container" id="Information">
    <div class="row">
       
        <div class="col-12">
            <div class="card">
                <div class="card-body p-0">
                    <div class="row p-5">
                        <div class="col-8">         
<h4 class="font-weight-bold mb-4">訂單編號 ${courseReservationVO.crvId}</h4>
   <p class="font-weight-bold mb-4">上課地點 <p class="mb-1"> ${memberSvc.getOneMember(teacherSvc.findOneById(courseReservationVO.teacherId).memId).memAdd}</p></p>
  <p><input type="hidden" id="addr" value=" ${memberSvc.getOneMember(teacherSvc.findOneById(courseReservationVO.teacherId).memId).memAdd}">
      <div id="map" style="width:700px; height:400px; margin:0px auto;" ></div>
 						</div>
 						
 						<div class="col-2">
 						<p class="font-weight-bold mb-4">QRCode條碼<p class="mb-1"></p>
 						<img src="data:image/png;base64, ${QRCode.qrcodeGo(courseReservationVO.crvId)}" width="300px" height="300px" class="media-photo">	
                        </div>

                        <div class="col-md-6 text-right">
                            <p class="font-weight-bold mb-1"></p>
                            <p class="text-muted"><fmt:formatDate value="${now}" type="both"/></p>
                        </div>
                    </div>

                    <hr class="my-5">

                    <div class="row pb-5 p-5">
                        <div class="col-md-6">
                            <p class="font-weight-bold mb-4">教師資訊</p>
                            <p class="mb-1"><th class="border-0 text-uppercase small font-weight-bold">姓名：</th>
                            ${memberSvc.getOneMember(teacherSvc.findOneById(courseReservationVO.teacherId).memId).memName}</p>
                          	<p class="mb-1"><th class="border-0 text-uppercase small font-weight-bold">電話：</th>
                          	${memberSvc.getOneMember(teacherSvc.findOneById(courseReservationVO.teacherId).memId).memPhone}</p>
                  
                            
                        </div>

                        <div class="col-md-6 text-right">
                            <p class="font-weight-bold mb-4">學生資訊</p>
                            <p class="mb-1"><th class="border-0 text-uppercase small font-weight-bold">姓名：</th>${memberSvc.getOneMember(courseReservationVO.memId).memName}</p>
                            <p class="mb-1"><th class="border-0 text-uppercase small font-weight-bold">電話：</th>${memberSvc.getOneMember(courseReservationVO.memId).memPhone}</p>
                        </div>
                    </div>

                    <div class="row p-5">
                        <div class="col-md-12">
                            <table class="table">
                                <thead>
                                    <tr>
                             
                                        <th class="border-0 text-uppercase small font-weight-bold">課程名稱</th>
                                        <th class="border-0 text-uppercase small font-weight-bold">開始時間</th>
                                        <th class="border-0 text-uppercase small font-weight-bold">結束時間</th>
                                        <th class="border-0 text-uppercase small font-weight-bold">時數</th>
                                        <th class="border-0 text-uppercase small font-weight-bold">訂單狀態</th>
                                        <th class="border-0 text-uppercase small font-weight-bold">上課狀態</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>${courseSvc.findOneById(insCourseSvc.findOneById(courseReservationVO.inscId).courseId).courseName}</td>
                                        <td> <fmt:formatDate value="${courseReservationVO.crvMFD}" pattern="yyyy-MM-dd HH:mm"/></td>
                                        <td> <fmt:formatDate value="${courseReservationVO.crvEXP}" pattern="yyyy-MM-dd HH:mm"/></td>
                                         <td>${courseReservationVO.crvTotalTime}</td>
                                         <td>
              							<c:if test="${courseReservationVO.crvStatus==0}">
              							取消
              							</c:if>
              							<c:if test="${courseReservationVO.crvStatus==1}">
              							正常
              							</c:if>
              							</td>
                  						<td>
              							<c:if test="${courseReservationVO.classStatus==0}">
              							未上課
              							</c:if>
              							<c:if test="${courseReservationVO.classStatus==1}">
              							已上課
              							</c:if>
              							</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="d-flex flex-row-reverse bg-dark text-white p-4">
                    
                     <div class="py-3 px-5 text-right">
                            <div class="mb-2">訂單總金額</div>
                            <div class="h2 font-weight-light">$${courseReservationVO.crvTotalPrice}</div>
                        </div>
                        <div class="py-3 px-5 text-right">
                            <div class="mb-2">手續費</div>
                            <div class="h2 font-weight-light">$<fmt:formatNumber type="number" value="<%=courseReservationVO.getCrvTotalPrice()/1.1*0.1%>" pattern="#.00"/></div>
                           
                        </div>
                        
                         <div class="py-3 px-5 text-right">
                            <div class="mb-2">訂單金額</div>
                            <div class="h2 font-weight-light">$<fmt:formatNumber type="number" value="<%=courseReservationVO.getCrvTotalPrice()/1.1%>" pattern="#.00"/></div>
                            
                        </div>

                       
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="text-light mt-5 mb-5 text-center small">by : <a class="text-light" target="_blank" href="http://totoprayogo.com">totoprayogo.com</a></div>

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
</body>
</html>
