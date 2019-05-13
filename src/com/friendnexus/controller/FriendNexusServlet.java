package com.friendnexus.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.*;
import javax.servlet.http.*;

import com.friendnexus.model.FriendNexusService;
import com.friendnexus.model.FriendNexusVO;
import com.member.model.MemberService;
import com.member.model.MemberVO;
import com.team.model.TeamService;
import com.team.model.TeamVO;

public class FriendNexusServlet extends HttpServlet {

	private static final String String = null;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		System.out.println(action);

		if ("insert1".equals(action)) { // 來自addEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				String memId = req.getParameter("memId");
				String friendAcc = req.getParameter("friendAcc");
//					Integer friendstatus = req.getParameter(friendstatus);
				if (memId == null||memId.isEmpty()) {
					String url = "/front-end/friend/allfriend.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
					successView.forward(req, res);
					return;
				}	
				if (memId.equals(friendAcc)) {
					errorMsgs.add("不能加自己為好友喔");
					
				}
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/friend/allfriend.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}

				/*************************** 2.開始新增資料 ***************************************/
			
				try{
					FriendNexusService friendnexusSvc = new FriendNexusService();
					friendnexusSvc.addfriendNexus(memId, friendAcc, 0);
				} catch (Exception e) {
					errorMsgs.add("請勿重複申請好友喔");
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/friend/allfriend.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/front-end/friend/allfriend.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);
				return;
				

				/*************************** 其他可能的錯誤處理 **********************************/
			}
			catch (Throwable e) {
				errorMsgs.add( e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/friend/allfriend.jsp");
				failureView.forward(req, res);
				return;
			}
		}

		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String memId = new String(req.getParameter("memId").trim());
				String friendAcc = new String(req.getParameter("friendAcc").trim());
				Integer friendstatus = new Integer(req.getParameter("friendstatus").trim());

				FriendNexusVO friendNexusVO = new FriendNexusVO();
				friendNexusVO.setMemId(memId);
				friendNexusVO.setFriendAcc(friendAcc);
				friendNexusVO.setFriendstatus(friendstatus);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("friendNexusVO", friendNexusVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/friend/friendCheck.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				FriendNexusService friendNexusSvc = new FriendNexusService();
				friendNexusVO = friendNexusSvc.updatefriendNexus(memId, friendAcc, friendstatus);

				System.out.println(memId);
				System.out.println(friendAcc);
				System.out.println(friendstatus);

				
				FriendNexusService friendnexusSvc = new FriendNexusService();
				friendnexusSvc.addfriendNexus(friendAcc, memId,1);
				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("friendNexusVO", friendNexusVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/front-end/friend/friendCheck.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/friend/friendCheck.jsp");
				failureView.forward(req, res);
			}

		}
		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs1 = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs1);

			try {

				/*************************** 1.接收請求參數 ***************************************/
				String friendAcc = new String(req.getParameter("friendAcc"));
                String memId = new String(req.getParameter("memId"));
                
                System.out.println("friendAcc=" + friendAcc);
                System.out.println("memId=" + friendAcc);
				/*************************** 2.開始刪除資料 ***************************************/
				FriendNexusService friendNexusSvc = new FriendNexusService();
				friendNexusSvc.deletefriendNexusp(friendAcc, memId);
				friendNexusSvc.deletefriendNexuspMemid(memId, friendAcc);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/front-end/friend/myfriend.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs1.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/friend/myfriend.jsp");
				failureView.forward(req, res);
			}

		}
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("memName");
				System.out.println(str);
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入好友姓名");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/friend/allfriend.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				String memName = null;
				try {
					memName = new String(str.trim());
				} catch (Exception e) {
					errorMsgs.add("好友ID不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/friend/allfriend.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				MemberService memberSvc = new MemberService();
				MemberVO memberVO = memberSvc.findMemName(memName.trim());
				System.out.println("姓名"+"memName");
				if (memberVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/friend/allfriend.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("friendVO", memberVO);
				String url = "/front-end/friend/findOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/friend/allfriend.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("getmyFriend".equals(action)) { // 來自listAllEmp.jsp 或 /dept/listEmps_ByDeptno.jsp 的請求

			try {
				/*************************** 1.接收請求參數 ****************************************/

				System.out.println("有近來");
				String memId = req.getParameter("memId");

				MemberService memberSvc = new MemberService();
				MemberVO memberVO = memberSvc.getOneMember(memId);

				req.setAttribute("memberVO", memberVO);

				/*************************** 2.開始查詢資料 ****************************************/

////				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/	

				RequestDispatcher successView = req.getRequestDispatcher("/front-end/friend/myfriend.jsp"); // 成功轉交
																									// loginSuccess.jsp
				successView.forward(req, res);
				System.out.println("走完了");
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
		
		if ("getmyFriendCheck".equals(action)) { // 來自listAllEmp.jsp 或 /dept/listEmps_ByDeptno.jsp 的請求

			try {
				/*************************** 1.接收請求參數 ****************************************/

				System.out.println("有近來");
				String friendAcc = req.getParameter("friendAcc");
                
				FriendNexusService friendNexusSvc = new FriendNexusService();
				List<FriendNexusVO> friendNexusVO = friendNexusSvc.friendNexus0(friendAcc);
				
                
			    System.out.println(friendAcc);

				req.setAttribute("friendNexusVO", friendNexusVO);

				/*************************** 2.開始查詢資料 ****************************************/

////				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/	

				RequestDispatcher successView = req.getRequestDispatcher("/front-end/friend/friendCheck.jsp"); // 成功轉交
																									// loginSuccess.jsp
				successView.forward(req, res);
				System.out.println("走完了");
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
	}
}
