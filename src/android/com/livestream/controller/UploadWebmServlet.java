package android.com.livestream.controller;

import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import android.com.livestream.model.LiveStreamService;
import android.com.livestream.model.LiveStreamVO;

@WebServlet("/UploadWebmServlet")
public class UploadWebmServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
			
			req.setCharacterEncoding("UTF-8");
			res.setContentType("Content-Type ; video/webm");
			byte[] buffer = new byte[1024 * 1024];
			InputStream is = req.getInputStream();  
			ByteArrayOutputStream output = new ByteArrayOutputStream();
			int bytesRead;
			while ((bytesRead = is.read(buffer)) != -1){
			    output.write(buffer, 0, bytesRead);
			}
			output.close();
			is.close();
			byte[] blob=output.toByteArray();
			
			LiveStreamService LiveStreamSvs = new LiveStreamService();
			
			List<LiveStreamVO> list = LiveStreamSvs.getAll();
			LiveStreamVO liveStreamVO=list.get(list.size()-1);
			liveStreamVO.setLsContent(blob);
			LiveStreamSvs.update(liveStreamVO);
	
	
		
	
		

		
	}

}
