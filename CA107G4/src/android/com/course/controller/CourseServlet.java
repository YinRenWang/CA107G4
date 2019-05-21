package android.com.course.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

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

@WebServlet("/android/CourseServlet")
public class CourseServlet extends HttpServlet {
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

		if ("search_for_course".equals(action)) {
			CourseService courseSvc = new CourseService();
			List<CourseVO> cVOs = courseSvc.getAll();
			String keyword = req.getParameter("keyword");

			List<InsCourseVO> inscVOs = new ArrayList<>();
			InsCourseService inscSvc = new InsCourseService();
			System.out.println(cVOs.size());
			for (int i = 0; i < cVOs.size(); i++) {
				CourseVO cVO = cVOs.get(i);
				if (!cVO.getCourseName().contains(keyword)) {
					
					System.out.println("del--------------"+cVO.getCourseName());
				}else {
				
					List<InsCourseVO> a00 = inscSvc.findByCourse(cVO.getCourseId());
					inscVOs.addAll(a00);
					System.out.println("nor--------------"+cVO.getCourseName());
				}
			}
			
			// 去除工程師資料
			for (InsCourseVO icvo : inscVOs) {

				for (CourseVO cvo : cVOs) {
					if (icvo.getCourseId().equals(cvo.getCourseId())) {
						icvo.setCourseId(cvo.getCourseName());
						System.out.println(cvo.getCourseName());
					}
				}
			}
			out.println(gson.toJson(inscVOs));

		}
		if ("find_by_coursetype".equals(action)) {

			CourseService courseSvc = new CourseService();
			Integer courseTypeId = new Integer(req.getParameter("courseTypeId"));
			List<CourseVO> courseVOs = courseSvc.findByCourseType(courseTypeId);
			List<InsCourseVO> insCourseVOs = new ArrayList<>();

			InsCourseService insCourseSvc = new InsCourseService();
			
			
			
			
			
			
			// 查詢對應課程
			courseVOs.stream().forEach(cvo -> insCourseVOs.addAll(insCourseSvc.findByCourse(cvo.getCourseId())));
//			for (CourseVO cvo : courseVOs) {
//
//				InsCourseService insCourseSvc = new InsCourseService();
//				List<InsCourseVO> insCourseVOmass = insCourseSvc.findByCourse(cvo.getCourseId());
//				insCourseVOs.addAll(insCourseVOmass);
//			}

			// 去除工程師資料
			for (InsCourseVO icvo : insCourseVOs) {
				for (CourseVO cvo : courseVOs) {
					if (icvo.getCourseId().equals(cvo.getCourseId())) {
						icvo.setCourseId(cvo.getCourseName());
					}
				}
			}
			out.println(gson.toJson(insCourseVOs));
		}

	}

}
