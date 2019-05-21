package android.com.inscourse.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import android.com.course.model.CourseService;
import android.com.course.model.CourseVO;
import android.com.inscourse.model.InsCourseService;
import android.com.inscourse.model.InsCourseVO;
import android.com.inscoursetime.model.InsCourseTimeService;
import android.com.inscoursetime.model.InsCourseTimeVO;

@WebServlet("/android/InsCourseServlet")
public class InsCourseServlet extends HttpServlet {
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

		

		if ("find_by_teacher".equals(action)) {

			String teacherId = req.getParameter("teacherId");
			InsCourseService inscSvc = new InsCourseService();
			List<InsCourseVO> insCourseVOs = inscSvc.findByTeacher(teacherId);
			CourseService courseSvc = new CourseService();
			for (InsCourseVO inscVO : insCourseVOs) {
				CourseVO cvo = courseSvc.findOneById(inscVO.getCourseId());
				inscVO.setCourseId(cvo.getCourseName());
			}

			out.print(gson.toJson(insCourseVOs));
		}

		// 抓取時間
		if ("get_time_by_inscId_Date".equals(action)) {
			

			java.sql.Date inscDate = null;
			try {
				inscDate = java.sql.Date.valueOf(req.getParameter("inscDate").trim());

			} catch (IllegalArgumentException e) {
				inscDate = new java.sql.Date(System.currentTimeMillis());
			}
			Calendar cal = Calendar.getInstance();
			cal.setTime(inscDate);
			cal.add(Calendar.DAY_OF_YEAR, 1);

			java.sql.Date inscDate2 = new java.sql.Date(cal.getTimeInMillis());
			String startTime = inscDate.toString();
			String endTime = inscDate2.toString();

			String inscId = req.getParameter("inscId");

			InsCourseTimeService insCourseTimvc = new InsCourseTimeService();

			List<InsCourseTimeVO> list = insCourseTimvc.findDate(startTime, endTime, inscId);

			out.print(gson.toJson(list));

		}

		

		// for Android
		if ("search_by_CourseType".equals(action)) {
			List<String> erroMsgs = new LinkedList<>();

			String courseId = req.getParameter("keyword");
			InsCourseService insCourseService = new InsCourseService();
			// insCourseService.findByCourse(courseId);
			List<InsCourseVO> insCourseVOs = insCourseService.findByCourse("0005");

			out.print(gson.toJson(insCourseVOs));
		}
		
		
		if ("getOne_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				String inscId = req.getParameter("inscId");
				if (inscId == null || (inscId.trim()).length() == 0) {
					errorMsgs.add("請輸入課程編號");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/inscourse/select_page.jsp");
					failureView.forward(req, res);
					return;
				}
				if (!inscId.matches("IC[0-9]{5}")) {
					errorMsgs.add("課程編號格式錯誤");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/inscourse/select_page.jsp");
					failureView.forward(req, res);
					return;
				}

				InsCourseService insCourseSvc = new InsCourseService();
				InsCourseVO insCourseVO = insCourseSvc.findOneById(inscId);
				if (insCourseVO == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/inscourse/select_page.jsp");
					failureView.forward(req, res);
				}

				req.setAttribute("insCourseVO", insCourseVO);
				String url = "/inscourse/listOneInsCourse.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/inscourse/select_page.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("erroMsgs", errorMsgs);

			try {
				String inscId = req.getParameter("inscId");

				InsCourseService insCourseSvc = new InsCourseService();
				InsCourseVO insCourseVO = insCourseSvc.findOneById(inscId);

				req.setAttribute("insCourseVO", insCourseVO);
				String url = "/inscourse/update_InsCourse_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/inscourse/listAllInsCourse.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL = req.getParameter("requestURL");
			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String inscId = req.getParameter("inscId").trim();

				String teacherId = req.getParameter("teacherId");

				String courseId = req.getParameter("courseId").trim();

				String inscLoc = req.getParameter("inscLoc").trim();

				Integer inscType = new Integer(req.getParameter("inscType").trim());

				Integer inscPeople = null;
				try {
					inscPeople = new Integer(req.getParameter("inscPeople").trim());
					if (inscPeople < 1) {
						errorMsgs.add("人數不可小於１");
					}
				} catch (NumberFormatException e) {
					inscPeople = 1;
					errorMsgs.add("人數請填數字.");
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
					errorMsgs.add("職位請勿空白");
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
					req.setAttribute("insCourseVO", insCourseVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/inscourse/update_InsCourse_input.jsp");
					failureView.forward(req, res);
					return;
				}

				InsCourseService insCourseSvc = new InsCourseService();
				insCourseVO = insCourseSvc.updateInsCourse(inscId, teacherId, courseId, inscLoc, inscType, inscPeople,
						inscLang, inscPrice, inscCourser, inscStatus);

				req.setAttribute("insCourseVO", insCourseVO);
				RequestDispatcher successView = req.getRequestDispatcher("/inscourse/listOneInsCourse.jsp");
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/inscourse/update_InsCourse_input.jsp");
				failureView.forward(req, res);
			}
		}

		if ("insert".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				String teacherId = req.getParameter("teacherId");

				String courseId = req.getParameter("courseId").trim();

				String inscLoc = req.getParameter("inscLoc").trim();

				Integer inscType = new Integer(req.getParameter("inscType").trim());

				Integer inscPeople = null;
				try {
					inscPeople = new Integer(req.getParameter("inscPeople").trim());
				} catch (NumberFormatException e) {
					inscPeople = 0;
					errorMsgs.add("人數請填數字.");
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
					errorMsgs.add("職位請勿空白");
				}

				Integer inscStatus = new Integer(req.getParameter("inscStatus").trim());

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
					RequestDispatcher failureView = req.getRequestDispatcher("/inscourse/addInsCourse.jsp");
					failureView.forward(req, res);
					return;
				}

				InsCourseService insCourseSvc = new InsCourseService();
				insCourseSvc.addInsCourse(teacherId, courseId, inscLoc, inscType, inscPeople, inscLang, inscPrice,
						inscCourser, inscStatus);

				String url = "/inscourse/listAllInsCourse.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/inscourse/addInsCourse.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
	}

}
