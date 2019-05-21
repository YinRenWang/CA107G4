package com.coursecomment.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CourseCommentJDBCDAO implements CourseCommentDAO_interface {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "WESHARE";
	String passwd = "123456";
	
	//新增
	private static final String INSERT_STMT = "Insert into COURSECOMMENT values (('CC'||LPAD(to_char(COURSECOMMENT_seq.NEXTVAL), 5, '0')),?,?,?)";
	
	//刪除
	private static final String DELETE = "DELETE FROM COURSECOMMENT where ccId= ? ";
	
	//修改
	private static final String UPDATE = "UPDATE COURSECOMMENT set ccContent=? where ccId = ?";
	
	//查詢全部
	private static final String GET_ALL_STMT = "SELECT * FROM COURSECOMMENT";
	
	//複合式查詢
	private static final String CASE_WHEN_STMT = "SELECT * FROM COURSECOMMENT where (case when ccId=? then 1 else 0 end+case when memId=? then 1 else 0 end+ case when inscId=? then 1 else 0 end)>=1";
	@Override
	public void insert(CourseCommentVO courseCommentVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, courseCommentVO.getMemId());
			pstmt.setString(2,courseCommentVO.getInscId());
			pstmt.setString(3, courseCommentVO.getCcContent());

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
	public void update(CourseCommentVO courseCommentVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, courseCommentVO.getCcContent());
			pstmt.setString(2,courseCommentVO.getCcId());
			


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
	public void delete(String ccId) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);
			pstmt.setString(1, ccId);
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
	public List<CourseCommentVO> findByPrimaryKey(String xxxId) {
		List<CourseCommentVO> list = new ArrayList<CourseCommentVO>();
		CourseCommentVO courseCommentVO = null;

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
				courseCommentVO = new CourseCommentVO();
				courseCommentVO.setCcId(rs.getString("ccId"));
				courseCommentVO.setMemId(rs.getString("memId"));
				courseCommentVO.setInscId(rs.getString("inscId"));
				courseCommentVO.setCcContent(rs.getString("ccContent"));
				list.add(courseCommentVO); // Store the row in the list
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
	public List<CourseCommentVO> getAll() {
		List<CourseCommentVO> list = new ArrayList<CourseCommentVO>();
		CourseCommentVO courseCommentVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				courseCommentVO = new CourseCommentVO();
				courseCommentVO.setCcId(rs.getString("ccId"));
				courseCommentVO.setMemId(rs.getString("memId"));
				courseCommentVO.setInscId(rs.getString("inscId"));
				courseCommentVO.setCcContent(rs.getString("ccContent"));
				list.add(courseCommentVO); // Store the row in the list
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
		
		CourseCommentJDBCDAO dao=new CourseCommentJDBCDAO();
		
		// 新增
//		CourseCommentVO courseCommentVO1 = new CourseCommentVO();
//		courseCommentVO1.setMemId("weshare04");
//		courseCommentVO1.setInscId("IC00002");
//		courseCommentVO1.setCcContent("有附教材嗎？謝謝");
//		dao.insert(courseCommentVO1);
		
		// 更新
		CourseCommentVO courseCommentVO2 = new CourseCommentVO();
		courseCommentVO2.setCcId("CC00003");
		courseCommentVO2.setCcContent("8888");
		dao.update(courseCommentVO2);
		
		// 刪除
//		dao.delete("CC00004");
		

		// 查詢複合式查詢
//		List<CourseCommentVO> list = dao.findByPrimaryKey("IC00002");
//		for (CourseCommentVO courseCommentVO3 : list) {
//			System.out.println(courseCommentVO3.getCcId()+ ",");
//			System.out.println(courseCommentVO3.getMemId()+ ",");
//			System.out.println(courseCommentVO3.getInscId()+ ",");
//			System.out.println(courseCommentVO3.getCcContent()+ ",");
//			System.out.println("---------------------");

//		// 查詢全部
//		List<CourseCommentVO> list = dao.getAll();
//		for (CourseCommentVO courseCommentVO4 : list) {
//			System.out.println(courseCommentVO4.getCcId()+ ",");
//			System.out.println(courseCommentVO4.getMemId()+ ",");
//			System.out.println(courseCommentVO4.getInscId()+ ",");
//			System.out.println(courseCommentVO4.getCcContent()+ ",");
//			System.out.println("---------------------");
//		}
		
		
		
	}
	

	







}

	
