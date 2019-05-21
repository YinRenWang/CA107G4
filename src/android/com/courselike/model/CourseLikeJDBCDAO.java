package android.com.courselike.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class CourseLikeJDBCDAO implements CourseLikeDAO_interface {
	static CourseLikeJDBCDAO dao=new CourseLikeJDBCDAO();
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "WESHARE";
	String passwd = "123456";
	
	//新增
	private static final String INSERT_STMT = "Insert into CourseLike values (?,?)";
	
	//刪除
	private static final String DELETE = "DELETE FROM CourseLike where memId = ? and inscId = ? ";
	
	//查詢
	private static final String GET_ALL_STMT = "SELECT * FROM CourseLike";
	private static final String GET_ONE_MEMID = "SELECT * FROM CourseLike where memId = ?";
	private static final String GET_ONE_STMT = "SELECT * FROM CourseLike where memId = ? and inscId = ? ";
	

	public CourseLikeJDBCDAO() {

	}

	@Override
	public void insert(CourseLikeVO courseLikeVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, courseLikeVO.getMemId());
			pstmt.setString(2,courseLikeVO.getInscId());

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
	public void delete(String memId,String inscId) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);
			pstmt.setString(1, memId);
			pstmt.setString(2, inscId);
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
	public CourseLikeVO findByPrimaryKey(String memId,String inscId) {
		CourseLikeVO courseLikeVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, memId);
			pstmt.setString(2, inscId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				courseLikeVO = new CourseLikeVO();
				courseLikeVO.setMemId(rs.getString("memId"));
				courseLikeVO.setInscId(rs.getString("inscId"));
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
		return courseLikeVO;
	}

	@Override
	public List<CourseLikeVO> getAll() {
		List<CourseLikeVO> list = new ArrayList<CourseLikeVO>();
		CourseLikeVO courseLikeVO = null;

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
				courseLikeVO = new CourseLikeVO();
				courseLikeVO.setMemId(rs.getString("memId"));
				courseLikeVO.setInscId(rs.getString("inscId"));
				list.add(courseLikeVO); // Store the row in the list
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
	public List<CourseLikeVO> findByMemId(String memId) {
		List<CourseLikeVO> list = new ArrayList<CourseLikeVO>();
		CourseLikeVO courseLikeVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_MEMID);

			pstmt.setString(1, memId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				courseLikeVO = new CourseLikeVO();
				courseLikeVO.setMemId(rs.getString("memId"));
				courseLikeVO.setInscId(rs.getString("inscId"));
				list.add(courseLikeVO); // Store the row in the list
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
//		CourseLikeVO courseLikeVO1 = new CourseLikeVO();
//		courseLikeVO1.setMemId("weshare04");
//		courseLikeVO1.setInscId("IC00002");
//		dao.insert(courseLikeVO1);
		
		//刪除
//		dao.delete("weshare04","IC00001");
		
		// 查詢
//		CourseLikeVO courseLikeVO2 = dao.findByPrimaryKey("weshare02","IC00001");
//		System.out.print(courseLikeVO2.getMemId() + ",");
//		System.out.print(courseLikeVO2.getInscId() + ",");
//		System.out.println("---------------------");
		
		// 查詢
		List<CourseLikeVO> list = dao.findByMemId("weshare03");
		for (CourseLikeVO courseLikeVO4 : list) {
			System.out.print(courseLikeVO4.getMemId() + ",");
			System.out.print(courseLikeVO4.getInscId() + ",");
			System.out.println("---------------------");
		}
		
		// 查詢
//		List<CourseLikeVO> list = dao.getAll();
//		for (CourseLikeVO courseLikeVO4 : list) {
//			System.out.print(courseLikeVO4.getMemId() + ",");
//			System.out.print(courseLikeVO4.getInscId() + ",");
//			System.out.println("---------------------");
//		}

	}



}
