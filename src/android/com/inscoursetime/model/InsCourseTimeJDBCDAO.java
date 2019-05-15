package android.com.inscoursetime.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;



public class InsCourseTimeJDBCDAO implements InsCourseTimeDAO_interface {
	static InsCourseTimeJDBCDAO dao=new InsCourseTimeJDBCDAO();
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
//	String url = "jdbc:oracle:thin:@localhost:49161:XE";
	String userid = "WESHARE";
	String passwd = "123456";
	
	//新增
	private static final String INSERT_STMT = "Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),?,?,?)";
	
	//修改
	private static final String UPDATE = "UPDATE InsCourseTime set inscMFD=?,inscEXP=? where inscTimeId = ?";

	//刪除
	private static final String DELETE = "DELETE FROM InsCourseTime where inscTimeId = ?";
	
	//查詢
	private static final String GET_ALL_STMT = "SELECT * FROM InsCourseTime";
	private static final String GET_ONE_STMT = "SELECT * FROM InsCourseTime where inscTimeId = ?";
	private static final String GET_DATE_STMT = "SELECT * FROM INSCOURSETIME WHERE INSCMFD >= TO_DATE(?,'yyyy-mm-dd')\r\n" + 
			"AND INSCMFD < TO_DATE(?,'yyyy-mm-dd') AND INSCID = ?";
	//複合式查詢
    private static final String CASE_WHEN_STMT = "SELECT * FROM InsCourseTime where (case when inscId=? then 1 else 0 end+ case when inscTimeId=? then 1 else 0 end)>=1";

	@Override
	public void insert(InsCourseTimeVO insCourseTimeVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1,insCourseTimeVO.getInscId());
			pstmt.setTimestamp(2, insCourseTimeVO.getInscMFD());
			pstmt.setTimestamp(3, insCourseTimeVO.getInscEXP());

			pstmt.executeUpdate();
			System.out.println("已新增一筆資料");

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
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

	@Override
	public void update(InsCourseTimeVO insCourseTimeVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setTimestamp(1, insCourseTimeVO.getInscMFD());
			pstmt.setTimestamp(2, insCourseTimeVO.getInscEXP());
			pstmt.setString(3, insCourseTimeVO.getInscTimeId());
			pstmt.executeUpdate();
			System.out.println("已修改一筆資料");

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
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

	@Override
	public void delete(String inscTimeId) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);
			pstmt.setString(1, inscTimeId);
			pstmt.executeUpdate();
		
			System.out.println("已刪除一筆資料");

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
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

	@Override
	public InsCourseTimeVO findByPrimaryKey(String inscTimeId) {
		InsCourseTimeVO insCourseTimeVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, inscTimeId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				insCourseTimeVO = new InsCourseTimeVO();
				insCourseTimeVO.setInscTimeId(rs.getString("inscTimeId"));
				insCourseTimeVO.setInscId(rs.getString("inscId"));
				insCourseTimeVO.setInscMFD(rs.getTimestamp("inscMFD"));
				insCourseTimeVO.setInscEXP(rs.getTimestamp("inscEXP"));
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
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
		return insCourseTimeVO;

	}
	
	@Override
	public List<InsCourseTimeVO> findByKey(String xxxId) {
		List<InsCourseTimeVO> list = new ArrayList<InsCourseTimeVO>();
		InsCourseTimeVO insCourseTimeVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(CASE_WHEN_STMT);
			pstmt.setString(1, xxxId);
			pstmt.setString(2, xxxId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				insCourseTimeVO = new InsCourseTimeVO();
				insCourseTimeVO.setInscTimeId(rs.getString("inscTimeId"));
				insCourseTimeVO.setInscId(rs.getString("inscId"));
				insCourseTimeVO.setInscMFD(rs.getTimestamp("inscMFD"));
				insCourseTimeVO.setInscEXP(rs.getTimestamp("inscEXP"));
				list.add(insCourseTimeVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} finally {
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
		return list;

	}

	@Override
	public List<InsCourseTimeVO> getAll() {
		List<InsCourseTimeVO> list = new ArrayList<InsCourseTimeVO>();
		InsCourseTimeVO insCourseTimeVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
		

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				insCourseTimeVO = new InsCourseTimeVO();
				insCourseTimeVO.setInscTimeId(rs.getString("inscTimeId"));
				insCourseTimeVO.setInscId(rs.getString("inscId"));
				insCourseTimeVO.setInscMFD(rs.getTimestamp("inscMFD"));
				insCourseTimeVO.setInscEXP(rs.getTimestamp("inscEXP"));
				list.add(insCourseTimeVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
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
		return list;
	}

	

	@Override
	public List<InsCourseTimeVO> findDate(java.sql.Date startTime, java.sql.Date endTime, String inscId) {
		List<InsCourseTimeVO> list = new ArrayList<InsCourseTimeVO>();
		InsCourseTimeVO insCourseTimeVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_DATE_STMT);

			pstmt.setDate(1,startTime);
			pstmt.setDate(2,endTime);
			pstmt.setString(3,inscId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				insCourseTimeVO = new InsCourseTimeVO();
				insCourseTimeVO.setInscTimeId(rs.getString("inscTimeId"));
				insCourseTimeVO.setInscId(rs.getString("inscId"));
				insCourseTimeVO.setInscMFD(rs.getTimestamp("inscMFD"));
				insCourseTimeVO.setInscEXP(rs.getTimestamp("inscEXP"));
				list.add(insCourseTimeVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
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
		return list;
	}
	
	
	@Override
	public List<InsCourseTimeVO> findDate(String startTime, String endTime, String inscId) {
		List<InsCourseTimeVO> list = new ArrayList<InsCourseTimeVO>();
		InsCourseTimeVO insCourseTimeVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_DATE_STMT);

			pstmt.setString(1,startTime);
			pstmt.setString(2,endTime);
			pstmt.setString(3,inscId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				insCourseTimeVO = new InsCourseTimeVO();
				insCourseTimeVO.setInscTimeId(rs.getString("inscTimeId"));
				insCourseTimeVO.setInscId(rs.getString("inscId"));
				insCourseTimeVO.setInscMFD(rs.getTimestamp("inscMFD"));
				insCourseTimeVO.setInscEXP(rs.getTimestamp("inscEXP"));
				list.add(insCourseTimeVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
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
		return list;
	}
	
	
	public static void main(String[] args) {
		// 新增
//		InsCourseTimeVO insCourseTimeVO1 = new InsCourseTimeVO();
//		insCourseTimeVO1.setInscId("IC00002");
//		insCourseTimeVO1.setInscMFD(java.sql.Timestamp.valueOf("2019-04-22 16:00:00"));
//		insCourseTimeVO1.setInscEXP(java.sql.Timestamp.valueOf("2019-04-22 17:00:00"));
//		dao.insert(insCourseTimeVO1);
		
		// 修改
//		InsCourseTimeVO insCourseTimeVO2 = new InsCourseTimeVO();
//		insCourseTimeVO2.setInscMFD(java.sql.Timestamp.valueOf("2019-04-22 14:00:00"));
//		insCourseTimeVO2.setInscEXP(java.sql.Timestamp.valueOf("2019-04-22 16:00:00"));
//		insCourseTimeVO2.setInscTimeId("TT00006");
//		dao.update(insCourseTimeVO2);
//		
		// 刪除
//		dao.delete("TT00007");
		
		// 查詢單筆
		InsCourseTimeVO insCourseTimeVO3 = dao.findByPrimaryKey("TT00001");
		System.out.print(insCourseTimeVO3.getInscTimeId() + ",");
		System.out.print(insCourseTimeVO3.getInscId() + ",");
		System.out.print(insCourseTimeVO3.getInscMFD() + ",");
		System.out.println(insCourseTimeVO3.getInscEXP() + ",");
		System.out.println("---------------------");
	
		// 查詢全部
//		List<InsCourseTimeVO> list = dao.getAll();
//		for (InsCourseTimeVO insCourseTimeVO4 : list) {
//			System.out.print(insCourseTimeVO4.getInscTimeId() + ",");
//			System.out.print(insCourseTimeVO4.getInscId() + ",");
//			System.out.print(insCourseTimeVO4.getInscMFD() + ",");
//			System.out.println(insCourseTimeVO4.getInscEXP() + ",");
//			System.out.println("---------------------");
//		}
		
		// 查詢時段
//		List<InsCourseTimeVO> list =dao.findDate("2019-04-20","2019-04-20", "IC00001");
//		for (InsCourseTimeVO insCourseTimeVO4 : list) {
//			System.out.print(insCourseTimeVO4.getInscTimeId() + ",");
//			System.out.print(insCourseTimeVO4.getInscId() + ",");
//			System.out.print(insCourseTimeVO4.getInscMFD() + ",");
//			System.out.println(insCourseTimeVO4.getInscEXP() + ",");
//			System.out.println("---------------------");
//	
		
		
		// 簡易複合查詢
//		List<InsCourseTimeVO> list = dao.findByKey("IC00001");
//		for (InsCourseTimeVO insCourseTimeVO4 : list) {
//			System.out.print(insCourseTimeVO4.getInscTimeId() + ",");
//			System.out.print(insCourseTimeVO4.getInscId() + ",");
//			System.out.print(insCourseTimeVO4.getInscMFD() + ",");
//			System.out.println(insCourseTimeVO4.getInscEXP() + ",");
//			System.out.println("---------------------");
		
		}





}
