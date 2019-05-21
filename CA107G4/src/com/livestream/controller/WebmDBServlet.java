
package com.livestream.controller;

import java.io.*;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.sql.DataSource;

@WebServlet(name = "WebmDBServlet", urlPatterns = { "/WebmDBServlet" })

public class WebmDBServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private static final String SELECT_STMT = "SELECT lsContent FROM LiveStream WHERE lsId = ?";
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace(); 
		}
	}
	

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		res.setContentType("video/webm");
		
		
		
		
		BufferedOutputStream out = new BufferedOutputStream(res.getOutputStream());

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(SELECT_STMT);
//			pstmt.setString(1,"LV00001"); //測試用
			pstmt.setString(1,req.getParameter("lsId"));
			rs = pstmt.executeQuery();
		

			if (rs != null && rs.next()) {
				BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("lsContent"));
				byte[] buf = new byte[50 * 1024]; // 4K buffer
				int len;
				while ((len = in.read(buf)) != -1) {
					out.write(buf, 0, len);
				}
				
				in.close();
				out.flush();
			} else {
				res.sendError(HttpServletResponse.SC_NOT_FOUND);
			}
			
			
		} catch (Exception e) {
			
			System.out.println("000000000000000000000000000000000000");
			e.printStackTrace();
		}finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}



}