package oracle;

import java.sql.*;
import java.io.*;

//專題資料庫假資料照片塞入
public class GOODIMG {

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
//Windows用	
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		
//Mac用
//		String url = "jdbc:oracle:thin:@localhost:49161:XE";
		String userid = "WESHARE";
		String passwd = "123456";
		int    count  = 13;
		String picName[] = { "01.jpg", "02.jpg", "03.jpg", "04.jpg","05.jpg","06.jpg","07.jpg","08.jpg","09.jpg","10.jpg","11.jpg","12.jpg","13.jpg"};
		String memId[] = {"GD00001","GD00002","GD00003","GD00004","GD00005","GD00006","GD00007","GD00008","GD00009","GD00010","GD00011","GD00012","GD00013"};
	
		try {
			con = DriverManager.getConnection(url, userid, passwd);
			for (int i = 1; i <= count; i++) {

				// 相對路徑- picFrom
				// 絕對路徑- 譬如:
				
//Mac用
//				File pic = new File("/Users/yinren/Desktop/images/BookName/", picName[i-1]);
				
//Window用 		
				File pic = new File("C:/database/GOODIMG/", picName[i-1]);
				long flen = pic.length();
				String fileName = pic.getName();
				int dotPos = fileName.indexOf('.');
				String fno = fileName.substring(0, dotPos);
				String format = fileName.substring(dotPos + 1);
				InputStream fin = new FileInputStream(pic);

				System.out.println("Update the database... "+i);
				pstmt = con.prepareStatement("UPDATE GOODS set GOODIMG=? where GOODID = ?");
				pstmt.setBinaryStream(1, fin, (int) flen);
				pstmt.setString(2, memId[i-1]);

				
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
				System.out.println("Update End!");
			} catch (SQLException e) {
			}
		}
	}
}

