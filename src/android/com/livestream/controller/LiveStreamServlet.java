package android.com.livestream.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import android.com.livestream.model.LiveStreamService;


@WebServlet("/LiveStreamServlet")
public class LiveStreamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

  
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		doPost(req, res);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
		res.setContentType("UTF-8");
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("insert".equals(action)) {// 來自addInscTime.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to 
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

		
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				LiveStreamService liveStreamSvc=new LiveStreamService();
				String teacherId=req.getParameter("teacherId").toUpperCase();
				String count=req.getParameter("lsViewNum");
				System.out.println("servlet的"+teacherId);
				
				Integer lsViewNum=null;
				lsViewNum=Integer.valueOf(count);
				System.out.println(lsViewNum);
				SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				Date date = new Date();
				String strDate = sdFormat.format(date);
				java.sql.Timestamp lsDate=java.sql.Timestamp.valueOf(strDate);
				System.out.println(lsDate);
				liveStreamSvc.insert(teacherId, lsDate, lsViewNum, null);
			

			}
			
		


		
	}

}
