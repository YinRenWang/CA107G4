package oracle;

import java.sql.*;
import java.io.*;


public class MEMIMAGE {

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
		int    count  = 17;
		String memId[] = {"we01","we02","we03","we04","we05","we06","we07","we08","we09","we10","we11","we12","we13","david","peter","west","gods"};
	
		try {
			con = DriverManager.getConnection(url, userid, passwd);
			for (int i = 1; i <= count; i++) {

				// 相對路徑- picFrom
				// 絕對路徑- 譬如:
				
//Mac用
//				File pic = new File("/Users/yinren/Desktop/images/blob/", picName[i-1]);
				
//Window用 		
				File pic = new File("C:/database/MEMIMAGE/", i+".jpg");
				long flen = pic.length();
				String fileName = pic.getName();
				int dotPos = fileName.indexOf('.');
				String fno = fileName.substring(0, dotPos);
				String format = fileName.substring(dotPos + 1);
				InputStream fin = new FileInputStream(pic);

				System.out.println("Update the database... "+i);
				pstmt = con.prepareStatement("UPDATE member set memImage=? where memId = ?");
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

