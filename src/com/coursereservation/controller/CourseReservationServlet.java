package com.coursereservation.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.course.model.CourseService;
import com.course.model.CourseVO;
import com.coursereservation.model.CourseReservationService;
import com.coursereservation.model.CourseReservationVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.inscourse.model.InsCourseService;
import com.inscourse.model.InsCourseVO;
import com.inscoursetime.model.InsCourseTimeService;
import com.inscoursetime.model.InsCourseTimeVO;
import com.member.model.MemberService;
import com.member.model.MemberVO;
import com.teacher.model.TeacherService;

@WebServlet("/CourseReservationServlet")
public class CourseReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
 
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/plain; charset=UTF-8");
		PrintWriter out = res.getWriter();
 
		String action = req.getParameter("action");
		System.out.println(action);

		// 我的預約
		if ("find_my_reservation".equals(action)) {
			String param = req.getParameter("param");
			CourseReservationService crSvc = new CourseReservationService();
			List<CourseReservationVO> crList = crSvc.findByPrimaryKey(param);

			// JOIN
			InsCourseService inscSvc = new InsCourseService();
			CourseService courseSvc = new CourseService();

			for (CourseReservationVO crVO : crList) {
				InsCourseVO inscVO = inscSvc.findOneById(crVO.getInscId());
				CourseVO courseVO = courseSvc.findOneById(inscVO.getCourseId());
				crVO.setInscId(courseVO.getCourseName());
			}
			out.print(gson.toJson(crList));
		}

		// 預約
		if ("make_new_reservation".equals(action) || "addOrder".equals(action)) {
			synchronized(this) {
			CourseReservationVO crVO;
			// Android取資料
			if ("make_new_reservation".equals(action)) {
				crVO = gson.fromJson(req.getParameter("crVO"), CourseReservationVO.class);
				String memId = crVO.getMemId();
				String teacherId = crVO.getMemId();
				TeacherService teacherSvc=new TeacherService();
				if(teacherSvc.findOneById(teacherId).getMemId().equals(memId)) {
				}
				// Web取資料  
			} else { 			
				List<String> errorMsgs = new LinkedList<String>();
				List<String> errorMsgsAlert = new LinkedList<String>();
				HttpSession session	=req.getSession();
				MemberVO memberVO=(MemberVO) session.getAttribute("memberVO");
				if(memberVO==null) {
					errorMsgsAlert.add("請先登入會員");
					session.setAttribute("errorMsgsAlert", errorMsgsAlert); // 含有輸入格式錯誤的empVO物件,也存入req
					String location=req.getContextPath()+"/inscourse/inscourse.do?"+(String) session.getAttribute("userSearch");
					session.setAttribute("location", location);
					res.sendRedirect(req.getContextPath() + "/front-end/member/loginMember.jsp");
					return;
				}
				String memId = memberVO.getMemId();
				String teacherId = req.getParameter("teacherId").trim();
				TeacherService teacherSvc=new TeacherService();
				
				if(teacherSvc.findOneById(teacherId).getMemId().equals(memId)) {
					errorMsgs.add("您不能訂購自己的課程...");
					req.setAttribute("errorMsgs", errorMsgs); // 含有輸入格式錯誤的empVO物件,也存入req
					String userSearch=(String) session.getAttribute("userSearch");
					RequestDispatcher failureView = req.getRequestDispatcher("/inscourse/inscourse.do?"+userSearch);
					failureView.forward(req, res);
					return;
					
				}
				String inscTimeId = req.getParameter("inscTimeId").trim();
				String inscId = req.getParameter("inscId").trim();
				Timestamp crvMFD = Timestamp.valueOf(req.getParameter("crvMFD").trim());
				Timestamp crvEXP = Timestamp.valueOf(req.getParameter("crvEXP").trim());
				String crvLoc = req.getParameter("crvLoc").trim();
				Double crvTotalTime = new Double(req.getParameter("crvTotalTime"));
				Double crvTotalPrice = new Double(req.getParameter("crvTotalPrice"));
				MemberService memberSvc = new MemberService();
				if(memberSvc.getOneMemberNoImg(memId).getMemBalance()<crvTotalPrice.intValue()) {
					errorMsgs.add("您的餘額不足");
					req.setAttribute("errorMsgs", errorMsgs); // 含有輸入格式錯誤的empVO物件,也存入req
					String userSearch=(String) session.getAttribute("userSearch");
					RequestDispatcher failureView = req.getRequestDispatcher("/inscourse/inscourse.do?"+userSearch);
					failureView.forward(req, res);
					return;
					
				}
				crVO = new CourseReservationVO();
				crVO.setInscTimeId(inscTimeId);
				crVO.setTeacherId(teacherId);
				crVO.setMemId(memId);
				crVO.setInscId(inscId);
				crVO.setTeamId(null);
				crVO.setCrvStatus(1);
				crVO.setClassStatus(0);
				crVO.setTranStatus(0);
				crVO.setCrvMFD(crvMFD);
				crVO.setCrvEXP(crvEXP);
				crVO.setCrvLoc(crvLoc);
				crVO.setCrvTotalTime(crvTotalTime);
				crVO.setCrvTotalPrice(crvTotalPrice);
				crVO.setCrvRate(null);
			}

			// 確認是否已被訂走
			InsCourseTimeService insctSvc = new InsCourseTimeService();
			List<InsCourseTimeVO> ictVO = insctSvc.findByKey(crVO.getInscTimeId());
			if (ictVO.size()!=0) {

				// 開始新增資料
				CourseReservationService crSvc = new CourseReservationService();
				CourseReservationVO crVO2=crSvc.insertWithMemberWithRecod(crVO.getTeacherId(), crVO.getMemId(), crVO.getInscId(), crVO.getTeamId(),
						crVO.getCrvStatus(), crVO.getClassStatus(), crVO.getTranStatus(), crVO.getCrvMFD(),
						crVO.getCrvEXP(), crVO.getCrvLoc(), crVO.getCrvTotalTime(), crVO.getCrvTotalPrice(),
						crVO.getCrvRate(),crVO.getInscTimeId());
			
				// 新增成功
				MemberService memberSvc = new MemberService();
				MemberVO buyer = memberSvc.getOneMember(crVO2.getMemId());
				
				//買家資訊
				String buyerTel=buyer.getMemPhone();
				String buyerName=buyer.getMemName();
				
				String[] tel ={buyerTel};
			 	String message = "親愛的 "+buyerName+" 先生/小姐 您好!感謝您在WeShare 訂購課程 訂單編號為"+crVO2.getCrvId()+"祝您能有一個良好的學習體驗!";
				crSvc.sendMessage(tel, message);
				// Android處理
				if ("make_new_reservation".equals(action)) {
					String success = "";
					out.print(success);

					// Web導向
				} else {
					String url = "/front-end/coursereservation/courseOrder.jsp";
					req.setAttribute("courseReservationVO", crVO2);
					RequestDispatcher successView = req.getRequestDispatcher(url);
					successView.forward(req, res);
				}
				// 已經被搶走
			} else {
				// Android處理
				if ("make_new_reservation".equals(action)) {
					String error = "error";
					out.print(error);
					// Web處理
				} else {
					req.setAttribute("courseReservationVO", crVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/coursereservation/insCourseDetails.jsp");
					failureView.forward(req, res);
					return;
				}

			}

			}
			
			
			}	

		
	
		// 取消
		if ("cancel_my_reservation".equals(action)) {
		}

	}

}
