package android.com.inscourse.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class InsCourseJDBCDAO implements InsCourseDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "weshare";
	String passwd = "123456";
	
	final String INSERT_STMT = "INSERT INTO INSCOURSE VALUES('IC'||LPAD(InsCourse_seq.NEXTVAL,5,'0'),?,?,?,?,?,?,?,?,?)";
	final String UPDATE_STMT = "UPDATE INSCOURSE SET TEACHERID=?,COURSEID=?,INSCLOC=?,INSCTYPE=?,INSCPEOPLE=?,INSCLANG=?,INSCPRICE=?,INSCCOURSER=?,INSCSTATUS=? WHERE INSCID=?";
	final String DELETE_COURSE = "DELETE FROM INSCOURSE WHERE INSCID=?";
	final String SEARCH_COURSE = "SELECT * FROM INSCOURSE WHERE INSCID=?";
	final String SEARCH_COURSEALL = "SELECT * FROM INSCOURSE";
	
	
	@Override
	public void insert(InsCourseVO insCourseVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, insCourseVO.getTeacherId());
			pstmt.setString(2, insCourseVO.getCourseId());
			pstmt.setString(3, insCourseVO.getInscLoc());
			pstmt.setInt(4, insCourseVO.getInscType());
			pstmt.setInt(5, insCourseVO.getInscPeople());
			pstmt.setString(6, insCourseVO.getInscLang());
			pstmt.setInt(7, insCourseVO.getInscPrice());
			pstmt.setString(8, insCourseVO.getInscCourser());
			pstmt.setInt(9, insCourseVO.getInscStatus());
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
	public void update(InsCourseVO insCourseVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setString(1, insCourseVO.getTeacherId());
			pstmt.setString(2, insCourseVO.getCourseId());
			pstmt.setString(3, insCourseVO.getInscLoc());
			pstmt.setInt(4, insCourseVO.getInscType());
			pstmt.setInt(5, insCourseVO.getInscPeople());
			pstmt.setString(6, insCourseVO.getInscLang());
			pstmt.setInt(7, insCourseVO.getInscPrice());
			pstmt.setString(8, insCourseVO.getInscCourser());
			pstmt.setInt(9, insCourseVO.getInscStatus());
			pstmt.setString(10, insCourseVO.getInscId());
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
 	public void delete(String inscId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			con.setAutoCommit(false);
			
			pstmt = con.prepareStatement(DELETE_COURSE);
			
			pstmt.setString(1, inscId);
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
	public InsCourseVO findByPrimaryKey(String inscId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SEARCH_COURSE);
			
			pstmt.setString(1, inscId);
			rs = pstmt.executeQuery();
			InsCourseVO insCourseVO = new InsCourseVO(); 
			while(rs.next()) {
				insCourseVO.setInscId(inscId);
				insCourseVO.setTeacherId(rs.getString("teacherId"));
				insCourseVO.setCourseId(rs.getString("courseId"));
				insCourseVO.setInscLoc(rs.getString("inscLoc"));
				insCourseVO.setInscType(rs.getInt("inscType"));
				insCourseVO.setInscPeople(rs.getInt("inscPeople"));
				insCourseVO.setInscLang(rs.getString("inscLang"));
				insCourseVO.setInscPrice(rs.getInt("inscPrice"));
				insCourseVO.setInscCourser(rs.getString("inscCourser"));
				insCourseVO.setInscStatus(rs.getInt("inscStatus"));
			}
			return insCourseVO;
			
			
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
	public List<InsCourseVO> getAll() {
		List<InsCourseVO> list = new ArrayList<InsCourseVO>();
		InsCourseVO insCourseVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SEARCH_COURSEALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				insCourseVO = new InsCourseVO();
				insCourseVO.setInscId(rs.getString("inscId"));
				insCourseVO.setTeacherId(rs.getString("teacherId"));
				insCourseVO.setCourseId(rs.getString("courseId"));
				insCourseVO.setInscLoc(rs.getString("inscLoc"));
				insCourseVO.setInscType(rs.getInt("inscType"));
				insCourseVO.setInscPeople(rs.getInt("inscPeople"));
				insCourseVO.setInscLang(rs.getString("inscLang"));
				insCourseVO.setInscPrice(rs.getInt("inscPrice"));
				insCourseVO.setInscCourser(rs.getString("inscCourser"));
				insCourseVO.setInscStatus(rs.getInt("inscStatus"));
				list.add(insCourseVO);
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
		
		InsCourseJDBCDAO InsCourseJDBCDAO = new InsCourseJDBCDAO();
		
		
		
//		//新增
//		InsCourseVO InsCourseVO1 =new InsCourseVO();
//		InsCourseVO1.setTeacherId("TC00004");
//		InsCourseVO1.setCourseId("0007");
//		InsCourseVO1.setInscLoc("日本東京");
//		InsCourseVO1.setInscType(1);
//		InsCourseVO1.setInscPeople(10);
//		InsCourseVO1.setInscLang("越南文");
//		InsCourseVO1.setInscPrice(90000);
//		InsCourseVO1.setInscCourser("大家都進來吧");
//		InsCourseVO1.setInscStatus(1);
//		InsCourseJDBCDAO.insert(InsCourseVO1);
		
//		//修改
//		InsCourseVO InsCourseVO2 =new InsCourseVO();		
//		InsCourseVO2.setInscId("IC00002");
//		InsCourseVO2.setTeacherId("TC00001");
//		InsCourseVO2.setCourseId("0005");
//		InsCourseVO2.setInscLoc("日本東京");
//		InsCourseVO2.setInscType(1);
//		InsCourseVO2.setInscPeople(10);
//		InsCourseVO2.setInscLang("越南文");
//		InsCourseVO2.setInscPrice(100000);
//		InsCourseVO2.setInscCourser("大家都進來吧");
//		InsCourseVO2.setInscStatus(1);
//		InsCourseJDBCDAO.update(InsCourseVO2);
		
//		//刪除
//		InsCourseJDBCDAO.delete("IC00001");
		
//		//查詢
//		InsCourseVO InsCourseVO3 = InsCourseJDBCDAO.findByPrimaryKey("IC00001");
//		System.out.println("InscId="+InsCourseVO3.getInscId());
//		System.out.println("InscId="+InsCourseVO3.getTeacherId());
//		System.out.println("CourseId="+InsCourseVO3.getCourseId());
//		System.out.println("InscLoc="+InsCourseVO3.getInscLoc());
//		System.out.println("InscType="+InsCourseVO3.getInscType());
//		System.out.println("InscPeople="+InsCourseVO3.getInscPeople());
//		System.out.println("InscLang="+InsCourseVO3.getInscLang());
//		System.out.println("InscPrice="+InsCourseVO3.getInscPrice());
//		System.out.println("InscCourser="+InsCourseVO3.getInscCourser());
//		System.out.println("InscStatus="+InsCourseVO3.getInscStatus());
		
		//查詢全部
		List<InsCourseVO> list = InsCourseJDBCDAO.getAll();
		for (InsCourseVO aEmp : list) {
			System.out.println("InscId="+aEmp.getInscId());
			System.out.println("InscId="+aEmp.getTeacherId());
			System.out.println("CourseId="+aEmp.getCourseId());
			System.out.println("InscLoc="+aEmp.getInscLoc());
			System.out.println("InscType="+aEmp.getInscType());
			System.out.println("InscPeople="+aEmp.getInscPeople());
			System.out.println("InscLang="+aEmp.getInscLang());
			System.out.println("InscPrice="+aEmp.getInscPrice());
			System.out.println("InscCourser="+aEmp.getInscCourser());
			System.out.println("InscStatus="+aEmp.getInscStatus());
			System.out.println();
		}
		
	}


	@Override
	public void updateStatus(InsCourseVO insCourseVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<InsCourseVO> findByCourse(String courseId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<InsCourseVO> findByTeacher(String teacherId) {
		// TODO Auto-generated method stub
		return null;
	}

}

