package com.inscoursetime.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.inscoursetime.model.InsCourseTimeService;
import com.inscoursetime.model.InsCourseTimeVO;
import com.member.model.MemberService;
import com.member.model.MemberVO;

@WebServlet("/InsCourseTimeServlet")
public class InsCourseTimeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("UTF-8");
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) {// 來自addInscTime.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to 
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String inscId = req.getParameter("inscId");
				/*************************** 2.開始查詢資料 *****************************************/
				InsCourseTimeService insCourseTimeSvc = new InsCourseTimeService();
				List<InsCourseTimeVO> timeList = insCourseTimeSvc.findByKey(inscId);
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("timeList", timeList); // 資料庫取出的memberVO物件,存入req
				req.setAttribute("inCludeVO", "teacher"); // 要導向的分頁
				String url = "/member/viewAllMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/member/loginMember.jsp");
				failureView.forward(req, res);
			}

		}

		if ("delete".equals(action)) {// 來自addInscTime.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String inscTimeId = req.getParameter("inscTimeId");
				/*************************** 2.開始查詢資料 *****************************************/
				InsCourseTimeService insCourseTimeSvc = new InsCourseTimeService();
				insCourseTimeSvc.deleteInsCourseTime(inscTimeId);
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				String url = "/member/viewAllMember.jsp";
				req.setAttribute("inCludeVO", "teacher"); // 要導向的分頁
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/member/loginMember.jsp");
				failureView.forward(req, res);
			}

		}

		if ("insert".equals(action)) {// 來自loginMember.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			List<String> successMsgs = new LinkedList<String>();
			Set<String> inscMFDSet = new LinkedHashSet<String>();
			Set<String> inscEXPSet = new LinkedHashSet<String>();
			// Store this set in the request scope, in case we need td
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("successMsgs", successMsgs);
//
//			try {
				/*************************** 2.開始查詢資料 *****************************************/
				InsCourseTimeService insCourseTimeSvc = new InsCourseTimeService();
				String inscId = req.getParameter("inscId");
				if (inscId == null || (inscId.trim()).length() == 0) {
					errorMsgs.add("請選擇	課程");
				}
				String[] start_dateTime = req.getParameterValues("start_dateTime");
				String[] end_dateTime = req.getParameterValues("end_dateTime");
				for (int i = 0; i < start_dateTime.length; i++) {
					if (start_dateTime[i] == null || (start_dateTime[i].trim()).length() == 0 || end_dateTime[i] == null
							|| (end_dateTime[i].trim()).length() == 0) {
						errorMsgs.add("開始時間與結束時間請勿請勿空白");
						break;
					}
					if (start_dateTime[i].equals(end_dateTime[i])) {
						errorMsgs.add("開始時間與結束時間請勿相同");
						break;

					}
					if(insCourseTimeSvc.findDateMinute(start_dateTime[i], end_dateTime[i], inscId)!=null) {
						errorMsgs.add("此日期時段已存在資料庫");				
						break;
					} else {
						
						inscMFDSet.add((start_dateTime[i] + ":00"));
						inscEXPSet.add((end_dateTime[i] + ":00"));
					}
				}
				String[] inscMFD = inscMFDSet.toArray(new String[inscMFDSet.size()]);
				String[] inscEXP = inscEXPSet.toArray(new String[inscEXPSet.size()]);
				for (int i = 0; i < inscMFD.length; i++) {
					insCourseTimeSvc.insertInsCourseTime(inscId, java.sql.Timestamp.valueOf(inscMFD[i]),
							java.sql.Timestamp.valueOf(inscEXP[i]));
				}
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("inCludeVO", "teacher"); // 要導向的分頁
					String url = "/member/viewAllMember.jsp";
					RequestDispatcher failureView = req.getRequestDispatcher(url);
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.新增完成,準備轉交(Send the Success view) *************/
				successMsgs.add("完成新增課程時間");
				String url = "/member/viewAllMember.jsp";
				req.setAttribute("inCludeVO", "teacher"); // 要導向的分頁
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);
				

			} 
//			catch (Exception e) {
//				errorMsgs.add("無法取得資料:" + e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("insctime/addinscTime.jsp");
//				failureView.forward(req, res);
//			}

		

	}

}
