package com.coursereservation.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coursereservation.model.CourseReservationService;
import com.coursereservation.model.CourseReservationVO;

@WebServlet("/CourseReservationServlet")
public class CourseReservationServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		  if ("addOrder".equals(action)) { // 來自addEmp.jsp的請求  
				
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
				

				try {
					/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
					String teacherId = req.getParameter("teacherId").trim();
//					String memId = req.getParameter("memId").trim();
					String inscId = req.getParameter("inscId").trim();

					
					Timestamp crvMFD = null;
					try {
						crvMFD = Timestamp.valueOf(req.getParameter("crvMFD").trim());
					} catch (IllegalArgumentException e) {
						crvMFD=new Timestamp(System.currentTimeMillis());
						errorMsgs.add("請輸入日期!");
					}
					
					String TeamId =null;
					
					Timestamp crvEXP = null;
					try {
						crvEXP = Timestamp.valueOf(req.getParameter("crvEXP").trim());
					} catch (IllegalArgumentException e) {
						crvEXP=new Timestamp(System.currentTimeMillis());
						errorMsgs.add("請輸入日期!");
					}
					
					
					String crvLoc = req.getParameter("crvLoc").trim();
			
					Double crvTotalTime = null;

						crvTotalTime = new Double(req.getParameter("crvTotalTime"));
					
					Double crvTotalPrice = null;
					try {
						crvTotalPrice = new Double(req.getParameter("crvTotalPrice"));
					} catch (NumberFormatException e) {
						crvTotalPrice = 0.0;
						errorMsgs.add("請選擇時間!");
					}
					String teamId =null;
					Integer crvStatus = 1;
					Integer classStatus = 0;
					Integer tranStatus = 0;
					Double crvScore = 0.0;
					String crvRate = null;
					String xxx= "weshare05";
					
					CourseReservationVO courseReservationVO=new CourseReservationVO();
					courseReservationVO.setTeacherId(teacherId);
					courseReservationVO.setMemId(xxx);
					courseReservationVO.setInscId(inscId);
					courseReservationVO.setTeamId(teamId);
					courseReservationVO.setCrvStatus(crvStatus);
					courseReservationVO.setClassStatus(classStatus);
					courseReservationVO.setTranStatus(tranStatus);
					courseReservationVO.setCrvMFD(crvMFD);
					courseReservationVO.setCrvEXP(crvEXP);
					courseReservationVO.setCrvLoc(crvLoc);
					courseReservationVO.setCrvTotalTime(crvTotalTime);
					courseReservationVO.setCrvTotalPrice(crvTotalPrice);
					courseReservationVO.setCrvScore(crvScore);
					courseReservationVO.setCrvRate(crvRate);
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						req.setAttribute("courseReservationVO", courseReservationVO); // 含有輸入格式錯誤的empVO物件,也存入req
						RequestDispatcher failureView = req
								.getRequestDispatcher("/coursereservation/courseOrder.jsp");
						failureView.forward(req, res);
						return;
						
					}
					
					/***************************2.開始新增資料***************************************/
					CourseReservationService crSvc = new CourseReservationService();
					
					crSvc.addCourseReservation(teacherId, xxx, inscId, teamId, crvStatus, classStatus, tranStatus, crvMFD, crvEXP, crvLoc, crvTotalTime, crvTotalPrice, crvScore, crvRate);
					/***************************3.新增完成,準備轉交(Send the Success view)***********/
					String url = "/coursereservation/courseOrder.jsp";
					req.setAttribute("courseReservationVO", courseReservationVO); 
					RequestDispatcher successView = req.getRequestDispatcher(url); // 
					successView.forward(req, res);				
					
					/***************************其他可能的錯誤處理**********************************/
				} 
				catch (Exception e) {
					errorMsgs.add(e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/insCourseServlet/insCourseDetails.jsp");
					failureView.forward(req, res);
				}
			}
		
		
		
		
		

	
	
	

	}	
}
