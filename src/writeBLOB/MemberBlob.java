package writeBLOB;

import java.sql.*;
import java.io.*;


class memberPhotoWrite {

	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String argv[]) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String driver = "oracle.jdbc.driver.OracleDriver";
//		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String url = "jdbc:oracle:thin:@localhost:49161:XE";
		String userid = "WESHARE";
		String passwd = "123456";
		int    count  = 6;
		String picName[] = { "01.jpg", "02.jpg", "03.jpg", "04.jpg", "05.jpg", "06.jpg" };
	
		try {
			con = DriverManager.getConnection(url, userid, passwd);
			for (int i = 1; i <= count; i++) {
				File pic = new File("/images/blob/", picName[i-1]);
				// 相對路徑- picFrom
				// 絕對路徑- 譬如:
				// File pic = new File("x:\\aa\\bb\\picFrom", picName);
				long flen = pic.length();
				String fileName = pic.getName();
				int dotPos = fileName.indexOf('.');
				String fno = fileName.substring(0, dotPos);
				String format = fileName.substring(dotPos + 1);
				InputStream fin = new FileInputStream(pic);

				System.out.println("Update the database... "+i);
				pstmt = con.prepareStatement("UPDATE member set memImage=? where memId = ?");
				pstmt.setBinaryStream(1, fin, (int) flen);
				pstmt.setInt(2, i);

				
				// void pstmt.setBinaryStream(int parameterIndex, InputStream x,
				// int
				// length) throws SQLException
				int rowsUpdated = pstmt.executeUpdate();

				fin.close();
			}

			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
			}
		}
	}
}

