package android.com.livestream.controller;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "WebmDBServlet", urlPatterns = { "/WebmDBServlet" })

public class WebmDBServlet extends HttpServlet {
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "WESHARE";
	String passwd = "123456";
	private static final String SELECT_STMT = "SELECT lsContent FROM LiveStream WHERE lsId = ?";

	Connection con;

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		res.setContentType("video/webm");
		ServletOutputStream out = res.getOutputStream();
		
		
		try {
			pstmt = con.prepareStatement(SELECT_STMT);
//			pstmt.setString(1,"LV00001"); //測試用
			pstmt.setString(1,req.getParameter("lsId"));
			rs = pstmt.executeQuery();
	 

			if (rs.next()) {
				BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("lsContent"));
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