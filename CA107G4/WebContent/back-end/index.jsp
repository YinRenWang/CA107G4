<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta content='IE=edge' http-equiv='X-UA-Compatible'/>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1' name='viewport'/>
    <title>Weshare 教育平台 || 後台管理系統</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href='<%= request.getContextPath()%>/back-end/css/SidebarNav.min.css' media='all' rel='stylesheet' type='text/css'/>
  </head>
  <body>
    <aside class="sidebar-left">
      <nav class="navbar navbar-inverse">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".collapse" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Weshare 教育平台</a>
          </div>
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="sidebar-menu">
              <li class="header">
<c:choose> 
  <c:when test="${inCludeVO=='member'}">
	會員資料查詢
    </c:when> 
    
    <c:when test="${inCludeVO=='teacher'}">
	教師資格審核
    </c:when>
    
      <c:when test="${inCludeVO=='liveStream'}">
	直播影片管理
    </c:when>
    
      <c:when test="${inCludeVO=='transactionRecord'}">
 	交易紀錄查詢
    </c:when> 
 
    <c:otherwise>
    會員資料查詢
    </c:otherwise>
</c:choose> 

			</li>
              <li class="treeview">
              	<form id="member" action="<%= request.getContextPath()%>/AdministratorServlet" method="POST">
				<input type="hidden" name="inCludeVO"  value="member"> 
				<input type="hidden" name="action" value="changeValue">
				</form>	
			<a href="" onclick="document.getElementById('member').submit();return false;">	
                <i class="fa fa-dashboard"></i> <span>會員管理</span> 
                </a>
              </li>
              
               <li class="treeview">
                <form id="teacher" action="<%= request.getContextPath()%>/AdministratorServlet" method="POST">
				<input type="hidden" name="inCludeVO"  value="teacher"> 
				<input type="hidden" name="action" value="changeValue">
				</form>	
			<a href="" onclick="document.getElementById('teacher').submit();return false;">	
                <i class="fa fa-calendar"></i> <span>教師審核</span> 
                </a>
              </li>
              
              <li class="treeview">
                <form id="liveStream" action="<%= request.getContextPath()%>/AdministratorServlet" method="POST">
				<input type="hidden" name="inCludeVO"  value="liveStream"> 
				<input type="hidden" name="action" value="changeValue">
				</form>	
			<a href="" onclick="document.getElementById('liveStream').submit();return false;">	
                <i class="fa fa-circle-o"></i> <span>直播管理</span> 
                </a>
              </li>
              
             <li class="treeview">
                <form id="transactionRecord" action="<%= request.getContextPath()%>/AdministratorServlet" method="POST">
				<input type="hidden" name="inCludeVO"  value="transactionRecord"> 
				<input type="hidden" name="action" value="changeValue">
				</form>	
			<a href="" onclick="document.getElementById('transactionRecord').submit();return false;">	
                <i class="fa fa-pie-chart"></i> <span>交易紀錄</span> 
                </a>
              </li>
            
              <li>
               <form id="loginOut" action="<%= request.getContextPath()%>/AdministratorServlet" method="POST">
				<input type="hidden" name="action" value="logout">
				</form>	
              <a href="#" onclick="document.getElementById('loginOut').submit();return false;">	
              <i class="fa fa-circle-o text-aqua"></i> <span>登出</span></a></li>
            </ul>
          </div>
       
        </div>
  
      </nav>
    </aside>
    <div class='content container-fluid' style="background-color:#fafafa;">
    
      <div class="col-sm-12" style="min-width:80%;">
<c:choose> 
  <c:when test="${inCludeVO=='member'}">
    <%@ include file="/back-end/member/listAllMember.jsp"%>
    </c:when> 
    <c:when test="${inCludeVO=='teacher'}">
  <%@ include file="/back-end/teacher/allTeacher.jsp"%>
    </c:when>
      <c:when test="${inCludeVO=='liveStream'}">
  <%@ include file="/back-end/livestream/AllLiveStream.jsp"%>
    </c:when>
      <c:when test="${inCludeVO=='transactionRecord'}">
  <%@ include file="/back-end/withdrawalrecord/listAllWithdrawalRecord.jsp"%>     
    </c:when> 
        <c:when test="${inCludeVO=='findOneByKey'}">
  <%@ include file="/back-end/withdrawalrecord/findOneByKey.jsp"%>     
    </c:when> 
    <c:otherwise>
        <%@ include file="/back-end/member/listAllMember.jsp"%>
    </c:otherwise>
</c:choose> 


</div>

      </div>
     
      
      <style>
         body{
      font-family:"微軟正黑體";
      }
      </style>
  
    <script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



  </body>
</html>
