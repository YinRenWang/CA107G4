package android.com.picture.controller;

import java.awt.image.BufferedImage;
import java.io.*;

import java.sql.*;

import javax.imageio.ImageIO;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.sql.DataSource;

import org.apache.tomcat.util.codec.binary.Base64;

@WebServlet("/android/DBGifReader")
public class DBGifReader extends HttpServlet {


	private static final long serialVersionUID = 1L;
	private static DataSource ds;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}

	}

	private static final String GET_ONE_BY_MEMID = "SELECT memImage FROM member WHERE memId=?";
	private static final String GET_ONE_BY_GOODID = "SELECT goodImg FROM goods WHERE goodId=?";
	Connection con;
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String action = req.getParameter("action");

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		res.setContentType("image/jpeg");
		OutputStream out = res.getOutputStream();

		if ("get_member_pic".equals(action) || "get_goods_pic".equals(action)) {

			byte[] bPic = null;

			try {
				con = ds.getConnection();
				if ("get_member_pic".equals(action)) {
					pstmt = con.prepareStatement(GET_ONE_BY_MEMID);
					pstmt.setString(1, req.getParameter("memId"));
					rs = pstmt.executeQuery();
					if (rs.next()) {
						bPic = rs.getBytes("memImage");
					} else {
						res.sendError(HttpServletResponse.SC_NOT_FOUND);
					}
					//System.out.println("memId-圖片" + req.getParameter("memId"));
				} else

				if ("get_goods_pic".equals(action)) {

					pstmt = con.prepareStatement(GET_ONE_BY_GOODID);
					pstmt.setString(1, req.getParameter("goodId"));
					rs = pstmt.executeQuery();
					if (rs.next()) {
						bPic = rs.getBytes("goodImg");
					} else {
						res.sendError(HttpServletResponse.SC_NOT_FOUND);
					}
					//System.out.println("goodId-圖片" + req.getParameter("goodId"));

				}
			} catch (Exception e) {
				System.out.println(e);
			} finally {
				try {
					if (con != null)
						con.close();
				} catch (SQLException e) {
					System.out.println(e);
				}
				try {
					rs.close();
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			//System.out.println("壓縮前" + bPic.length);
			int imageSize = Integer.parseInt(req.getParameter("imageSize"));

			bPic = ImageUtil.shrink(bPic, imageSize);

			//System.out.println("壓縮後" + bPic.length);
			//System.out.println("圖片大小" + imageSize);

			//base64 = Base64.encodeBase64String(bPic);
			out.write(bPic);

		}

	}

}