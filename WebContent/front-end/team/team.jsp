<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.team.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.course.model.*"%>
<%@ page import="com.joingroup.model.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.inscourse.model.*"%>
<%
	InsCourseService inscourseSvc = new InsCourseService();

	List<InsCourseVO> list = inscourseSvc.getAll(1);
	pageContext.setAttribute("list", list);

	JoinGroupVO joinGroupVO = (JoinGroupVO) request.getAttribute("joinGroupVO");	
%>



<jsp:useBean id="memberSvc" scope="page"
	class="com.member.model.MemberService" />
<jsp:useBean id="incourseSvc" scope="page"
	class="com.inscourse.model.InsCourseService" />
<jsp:useBean id="courseSvc" scope="page"
	class="com.course.model.CourseService" />
<jsp:useBean id="teamSvc" scope="page"
	class="com.team.model.TeamService" />
<jsp:useBean id="teacherSvc" scope="page"
	class="com.teacher.model.TeacherService" />

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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/front-end/css/G4.css ">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<script
	src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js"
	type="text/javascript"></script>
<title>WeShare | 最棒的教育共享平台</title>
<style type="">
}
.breadcrumb-item+.breadcrumb-item::before {
	content: "|";
}

.page-link:hover {
	background-color: #8af;
	color: #fff;
	border-color: #00f;
	transform: scale(2);
}

.head {
	display: none;
}

.jumbotron {
	border-radius: 0;
}

.jumbotron {
	background-image: url(01.jpg);
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center center;
}

.JumboHeaderImg {
	background-size: cover;
	background-image: url(<%=request.getContextPath()%>/front-end/Images/333.jpg);
}

#quick_form {
	margin-top: 60px;
	margin-left: 35px;
}

.plan {
	padding: 10px;
	border: 1px #ccc solid;
	border-radius: 10px;
	margin: 10px;
}

.plan_iamge {
	width: 200px;
	height: 150px;
	float: left;
	margin-top: -2px;
}

.container {
	width: 100%;
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
	max-width: 1140px;
}

.row {
	display: flex;
	flex-wrap: wrap;
	margin-right: -15px;
	margin-left: -15px;
}

.button-group {
	margin-left: 900px;
	margin-top: -40px;
}


.form-row {
	margin-left: 5px;
	margin-top: 5px;
}

.btn-info {
	margin-top: 5px;
}

.class1 {
	margin-left: 200px;
}

.picture {
	margin-top: -120px;
	margin-left: 250px;
}
#btn2 {
    margin-top: -350px;
    margin-left: 950px;
}



</style>
</head>
<body>
	<!-------------------------------------------------------------------------headerStart------------------------------------------------------------------------->
<%@ include file="/front-end/backHeaderFooter/header.jsp"%>    
	<!-------------------------------------------------------------------------headerEnd------------------------------------------------------------------------->
	<div class="jumbotron JumboHeaderImg">

		<div id="quick_form">
			<h1>
				<font face="fantasy" color="#855600">想揪什麼團呢？</font>
			</h1>




			<div class="form-row">
				<div class="form-group col-md-4">

					<FORM METHOD="get" ACTION="<%=request.getContextPath()%>/team/team.do">


						<div class="form-row">
							<input type="hidden" name="action" value="Search_One"> <label
								for="inputEmail" class="sr-only">請輸入課程</label>
							<div class="input-group group-sm">
								<input type="text" id="inputEmail" name="str"
									class="form-control-addon" placeholder="請輸入課程" required
									autofocus>
							</div>
							<!--                         <input type="text" class="form-control" name="str" id="username" placeholder="請輸入課程">	  -->
							<input type="submit" name="commit" value="查詢"
								class="btn btn-info submit" data-disable-with="find" />
							<div class="invalid-feedback" id="username-feedback"></div>
						</div>
					</FORM>
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-3">
					<FORM METHOD="get"
						ACTION="<%=request.getContextPath()%>/team/team.do">
						<div class="form-row">
							<input type="hidden" name="action" value="findOneteam"> 
							<button class="btn btn-info submit" type="submit" value="${param.memId}" data-disable-with="find" >查看我的揪團</button>
							
						</div>
					</FORM>
				</div>
			</div>
		</div>
	</div>


	<c:if test="${not empty errorMsgs}">
		<h4 style="color: red; text-align: center;">請修正以下錯誤:</h4>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red; text-align: center;">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<%@ include file="page1.file"%>
	<c:forEach var="insCourseVO" items="${list}" begin="<%=pageIndex%>"
		end="<%=pageIndex+rowsPerPage-1%>">




		<div class="container">
			<div class="plan">
				<div class="plan_iamge">
					<img src="<%=request.getContextPath()%>/member/DBGifReader.do?memId=${teacherSvc.findOneById(insCourseVO.teacherId).memId}"
						width="175" height="185">
				</div>
				<div class="plan_info">
					<h4>
						${courseSvc.findOneById(insCourseVO.courseId).courseName} <span 
							class="badge badge-light">團體課程 </span>
					</h4>
					<div>
						<i class="far fa-calendar-alt"></i>
						<div>課程大綱: ${insCourseVO.inscCourser}</div>
						<div>上課語言: ${insCourseVO.inscLang}</div> 	
						<div>上課地點: ${insCourseVO.inscLoc}</div>
					</div>

					<hr>
					<div>
						<span class="badge badge-light">收費模式</span> <span
							class="badge badge-success">預先扣款</span> <span
							class="badge badge-lisght"> <i class="fas fa-dollar-sign"></i>
						</span>每次$ ${insCourseVO.inscPrice}元<br>
					</div>
					<div class="class1">
						<span class="badge badge-light"> 隊伍型態 </span> <span
							class="badge badge-info">自主性揪團</span> 
							<c:if test="${not empty teamSvc.getOneTeam(insCourseVO.inscId).teamId}">	
							<span class="badge badge-info">揪團編號${teamSvc.getOneTeam(insCourseVO.inscId).teamId}</span>
							</c:if>
					</div>

				</div>
				<c:if test="${empty teamSvc.getOneTeam(insCourseVO.inscId).teamId}">
					<FORM METHOD="get" ACTION="<%=request.getContextPath()%>/team/team.do" name="form1" id="${teamSvc.getOneTeam(insCourseVO.inscId).teamId}">
							<input type="hidden" name="inscID" value="${insCourseVO.inscId}">
							 <input type="hidden" name="inscPrice" value="${insCourseVO.inscPrice}">
							<input type="hidden" name="action" value="addTeam"> 
							<input  id="btn2" type="submit" id="${teamSvc.getOneTeam(insCourseVO.inscId).teamId}" value="創建揪團" class="btn btn-info submit" data-disable-with="find" />
						</form>
					</c:if>	
				
				<div class="button-group">
					<div class="row">
					
					
					<FORM METHOD="get" ACTION="<%=request.getContextPath()%>/team/team.do" name="form1" id="${teamSvc.getOneTeam(insCourseVO.inscId).teamId}">
							<input type="hidden" name="memId" value="${memberVO.memId}">
							<input type="hidden" name="teamId" value="${teamSvc.getOneTeam(insCourseVO.inscId).teamId}">
							<input type="hidden" name="inscPrice"
								value="${insCourseVO.inscPrice}"> <input type="hidden"
								name="action" value="insert"> 
								<input type="button" id="${teamSvc.getOneTeam(insCourseVO.inscId).teamId}" value="加入揪團" class="btn btn-info submit" data-disable-with="find" />
						</form>
<script type="text/javascript">
//自訂預設值
swal.setDefaults({
    confirmButtonText: "確定",
    cancelButtonText: "取消"
});
swal.resetDefaults();//清空自訂預設值

$(function () {
    $("#${teamSvc.getOneTeam(insCourseVO.inscId).teamId}").click(function () {
        //confirm dialog範例
        swal({ 
            title: "確定加入揪團？",
            html: "按下確定後即將扣除餘額，並產生訂單明細",
            type: "question",
            showCancelButton: true//顯示取消按鈕
        }).then(
            function (result) {
                if (result.value) {
                    //使用者按下「確定」要做的事
                    swal("完成!", "資料已經刪除", "success");
                    $("#${teamSvc.getOneTeam(insCourseVO.inscId).teamId}").submit();
                    
                } else if (result.dismiss === "cancel")  
                {
                     //使用者按下「取消」要做的事
                    swal("取消", "資料未被刪除", "error");
                }//end else  
            });//end then 
    });
});
</script>						 
					

<!-- Button trigger modal -->

         
          
         <button type="button" id="${insCourseVO.inscId}"class="btn btn-info" data-toggle="modal" data-target="#basicModal"> 詳情
        <input type="hidden" value="${insCourseVO.inscId}" class="ha">
          </button>
 
<!-- Modal -->
<div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
     <div class="modal-header">
     <h5 class="modal-title">揪團詳情</h5>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
             
            </div>
				
			<div class="modal-body">
        <jsp:include page="listOneEmp.jsp" />
      </div>
       
      <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">關閉</button>
                
            </div>
    </div>
  </div>
</div>
<script type="text/javascript">


//自訂預設值
swal.setDefaults({
    confirmButtonText: "確定",
    cancelButtonText: "取消"
});
swal.resetDefaults();//清空自訂預設值

$(function () {
    $("#${teamSvc.getOneTeam(insCourseVO.inscId).teamId}").click(function () {
        //confirm dialog範例
        swal({ 
            title: "確定加入揪團？",
            html: "按下確定後即將扣除餘額，並產生訂單明細",
            type: "question",
            showCancelButton: true//顯示取消按鈕
        }).then(
            function (result) {
                if (result.value) {
                    //使用者按下「確定」要做的事
                    swal("完成!", "交易已完成已成功參加揪團", "success")
                    $("#${teamSvc.getOneTeam(insCourseVO.inscId).teamId}").submit();
                    
                } else if (result.dismiss === "cancel")  
                {
                     //使用者按下「取消」要做的事
                    swal("取消", "取消交易", "error");
                }//end else  
            });//end then 
    });
});
  $(document).ready(function(){
	
	  
	  $("#${insCourseVO.inscId}").click(function(){
		 
		  $.ajax({
	            type: "get", //傳送方式
	            url:  "<%=request.getContextPath()%>/team/team.do" ,
	            data:  {"action": "include1",
	            	    "inscId": "${insCourseVO.inscId}"},
	          dataType:"json",
	            
	            success: function(data) {
	            	$.each(data,function(i,item){
	            		document.getElementsByClassName('subjectName')[i].innerHTML=item.member_name;
		            	document.getElementsByClassName('subjectPhone')[i].innerHTML=item.member_phone;
		            	document.getElementsByClassName('subjectTime')[i].innerHTML=item.team_MFD;
		            	document.getElementsByClassName('subjectPrice')[i].innerHTML=item.team_price;
	            	});
	            	
	            	
	            	
	            	
	            },
	            error: function() {
	                alert("有錯誤")
	            }
	        })
	    })        
	});
</script>

 
						</div>
					</div>
				</div>
			</div>
	</c:forEach>
	<%@ include file="page2.file"%>




	<!-------------------------------------------------------------------------footerStart------------------------------------------------------------------------->
<%@ include file="/front-end/backHeaderFooter/footer.jsp"%> 
	<!-------------------------------------------------------------------------footerEnd------------------------------------------------------------------------->
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 <!--引用jQuery -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
<!--     引用SweetAlert2.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.0/sweetalert2.all.js"></script>
   
   



   





</body>
</html>
