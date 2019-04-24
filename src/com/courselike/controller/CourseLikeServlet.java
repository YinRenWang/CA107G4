package com.courselike.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.course.model.CourseService;
import com.course.model.CourseVO;
import com.courselike.model.CourseLikeService;
import com.courselike.model.CourseLikeVO;
import com.inscourse.model.InsCourseService;
import com.inscourse.model.InsCourseVO;

@WebServlet("/CourseLikeServlet")
public class CourseLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/plain; charset=UTF-8");
		PrintWriter out = res.getWriter();

		String action = req.getParameter("action");

		
		//加入收藏
		if("add_to_favorites".equals(action)) {
			String inscId = req.getParameter("inscId");
			String memId = req.getParameter("memId");
			CourseLikeService clSvc = new CourseLikeService();
			
			clSvc.addCourseLike(memId, inscId);
			
		}
		
		//移除收藏
		if("delete_from_favorites".equals(action)) {
			String inscId = req.getParameter("inscId");
			String memId = req.getParameter("memId");
			CourseLikeService clSvc = new CourseLikeService();
			clSvc.deleteCourseLike(memId, inscId);
		}
		
		//查看我的收藏
		if("look_my_favorites".equals(action)) {
			String memId = req.getParameter("memId");
			CourseLikeService clSvc = new CourseLikeService();
			List<CourseLikeVO> courseLikeVOs = clSvc.getMemIdCourseLike(memId);
			
			InsCourseService inscSvc = new InsCourseService(); 
			List<InsCourseVO> insCourseVOs = new ArrayList<>();
			
			CourseService courseSvc = new CourseService();
			for(int i=0; i<courseLikeVOs.size(); i++) {
				InsCourseVO inscVO = inscSvc.findOneById(courseLikeVOs.get(i).getInscId());
				CourseVO courseVO = courseSvc.findOneById(inscVO.getCourseId());
				inscVO.setCourseId(courseVO.getCourseName());
				insCourseVOs.add(inscVO);
			}
		
			
		}
		
	}

}
