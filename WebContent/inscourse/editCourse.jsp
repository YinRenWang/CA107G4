<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<jsp:useBean id="courseSvc" scope="page" class="com.coursetype.model.CourseTypeService" />
<jsp:useBean id="memberVO"  scope="session" type="com.member.model.MemberVO" />
<jsp:useBean id="teacherVO"  scope="session" type="com.teacher.model.TeacherVO" />
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
	href="<%=request.getContextPath()%>/css/G4.css ">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://cdn.bootcss.com/limonte-sweetalert2/7.33.1/sweetalert2.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/limonte-sweetalert2/7.33.1/sweetalert2.all.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script 
	src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script 
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>	
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    
<style>


body {
    background: #fff;
	font-family: 'Roboto', sans-serif;
	color:#333;
	line-height: 22px;	
}
h1, h2, h3, h4, h5, h6 {
	font-family: 'Roboto Condensed', sans-serif;
	font-weight: 400;
	color:#111;
	margin-top:5px;
	margin-bottom:5px;
}
h1, h2, h3 {
	text-transform:uppercase;
}

input.upload {
    position: absolute;
    top: 0;
    right: 0;
    margin: 0;
    padding: 0;
    font-size: 12px;
    cursor: pointer;
    opacity: 1;
    filter: alpha(opacity=1);    
}

.form-inline .form-group{
    margin-left: 0;
    margin-right: 0;
}
.control-label {
    color:#333333;
}

#addCourse{
	margin-bottom:300px;
}

#back{
position: relative;
  top: -20px;
  right: -600px;
  background-color: white;
  width: 500px;

}
</style>

<script>
$(document).ready(function () {

	 $("#courseTypeId").change(function(){
		 var selectValue=$(this).val();
		 $('#selectValue').val(selectValue);
		 $(this).attr("selected", "true");
		 $('#form1').submit();
		  });
	 
	 $("#inscType").change(function(){
		 var inscTypeValue=$(this).val();
		 console.log(inscTypeValue);
		 if(inscTypeValue==0){
			 $("#inscpp").css('display','none');	 
		 }
		 if(inscTypeValue==1){
			 $("#inscpp").css('display','block');	 
		 }
		  });
	 
	 
	 $("#courseId").change(function(){
		 var selectValue2=$(this).val();
		 $('#formvalue').val(selectValue2);
		  });
	 
	 
	 

 });
</script>
  
<title>WeShare | 最棒的教育共享平台</title>
</head>
<body>
	<!-------------------------------------------------------------------------headerStart------------------------------------------------------------------------->
<div class="header">
      <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top"> <img src="<%= request.getContextPath()%>/images/icon/logo.png" width="80" height="60" alt=""/><a class="navbar-brand" href="<%= request.getContextPath()%>">教育共享平台</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active"> <a class="nav-link" href="#">成為老師 <span class="sr-only">(current)</span></a> </li>
            <li class="nav-item dropdown"> <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">探索課程</a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink"> <a class="dropdown-item" href="<%= request.getContextPath()%>/Inscourse/NewFile.jsp">所有課程</a> <a class="dropdown-item" href="#">音樂</a> <a class="dropdown-item" href="#">語言</a> <a class="dropdown-item" href="#">運動</a> <a class="dropdown-item" href="#">藝術</a> <a class="dropdown-item" href="#">設計</a> <a class="dropdown-item" href="#">人文</a> <a class="dropdown-item" href="#">行銷</a> <a class="dropdown-item" href="#">程式語言</a> <a class="dropdown-item" href="#">投資理財</a> <a class="dropdown-item" href="#">職場技能</a> <a class="dropdown-item" href="#">手作</a> <a class="dropdown-item" href="#">烹飪</a> </div>
            </li>
            <li class="nav-item"> <a class="nav-link" href="<%= request.getContextPath()%>/member/loginMember.jsp">登入</a> </li>
            <li class="nav-item"> <a class="nav-link" href="<%= request.getContextPath()%>/member/addMember.jsp">註冊</a> </li>
            <li class="nav-item"> <a class="nav-link " href="<%= request.getContextPath()%>/member/listAllMember.jsp">關於我們</a> </li>
          </ul>
        </div>
      </nav>
    </div>	
	<!-------------------------------------------------------------------------headerEnd------------------------------------------------------------------------->
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


 <div class="container" id="addCourse">
   <h1 class="entry-title"><span>新增課程-課程資訊</span></h1>
        <hr>
 <div class="row">
  <div class="col-md-6 mb-3">
  	<label for="validationCustom03">課程分類:</label>
      <select class="form-control form-control-lg" id="courseTypeId" >
        <option value="" disabled selected>請選擇課程分類</option>
          <option value="1">音樂</option>
           <option value="2">語言</option>
            <option value="3">運動</option>
             <option value="4">藝術</option>
              <option value="5">設計</option>
               <option value="6">人文</option>
                <option value="7">行銷</option>
                 <option value="8">程式語言</option>
                  <option value="9">投資理財</option>
                   <option value="10">職場技能</option>
                    <option value="11">手作</option>
                     <option value="12">烹飪</option>
                     
      </select>
<form id="form1" action="<%= request.getContextPath()%>/CourseTypeServlet" method="GET">
<input type="hidden" name="action" value="updateCourse">
<input type="hidden" name="courseTypeId"  id="selectValue" value="">
</form> 
  </div>
  
  <div class="col-md-6 mb-3">
  	<label for="validationCustom04">課程類型:</label>
     <select class="form-control form-control-lg" id="courseId" >
    	 <option value=""  disabled selected >請選擇課程類型</option> 
    	<c:forEach var="courseVO" items="${courseList}" >
  		 <option value="${courseVO.courseId}">${courseVO.courseName}
		</c:forEach>
		</select>
  </div>
</div>

<form id="form2" action="<%= request.getContextPath()%>/InsCourseServlet" method="GET">
<input type="hidden" name="action" value="insert">
<input type="hidden" name="teacherId" value="${teacherVO.teacherId}">
<input type="hidden" name="courseId" id=formvalue value="">
	<div class="row">
    <div class="col-md-12">
               
    <div class="form-group">
          <label class="control-label col-2">授課金額</label>
          <div class="col-4">
            <input type="number" class="form-control" name="inscPrice" id="inscPrice"  min="0"  placeholder="每小時/新台幣" value="">
          </div>
        </div>
        <div id="back">
    <%--   <img src="<%= request.getContextPath()%>/images/inscourse/addInscoure.jpg" width="600"  > --%>
      </div>
        <div class="form-group">
          <label class="control-label col-2">授課地點</label>
          <div class="col-4">
            <input type="text" class="form-control" name="inscLoc" id="inscLoc" value="${fn:substring(memberVO.memAdd,0,6)}" readonly="readonly">
          </div>
        </div>
        
        
        
         <div class="form-group">
          <label class="control-label col-2">授課方式</label>
          <div class="col-4">
           <select class="form-control form-control-lg" name="inscType" id="inscType">
        <option value="0">個人課程</option>
          <option value="1">團體課程</option>
          </select>
		</div>
	</div>	
		
		 <div class="form-group" id="inscpp" style="display:none">
          <label class="control-label col-2">上課人數</label>
          <div class="col-4">
            <input type="text" class="form-control" name="inscPeople" placeholder="請輸入人數" value="">
          </div>
         </div> 
         
          <div class="form-group" id="inscpp" >
          <label class="control-label col-2">授課語言</label>
          <div class="col-4">
            <input type="text" class="form-control" name="inscLang" placeholder="請輸入上課語言" value="">
          </div>
         </div> 
         
          <div class="form-group" id="inscpp" >
          <label class="control-label col-2">課程大綱</label>
          <div class="col-8">
           <textarea class="form-control" rows="5" name="inscCourser" placeholder="介紹這堂課吧" value=""></textarea>
          </div>
         </div> 
 <div class="d-flex justify-content-center"><input type="submit" class="btn btn-secondary" value="下一步"></div>
   
  
    </div>
</div>
</form>
</div>
	<!-------------------------------------------------------------------------footerStart------------------------------------------------------------------------->
	<footer
		class="section footer-classic context-dark bg-image footer navbar-fixed-bottom"
		style="background: #74b49b;">
		<div class="container">
			<div class="row row-30">
				<div class="col-md-4 col-xl-5">
					<div class="pr-xl-4">
						<a href="index.html"></a>
						<p class="reademe">我們是最佳的共享教育的平台，致力於在分享技能，保障交易，展現自我，使用戶得到最棒的學習體驗。</p>
						<!-- Rights-->
						<p class="rights">
							<span>©  </span><span class="copyright-year">2018</span><span> </span><span>WeShare教育共享平台</span><span>. </span><span>©
								All Rights Reserved. .</span>
						</p>
					</div>
				</div>
				<div class="col-md-4">
					<h5 class="reademe">聯絡我們</h5>
					<dl class="contact-list">
						<dt>地址:</dt>
						<dd>桃園市中壢區中大路300號</dd>
					</dl>
					<dl class="contact-list">
						<dt>信箱:</dt>
						<dd>
							<a href="mailto:#">weshare@gmail.com</a>
						</dd>
					</dl>
					<dl class="contact-list">
						<dt>電話:</dt>
						<dd>
							<a href="tel:#">03-425-7387</a>
						</dd>
					</dl>
				</div>
				<div class="col-md-4 col-xl-3">
					<h5 class="reademe2">關於</h5>
					<ul class="nav-list">
						<li><a href="#">關於我們</a></li>
						<li><a href="#">團隊成員</a></li>
						<li><a href="#">加入WeShare</a></li>
						<li><a href="#">隱私權政策</a></li>
						<li><a href="#">功能更新</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="row no-gutters social-container">
			<div class="col">
				<a class="social-inner" href="#"><span
					class="icon mdi mdi-facebook"></span><span>Facebook</span></a>
			</div>
			<div class="col">
				<a class="social-inner" href="#"><span
					class="icon mdi mdi-instagram"></span><span>instagram</span></a>
			</div>
			<div class="col">
				<a class="social-inner" href="#"><span
					class="icon mdi mdi-twitter"></span><span>twitter</span></a>
			</div>
			<div class="col">
				<a class="social-inner" href="#"><span
					class="icon mdi mdi-youtube-play"></span><span>google</span></a>
			</div>
		</div>
	</footer>
	<!-------------------------------------------------------------------------footerEnd------------------------------------------------------------------------->
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
