package com.coursetype.model;

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

public class CourseTypeDAO implements CourseTypeDAO_interface {
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

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
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, courseTypeVO.getCourseTypeName());
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
	public void update(CourseTypeVO courseTypeVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setString(1, courseTypeVO.getCourseTypeName());
			pstmt.setInt(2, courseTypeVO.getCourseTypeId());
			
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
	public void delete(Integer courseTypeId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			con.setAutoCommit(false);
			
			pstmt = con.prepareStatement(DELETE_COURSETYPE);
			
			pstmt.setInt(1, courseTypeId);
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
	public CourseTypeVO findByPrimaryKey(Integer courseTypeId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(SEARCH_COURSETYPE);
			
			pstmt.setInt(1, courseTypeId);
			rs = pstmt.executeQuery();
			CourseTypeVO courseTypeVO = new CourseTypeVO(); 
			while(rs.next()) {
				courseTypeVO.setCourseTypeId(courseTypeId);
				courseTypeVO.setCourseTypeName(rs.getString("courseTypeName"));
			}
			return courseTypeVO;
			
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
	public List<CourseTypeVO> getAll() {
		List<CourseTypeVO> list = new ArrayList<>();
		CourseTypeVO CourseTypeVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(SEARCH_COURSEALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CourseTypeVO = new CourseTypeVO();
				CourseTypeVO.setCourseTypeId(rs.getInt("CourseTypeId"));
				CourseTypeVO.setCourseTypeName(rs.getString("CourseTypeName"));
				list.add(CourseTypeVO);
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
}