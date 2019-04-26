package com.inscoursetime.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
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
				String url = "insctime/addinscTime.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 loginSuccess.jsp
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
				String url = "insctime/addinscTime.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 loginSuccess.jsp
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/member/loginMember.jsp");
				failureView.forward(req, res);
			}

		}

		if ("insert".equals(action)) {// 來自loginMember.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 2.開始查詢資料 *****************************************/
				InsCourseTimeService insCourseTimeSvc = new InsCourseTimeService();
				String inscId = req.getParameter("inscId");
				System.out.println(inscId);
				String[] inscMFD = req.getParameterValues("start_dateTime");
				String[] inscEXP = req.getParameterValues("end_dateTime");
				for (int i = 0; i < inscMFD.length; i++) {
					System.out.println(inscMFD[i]);
					System.out.println(inscEXP[i]);
					insCourseTimeSvc.insertInsCourseTime(inscId, java.sql.Timestamp.valueOf(inscMFD[i]), java.sql.Timestamp.valueOf(inscEXP[i]));
					
				}
	
				/*************************** 3.新增完成,準備轉交(Send the Success view) *************/
				String url = "insctime/addinscTime.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 loginSuccess.jsp
				successView.forward(req, res);
				

			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/member/loginMember.jsp");
				failureView.forward(req, res);
			}

		}

	}

}
