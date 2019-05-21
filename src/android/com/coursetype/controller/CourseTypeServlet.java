package android.com.coursetype.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import android.com.coursetype.model.CourseTypeService;
import android.com.coursetype.model.CourseTypeVO;

@WebServlet("/android/CourseTypeServlet")
public class CourseTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Gson gson = new Gson();
		res.setContentType("text/plain; charset=UTF-8");
		PrintWriter out = res.getWriter();
		
		String action = req.getParameter("action");
		
		if("get_all_type".equals(action)) {
			List<CourseTypeVO> courseTypes = new CourseTypeService().getAll();
			out.println(gson.toJson(courseTypes));	
		}
		
		
		
	}

}
