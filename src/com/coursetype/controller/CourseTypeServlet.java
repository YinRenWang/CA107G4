package com.coursetype.controller;

import java.io.*;
import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.course.model.CourseService;
import com.course.model.CourseVO;
import com.coursereservation.model.CourseReservationService;
import com.coursereservation.model.CourseReservationVO;
import com.coursetype.model.CourseTypeDAO_interface;
import com.coursetype.model.CourseTypeJDBCDAO;
import com.coursetype.model.CourseTypeService;
import com.coursetype.model.CourseTypeVO;
import com.inscourse.model.InsCourseService;
import com.inscourse.model.InsCourseVO;
import com.member.model.MemberService;
import com.member.model.MemberVO;
import com.teacher.model.TeacherService;
import com.teacher.model.TeacherVO;

@WebServlet("/CourseTypeServlet")
public class CourseTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/plain; charset=UTF-8");
		PrintWriter out = res.getWriter();
		
		String action = req.getParameter("action");
		
		if("get_all_type".equals(action)) {
			List<CourseTypeVO> courseTypes = new CourseTypeService().getAll();
				 
		}
		
		if("find_by_coursetype".equals(action)) {
			
			CourseService courseSvc = new CourseService();
			Integer courseTypeId = new Integer(req.getParameter("courseTypeId"));
			
			List<CourseVO> courseVOs = courseSvc.findByCourseType(courseTypeId);
			
			List<InsCourseVO> insCourseVOs = new ArrayList<>();
			
			
			//查詢對應課程
			for(CourseVO cvo : courseVOs) {
				
				InsCourseService insCourseSvc = new InsCourseService();
				List<InsCourseVO> insCourseVOmass = insCourseSvc.findByCourse(cvo.getCourseId());
				insCourseVOs.addAll(insCourseVOmass);
				
			}

			//去除工程師資料
			for(InsCourseVO icvo : insCourseVOs) {
				
				for(CourseVO cvo : courseVOs) {
					if(icvo.getCourseId().equals(cvo.getCourseId())) {
						icvo.setCourseId(cvo.getCourseName());
					}
				}
			}

		}
		
		
		  if ("updateCourse".equals(action)) { // 來自addEmp.jsp的請求  
				
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
				

//				try {
					/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
					Integer courseTypeId=null;
					String str = req.getParameter("courseTypeId").trim();
					courseTypeId = new Integer(str);
					/***************************2.開始新增資料***************************************/
					CourseService cSvc = new CourseService();
					List<CourseVO>courseList =cSvc.findByCourseType(courseTypeId);
					/***************************3.新增完成,準備轉交(Send the Success view)***********/
					String url = "/inscourse/addInsCourse.jsp";
					req.setAttribute("courseList", courseList); 
					RequestDispatcher successView = req.getRequestDispatcher(url); // 
					successView.forward(req, res);				
					
					/***************************其他可能的錯誤處理**********************************/
				} 
//				catch (Exception e) {
//					errorMsgs.add(e.getMessage());
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/inscourse/insCourseDetails.jsp");
//					failureView.forward(req, res);
//				}
			
		  
		
		
		
		
		
	}

}
