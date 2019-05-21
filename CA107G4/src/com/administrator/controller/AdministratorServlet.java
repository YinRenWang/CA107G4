package com.administrator.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.administrator.model.AdministratorService;
import com.administrator.model.AdministratorVO;
import com.courselike.model.CourseLikeService;
import com.teacher.model.TeacherService;
import com.teacher.model.TeacherVO;


@WebServlet("/AdministratorServlet")
public class AdministratorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/plain; charset=UTF-8");
		String action = req.getParameter("action");

		//登入
		if("login".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>(); 
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
		try {
			 String admId = req.getParameter("admId");	
			if (admId == null || (admId.trim()).length() == 0) {
					errorMsgs.add("請輸入帳號");
			}
			 String admPsw = req.getParameter("admPsw");
			 if (admPsw == null || (admPsw.trim()).length() == 0) {
					errorMsgs.add("請輸入密碼");
					
			}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/login.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
			 AdministratorService AdministratorSvc =new AdministratorService();
			 AdministratorVO admVO= AdministratorSvc.getOneAdministrator(admId);
			if(admVO ==null) {
				errorMsgs.add("此帳號不存在");
			}try {
				if (!admPsw.equals(admVO.getAdmPsw())) {
					errorMsgs.add("錯誤的密碼");
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						admVO.setAdmPsw(null);//帳號保留,密碼清空
						req.setAttribute("admVO", admVO); // 含有輸入格式錯誤的empVO物件,也存入req
						RequestDispatcher failureView = req
								.getRequestDispatcher("/back-end/login.jsp");
						failureView.forward(req, res);
						return;
					}
				}
				if (admVO.getAdmStatus().equals(1)) {
					errorMsgs.add("此帳號已離職");
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						admVO.setAdmPsw(null);//帳號保留,密碼清空
						req.setAttribute("admVO", admVO); // 含有輸入格式錯誤的empVO物件,也存入req
						RequestDispatcher failureView = req
								.getRequestDispatcher("/back-end/login.jsp");
						failureView.forward(req, res);
						return;
					}
				}
			} 
			catch (NullPointerException npe) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/login.jsp");
				failureView.forward(req, res);
				return;// 程式中斷
			}

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/login.jsp");
				failureView.forward(req, res);
				return;// 程式中斷
			}
			/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
			HttpSession session=req.getSession();
			session.setAttribute("admVO", admVO); // 資料庫取出的memberVO物件,存入req
			String url ="/back-end/index.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 loginSuccess.jsp
			successView.forward(req, res);
			return;

		} 
		catch (Exception e) {
		errorMsgs.add("無法取得資料:" + e.getMessage());
		RequestDispatcher failureView = req.getRequestDispatcher("/back-end/login.jsp");
			failureView.forward(req, res);
			return;
		}		
		}
		
		if ("logout".equals(action)) { // 來自listAllMember.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			HttpSession session=req.getSession();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		

			try {
				/*************************** 1.清除登入資訊 ****************************************/
				session.removeAttribute("admVO");
				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				String url = "/back-end/login.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 editMember.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/login.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("changeValue".equals(action)) { // 來自editMember.jsp的請求
			try {
				String url = "/back-end/index.jsp";
				String inCludeVO=req.getParameter("inCludeVO");
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 loginSuccess.jsp
				  switch(inCludeVO) { 
		            case "member": 
		            	req.setAttribute("inCludeVO", "member"); // 資料庫取出的memberVO物件,存入req
						successView.forward(req, res);
		                break; 
		            case "teacher": 
		            	req.setAttribute("inCludeVO", "teacher"); // 資料庫取出的memberVO物件,存入req
						successView.forward(req, res);
		                break; 
		            case "inscourse": 
		            	req.setAttribute("inCludeVO", "inscourse"); // 資料庫取出的memberVO物件,存入req
						successView.forward(req, res);
		                break; 
		            case "transactionRecord": 
		            	req.setAttribute("inCludeVO", "transactionRecord"); // 資料庫取出的memberVO物件,存入req
						successView.forward(req, res);
		                break; 
		            case "liveStream": 
		            	req.setAttribute("inCludeVO", "liveStream"); // 資料庫取出的memberVO物件,存入req
						successView.forward(req, res);
		                break; 
		            default: 
		                System.out.println("include有問題!!"); 
		        }
				  
			} 
			catch (Exception e) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/index.jsp");
				failureView.forward(req, res);

			}

		}
		
	}

}
