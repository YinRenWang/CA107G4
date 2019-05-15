package android.com.course.model;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CourseJDBCDAO implements CourseDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "weshare";
	String passwd = "123456";
	
	final String INSERT_STMT = "INSERT INTO COURSE VALUES(LPAD(Course_seq.NEXTVAL,4,'0'),?,?)";
	final String UPDATE_STMT = "UPDATE COURSE SET COURSETYPEID=?,COURSENAME=? WHERE COURSEID=?";
	final String DELETE_COURSE = "DELETE FROM COURSE WHERE COURSEID=?";
	final String SEARCH_COURSE = "SELECT * FROM COURSE WHERE COURSEID=?";
	final String SEARCH_COURSEALL = "SELECT * FROM COURSE";
	
	
	@Override
	public void insert(CourseVO courseVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setInt(1, courseVO.getCourseTypeId());
			pstmt.setString(2, courseVO.getCourseName());
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
	public void update(CourseVO courseVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setInt(1, courseVO.getCourseTypeId());
			pstmt.setString(2, courseVO.getCourseName());
			pstmt.setString(3, courseVO.getCourseId());
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
 	public void delete(String courseId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			con.setAutoCommit(false);
			
			pstmt = con.prepareStatement(DELETE_COURSE);
			
			pstmt.setString(1, courseId);
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
	public CourseVO findByPrimaryKey(String courseId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SEARCH_COURSE);
			
			pstmt.setString(1, courseId);
			rs = pstmt.executeQuery();
			CourseVO courseVO = new CourseVO(); 
			while(rs.next()) {
				courseVO.setCourseId(courseId);
				courseVO.setCourseTypeId(rs.getInt("courseTypeId"));
				courseVO.setCourseName(rs.getString("courseName"));
			}
			return courseVO;
			
			
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
	
	}

	@Override
	public List<CourseVO> getAll() {
		List<CourseVO> list = new ArrayList<CourseVO>();
		CourseVO courseVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SEARCH_COURSEALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				courseVO = new CourseVO();
				courseVO.setCourseId(rs.getString("CourseId"));
				courseVO.setCourseTypeId(rs.getInt("CourseTypeId"));
				courseVO.setCourseName(rs.getString("CourseName"));
				list.add(courseVO);
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
		
		CourseJDBCDAO courseJDBCDAO = new CourseJDBCDAO();
		
		
		
//		//新增
//		CourseVO courseVO1 =new CourseVO();
//		courseVO1.setCourseTypeId(2);
//		courseVO1.setCourseName("法文");
//		courseJDBCDAO.insert(courseVO1);
		
//		//修改
//		CourseVO courseVO2 =new CourseVO();
//		courseVO2.setCourseId("0002");
//		courseVO2.setCourseTypeId(8);
//		courseVO2.setCourseName("JAVASCRIPT");
//		courseJDBCDAO.update(courseVO2);
		
//		//刪除
//		courseJDBCDAO.delete("0001");
		
//		//查詢
//		CourseVO courseVO3 = courseJDBCDAO.findByPrimaryKey("0005");
//		System.out.println("CourseId="+courseVO3.getCourseId());
//		System.out.println("CourseTypeId="+courseVO3.getCourseTypeId());
//		System.out.println("CourseName="+courseVO3.getCourseName());
//		
		//查詢全部
		List<CourseVO> list = courseJDBCDAO.getAll();
		for (CourseVO aEmp : list) {
			System.out.println(aEmp.getCourseId() + ",");
			System.out.println(aEmp.getCourseTypeId() + ",");
			System.out.println(aEmp.getCourseName() + ",");
			System.out.println();
		}
		
	}

	@Override
	public List<CourseVO> findByCourseType(Integer courseTypeId) {
		// TODO Auto-generated method stub
		return null;
	}

}
