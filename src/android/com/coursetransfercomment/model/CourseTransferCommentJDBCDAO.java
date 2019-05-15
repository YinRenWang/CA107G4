package android.com.coursetransfercomment.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CourseTransferCommentJDBCDAO implements CourseTransferCommentDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "weshare";
	String passwd = "123456";
	
	final String INSERT_STMT = "INSERT INTO COURSETRANSFERCOMMENT VALUES('CM'||LPAD(Course_seq.NEXTVAL,5,'0'),?,?,?)";
	final String UPDATE_STMT = "UPDATE COURSETRANSFERCOMMENT SET CTID=?,MEMID=?,CTCCONTENT=? WHERE CTCID=?";
	final String DELETE_COURSETRANSFERCOMMENT = "DELETE FROM COURSETRANSFERCOMMENT WHERE CTCID=?";
	final String SEARCH_COURSETRANSFERCOMMENT = "SELECT * FROM COURSETRANSFERCOMMENT WHERE CTCID=?";
	final String SEARCH_COURSETRANSFERCOMMENTALL = "SELECT * FROM COURSETRANSFERCOMMENT";
	
	
	@Override
	public void insert(CourseTransferCommentVO courseTransferCommentVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, courseTransferCommentVO.getCtId());
			pstmt.setString(2, courseTransferCommentVO.getMemId());
			pstmt.setString(3, courseTransferCommentVO.getCtcContent());
			pstmt.executeUpdate();
			
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
	public void update(CourseTransferCommentVO courseTransferCommentVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setString(1, courseTransferCommentVO.getCtId());
			pstmt.setString(2, courseTransferCommentVO.getMemId());
			pstmt.setString(3, courseTransferCommentVO.getCtcContent());
			pstmt.setString(4, courseTransferCommentVO.getCtcId());
			pstmt.executeUpdate();
			
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
 	public void delete(String ctcId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			con.setAutoCommit(false);
			
			pstmt = con.prepareStatement(DELETE_COURSETRANSFERCOMMENT);
			
			pstmt.setString(1, ctcId);
			pstmt.executeUpdate();
			
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
	public CourseTransferCommentVO findByPrimaryKey(String ctcId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SEARCH_COURSETRANSFERCOMMENT);
			
			pstmt.setString(1, ctcId);
			rs = pstmt.executeQuery();
			CourseTransferCommentVO courseTransferCommentVO = new CourseTransferCommentVO(); 
			while(rs.next()) {
				courseTransferCommentVO.setCtcId(ctcId);
				courseTransferCommentVO.setCtId(rs.getString("ctId"));
				courseTransferCommentVO.setMemId(rs.getString("memId"));
				courseTransferCommentVO.setCtcContent(rs.getString("ctcContent"));
			}
			return courseTransferCommentVO;
			
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
	public List<CourseTransferCommentVO> getAll() {
		List<CourseTransferCommentVO> list = new ArrayList<CourseTransferCommentVO>();
		CourseTransferCommentVO courseTransferCommentVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SEARCH_COURSETRANSFERCOMMENTALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				courseTransferCommentVO = new CourseTransferCommentVO();
				courseTransferCommentVO.setCtcId(rs.getString("ctcId"));
				courseTransferCommentVO.setCtId(rs.getString("ctId"));
				courseTransferCommentVO.setMemId(rs.getString("memId"));
				courseTransferCommentVO.setCtcContent(rs.getString("ctcContent"));
				list.add(courseTransferCommentVO);
			}


		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());

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
	
	public static void main(String args[]) {
		
		CourseTransferCommentJDBCDAO courseTransferCommentJDBCDAO = new CourseTransferCommentJDBCDAO();
		
		
		
//		//新增
//		CourseTransferCommentVO courseTransferCommentVO1 =new CourseTransferCommentVO();
//		courseTransferCommentVO1.setCtId("CT00001");
//		courseTransferCommentVO1.setMemId("weshare02");
//		courseTransferCommentVO1.setCtcContent("法文jefargaregaergae");
//		courseTransferCommentJDBCDAO.insert(courseTransferCommentVO1);
		
//		//修改
//		CourseTransferCommentVO courseTransferCommentVO2 =new CourseTransferCommentVO();	
//		courseTransferCommentVO2.setCtcId("CM00001");
//		courseTransferCommentVO2.setCtId("CT00001");
//		courseTransferCommentVO2.setMemId("weshare02");
//		courseTransferCommentVO2.setCtcContent("法文jefargaregaergae");
//		courseTransferCommentJDBCDAO.update(courseTransferCommentVO2);
		
//		//刪除
//		courseTransferCommentJDBCDAO.delete("CM00001");
		
//		//查詢
//		CourseTransferCommentVO courseTransferCommentVO3 = courseTransferCommentJDBCDAO.findByPrimaryKey("CM00013");
//		System.out.println("ctcId="+courseTransferCommentVO3.getCtcId());
//		System.out.println("ctId="+courseTransferCommentVO3.getCtId());
//		System.out.println("memId="+courseTransferCommentVO3.getMemId());
//		System.out.println("ctcContent="+courseTransferCommentVO3.getCtcContent());
		
		//查詢全部
		List<CourseTransferCommentVO> list = courseTransferCommentJDBCDAO.getAll();
		for (CourseTransferCommentVO aEmp : list) {
			System.out.println("ctcId="+aEmp.getCtcId());
			System.out.println("ctId="+aEmp.getCtId());
			System.out.println("memId="+aEmp.getMemId());
			System.out.println("ctcContent="+aEmp.getCtcContent());
			System.out.println();
		}
		
	}

}
