package com.goods.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * 資料庫上傳圖片
 */
//@WebServlet("/upImage")

@MultipartConfig
public class UpImage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USER = "WESHARE";
	private static final String PASSWORD = "123456";
	//private static final String SQL = "INSERT INTO GOODS GOODIMG = ? WHERE GOODID = ('GD'||LPAD(to_char(Goods_seq.NEXTVAL), 5, '0'))";
	private static final String SQL = "INSERT INTO GOODS GOODIMG = ? WHERE GOODID = 'GD00012'";
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("doGet");
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		Connection con = null;
		PreparedStatement pstmt = null;

		System.out.println("doPost");

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(SQL);

			InputStream in = null;
			Collection<Part> parts = req.getParts();

			for (Part p : parts) {
				System.out.println("###");
				in = p.getInputStream();

//				方法1:	VO 適用		
//				byte[] buf = new byte[in.available()];
//				in.read(buf);
//				pstmt.setBytes(3,buf);
				
//				方法2:					
				pstmt.setBinaryStream(1, in, in.available());
//				pstmt.setString(2, "AAA");
			}

			pstmt.executeUpdate();
			in.close();
		} catch (ClassNotFoundException ce) {
			System.out.println(ce);
		} catch (SQLException se) {
			System.out.println(se);
		} finally {

			// 依建立順序關閉資源 (越晚建立越早關閉)
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					System.out.println(se);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException se) {
					System.out.println(se);
				}
			}
		}

	}

}
