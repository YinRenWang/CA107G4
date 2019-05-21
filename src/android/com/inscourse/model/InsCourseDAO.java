package android.com.inscourse.model;

import java.util.List;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class InsCourseDAO implements InsCourseDAO_interface {
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	final String INSERT_STMT = "INSERT INTO INSCOURSE VALUES('IC'||LPAD(InsCourse_seq.NEXTVAL,5,'0'),?,?,?,?,?,?,?,?,?)";
	final String UPDATE_STMT = "UPDATE INSCOURSE SET TEACHERID=?,COURSEID=?,INSCLOC=?,INSCTYPE=?,INSCPEOPLE=?,INSCLANG=?,INSCPRICE=?,INSCCOURSER=?,INSCSTATUS=? WHERE INSCID=?";
	final String DELETE_COURSE = "DELETE FROM INSCOURSE WHERE INSCID=?";

	final String SEARCH_COURSE = "SELECT * FROM INSCOURSE WHERE INSCID=?";
	final String SEARCH_COURSEALL = "SELECT * FROM INSCOURSE";
	final String UPDATE_STATUS = "UPDATE INSCOURSE SET INSCSTATUS=? WHERE INSCID=?";
	final String FIND_BY_COURSE = "SELECT * FROM INSCOURSE WHERE COURSEID=?";
	final String FIND_BY_TEACHER = "SELECT * FROM INSCOURSE WHERE TEACHERID=?";
	
	@Override
	public void insert(InsCourseVO insCourseVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
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
			
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}finally {
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
			con = ds.getConnection();
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
			
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}finally {
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
			con = ds.getConnection();
			con.setAutoCommit(false);
			
			pstmt = con.prepareStatement(DELETE_COURSE);
			
			pstmt.setString(1, inscId);
			pstmt.executeUpdate();
			
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}finally {
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
			con = ds.getConnection();
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
			
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}finally {
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
	public List<InsCourseVO> getAll() {

		List<InsCourseVO> list = new ArrayList<InsCourseVO>();
		InsCourseVO insCourseVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
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
			
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}finally {
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
	public void updateStatus(InsCourseVO insCourseVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STATUS);
			
			pstmt.setInt(1, insCourseVO.getInscStatus());
			pstmt.setString(2, insCourseVO.getInscId());
			pstmt.executeUpdate();
			
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}finally {
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
	public List<InsCourseVO> findByCourse(String courseId) {
		List<InsCourseVO> list = new ArrayList<InsCourseVO>();
		InsCourseVO insCourseVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FIND_BY_COURSE);
			
			pstmt.setString(1, courseId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
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
			
			
			
			
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}finally {
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
	public List<InsCourseVO> findByTeacher(String teacherId) {
		List<InsCourseVO> list = new ArrayList<InsCourseVO>();
		InsCourseVO insCourseVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FIND_BY_TEACHER);
			
			pstmt.setString(1, teacherId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
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
			
			
			
			
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}finally {
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
	
	
}
