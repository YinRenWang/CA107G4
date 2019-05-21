package android.com.courselike.controller;

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

import android.com.course.model.CourseService;
import android.com.course.model.CourseVO;
import android.com.courselike.model.CourseLikeService;
import android.com.courselike.model.CourseLikeVO;
import android.com.inscourse.model.InsCourseService;
import android.com.inscourse.model.InsCourseVO;

@WebServlet("/android/CourseLikeServlet")
public class CourseLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Gson gson = new Gson();
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/plain; charset=UTF-8");
		PrintWriter out = res.getWriter();

		String action = req.getParameter("action");

		// 加入收藏
		if ("add_to_favorites".equals(action)) {
			String inscId = req.getParameter("inscId");
			String memId = req.getParameter("memId");
			CourseLikeService clSvc = new CourseLikeService();
			try {
				clSvc.addCourseLike(memId, inscId);
			} catch (Exception e) {
				System.out.println("FUCK");
			}

		}

		// 移除收藏
		if ("delete_from_favorites".equals(action)) {
			String inscId = req.getParameter("inscId");
			String memId = req.getParameter("memId");
			CourseLikeService clSvc = new CourseLikeService();
			try {
				clSvc.deleteCourseLike(memId, inscId);
			} catch (Exception e) {
				System.out.println("FUCK");
			}
		}

		// 查看我的收藏
		if ("look_my_favorites".equals(action)) {
			String memId = req.getParameter("memId");
			CourseLikeService clSvc = new CourseLikeService();
			List<CourseLikeVO> courseLikeVOs = clSvc.getMemIdCourseLike(memId);

			InsCourseService inscSvc = new InsCourseService();
			List<InsCourseVO> insCourseVOs = new ArrayList<>();

			CourseService courseSvc = new CourseService();
			for (int i = 0; i < courseLikeVOs.size(); i++) {
				InsCourseVO inscVO = inscSvc.findOneById(courseLikeVOs.get(i).getInscId());
				CourseVO courseVO = courseSvc.findOneById(inscVO.getCourseId());
				inscVO.setCourseId(courseVO.getCourseName());
				insCourseVOs.add(inscVO);
			}
			out.print(gson.toJson(insCourseVOs));

		}

	}

}
