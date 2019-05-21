package android.com.teacher.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import android.com.teacher.model.TeacherService;
import android.com.teacher.model.TeacherVO;


@WebServlet("/android/TeacherServlet")
public class TeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	 
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		Gson gson = new GsonBuilder()  
				  .setDateFormat("yyyy-MM-dd HH:mm:ss")  
				  .create(); 
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/plain; charset=UTF-8");
		PrintWriter out = res.getWriter();

		String action = req.getParameter("action");
		System.out.println(action);
		
		if("find_by_memId".equals(action)) {
			
			String memId = req.getParameter("memId");
			TeacherService tchSvc = new TeacherService();
			TeacherVO tchVO = tchSvc.findByMemId(memId);
			out.print(gson.toJson(tchVO));
			
		}
		
		if("find_by_teacherId".equals(action)) {
			
			String teacherId = req.getParameter("teacherId");
			TeacherService tchSvc = new TeacherService();
			TeacherVO tchVO = tchSvc.findOneById(teacherId);
			out.print(gson.toJson(tchVO));
			
			
		}
		
		
	}

}
