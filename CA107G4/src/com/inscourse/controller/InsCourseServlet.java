package com.inscourse.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.course.model.CourseService;
import com.course.model.CourseVO;
import com.coursereservation.model.CourseReservationVO;
import com.inscourse.model.InsCourseService;
import com.inscourse.model.InsCourseVO;
import com.inscoursetime.model.InsCourseTimeService;
import com.inscoursetime.model.InsCourseTimeVO;

@WebServlet("/InsCourseServlet")
public class InsCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/plain; charset=UTF-8");
		String action = req.getParameter("action");
		System.out.println("ininininininininiin");

		if ("getOne_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String inscId = req.getParameter("inscId"); 
				if (inscId == null || (inscId.trim()).length() == 0) {
					errorMsgs.add("請輸入課程編號");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/insCourse/select_page.jsp");
					failureView.forward(req, res);
					return;
				}
				if (!inscId.matches("IC[0-9]{5}")) {
					errorMsgs.add("課程編號格式錯誤");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/insCourse/select_page.jsp");
					failureView.forward(req, res);
					return;
				}

				InsCourseService insCourseSvc = new InsCourseService();
				InsCourseVO insCourseVO = insCourseSvc.findOneById(inscId);
				if (insCourseVO == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/insCourse/select_page.jsp");
					failureView.forward(req, res);
					return;
				}

				req.setAttribute("insCourseVO", insCourseVO);
				String url = "/front-end/Inscourse/listOneInsCourse.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				return;
 
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/insCourse/select_page.jsp");
				failureView.forward(req, res);
				return;
			}
		}

		if ("getOne_For_Update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("erroMsgs", errorMsgs);

		
				String inscId = req.getParameter("inscId");

				InsCourseService insCourseSvc = new InsCourseService();
				InsCourseVO insCourseVO = insCourseSvc.findOneById(inscId);

				req.setAttribute("insCourseVO", insCourseVO);
				String url = "/front-end/insCourse/editCourse.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				return;

			} 
	
		
		if ("update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String inscId = req.getParameter("inscId").trim();

				String teacherId = req.getParameter("teacherId");

				String courseId = req.getParameter("courseId").trim();

				String inscLoc = req.getParameter("inscLoc").trim();

				Integer inscType = new Integer(req.getParameter("inscType").trim());

				Integer inscPeople = 0;
				try {
					inscPeople = new Integer(req.getParameter("inscPeople").trim());
				} catch (NumberFormatException e) {
					inscPeople = 1;
				}

				String inscLang = req.getParameter("inscLang").trim();

				Integer inscPrice = 0;
				try {
					inscPrice = new Integer(req.getParameter("inscPrice").trim());
				} catch (NumberFormatException e) {
					inscPrice = 0;
					errorMsgs.add("授課金額請填數字.");
				}

				String inscCourser = req.getParameter("inscCourser").trim();
				if (inscCourser == null || inscCourser.trim().length() == 0) {
					errorMsgs.add("課程大綱請勿空白");
				}

				Integer inscStatus = new Integer(req.getParameter("inscStatus").trim());

				InsCourseVO insCourseVO = new InsCourseVO();
				insCourseVO.setInscId(inscId);
				insCourseVO.setTeacherId(teacherId);
				insCourseVO.setCourseId(courseId);
				insCourseVO.setInscLoc(inscLoc);
				insCourseVO.setInscType(inscType);
				insCourseVO.setInscPeople(inscPeople);
				insCourseVO.setInscLang(inscLang);
				insCourseVO.setInscPrice(inscPrice);
				insCourseVO.setInscCourser(inscCourser);
				insCourseVO.setInscStatus(inscStatus);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("inCludeVO", "teacher");
					String url = "/front-end/inscourse/editCourse.jsp?inscId="+inscId;
					RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 loginSuccess.jsp
					successView.forward(req, res);
					return;
				}

				InsCourseService insCourseSvc = new InsCourseService();
				insCourseSvc.updateInsCourse(inscId, teacherId, courseId, inscLoc, inscType, inscPeople, inscLang,
						inscPrice, inscCourser, inscStatus);
				/*************************** 4.新增完成,準備轉交(Send the Success view) ***********/
				req.setAttribute("inCludeVO", "teacher");
				String url = "/front-end/member/viewAllMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 loginSuccess.jsp
				successView.forward(req, res);
				return;

			} 
			catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				req.setAttribute("inCludeVO", "teacher");
				String url = "/front-end/member/viewAllMember.jsp";
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
				return;
			}
		}

		if ("insert".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

//			try {
				String courseId = req.getParameter("courseId").trim();
				String teacherId = req.getParameter("teacherId");
				
				InsCourseService insCourseSvc =new InsCourseService();
				InsCourseVO exist=insCourseSvc.findByTeacherInscId(courseId, teacherId);
				if(exist.getInscStatus()==null) {

					String inscLoc = req.getParameter("inscLoc").trim();

					Integer inscType = new Integer(req.getParameter("inscType").trim());

					Integer inscPeople = null;

					try {
						inscPeople = new Integer(req.getParameter("inscPeople").trim());
					} catch (NumberFormatException e) {
						inscPeople = 1;

					}

					String inscLang = req.getParameter("inscLang").trim();

					Integer inscPrice = null;
					try {
						inscPrice = new Integer(req.getParameter("inscPrice").trim());
					} catch (NumberFormatException e) {
						inscPrice = 0;
						errorMsgs.add("價錢請填數字.");
					}

					String inscCourser = req.getParameter("inscCourser").trim();
					if (inscCourser == null || inscCourser.trim().length() == 0) {
						errorMsgs.add("課程介紹請勿空白");
					}
					// 課程預設為下架
					Integer inscStatus = 1;
					InsCourseVO insCourseVO = new InsCourseVO();
					insCourseVO.setTeacherId(teacherId);
					insCourseVO.setCourseId(courseId);
					insCourseVO.setInscLoc(inscLoc);
					insCourseVO.setInscType(inscType);
					insCourseVO.setInscPeople(inscPeople);
					insCourseVO.setInscLang(inscLang);
					insCourseVO.setInscPrice(inscPrice);
					insCourseVO.setInscCourser(inscCourser);
					insCourseVO.setInscStatus(inscStatus);

					if (!errorMsgs.isEmpty()) {
						req.setAttribute("insCourseVO", insCourseVO);
						RequestDispatcher failureView = req.getRequestDispatcher("/front-end/inscourse/addInsCourse.jsp");
						failureView.forward(req, res);
						return;
					}
					insCourseSvc.addInsCourse(teacherId, courseId, inscLoc, inscType, inscPeople, inscLang, inscPrice,
							inscCourser, inscStatus);

					String url = "/front-end/member/viewAllMember.jsp";
					req.setAttribute("inCludeVO", "teacher"); // 要導向的分頁
					RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
					successView.forward(req, res);
					return;
				}else {
					errorMsgs.add("您已經有相同的課程了");
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/inscourse/addInsCourse.jsp");
					failureView.forward(req, res);
					return;
				}
	

		

			} 
//			catch (Exception e) {
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/inscourse/addInsCourse.jsp");
//				failureView.forward(req, res);
//			}
//		}

		if ("findValuebyId".equals(action)) {
			HttpSession session=req.getSession();
			List<String> errorMsgs = new LinkedList<String>();
			String userSearch = req.getQueryString();
			

			try {
				String inscId = req.getParameter("inscId");
				InsCourseService insCourseSvc = new InsCourseService();
				InsCourseVO insCourseVO = insCourseSvc.findOneById(inscId);
				if (insCourseVO == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/inscourse/insCourseDetails.jsp");
					failureView.forward(req, res);
					return;
				}
				req.setAttribute("insCourseVO", insCourseVO);
				session.setAttribute("userSearch", userSearch);//保存使用者搜尋結果
				String url = "/front-end/inscourse/insCourseDetails.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				return;
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/inscourse/insCourseDetails.jsp");
				failureView.forward(req, res);
				return;
			}
		}

		if ("updateDate".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				java.sql.Date inputSuccess = null;
				try {
					inputSuccess = java.sql.Date.valueOf(req.getParameter("inputSuccess").trim());
				} catch (IllegalArgumentException e) {
					inputSuccess = new java.sql.Date(System.currentTimeMillis());
				}
				Calendar cal = Calendar.getInstance();
				cal.setTime(inputSuccess);
				cal.add(Calendar.DAY_OF_YEAR, 1);

				java.sql.Date inputSuccess2 = new java.sql.Date(cal.getTimeInMillis());
				String startTime = inputSuccess.toString();
				String endTime = inputSuccess2.toString();
				String inscId = req.getParameter("inscId").trim();
				String inscLoc = req.getParameter("inscLoc").trim();

				InsCourseTimeService insCourseTimvc = new InsCourseTimeService();
//				//使用者選擇日期
				List<InsCourseTimeVO> list = insCourseTimvc.findDate(startTime, endTime, inscId);

				req.setAttribute("inscId", inscId);
				req.setAttribute("inscLoc", inscLoc);
				req.setAttribute("list", list);
				String url = "/front-end/inscourse/insCourseDetails.jsp";

				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);
				return;
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/inscourse/insCourseDetails.jsp");
				failureView.forward(req, res);
				return;
			}
		}

		
		
		
		if ("updateTime".equals(action)) {
			
			System.out.println("ininininininininiin");
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				
				String inscTimeId = req.getParameter("inscTimeId").trim();
				Integer inscPrice = new Integer(req.getParameter("inscPrice").trim());

				InsCourseTimeService insCourseTimvc = new InsCourseTimeService();
				InsCourseTimeVO insCourseTimeVO = insCourseTimvc.getOneInsCourseTime(inscTimeId);
//				使用者選擇時段
				Timestamp inscMFD = insCourseTimeVO.getInscMFD();
				Timestamp inscEXP = insCourseTimeVO.getInscEXP();

				Double crvTotalTime = (double) (inscEXP.getHours() - inscMFD.getHours());
				// 價格

				Double price = (double) (inscPrice * crvTotalTime);
				String crvPrice = String.valueOf(price);
				Double tax = price * 0.1;
				String crvTax = String.valueOf(tax);

//				//總金額
				Double totalPrice = price + tax;
				String crvTotalPrice = String.valueOf(totalPrice);
				
				req.setAttribute("inscTimeId", inscTimeId);
				req.setAttribute("crvPrice", crvPrice);
				req.setAttribute("crvTax", crvTax);
				req.setAttribute("crvTotalPrice", crvTotalPrice);
				req.setAttribute("crvTotalTime", crvTotalTime);
				req.setAttribute("inscMFD", inscMFD);
				req.setAttribute("inscEXP", inscEXP);
				
				
				JSONObject obj = new JSONObject();
				obj.put("inscTimeId", inscTimeId);
				obj.put("crvPrice", crvPrice);
				obj.put("crvTax", crvTax);
				obj.put("crvTotalPrice", crvTotalPrice);
				obj.put("crvTotalTime", crvTotalTime);
				SimpleDateFormat sdfMFD = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				SimpleDateFormat sdfEXP = new SimpleDateFormat("HH:mm");
				obj.put("inscMFD", inscMFD);
				obj.put("inscEXP", inscEXP);
				obj.put("time", sdfMFD.format(inscMFD)+"-"+sdfEXP.format(inscEXP));
				
				
				PrintWriter out = res.getWriter();
				out.print(obj.toString());
				out.close();
//				String url = "/front-end/inscourse/insCourseDetails.jsp";
//
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
//				successView.forward(req, res);

			} catch (Exception e) {
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/inscourse/insCourseDetails.jsp");
//				failureView.forward(req, res);
			}
		}
		
		
		

		if ("listEmps_ByCompositeQuery".equals(action)) { // 來自select_page.jsp的複合查詢請求
			String courseId = "courseId";
			List<String> errorMsgs = new LinkedList<String>();
			HttpSession session=req.getSession();
			req.setAttribute("errorMsgs", errorMsgs);
			Map<String, String[]> map = req.getParameterMap();

				if (req.getParameter("whichPage") == null) {
					HashMap<String, String[]> map1 = new HashMap<String, String[]>(req.getParameterMap());
					session.setAttribute("map", map1);
					map = map1;
				}
				if (map.get(courseId) != null) {
					String[] stringArray = map.get(courseId);
					if (stringArray[0] == null || stringArray[0].trim().length() == 0) {
					} else {
						CourseService courseSvc = new CourseService();
						CourseVO courseVO = courseSvc.findByLike(stringArray[0]);
						String value = courseVO.getCourseId();
						String[] ans = { value };
						// 將查詢結果重新放回put內
						map.put("courseId", ans);
					}
				}
				if(session.getAttribute("listEmps_ByCompositeQuery")==null) {
					InsCourseService insCourseSvc = new InsCourseService();
					List<InsCourseVO> list = insCourseSvc.getAll(map);
					session.setAttribute("listEmps_ByCompositeQuery", list); // 資料庫取出的list物件,存入request
					System.out.println("------------------------"+list.size()+"--------------------------------------");
				}
				
				RequestDispatcher successView = req.getRequestDispatcher("/front-end/inscourse/listEmps_ByCompositeQuery.jsp"); // 成功轉交listEmps_ByCompositeQuery.jsp
				successView.forward(req, res);
				return;
		
			} 

		
		
		if ("updateStatus".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			InsCourseService insCourseSvc=new InsCourseService();
			req.setAttribute("errorMsgs", errorMsgs);
			try{
				String inscId = req.getParameter("inscId");
				InsCourseVO insCourseVO=insCourseSvc.findOneById(inscId);
				Integer inscStatus = insCourseVO.getInscStatus();
				
				if(inscStatus==0) {
					inscStatus=1;
				}else {
					inscStatus=0;
				}	
				insCourseSvc.updateStatus(inscStatus, inscId);
				String url = "/front-end/member/viewAllMember.jsp";
				req.setAttribute("inCludeVO", "teacher"); // 要導向的分頁
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);
				return;
			}catch (Exception e) {
				errorMsgs.add(e.getMessage());
				req.setAttribute("inCludeVO", "teacher"); // 要導向的分頁
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/viewAllMember.jsp");
				failureView.forward(req, res);
				return;
			}
		}



	}
}
