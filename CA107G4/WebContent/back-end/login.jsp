<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://cdn.bootcss.com/limonte-sweetalert2/7.33.1/sweetalert2.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://cdn.bootcss.com/limonte-sweetalert2/7.33.1/sweetalert2.all.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<meta charset="UTF-8">
<title>WeShare ｜｜教育共享平台</title>
<style>
body {
    font-family: "Lato", sans-serif;
}

.main-head{
    height: 150px;
    background: #FFF;
   
}
.sidenav {
    height: 100%;
    background-color: #000;
    overflow-x: hidden;
    padding-top: 20px;
}
.main {
    padding: 0px 10px;
}
@media screen and (max-height: 450px) {
    .sidenav {padding-top: 15px;}
}

@media screen and (max-width: 450px) {
    .login-form{
        margin-top: 10%;
    }

    .register-form{
        margin-top: 10%;
    }
}

@media screen and (min-width: 768px){
    .main{
        margin-left: 40%; 
    }

    .sidenav{
        width: 40%;
        position: fixed;
        z-index: 1;
        top: 0;
        left: 0;
    }

    .login-form{
        margin-top: 80%;
    }

    .register-form{
        margin-top: 20%;
    }
}

.login-main-text{
    margin-top: 20%;
    padding: 60px;
    color: #fff;
}
.login-main-text h2{
    font-weight: 300;
}

.btn-black{
    background-color: #000 !important;
    color: #fff;
}
   body{
      font-family:"微軟正黑體";
      }
      </style>
</head>
<body>
<div class="sidenav">
         <div class="login-main-text">
            <h2>WeShare教育共享平台<br></h2>
            <h5>後台管理系統</h5>
         </div>
      </div>
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form">
              <form  id="formId" action="<%= request.getContextPath()%>/AdministratorServlet" method="POST" >
                  <div class="form-group">
                     <label>帳號</label>
                     <input type="text" name="admId" class="form-control" placeholder="請輸入帳號">
                  </div>
                  <div class="form-group">
                     <label>密碼</label>
                     <input type="password" name="admPsw" class="form-control" placeholder="請輸入密碼">
                  </div>
                  <input type="hidden" name="action" value="login"> 
                  <button type="submit" class="btn btn-black">登入</button>
               </form>
               
 
            </div>
         </div>
      </div>
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
</body>
</html>




