package com.teacher.model;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.inscoursetime.model.InsCourseTimeVO;



public class TeacherJDBCDAO implements TeacherDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
//	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String url = "jdbc:oracle:thin:@localhost:49161:XE";
	String userid = "weshare";
	String passwd = "123456";
	
	final String INSERT_STMT = "INSERT INTO TEACHER VALUES('TC'||LPAD(TEACHER_seq.NEXTVAL,5,'0'),?,?,?,?,?,?)";
	final String UPDATE_STMT = "UPDATE TEACHER SET MEMID=?,TEACHERSTATUS=?,TEACHERCITY=?,TEACHEREDU=?,DIPLOMAIMG=?,TEACHERTEXT=? WHERE TEACHERID=?";
	final String UPDATE_STATUS = "UPDATE TEACHER SET TEACHERSTATUS=? WHERE TEACHERID=?";
	final String DELETE_TEACHER = "DELETE FROM TEACHER WHERE TEACHERID=?";
	final String SEARCH_TEACHER = "SELECT * FROM TEACHER where (case when teacherId=? then 1 else 0 end+ case when memId=? then 1 else 0 end)>=1";
	final String SEARCH_MEMID = "SELECT TEACHERSTATUS FROM TEACHER WHERE MEMID=?";
	final String SEARCH_TEACHERALL = "SELECT * FROM TEACHER";
	final String SEARCH_STATUS= "SELECT * FROM Teacher WHERE teacherStatus=?";
	
	
	@Override
	public void insert(TeacherVO teacherVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, teacherVO.getMemId());
			pstmt.setInt(2, teacherVO.getTeacherStatus());
			pstmt.setString(3, teacherVO.getTeacherCity());
			pstmt.setString(4, teacherVO.getTeacherEdu());
			pstmt.setBytes(5,teacherVO.getDiplomaImg());
			pstmt.setString(6,teacherVO.getTeacherText());
			
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
	public void updateStatus(Integer teacherStatus, String teacherId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_STATUS);
			pstmt.setInt(1, teacherStatus);
			pstmt.setString(2, teacherId);
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
	public void update(TeacherVO teacherVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setString(1, teacherVO.getMemId());
			pstmt.setInt(2, teacherVO.getTeacherStatus());
			pstmt.setString(3, teacherVO.getTeacherCity());
			pstmt.setString(4, teacherVO.getTeacherEdu());
			pstmt.setBytes(5,teacherVO.getDiplomaImg());
			pstmt.setString(6,teacherVO.getTeacherText());
			pstmt.setString(7, teacherVO.getTeacherId());
			
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
 	public void delete(String teacherId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			con.setAutoCommit(false);
			
			pstmt = con.prepareStatement(DELETE_TEACHER);
			
			pstmt.setString(1, teacherId);
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
	public TeacherVO findByPrimaryKey(String xxxId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SEARCH_TEACHER);
			
			pstmt.setString(1, xxxId);
			pstmt.setString(2, xxxId);
			rs = pstmt.executeQuery();
			TeacherVO TeacherVO = new TeacherVO(); 
			while(rs.next()) {
				TeacherVO.setTeacherId(rs.getString("teacherId"));
				TeacherVO.setMemId(rs.getString("memId"));
				TeacherVO.setTeacherStatus(rs.getInt("teacherStatus"));
				TeacherVO.setTeacherCity(rs.getString("teacherCity"));
				TeacherVO.setTeacherEdu(rs.getString("teacherEdu"));
				TeacherVO.setDiplomaImg(rs.getBytes("diplomaImg"));
				TeacherVO.setTeacherText(rs.getString("teacherText"));
				
			}
			return TeacherVO;
			
			
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
	public List<TeacherVO> getAll() {
		List<TeacherVO> list = new ArrayList<TeacherVO>();
		TeacherVO TeacherVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SEARCH_TEACHERALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				TeacherVO = new TeacherVO();
				TeacherVO.setTeacherId(rs.getString("teacherId"));
				TeacherVO.setMemId(rs.getString("memId"));
				TeacherVO.setTeacherStatus(rs.getInt("teacherStatus"));
				TeacherVO.setTeacherCity(rs.getString("teacherCity"));
				TeacherVO.setTeacherEdu(rs.getString("teacherEdu"));
				TeacherVO.setDiplomaImg(rs.getBytes("diplomaImg"));
		
				TeacherVO.setTeacherText(rs.getString("teacherText"));
				
				list.add(TeacherVO);
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
	
	@Override
	public TeacherVO findByStatus(String memId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SEARCH_MEMID);
			
			pstmt.setString(1, memId);
			rs = pstmt.executeQuery();
			TeacherVO TeacherVO = new TeacherVO(); 
			while(rs.next()) {
				TeacherVO.setTeacherStatus(rs.getInt("teacherStatus"));		
			}
			
			return TeacherVO;
			
			
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
	public List<TeacherVO> getAllStatus(Integer teacherStatus) {
		List<TeacherVO> list = new ArrayList<TeacherVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		TeacherVO TeacherVO=null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SEARCH_STATUS);
			pstmt.setInt(1, teacherStatus);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				TeacherVO = new TeacherVO();
				TeacherVO.setTeacherId(rs.getString("teacherId"));
				TeacherVO.setMemId(rs.getString("memId"));
				TeacherVO.setTeacherCity(rs.getString("teacherCity"));
				TeacherVO.setTeacherEdu(rs.getString("teacherEdu"));
				TeacherVO.setDiplomaImg(rs.getBytes("diplomaImg"));
				TeacherVO.setTeacherText(rs.getString("teacherText"));
				list.add(TeacherVO);
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
	
	public static void main(String args[]) {
		
		TeacherJDBCDAO TeacherJDBCDAO = new TeacherJDBCDAO();
		
	
//		byte[] pic = null;
//		try {
//			pic = getFileByteArray("items/Teacher1.jpg");
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
			
		
//		//新增
//		TeacherVO TeacherVO1 =new TeacherVO();
//		TeacherVO1.setMemId("weshare01");
//		TeacherVO1.setTeacherStatus(0);
//		TeacherVO1.setTeacherCity("上海");
//		TeacherVO1.setTeacherEdu("大學");
//		TeacherVO1.setIdCardImg(pic);
//		TeacherVO1.setDiplomaImg(pic);
//		TeacherVO1.setTeacherText("拉拉拉拉拉");
//		TeacherJDBCDAO.insert(TeacherVO1);
		
//		//修改
//		TeacherVO TeacherVO2 =new TeacherVO();
//		TeacherVO2.setTeacherId("TC00001");
//		TeacherVO2.setMemId("weshare02");
//		TeacherVO2.setTeacherStatus(0);
//		TeacherVO2.setTeacherCity("上海");
//		TeacherVO2.setTeacherEdu("大學");
//		TeacherVO2.setIdCardImg(pic);
//		TeacherVO2.setDiplomaImg(pic);
//		TeacherVO2.setTeacherText("拉拉拉拉拉");
//		TeacherJDBCDAO.update(TeacherVO2);
		
//		//刪除
		TeacherJDBCDAO.updateStatus(2, "TC00004");
		
//		//查詢
		TeacherVO TeacherVO3 = TeacherJDBCDAO.findByPrimaryKey("weshare01");
		System.out.println("TeacherId="+TeacherVO3.getTeacherId());
		System.out.println("MemId="+TeacherVO3.getMemId());
		System.out.println("TeacherStatus="+TeacherVO3.getTeacherStatus());
		System.out.println("TeacherCity="+TeacherVO3.getTeacherCity());
		System.out.println("DiplomaImg="+TeacherVO3.getDiplomaImg());
		System.out.println("TeacherEdu="+TeacherVO3.getTeacherEdu());
		System.out.println("TeacherText="+TeacherVO3.getTeacherText());

		//查詢全部
		List<TeacherVO> list = TeacherJDBCDAO.getAllStatus(1);
		for (TeacherVO aEmp : list) {
			System.out.println("TeacherId="+aEmp.getTeacherId());
			System.out.println("MemId="+aEmp.getMemId());
			System.out.println("TeacherCity="+aEmp.getTeacherCity());
			System.out.println("TeacherEdu="+aEmp.getTeacherEdu());
			System.out.println("TeacherText="+aEmp.getTeacherText());
		}
	
	}
		
	public static byte[] getFileByteArray(String path) throws IOException {
		File file = new File(path);
		FileInputStream fis = new FileInputStream(file);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] buffer = new byte[8192];
		int i;
		while ((i = fis.read(buffer)) != -1) {
			baos.write(buffer, 0, i);
		}
		baos.close();
		fis.close();
		return baos.toByteArray();
	}


	@Override
	public TeacherVO findByMemId(String memId) {
		// TODO Auto-generated method stub
		return null;
	}








}




