package com.teacher.model;

import java.io.IOException;
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

public class TeacherDAO implements TeacherDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	final String INSERT_STMT = "INSERT INTO TEACHER VALUES('TC'||LPAD(TEACHER_seq.NEXTVAL,5,'0'),?,?,?,?,?,?,?)";
	final String UPDATE_STMT = "UPDATE TEACHER SET MEMID=?,TEACHERSTATUS=?,TEACHERCITY=?,TEACHEREDU=?,IDCARDIMG=?,DIPLOMAIMG=?,TEACHERTEXT=? WHERE TEACHERID=?";
	final String DELETE_TEACHER = "DELETE FROM TEACHER WHERE TEACHERID=?";
	final String SEARCH_TEACHER = "SELECT * FROM TEACHER WHERE TEACHERID=?";
	final String SEARCH_TEACHERALL = "SELECT * FROM TEACHER";
	

	@Override
	public void insert(TeacherVO teacherVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, teacherVO.getMemId());
			pstmt.setInt(2, teacherVO.getTeacherStatus());
			pstmt.setString(3, teacherVO.getTeacherCity());
			pstmt.setString(4, teacherVO.getTeacherEdu());
			pstmt.setBytes(5,teacherVO.getIdCardImg());
			pstmt.setBytes(6,teacherVO.getDiplomaImg());
			pstmt.setString(7,teacherVO.getTeacherText());
			
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
	public void update(TeacherVO teacherVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setString(1, teacherVO.getMemId());
			pstmt.setInt(2, teacherVO.getTeacherStatus());
			pstmt.setString(3, teacherVO.getTeacherCity());
			pstmt.setString(4, teacherVO.getTeacherEdu());
			pstmt.setBytes(5,teacherVO.getIdCardImg());
			pstmt.setBytes(6,teacherVO.getDiplomaImg());
			pstmt.setString(7,teacherVO.getTeacherText());
			pstmt.setString(8, teacherVO.getTeacherId());
			
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
	public void delete(String teacherId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			con.setAutoCommit(false);
			
			pstmt = con.prepareStatement(DELETE_TEACHER);
			
			pstmt.setString(1, teacherId);
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
	public TeacherVO findByPrimaryKey(String teacherId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(SEARCH_TEACHER);
			
			pstmt.setString(1, teacherId);
			rs = pstmt.executeQuery();
			TeacherVO TeacherVO = new TeacherVO(); 
			while(rs.next()) {
				TeacherVO.setTeacherId(teacherId);
				TeacherVO.setMemId(rs.getString("memId"));
				TeacherVO.setTeacherStatus(rs.getInt("teacherStatus"));
				TeacherVO.setTeacherCity(rs.getString("teacherCity"));
				TeacherVO.setTeacherEdu(rs.getString("teacherEdu"));
				try {
					TeacherVO.setIdCardImg(new byte[rs.getBinaryStream("idCardImg").available()]);
					TeacherVO.setDiplomaImg(new byte[rs.getBinaryStream("diplomaImg").available()]);
				} catch (IOException e) {
					e.printStackTrace();
				}
				TeacherVO.setTeacherText(rs.getString("teacherText"));
				
			}
			return TeacherVO;
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
	public List<TeacherVO> getAll() {
		List<TeacherVO> list = new ArrayList<TeacherVO>();
		TeacherVO TeacherVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(SEARCH_TEACHERALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				TeacherVO = new TeacherVO();
				TeacherVO.setTeacherId(rs.getString("teacherId"));
				TeacherVO.setMemId(rs.getString("memId"));
				TeacherVO.setTeacherStatus(rs.getInt("teacherStatus"));
				TeacherVO.setTeacherCity(rs.getString("teacherCity"));
				TeacherVO.setTeacherEdu(rs.getString("teacherEdu"));
				try {
					TeacherVO.setIdCardImg(new byte[rs.getBinaryStream("idCardImg").available()]);
					TeacherVO.setDiplomaImg(new byte[rs.getBinaryStream("diplomaImg").available()]);
				} catch (IOException e) {
					e.printStackTrace();
				}
				TeacherVO.setTeacherText(rs.getString("teacherText"));
				
				list.add(TeacherVO);
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
