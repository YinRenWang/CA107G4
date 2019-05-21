<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<jsp:useBean id="CourseTypeSvc" scope="page" class="com.coursetype.model.CourseTypeService" />
<jsp:useBean id="CourseSvc" scope="page" class="com.course.model.CourseService" />
<jsp:useBean id="InsCourseSvc" scope="page" class="com.inscourse.model.InsCourseService" />
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
margin:auto;
    padding:0;
    background: #f4f9f4;
    width: 100%;
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
<%@ include file="/front-end/backHeaderFooter/header.jsp"%>      

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
   <h1 class="entry-title"><span>編輯課程-課程資訊</span></h1>
        <hr>
 <div class="row">
  <div class="col-md-6 mb-3">
  	<label for="validationCustom03">課程分類:</label>
      <select class="form-control form-control-lg" id="courseTypeId" >
        <option value="${CourseSvc.findOneById(InsCourseSvc.findOneById(param.inscId).courseId).courseTypeId}" 
        disabled selected>${CourseTypeSvc.findOneById(CourseSvc.findOneById(InsCourseSvc.findOneById(param.inscId).courseId).courseTypeId).courseTypeName}</option>
                     
      </select>
  </div>
  
  <div class="col-md-6 mb-3">
  	<label for="validationCustom04">課程類型:</label>
     <select class="form-control form-control-lg" id="courseId" >
    	 <option value="${InsCourseSvc.findOneById(param.inscId).courseId}" 
		 disabled selected >${CourseSvc.findOneById(InsCourseSvc.findOneById(param.inscId).courseId).courseName}</option> 
		</select>
  </div>
</div>

<form id="form2" action="<%= request.getContextPath()%>/InsCourseServlet" method="GET">
<input type="hidden" name="action" value="update">
<input type="hidden" name="inscStatus" value="${InsCourseSvc.findOneById(param.inscId).inscStatus}">
<input type="hidden" name="inscId" value="${param.inscId}">
<input type="hidden" name="teacherId" value="${teacherVO.teacherId}">
<input type="hidden" name="courseId" id=formvalue value="${InsCourseSvc.findOneById(param.inscId).courseId}">
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
