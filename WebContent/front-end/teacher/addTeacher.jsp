<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!doctype html>
<html lang="en">
<jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService" />
<c:set var="memberVO" value="${memberSvc.getOneMember(memberVO.memId)}"  />

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

.mainbody {
    background:#f0f0f0;
}
/* Special class on .container surrounding .navbar, used for positioning it into place. */
.navbar-wrapper {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 20;
  margin-left: -15px;
  margin-right: -15px;
}

.post-content {
    margin-left:58px;
}

.badge-important {
    margin-top: 3px;
    margin-left: 25px;
    position: absolute;
}

</style>
 
<script>
$(function (){
	 
    function format_float(num, pos)
    {
        var size = Math.pow(20, pos);
        return Math.round(num * size) / size;
    }
 
    function preview(input) {
 
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function (e) {
                $('.preview').attr('src', e.target.result);
                var KB = format_float(e.total / 1024, 2);
                $('.size').text("檔案大小：" + KB + " KB");
            }
 
            reader.readAsDataURL(input.files[0]);
        }
    }
 
    $("body").on("change", ".upl", function (){
        preview(this);
    })
    
})
</script>
<title>WeShare | 最棒的教育共享平台</title>
</head>
<body>
	<!-------------------------------------------------------------------------headerStart------------------------------------------------------------------------->
<%@ include file="/front-end/backHeaderFooter/header.jsp"%>    	
	<!-------------------------------------------------------------------------headerEnd------------------------------------------------------------------------->

<div class="mainbody container-fluid" id="coole">
    <div class="row align-items-center">
        <div style="padding-top:50px;"> </div>
          <div class="col-12"></div>
            <div class="col-12"></div>
                <div class="col-3"></div>
        <div class="col-6">
            <div class="panel panel-default">
                <div class="panel-body">
                    <h1 class="panel-title pull-left" style="font-size:30px;">申請成為老師</h1>
                </div>
            </div>    
            	<c:if test="${not empty errorMsgs}">
		<div class="alert alert-danger" role="alert">
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red; text-align: center;">${message}</li>
				</c:forEach>
			</ul>
			</div>		
		</c:if>     
            <div class="panel panel-default">
                <div class="panel-body">
                    <h3 class="panel-title pull-left"></h3>
                    <br><br>
                        <label for="First_name">姓名</label>
 <form data-toggle="validator" role="form" method="post" action="<%=request.getContextPath()%>/teacher/teacher.do" enctype="multipart/form-data">
<input type="hidden" name="action" value="insert">                       
                        <input type="hidden" name="memId"  value="${memberVO.memId}">
                        <input type="text" class="form-control" value="${memberVO.memName}" readonly="readonly">
                         <label for="Your_location">授課城市</label>
                        <input type="text" class="form-control" name="teacherCity" value="${fn:substring(memberVO.memAdd,0,6)}" readonly="readonly">
                       
                        <br>
    
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <h3 class="panel-title pull-left">教學資訊</h3>
                 
                    <br><br>

                       
                        <label for="Your_gender">教育程度</label>
                        <input type="text" class="form-control" name="teacherEdu" placeholder="請填寫學校名稱">
                        <br>
                   
                        </div>
                  
                             <div class="panel panel-default">
                <div class="panel-body">
                    <h3 class="panel-title pull-left">學經歷證明</h3>
                    <br><br>
                    <div align="center">
                        <div class="col-lg-12 col-md-12">
                        
                        </div>
                        <div class="col-lg-12 col-md-12">
                		 <input name="diplomaImg" type="file" class="upl">
    <div>
        <img class="preview" style="max-width: 150px; max-height: 150px;">
        <div class="size"></div>
    </div>
						
                        </div>
                    </div>
                </div>
            </div>
            
                        <label>老師介紹</label>
                       <textarea class="form-control" rows="3" name="teacherText" placeholder="試著介紹自己吧"></textarea>
                  <div class="d-flex justify-content-center"><input type="submit" class="btn btn-secondary" value="送出申請"></div>
                </div>
            </div>
                 <div class="col-3"></div>
        </div>
    </div>
</form>    
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
