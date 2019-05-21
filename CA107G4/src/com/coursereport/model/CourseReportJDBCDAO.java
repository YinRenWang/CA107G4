package com.coursereport.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.coursecomment.model.CourseCommentVO;


public class CourseReportJDBCDAO implements CourseReportDAO_interface {
	static CourseReportJDBCDAO dao=new CourseReportJDBCDAO();
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "WESHARE";
	String passwd = "123456";
	
	//新增
	private static final String INSERT_STMT = "INSERT INTO CourseReport VALUES (('CR'||LPAD(to_char(CourseReport_seq.NEXTVAL), 5, '0')),?,?,?,?)";
	
	//修改
	private static final String UPDATE = "UPDATE CourseReport set crStatus=? where crId = ?";

	//查詢全部
	private static final String GET_ALL_STMT = "SELECT * FROM CourseReport";

	//查詢狀態
	private static final String GET_ALL_STATUS = "SELECT * FROM CourseReport WHERE crStatus=?";
	
	//查詢單筆
	private static final String GET_ONE_STMT = "SELECT * FROM CourseReport WHERE crId=?";
	
	//複合式查詢
	private static final String CASE_WHEN_STMT = "SELECT * FROM CourseReport where (case when crId=? then 1 else 0 end+ case when inscId=? then 1 else 0 end+ case when inscId=? then 1 else 0 end)>=1";

	@Override
	public void insert(CourseReportVO courseReportVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, courseReportVO.getMemId());
			pstmt.setString(2, courseReportVO.getInscId());
			pstmt.setString(3, courseReportVO.getCrContent());
			pstmt.setInt(4, courseReportVO.getCrStatus());

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
	public void update(CourseReportVO courseReportVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setInt(1, courseReportVO.getCrStatus());
			pstmt.setString(2, courseReportVO.getCrId());

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
	public CourseReportVO findByPrimaryKey(String crId) {

		return null;
	}
	
	@Override
	public List<CourseReportVO> findByKey(String xxxId){
		List<CourseReportVO> list = new ArrayList<CourseReportVO>();
		CourseReportVO courseReportVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(CASE_WHEN_STMT);
			pstmt.setString(1, xxxId);
			pstmt.setString(2, xxxId);
			pstmt.setString(3, xxxId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				courseReportVO = new CourseReportVO();
				courseReportVO.setCrId(rs.getString("crId"));
				courseReportVO.setMemId(rs.getString("memId"));
				courseReportVO.setInscId(rs.getString("inscId"));
				courseReportVO.setCrContent(rs.getString("crContent"));
				courseReportVO.setCrStatus(rs.getInt("crStatus"));
				list.add(courseReportVO); // Store the row in the list
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
	public List<CourseReportVO> findByStatus(Integer crStatus) {
		List<CourseReportVO> list = new ArrayList<CourseReportVO>();
		CourseReportVO courseReportVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STATUS);
			pstmt.setInt(1, crStatus);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				courseReportVO = new CourseReportVO();
				courseReportVO.setCrId(rs.getString("crId"));
				courseReportVO.setMemId(rs.getString("memId"));
				courseReportVO.setInscId(rs.getString("inscId"));
				courseReportVO.setCrContent(rs.getString("crContent"));
				courseReportVO.setCrStatus(rs.getInt("crStatus"));
				list.add(courseReportVO); // Store the row in the list
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
	public List<CourseReportVO> getAll() {
		List<CourseReportVO> list = new ArrayList<CourseReportVO>();
		CourseReportVO courseReportVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				courseReportVO = new CourseReportVO();
				courseReportVO.setCrId(rs.getString("crId"));
				courseReportVO.setMemId(rs.getString("memId"));
				courseReportVO.setInscId(rs.getString("inscId"));
				courseReportVO.setCrContent(rs.getString("crContent"));
				courseReportVO.setCrStatus(rs.getInt("crStatus"));
				list.add(courseReportVO); // Store the row in the list
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
	



	public static void main(String[] args) {
		// 新增
//		CourseReportVO courseReportVO1 = new CourseReportVO();
//		courseReportVO1.setMemId("weshare04");
//		courseReportVO1.setInscId("IC00001");
//		courseReportVO1.setCrContent("JSP是廢物吧");
//		courseReportVO1.setCrStatus(2);
//		dao.insert(courseReportVO1);
		

		// 修改
//		CourseReportVO courseReportVO2 = new CourseReportVO();
//		courseReportVO2.setCrStatus(2);
//		courseReportVO2.setCrId("CR00001");
//		dao.update(courseReportVO2);

		// 複合式查詢
//		List<CourseReportVO> list = dao.findByPrimaryKey("CR00001");
//		for (CourseReportVO courseReportVO3 : list) {
//			System.out.println(courseReportVO3.getCrId()+ ",");
//			System.out.println(courseReportVO3.getMemId()+ ",");
//			System.out.println(courseReportVO3.getInscId()+ ",");
//			System.out.println(courseReportVO3.getCrContent()+ ",");
//			System.out.println(courseReportVO3.getCrStatus()+ ",");
//			System.out.println("---------------------");
//		}
		
		// 查詢狀態
//		List<CourseReportVO> list = dao.findByStatus(1);
//		for (CourseReportVO courseReportVO3 : list) {
//			System.out.println(courseReportVO3.getCrId()+ ",");
//			System.out.println(courseReportVO3.getMemId()+ ",");
//			System.out.println(courseReportVO3.getInscId()+ ",");
//			System.out.println(courseReportVO3.getCrContent()+ ",");
//			System.out.println(courseReportVO3.getCrStatus()+ ",");
//			System.out.println("---------------------");
//		}
		
//		// 查詢全部
//		List<CourseReportVO> list = dao.getAll();
//		for (CourseReportVO courseReportVO3 : list) {
//			System.out.println(courseReportVO3.getCrId()+ ",");
//			System.out.println(courseReportVO3.getMemId()+ ",");
//			System.out.println(courseReportVO3.getInscId()+ ",");
//			System.out.println(courseReportVO3.getCrContent()+ ",");
//			System.out.println(courseReportVO3.getCrStatus()+ ",");
//			System.out.println("---------------------");
//		}
		

	}





}
