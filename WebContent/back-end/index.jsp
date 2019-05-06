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
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
	會員管理頁面
    </c:when>
    <c:when test="${inCludeVO=='teacher'}">
	教師審核頁面
    </c:when>
      <c:when test="${inCludeVO=='inscourse'}">

    </c:when>
      <c:when test="${inCludeVO=='transactionRecord'}">
    </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose> 

			</li>
              <li class="treeview">
              	<form id="member" action="<%= request.getContextPath()%>/AdministratorServlet" method="get">
				<input type="hidden" name="inCludeVO"  value="member"> 
				<input type="hidden" name="action" value="changeValue">
				</form>	
			<a href="#" onclick="document.getElementById('member').submit();return false;">	
                <i class="fa fa-dashboard"></i> <span>會員管理</span> 
                </a>
              </li>
               <li class="treeview">
                <form id="teacher" action="<%= request.getContextPath()%>/AdministratorServlet" method="get">
				<input type="hidden" name="inCludeVO"  value="teacher"> 
				<input type="hidden" name="action" value="changeValue">
				</form>	
			<a href="#" onclick="document.getElementById('teacher').submit();return false;">	
                <i class="fa fa-dashboard"></i> <span>教師審核</span> 
                </a>
              </li>
              <li>
                <a href="#">
                <i class="fa fa-th"></i> <span>Widgets</span>
                <small class="label pull-right label-info">new</small>
                </a>
              </li>
              <li class="treeview">
                <a href="#">
                <i class="fa fa-pie-chart"></i>
                <span>Charts</span>
                <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                  <li><a href="#"><i class="fa fa-circle-o"></i> ChartJS</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Morris</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Flot</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Inline charts</a></li>
                </ul>
              </li>
              <li class="treeview">
                <a href="#">
                <i class="fa fa-laptop"></i>
                <span>UI Elements</span>
                <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                  <li><a href="#"><i class="fa fa-circle-o"></i> General</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Icons</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Buttons</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Sliders</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Timeline</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Modals</a></li>
                </ul>
              </li>
              <li class="treeview">
                <a href="#">
                <i class="fa fa-edit"></i> <span>Forms</span>
                <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                  <li><a href="#"><i class="fa fa-circle-o"></i> General Elements</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Advanced Elements</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Editors</a></li>
                </ul>
              </li>
              <li class="treeview">
                <a href="#">
                <i class="fa fa-table"></i> <span>Tables</span>
                <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                  <li><a href="#"><i class="fa fa-circle-o"></i> Simple tables</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Data tables</a></li>
                </ul>
              </li>
              <li>
                <a href="#">
                <i class="fa fa-calendar"></i> <span>Calendar</span>
                <small class="label pull-right label-danger">3</small>
                </a>
              </li>
              <li>
                <a href="#">
                <i class="fa fa-envelope"></i> <span>Mailbox</span>
                <small class="label pull-right label-warning">12</small>
                </a>
              </li>
              <li class="treeview">
                <a href="#">
                <i class="fa fa-folder"></i> <span>Examples</span>
                <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                  <li><a href="#"><i class="fa fa-circle-o"></i> Invoice</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Profile</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Login</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Register</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Lockscreen</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> 404 Error</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> 500 Error</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Blank Page</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Pace Page</a></li>
                </ul>
              </li>
              <li class="treeview">
                <a href="#">
                <i class="fa fa-share"></i> <span>Multilevel</span>
                <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                  <li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
                  <li>
                    <a href="#"><i class="fa fa-circle-o"></i> Level One <i class="fa fa-angle-left pull-right"></i></a>
                    <ul class="treeview-menu">
                      <li><a href="#"><i class="fa fa-circle-o"></i> Level Two</a></li>
                      <li>
                        <a href="#"><i class="fa fa-circle-o"></i> Level Two <i class="fa fa-angle-left pull-right"></i></a>
                        <ul class="treeview-menu">
                          <li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
                          <li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
                        </ul>
                      </li>
                    </ul>
                  </li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
                </ul>
              </li>
              <li>
               <form id="loginOut" action="<%= request.getContextPath()%>/AdministratorServlet" method="get">
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
    <%@ include file="/member/listAllMember.jsp"%>
    </c:when> 
    <c:when test="${inCludeVO=='teacher'}">
  <%@ include file="/teacher/allTeacher.jsp"%>
    </c:when>
      <c:when test="${inCludeVO=='inscourse'}">
    </c:when>
      <c:when test="${inCludeVO=='transactionRecord'}">
    </c:when> 
    <c:otherwise>
    </c:otherwise>
</c:choose> 


</div>

      </div>
     
      
      
  
    <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



  </body>
</html>
