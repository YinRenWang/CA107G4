package com.member.controller;

import com.member.model.*;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MemberServlet")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doGet(req, res);
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("login".equals(action)) {// 來自loginMember.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String memId = req.getParameter("memId");
				if (memId == null || (memId.trim()).length() == 0) {
					errorMsgs.add("請輸入帳號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/member/loginMember.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				String memPsw = req.getParameter("memPsw");
				if (memPsw == null || (memPsw.trim()).length() == 0) {
					errorMsgs.add("請輸入密碼");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/member/loginMember.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				MemberService memSvc = new MemberService();
				MemberVO memberVO = memSvc.getOneMember(memId);
				if (memberVO == null) {
					errorMsgs.add("此帳號不存在");
				}
				try {
					if (!memPsw.equals(memberVO.getMemPsw())) {
						errorMsgs.add("錯誤的密碼");
					}
				} catch (NullPointerException npe) {
					RequestDispatcher failureView = req.getRequestDispatcher("/member/loginMember.jsp");
					failureView.forward(req, res);

				}

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/member/loginMember.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("memberVO", memberVO); // 資料庫取出的memberVO物件,存入req
				String url = "/loginSuccess.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 loginSuccess.jsp
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/member/loginMember.jsp");
				failureView.forward(req, res);
			}

		}

		if ("insert".equals(action)) { // 來自addMember.jsp的請求

			List<String> errorMsgs = new <String>LinkedList();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				String memId = req.getParameter("memId");
				String memIdReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{8,12}$";
				if (memId == null || memId.trim().length() == 0) {
					errorMsgs.add("會員帳號：請勿空白");
				} else if (!memId.trim().matches(memIdReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("會員帳號：請以半形輸入，6-12個英、數字組合");
				}

				String memEmail = req.getParameter("memEmail");
				String memEmailReg = "^[a-z0-9A-Z]+[- | a-z0-9A-Z . _]+@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-z]{2,}$";
				if (memEmail == null || memEmail.trim().length() == 0) {
					errorMsgs.add("電子郵件：請勿空白");
				} else if (!memEmail.trim().matches(memEmailReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("電子郵件：請輸入有效的手機號碼或電子郵件");
				}

				String memPsw = req.getParameter("memPsw");
				String memPswReg = "^(?=.*[^a-zA-Z0-9])(?=.*[A-Z])(?=.*[a-z])(?=.*\\d).{6,}$";
				if (memPsw == null || memPsw.trim().length() == 0) {
					errorMsgs.add("會員密碼：請勿空白");
				} else if (!memPsw.trim().matches(memPswReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("會員密碼：請輸入6 位數以上，並且至少包含大寫字母、小寫字母、數字、符號各一");
				}

				String memPswHint = req.getParameter("memPswHint");
				if (memPswHint == null || memPswHint.trim().length() == 0) {
					errorMsgs.add("會員提示：請勿空白");
				} else if (memPswHint.trim().equals(memPsw)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("會員提示：請勿與密碼相同");
				}

				String memName = req.getParameter("memName");
				String memNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z)]{2,10}$";
				if (memName == null || memName.trim().length() == 0) {
					errorMsgs.add("姓名: 請勿空白");
				} else if (!memName.trim().matches(memNameReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("姓名: 只能是中、英文字母 , 且長度必需在2到10之間");
				}

				String memIdCard = req.getParameter("memIdCard");
				String memIdCardReg = "^[A-Z]{1}[0-9]{9}$";
				if (memIdCard == null || memIdCard.trim().length() == 0) {
					errorMsgs.add("身分證字號：請勿空白");
				} else if (!memIdCard.trim().matches(memIdCardReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("身分證字號: 請輸入正確格式");
				}

				java.sql.Date memBirth = null;
				try {
					memBirth = java.sql.Date.valueOf(req.getParameter("memBirth").trim());
				} catch (IllegalArgumentException e) {
					memBirth = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}

				Integer memSex = new Integer(req.getParameter("memSex").trim());

				String memPhone = req.getParameter("memPhone");
				String memPhoneReg = "^09[0-9]{8}$";
				if (memPhone == null || memPhone.trim().length() == 0) {
					errorMsgs.add("電話號碼: 請勿空白");
				} else if (!memPhone.trim().matches(memPhoneReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("電話號碼：請輸入正確格式");
				}

				String memAdd = req.getParameter("memAdd");
				String memAddReg = "^[(\u4e00-\u9fa5)(0-9)]{6,50}$";
				if (memAdd == null || memAdd.trim().length() == 0) {
					errorMsgs.add("地址: 請勿空白");
				} else if (!memAdd.trim().matches(memAddReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("地址: 請輸入正確格式");
				}

				byte[] memImage = null;
				Integer memBalance = 0;
				Integer memBlock = 0;
				Integer memStatus = 0;

				MemberVO memberVO = new MemberVO();
				memberVO.setMemId(memId);
				memberVO.setMemIdCard(memIdCard);
				memberVO.setMemPsw(memPsw);
				memberVO.setMemPswHint(memPswHint);
				memberVO.setMemName(memName);
				memberVO.setMemSex(memSex);
				memberVO.setMemImage(memImage);
				memberVO.setMemEmail(memEmail);
				memberVO.setMemPhone(memPhone);
				memberVO.setMemBirth(memBirth);
				memberVO.setMemAdd(memAdd);
				memberVO.setMemBalance(memBalance);
				memberVO.setMemBlock(memBlock);
				memberVO.setMemStatus(memStatus);

				/*************************** 2.開始查詢資料 *****************************************/
				MemberService memSvc = new MemberService();
				memberVO = memSvc.getOneMember(memId);

				if (!(memberVO == null)) {

					try {

						if (memId.equals(memberVO.getMemId())) {
							errorMsgs.add("此帳號已註冊過");
						}
						if (memEmail.equals(memberVO.getMemEmail())) {
							errorMsgs.add("此信箱已註冊過");
						}
						if (memIdCard.equals(memberVO.getMemIdCard())) {
							errorMsgs.add("此身分證已註冊過");
						}
						if (memPhone.equals(memberVO.getMemPhone())) {
							errorMsgs.add("此手機號碼已註冊過");
						}

					} catch (NullPointerException npe) {
						RequestDispatcher failureView = req.getRequestDispatcher("/member/addMember.jsp");
						failureView.forward(req, res);
						return;
					}
				} // Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memberVO", memberVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/member/addMember.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 3.開始新增資料 ***************************************/
				memberVO = memSvc.regMember(memId, memIdCard, memPsw, memPswHint, memName, memSex, memImage, memEmail,
						memPhone, memBirth, memAdd, memBalance, memBlock, memStatus);

				/*************************** 4.新增完成,準備轉交(Send the Success view) ***********/
				req.setAttribute("memberVO", memberVO); // 資料庫取出的memberVO物件,存入req
				String url = "/loginSuccess.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 loginSuccess.jsp
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/member/addMember.jsp");
				failureView.forward(req, res);
			}

		}

		if ("getOne_For_Update".equals(action)) { // 來自listAllMember.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				String memId = new String(req.getParameter("memId"));

				/*************************** 2.開始查詢資料 ****************************************/
				MemberService memberSvc = new MemberService();
				MemberVO memberVO = memberSvc.getOneMember(memId);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("memberVO", memberVO); // 資料庫取出的Member物件,存入req
				String url = "/member/editMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 editMember.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/member/listAllMember.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // 來自editMember.jsp的請求

			List<String> errorMsgs = new <String>LinkedList();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

//			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				String memId = new String(req.getParameter("memId"));

				String memAdd = req.getParameter("memAdd");
				String memAddReg = "^[(\u4e00-\u9fa5)(0-9)]{6,50}$";
				if (memAdd == null || memAdd.trim().length() == 0) {
					errorMsgs.add("地址: 請勿空白");
				} else if (!memAdd.trim().matches(memAddReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("地址: 請輸入正確格式");
				}

				String memBank = req.getParameter("memBank");
				String memBankReg = "^[0-9]*$";
				if (!memBank.trim().matches(memBankReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("銀行帳號: 請輸入正確格式");
				}
			

				String memPsw = req.getParameter("memPsw");
				String memPswReg = "^(?=.*[^a-zA-Z0-9])(?=.*[A-Z])(?=.*[a-z])(?=.*\\d).{6,}$";
				if (memPsw == null || memPsw.trim().length() == 0) {
					errorMsgs.add("會員密碼：請勿空白");
				} else if (!memPsw.trim().matches(memPswReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("會員密碼：請輸入6 位數以上，並且至少包含大寫字母、小寫字母、數字、符號各一");
				}

				String memText = req.getParameter("memText");
				String memSkill = req.getParameter("memSkill");
				String memWantSkill = req.getParameter("memWantSkill");
				String memEmail = req.getParameter("memEmail");
				String memPhone = req.getParameter("memPhone");

				byte[] memImage = null;

				MemberVO memberVO = new MemberVO();
				memberVO.setMemImage(memImage);
				memberVO.setMemPsw(memPsw);
				memberVO.setMemId(memId);
				memberVO.setMemAdd(memAdd);
				memberVO.setMemText(memText);
				memberVO.setMemBank(memBank);
				memberVO.setMemSkill(memSkill);
				memberVO.setMemWantSkill(memWantSkill);
				memberVO.setMemEmail(memEmail);
				memberVO.setMemPhone(memPhone);
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memberVO", memberVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/member/editMember.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始修改資料 ***************************************/
				MemberService memSvc = new MemberService();
				memSvc.editMember(memId, memSkill, memWantSkill, memPsw, memImage, memAdd, memText, memBank);

				/*************************** 4.新增完成,準備轉交(Send the Success view) ***********/
				req.setAttribute("memberVO", memberVO); // 資料庫取出的memberVO物件,存入req
				String url = "/member/listAllMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 loginSuccess.jsp
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 **********************************/
//			} catch (Exception e) {
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/member/editMember.jsp");
//				failureView.forward(req, res);
//
//			}

		}

	}

}
