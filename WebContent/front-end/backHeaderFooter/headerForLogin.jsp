<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<div class="header">
      <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top"> <img src="<%= request.getContextPath()%>/images/icon/logo.png" width="80" height="60" alt=""/><a class="navbar-brand" href="<%= request.getContextPath()%>">教育共享平台</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
              <li class="nav-item"> <a class="nav-link" href="<%= request.getContextPath()%>/inscourse/inscourse.do?courseId=&inscLoc=&inscStatus=0&action=listEmps_ByCompositeQuery">探索課程</a> </li>
              <li class="nav-item"> <a class="nav-link" href="<%= request.getContextPath()%>/front-end/team/team.jsp">揪團上課</a> </li>
               <li class="nav-item"> <a class="nav-link" href="<%= request.getContextPath()%>/front-end/goods/good_home.jsp">教材商城</a> </li>
           <li class="nav-item active"> <a class="nav-link" href="<%= request.getContextPath()%>/front-end/teacher/joinTeacher.jsp">成為老師 <span class="sr-only">(current)</span></a> </li>
    			<li class="nav-item"> <a class="nav-link" href="<%= request.getContextPath()%>/front-end/member/loginMember.jsp">登入</a> </li>
    		    <li class="nav-item"> <a class="nav-link" href="<%= request.getContextPath()%>/front-end/member/addMember.jsp">註冊</a> </li>
    		
            <li class="nav-item"> <a class="nav-link">關於我們</a> </li>
          </ul>
        </div>
      </nav>
   </div> 