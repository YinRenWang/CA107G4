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
           <c:choose>
    		<c:when test="${!empty teacherVO}">
    			<li class="nav-item"> <a class="nav-link" id="openLive" href="<%= request.getContextPath()%>/SimpleWebRTC-master/test/selenium/index.jsp" onclick="sendMessage();">現場直播</a> </li>
           </c:when>
           <c:otherwise>
           <li class="nav-item active"> <a class="nav-link" href="<%= request.getContextPath()%>/teacher/joinTeacher.jsp">成為老師 <span class="sr-only">(current)</span></a> </li>
         
           </c:otherwise>
         </c:choose>  
         
        <c:if test="${!empty memberVO}">
            <li class="nav-item"> <a class="nav-link" id="openLive" href="<%= request.getContextPath()%>/front-end/friend/chatroom.jsp">聊天室</a> </li>
        </c:if>
         
                    
                <c:choose>
                		<c:when test="${!empty teacherVO}">
			      
			<li class="nav-item dropdown"> <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >${memberVO.memName}</a>
             <form id="viewAllMember" action="<%= request.getContextPath()%>/MemberServlet" method="get">
            	<input type="hidden" name="inCludeVO"  value="member"> 
            	<input type="hidden" name="action" value="changeValue">
            </form>	
              <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink"> <a class="dropdown-item" onclick="document.getElementById('viewAllMember').submit();return false;">個人資料</a> 
             
             	<a class="dropdown-item" href="<%= request.getContextPath()%>/front-end/friend/myfriend.jsp">我的好友</a>
             <form id="form2" action="<%= request.getContextPath()%>/MemberServlet" method="get">
					<input type="hidden" name="inCludeVO"  value="teacher"> 
					<input type="hidden" name="action" value="changeValue">
			</form>	
 			<a class="dropdown-item" onclick="document.getElementById('form2').submit();return false;">課程管理</a>
 				<form id="form3" action="<%= request.getContextPath()%>/MemberServlet" method="get">
								<input type="hidden" name="inCludeVO"  value="inscourse"> 
								<input type="hidden" name="action" value="changeValue">
							</form>	
              <a class="dropdown-item"onclick="document.getElementById('form3').submit();return false;">預約資訊</a>
              
                <form id="form4" action="<%= request.getContextPath()%>/MemberServlet" method="get">
								<input type="hidden" name="inCludeVO"  value="goods"> 
								<input type="hidden" name="action" value="changeValue">
							</form>	
              <a class="dropdown-item" onclick="document.getElementById('form4').submit();return false;">商品管理</a>
              
                 <form id="form5" action="<%= request.getContextPath()%>/MemberServlet" method="get">
								<input type="hidden" name="inCludeVO"  value="goodsOrder"> 
								<input type="hidden" name="action" value="changeValue">
							</form>	
              <a class="dropdown-item" onclick="document.getElementById('form5').submit();return false;">訂單資訊</a>
              
              
              <form id="form6" action="<%= request.getContextPath()%>/MemberServlet" method="get">
								<input type="hidden" name="inCludeVO"  value="transactionRecord"> 
								<input type="hidden" name="action" value="changeValue">
							</form>	
              <a class="dropdown-item"  onclick="document.getElementById('form6').submit();return false;">交易紀錄</a>
            

 			 <form id="form7" action="<%= request.getContextPath()%>/MemberServlet" method="get">
								<input type="hidden" name="inCludeVO"  value="liveStream"> 
								<input type="hidden" name="action" value="changeValue">
							</form>	
              <a class="dropdown-item" onclick="document.getElementById('form7').submit();return false;">直播管理</a>
              
              <a class="dropdown-item" href="<%= request.getContextPath()%>/MemberServlet?action=logout">登出</a>
                 </div>
            </li>  
   				</c:when>
    			<c:when test="${!empty memberVO}">
			 <li class="nav-item"> <a class="nav-link " href="<%= request.getContextPath()%>/front-end/friend/myfriend.jsp">我的好友</a> </li>		                   
			<li class="nav-item dropdown"> <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >${memberVO.memName}</a>
              <form id="viewAllMember" action="<%= request.getContextPath()%>/MemberServlet" method="get">
            	<input type="hidden" name="inCludeVO"  value="member"> 
            	<input type="hidden" name="action" value="changeValue">
            </form>	
              <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink"> <a class="dropdown-item" onclick="document.getElementById('viewAllMember').submit();return false;">個人資料</a> 
              <form id="form3" action="<%= request.getContextPath()%>/MemberServlet" method="get">
				<input type="hidden" name="inCludeVO"  value="inscourse"> 
				<input type="hidden" name="action" value="changeValue">
			</form>	
              <a class="dropdown-item" href="<%= request.getContextPath()%>/MemberServlet?action=logout" onclick="document.getElementById('form3').submit();return false;">預約資訊</a>
         <form id="form5" action="<%= request.getContextPath()%>/MemberServlet" method="get">
								<input type="hidden" name="inCludeVO"  value="goodsOrder"> 
								<input type="hidden" name="action" value="changeValue">
							</form>	
              <a class="dropdown-item" href="<%= request.getContextPath()%>/MemberServlet?action=logout" onclick="document.getElementById('form5').submit();return false;">訂單資訊</a>
       <form id="form6" action="<%= request.getContextPath()%>/MemberServlet" method="get">
								<input type="hidden" name="inCludeVO"  value="transactionRecord"> 
								<input type="hidden" name="action" value="changeValue">
							</form>	
              <a class="dropdown-item" href="<%= request.getContextPath()%>/MemberServlet?action=logout" onclick="document.getElementById('form6').submit();return false;">交易紀錄</a>
           
              <a class="dropdown-item" href="<%= request.getContextPath()%>/MemberServlet?action=logout">登出</a>
                 </div>
            </li>  
   				</c:when>				
    			<c:otherwise>
    			<li class="nav-item"> <a class="nav-link" href="<%= request.getContextPath()%>/front-end/member/loginMember.jsp">登入</a> </li>
    		    <li class="nav-item"> <a class="nav-link" href="<%= request.getContextPath()%>/front-end/member/addMember.jsp">註冊</a> </li>
    			</c:otherwise>
				</c:choose>
            <li class="nav-item"> <a class="nav-link">關於我們</a> </li>
          </ul>
        </div>
      </nav>
   </div> 