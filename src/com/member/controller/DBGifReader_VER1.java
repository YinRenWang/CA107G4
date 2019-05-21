package com.member.controller;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class DBGifReader_VER1 extends HttpServlet {
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
//	String url = "jdbc:oracle:thin:@localhost:49161:XE";
	String userid = "WESHARE";
	String passwd = "123456";
	private static final String SELECT_STMT = "SELECT memImage FROM member WHERE memId=?";

	Connection con;

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();

		try {
			pstmt = con.prepareStatement(SELECT_STMT);
			pstmt.setString(1,req.getParameter("memId"));
			rs = pstmt.executeQuery();
	

			if (rs.next()) {
				BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("memImage"));
				byte[] buf = new byte[4 * 1024]; // 4K buffer
				int len;
				while ((len = in.read(buf)) != -1) {
					out.write(buf, 0, len);
				}
				in.close();
			} else {
				res.sendError(HttpServletResponse.SC_NOT_FOUND);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void init() throws ServletException {
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
		} catch (ClassNotFoundException e) {
			throw new UnavailableException("Couldn't load JdbcOdbcDriver");
		} catch (SQLException e) {
			throw new UnavailableException("Couldn't get db connection");
		}
	}

	public void destroy() {
		try {
			if (con != null) con.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

}