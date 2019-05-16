package com.member.controller;

import com.member.model.*;
import com.teacher.model.TeacherService;
import com.teacher.model.TeacherVO;

import other.Check;
import other.MailService;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/MemberServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 50 * 1024 * 1024, maxRequestSize = 50 * 5 * 1024 * 1024)
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("UTF-8");
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("login".equals(action)) {// 來自loginMember.jsp的請求

			List<String> errorMsgs = new LinkedList<String>(); 
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			HttpSession session = req.getSession();

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String memId = req.getParameter("memId"); 
				if (memId == null || (memId.trim()).length() == 0) {
					errorMsgs.add("請輸入帳號");
				}
				String memPsw = req.getParameter("memPsw"); 
				if (memPsw == null || (memPsw.trim()).length() == 0) {
					errorMsgs.add("請輸入密碼");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/loginMember.jsp");
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
						
						// Send the use back to the form, if there were errors
						if (!errorMsgs.isEmpty()) {
							memberVO.setMemPsw(null);//帳號保留,密碼清空 
							req.setAttribute("memberVO", memberVO); // 含有輸入格式錯誤的empVO物件,也存入req
							RequestDispatcher failureView = req
									.getRequestDispatcher("/front-end/member/loginMember.jsp");
							failureView.forward(req, res);
							return;
						}
					}
				} catch (NullPointerException npe) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/loginMember.jsp");
					failureView.forward(req, res);

				}

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/loginMember.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				TeacherService teacherSvc=new TeacherService();
				TeacherVO teacherVO =teacherSvc.findOneById(memberVO.getMemId());
				if(teacherVO.getTeacherId()!=null) {
					session.setAttribute("teacherVO", teacherVO);
				}
				session.setAttribute("memberVO", memberVO); // 資料庫取出的memberVO物件,存入req
				  try {                                                        
				         String location = (String) session.getAttribute("location");
				         if (location != null) {
				           res.sendRedirect(location);            
				           return;
				         }
				       }catch (Exception ignored) { }
				  
				String url ="/index.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 loginSuccess.jsp
				successView.forward(req, res);
				return;

			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/loginMember.jsp");
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
				session.removeAttribute("memberVO");
				TeacherVO teacherVO=(TeacherVO) session.getAttribute("teacherVO");
				if(teacherVO!=null) {
					session.removeAttribute("teacherVO");
					System.out.println("老師"+teacherVO.getMemId()+"已登出");
					
				}
				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				String url = "/index.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 editMember.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/listAllMember.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("updateStatus".equals(action)) { // 來自editMember.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			

			try { 
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				String userMemId=req.getParameter("memId");
				String userVerifyCode=req.getParameter("verifyCode");
				/*************************** 2.開始驗證資料 ***************************************/
				MemberService memSvc = new MemberService();
				if(!memSvc.checkVerifyCode(userMemId, userVerifyCode)) {
					errorMsgs.add("您的驗證碼錯誤或可能已經過期了");
					RequestDispatcher failureView = req.getRequestDispatcher("/index.jsp");
					failureView.forward(req, res);
				}else {
					memSvc.updateStatus(userMemId);
					MemberVO memberVO=memSvc.getOneMemberNoImg(userMemId);
					System.out.println("一位會員驗證成功");
					/*************************** 4.新增完成,準備轉交(Send the Success view) ***********/
					req.getSession().setAttribute("memberVO", memberVO);
					req.setAttribute("inCludeVO", "member"); // 要導向的分頁
					String url = "/front-end/member/viewAllMember.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 loginSuccess.jsp
					successView.forward(req, res);
				}
				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/index.jsp");
				failureView.forward(req, res);

			} 

		}
		
		

		if ("insert".equals(action)) { // 來自addMember.jsp的請求
			List<String> successMsgs = new LinkedList<String>();
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("successMsgs", successMsgs);

//			try { 
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				String memId = req.getParameter("memId");
				String memIdReg = "^[(a-zA-Z0-9_)]{6,12}$";
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
				String memPswReg ="^[(a-zA-Z0-9_)]{6,12}$";
				if (memPsw == null || memPsw.trim().length() == 0) {
					errorMsgs.add("會員密碼：請勿空白");
				} else if (!memPsw.trim().matches(memPswReg)) { // 以下練習正則(規)表示式(regular-expression)
					memPsw="";
					errorMsgs.add("會員密碼：請輸入6 位數以上，開頭必須為英文不得有中文");
				}

				String memPswHint = req.getParameter("memPswHint");
				if (memPswHint == null || memPswHint.trim().length() == 0) {
					errorMsgs.add("會員提示：請勿空白");
				} else if (memPswHint.trim().equals(memPsw)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("會員提示：請勿與密碼相同");
					memPswHint="";
				}
		
				String memName = req.getParameter("memName");
				String memNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z)]{2,10}$";
				if (memName == null || memName.trim().length() == 0) {
					errorMsgs.add("姓名: 請勿空白");
				} else if (!memName.trim().matches(memNameReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("姓名: 只能是中、英文字母 , 且長度必需在2到10之間");
				}
					

				String memIdCard = req.getParameter("memIdCard").toUpperCase();
				String memIdCardReg = "^[A-Z]{1}[0-9]{9}$";
				if (memIdCard == null || memIdCard.trim().length() == 0) {
					errorMsgs.add("身分證字號：請勿空白");
				} else if (!memIdCard.trim().matches(memIdCardReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("身分證字號: 請輸入中華民國國民身分證");
				} else if (!Check.checkId(memIdCard)) {
					errorMsgs.add("身分證字號: 非正確格式");
				} 
			
				

				java.sql.Date memBirth = null;
				try {
					memBirth = java.sql.Date.valueOf(req.getParameter("memBirth").trim());
				} catch (IllegalArgumentException e) {
					memBirth = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("會員生日：請輸入日期!");
				}
				// Send the use back to the form, if there were errors
		
				

				Integer memSex = new Integer(req.getParameter("memSex")); 
				
				

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
			
				

				Part part = req.getPart("memImage");
				InputStream in = part.getInputStream();
				byte[] memImage = new byte[in.available()];
				in.read(memImage);
				in.close();
				
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
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memberVO", memberVO); // 含有輸入格式錯誤的member物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/addMember.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始查詢資料 *****************************************/
				MemberService memSvc = new MemberService();
				memberVO = memSvc.getOneMember(memId);

				if (!(memberVO == null)) {

					try {

						if (memId.equals(memberVO.getMemId())) {
							errorMsgs.add("此帳號已註冊過");
							memberVO.setMemId(null);
							memberVO.setMemPsw(null);
							memberVO.setMemPswHint(null);
						}
						if (memEmail.equals(memberVO.getMemEmail())) {
							errorMsgs.add("此信箱已註冊過");
							memberVO.setMemId(null);
							memberVO.setMemPsw(null);
							memberVO.setMemPswHint(null);
						}
						if (memIdCard.equals(memberVO.getMemIdCard())) {
							errorMsgs.add("此身分證字號已註冊過");
							memberVO.setMemId(null);
							memberVO.setMemPsw(null);
							memberVO.setMemPswHint(null);
						}
						if (memPhone.equals(memberVO.getMemPhone())) {
							errorMsgs.add("此手機號碼已註冊過");
							memberVO.setMemId(null);
							memberVO.setMemPsw(null);
							memberVO.setMemPswHint(null);
						}

					} catch (NullPointerException npe) {
						req.setAttribute("memberVO", memberVO); // 含有輸入格式錯誤的member物件,也存入req
						RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/addMember.jsp");
						failureView.forward(req, res);
						return;
					}
				} 
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memberVO", memberVO); // 含有輸入格式錯誤的member物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/addMember.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 3.開始新增資料 ***************************************/
				memberVO = memSvc.regMember(memId, memIdCard, memPsw, memPswHint, memName, memSex, memImage, memEmail,
						memPhone, memBirth, memAdd, memBalance, memBlock, memStatus);
				MailService mailSvc = new MailService();
			      String subject = "Weshare 註冊會員 確認信件";
			      String verifyCode = mailSvc.genAuthCode();
			      String verifyURL="https://ca107g4.ga/CA107G4/MemberServlet?action=updateStatus&memId="+memId+"&verifyCode="+verifyCode;
			      String messageText="親愛的 "+memName+" 您好：\r\n" + 
			      		"感謝您註冊WeShare會員，要啟用您的帳戶，請按以下的連結：\r\n" + 
			      		"\r\n" + 
			      		verifyURL+ 
			      		"\r\n" + 
			      		"如果您沒有在WeSahre註冊會員，請忽略這封郵件。";
			      mailSvc.sendMail(memEmail, subject, messageText);
			      memSvc.insertVerifyCode(memId, verifyCode);
			      successMsgs.add("註冊確認將通過電子郵件寄送給您!");
				/*************************** 4.新增完成,準備轉交(Send the Success view) ***********/
				req.setAttribute("memberVO", memberVO); // 資料庫取出的memberVO物件,存入req
				req.setAttribute("successMsgs", successMsgs); // 資料庫取出的memberVO物件,存入req
				String url = "/index.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 loginSuccess.jsp
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 **********************************/
			}
//			catch (Exception e) {
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/addMember.jsp");
//				failureView.forward(req, res);
//			}
//		}

		
		if ("reverify".equals(action)) { // 來自listAllMember.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				MemberService memSvc = new MemberService();
				MailService mailSvc = new MailService();
				String memId = req.getParameter("memId");
				MemberVO memberVO=new MemberVO();
				memberVO = memSvc.getOneMember(memId);
				
			      String subject = "Weshare 註冊會員 確認信件";
			      String verifyCode = mailSvc.genAuthCode();
			      String verifyURL="http://localhost:8081/CA107G4/MemberServlet?action=updateStatus&memId="+memId+"&verifyCode="+verifyCode;
			      String messageText="親愛的 "+memberVO.getMemName()+" 您好：\r\n" + 
			      		"感謝您註冊WeShare會員，要啟用您的帳戶，請按以下的連結：\r\n" + 
			      		"\r\n" + 
			      		verifyURL+ 
			      		"\r\n" + 
			      		"如果您沒有在WeSahre註冊會員，請忽略這封郵件。";
			      mailSvc.sendMail(memberVO.getMemEmail(), subject, messageText);
			      memSvc.insertVerifyCode(memId, verifyCode);
				/*************************** 4.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/back-end/index.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 loginSuccess.jsp
				successView.forward(req, res);
				return;
				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/listAllMember.jsp");
				failureView.forward(req, res);
				return;
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
				String url = "/front-end/member/editMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 editMember.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/listAllMember.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // 來自editMember.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				
				byte []memImage=null; 
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
				String memPswReg ="^[(a-zA-Z0-9_)]{6,12}$";
				if (memPsw == null || memPsw.trim().length() == 0) {
					errorMsgs.add("會員密碼：請勿空白");
				} else if (!memPsw.trim().matches(memPswReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("會員密碼：請輸入6 位數以上，開頭必須為英文不得有中文");
				}
				
				
				String memPswDouble =req.getParameter("memPswDouble");
				if(memPswDouble!=null ||memPsw.trim().length() != 0) {
					
				}else if(memPsw!=memPswDouble) {
					errorMsgs.add("確認密碼：請確認與密碼相同!!");
				}
				

				String memText = req.getParameter("memText");
				String memSkill = req.getParameter("memSkill");
				String memWantSkill = req.getParameter("memWantSkill");
				String memEmail = req.getParameter("memEmail");
				String memPhone = req.getParameter("memPhone");

				Part part = req.getPart("memImage");

				MemberVO memberVO = new MemberVO();	
				if (part.getSize()!=0) {
					InputStream in = part.getInputStream();
					memImage = new byte[in.available()];
					in.read(memImage);
					in.close();
					memberVO.setMemImage(memImage);
				}
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
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/editMember.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始修改資料 ***************************************/
				MemberService memSvc = new MemberService();
				if(part.getSize()!=0) {
					memSvc.editMember(memId, memSkill, memWantSkill, memPsw, memImage, memAdd, memText, memBank);
				}else {
					memSvc.editNoImgMember(memId, memSkill, memWantSkill, memPsw, memAdd, memText, memBank);
				}

				/*************************** 4.新增完成,準備轉交(Send the Success view) ***********/
				req.setAttribute("memberVO", memberVO); // 資料庫取出的memberVO物件,存入req
				req.setAttribute("inCludeVO", "member"); // 要導向的分頁
				String url = "/front-end/member/viewAllMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 loginSuccess.jsp
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/editMember.jsp");
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
				String url = "/front-end/member/editMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 editMember.jsp
				successView.forward(req, res);
				return;

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/listAllMember.jsp");
				failureView.forward(req, res);
				return;
			}
		}

		if ("changeValue".equals(action)) { // 來自editMember.jsp的請求
			try {
				String inCludeVO=req.getParameter("inCludeVO");
				  switch(inCludeVO) { 
		            case "member": 
		            	req.setAttribute("inCludeVO", "member"); // 資料庫取出的memberVO物件,存入req
		                break; 
		            case "teacher": 
		            	req.setAttribute("inCludeVO", "teacher"); // 資料庫取出的memberVO物件,存入req
		                break; 
		            case "inscourse": 
		            	req.setAttribute("inCludeVO", "inscourse"); // 資料庫取出的memberVO物件,存入req
		                break; 
		            case "transactionRecord": 
		            	req.setAttribute("inCludeVO", "transactionRecord"); // 資料庫取出的memberVO物件,存入req
		                break; 
		            case "goods": 
		            	req.setAttribute("inCludeVO", "goods"); // 資料庫取出的memberVO物件,存入req
		                break; 
		            case "goodsOrder": 
		            	req.setAttribute("inCludeVO", "goodsOrder"); // 資料庫取出的memberVO物件,存入req
		                break; 
		            case "liveStream": 
		            	req.setAttribute("inCludeVO", "liveStream"); // 資料庫取出的memberVO物件,存入req
		                break; 
		            default: 
		                System.out.println("include有問題!!"); 
		        }
				
		
				/*************************** 4.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/front-end/member/viewAllMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 loginSuccess.jsp
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/editMember.jsp");
				failureView.forward(req, res);

			}

		}
	

		
		
		
		
	}

}
