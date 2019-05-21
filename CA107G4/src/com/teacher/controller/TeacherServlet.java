package com.teacher.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.member.model.MemberService;
import com.member.model.MemberVO;
import com.teacher.model.TeacherService;
import com.teacher.model.TeacherVO;

import other.MailService;
 

@WebServlet("/TeacherServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 50 * 1024 * 1024, maxRequestSize = 50 * 5 * 1024 * 1024)
public class TeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doPost(req, res);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("UTF-8");
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		byte[] diplomaImg=null;

		if ("insert".equals(action)) {// 來自loginMember.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String memId = req.getParameter("memId");
				TeacherService teacherSvc = new TeacherService();
				Integer tcST=teacherSvc.findByStatus(memId).getTeacherStatus();
				if(tcST==null) {
					String teacherCity = req.getParameter("teacherCity");
					String teacherEdu = req.getParameter("teacherEdu");
				
					if (teacherEdu == null || (teacherEdu.trim()).length() == 0) {
						errorMsgs.add("請輸入您的學校名稱");
					}
					
					
					Part part = req.getPart("diplomaImg");
					if(part.getSize()==0) {
						errorMsgs.add("請上傳相關學經歷證明");
					}else {
						InputStream in = part.getInputStream();
						diplomaImg = new byte[in.available()];
						in.read(diplomaImg);
						in.close();
					}
					
					String teacherText = req.getParameter("teacherText");
				
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req.getRequestDispatcher("/front-end/teacher/addTeacher.jsp");
						failureView.forward(req, res);
						return;// 程式中斷
					}

					/*************************** 2.開始查詢資料 *****************************************/
				
					
					Integer teacherStatus = 0;//待審核
					teacherSvc.addTeacher(memId, teacherStatus, teacherCity, teacherEdu, diplomaImg, teacherText);

					/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
					
					String url = "/index.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 loginSuccess.jsp
					successView.forward(req, res);
				}else {
					if(tcST==0) {
						errorMsgs.add("您目前正在審核中");
					}
					if(tcST==1) {
						errorMsgs.add("您已是老師了！");
					}
					if(tcST==2) {
						errorMsgs.add("您目前被停權中，請聯絡我們");
					}
					
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/teacher/addTeacher.jsp");
					failureView.forward(req, res);
				}

			} 
			catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/teacher/addTeacher.jsp");
				failureView.forward(req, res);
			}
			
		}	
		
		
		if ("updateStatus".equals(action)) {// 來自loginMember.jsp的請求
			System.out.println("我進來了");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

		
//			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String teacherId = req.getParameter("teacherId");
				String str =req.getParameter("teacherStatus");
				Integer teacherStatus = null;
				teacherStatus = new Integer(str);
				/*************************** 2.開始查詢資料 *****************************************/
				TeacherService teacherSvc = new TeacherService();
				MemberService memberSvc =new MemberService();
				teacherSvc.updateStatus(teacherStatus, teacherId);
				MemberVO memberVO=(MemberVO)memberSvc.getOneMember((teacherSvc.findOneById(teacherId).getMemId()));
				String memEmail=memberSvc.getOneMemberNoImg(teacherSvc.findOneById(teacherId).getMemId()).getMemEmail();
				String memId=memberSvc.getOneMemberNoImg(teacherSvc.findOneById(teacherId).getMemId()).getMemId();
			      String subject = "Weshare 註冊會員 確認信件";
			      String verifyURL="https://ca107g4.ga/CA107G4/TeacherServlet?action=teacherCheck&teacherId="+teacherId+"memId="+memId;
			      String messageText="親愛的 "+memberVO.getMemName()+" 您好：\r\n" + 
			      		"恭喜您已成為WeShare平台的老師，請按以下的連結確認：\r\n" + 
			      		"\r\n" + 
			      		verifyURL+ 
			      		"\r\n" + 
			      		"如果您沒有在WeSahre申請成為老師，請忽略這封郵件。";
			     
				if(teacherStatus.equals(1)) {
				MailService mailSvc =new MailService();
				 mailSvc.sendMail(memEmail, subject, messageText);
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("inCludeVO", "teacher"); // 資料庫取出的memberVO物件,存入req
				String url ="/back-end/index.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 loginSuccess.jsp
				successView.forward(req, res);
				
				}
		
//			catch (Exception e) {
//				errorMsgs.add("無法取得資料:" + e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/index.jsp");
//				failureView.forward(req, res);
//			}
			
		if ("teacherCheck".equals(action)) {// 來自loginMember.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

//			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.getSession().invalidate();
				String url = "/front-end/member/loginMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 loginSuccess.jsp
				successView.forward(req, res);
				
				}
		

		
		

		
	}

}
