package android.com.coursetype.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class CourseTypeJDBCDAO implements CourseTypeDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "weshare";
	String passwd = "123456";
	
	final String INSERT_STMT = "INSERT INTO COURSETYPE VALUES(CourseType_seq.NEXTVAL,?)";
	final String UPDATE_STMT = "UPDATE COURSETYPE SET COURSETYPENAME=? WHERE COURSETYPEID=?";
	final String DELETE_COURSETYPE = "DELETE FROM COURSETYPE WHERE COURSETYPEID=?";
	final String SEARCH_COURSETYPE = "SELECT * FROM COURSETYPE WHERE COURSETYPEID=?";
	final String SEARCH_COURSEALL = "SELECT * FROM COURSETYPE";
	
	@Override
	public void insert(CourseTypeVO courseTypeVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, courseTypeVO.getCourseTypeName());
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
	public void update(CourseTypeVO courseTypeVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setString(1, courseTypeVO.getCourseTypeName());
			pstmt.setInt(2, courseTypeVO.getCourseTypeId());
			
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
	public void delete(Integer courseTypeId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			con.setAutoCommit(false);
			
			pstmt = con.prepareStatement(DELETE_COURSETYPE);
			
			pstmt.setInt(1, courseTypeId);
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
	public CourseTypeVO findByPrimaryKey(Integer courseTypeId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SEARCH_COURSETYPE);
			
			pstmt.setInt(1, courseTypeId);
			rs = pstmt.executeQuery();
			CourseTypeVO courseTypeVO = new CourseTypeVO(); 
			while(rs.next()) {
				courseTypeVO.setCourseTypeId(courseTypeId);
				courseTypeVO.setCourseTypeName(rs.getString("courseTypeName"));
			}
			return courseTypeVO;
			
			
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
	public List<CourseTypeVO> getAll() {
		List<CourseTypeVO> list = new ArrayList<CourseTypeVO>();
		CourseTypeVO CourseTypeVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SEARCH_COURSEALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CourseTypeVO = new CourseTypeVO();
				CourseTypeVO.setCourseTypeId(rs.getInt("CourseTypeId"));
				CourseTypeVO.setCourseTypeName(rs.getString("CourseTypeName"));
				list.add(CourseTypeVO);
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
			
			CourseTypeJDBCDAO courseTypeJDBCDAO = new CourseTypeJDBCDAO();
			
			
			
	//		//新增
	//		CourseTypeVO courseTypeVO1 =new CourseTypeVO();
	//		courseTypeVO1.setCourseTypeName("GGC");
	//		courseTypeJDBCDAO.insert(courseTypeVO1);
			
	//		//修改
	//		CourseTypeVO courseTypeVO2 = new CourseTypeVO();
	//		courseTypeVO2.setCourseTypeId(7);
	//		courseTypeVO2.setCourseTypeName("行笑");
	//		courseTypeJDBCDAO.update(courseTypeVO2);
			
	//		//刪除
	//		courseTypeJDBCDAO.delete(5);
			
	//		//查詢
	//		CourseTypeVO courseTypeVO3 = courseTypeJDBCDAO.findByPrimaryKey(9);
	//		System.out.println(courseTypeVO3.getCourseTypeId());
	//		System.out.println(courseTypeVO3.getCourseTypeName());
			
			//查詢全部
			List<CourseTypeVO> list = courseTypeJDBCDAO.getAll();
			for (CourseTypeVO aEmp : list) {
				System.out.println(aEmp.getCourseTypeId() + ",");
				System.out.println(aEmp.getCourseTypeName());
				System.out.println();
		}
	
	}
}
