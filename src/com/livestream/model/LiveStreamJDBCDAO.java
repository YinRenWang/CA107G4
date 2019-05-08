package com.livestream.model;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LiveStreamJDBCDAO implements LiveStreamDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "weshare";
	String passwd = "123456";
	
	final String INSERT_STMT = "INSERT INTO LIVESTREAM VALUES('LV'||LPAD(Course_seq.NEXTVAL,5,'0'),?,?,?,?)";
	final String UPDATE_STMT = "UPDATE LIVESTREAM SET TEACHERID=?,LSDATE=?,LSVIEWNUM=?,LSCONTENT=? WHERE LSID=?";
	final String DELETE_LIVESTREAM = "DELETE FROM LIVESTREAM WHERE LSID=?";
	final String SEARCH_LIVESTREAM = "SELECT * FROM LIVESTREAM WHERE LSID=?";
	final String SEARCH_LIVESTREAMALL = "SELECT * FROM LIVESTREAM";
	
	
	@Override
	public void insert(LiveStreamVO liveStreamVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, liveStreamVO.getTeacherId());
			pstmt.setTimestamp(2, liveStreamVO.getLsDate());
			pstmt.setInt(3, liveStreamVO.getLsViewNum());
			pstmt.setBytes(4, liveStreamVO.getLsContent());
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
	public void update(LiveStreamVO liveStreamVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setString(1, liveStreamVO.getTeacherId());
			pstmt.setTimestamp(2, liveStreamVO.getLsDate());
			pstmt.setInt(3, liveStreamVO.getLsViewNum());
			pstmt.setBytes(4, liveStreamVO.getLsContent());
			pstmt.setString(5, liveStreamVO.getLsId());
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
 	public void delete(String lsId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			con.setAutoCommit(false);
			
			pstmt = con.prepareStatement(DELETE_LIVESTREAM);
			
			pstmt.setString(1, lsId);
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
	public LiveStreamVO findByPrimaryKey(String lsId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SEARCH_LIVESTREAM);
			
			pstmt.setString(1, lsId);
			rs = pstmt.executeQuery();
			LiveStreamVO liveStreamVO = new LiveStreamVO(); 
			while(rs.next()) {
				liveStreamVO.setLsId(lsId);
				liveStreamVO.setTeacherId(rs.getString("teacherId"));
				liveStreamVO.setLsDate(rs.getTimestamp("lsDate"));
				liveStreamVO.setLsViewNum(rs.getInt("lsViewNum"));
				liveStreamVO.setLsContent(rs.getBytes("lsContent"));
			}
			return liveStreamVO;
			
			
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
	public List<LiveStreamVO> getAll() {
		List<LiveStreamVO> list = new ArrayList<LiveStreamVO>();
		LiveStreamVO liveStreamVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SEARCH_LIVESTREAMALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				liveStreamVO = new LiveStreamVO();
				liveStreamVO.setLsId(rs.getString("lsId"));
				liveStreamVO.setTeacherId(rs.getString("teacherId"));
				liveStreamVO.setLsDate(rs.getTimestamp("lsDate"));
				liveStreamVO.setLsViewNum(rs.getInt("lsViewNum"));
				liveStreamVO.setLsContent(rs.getBytes("lsContent"));
				list.add(liveStreamVO);
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
		
		LiveStreamJDBCDAO liveStreamJDBCDAO = new LiveStreamJDBCDAO();
		
		byte[] pic = null;
		try {
			pic = getFileByteArray("items/Teacher1.jpg");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
//		//新增
//		LiveStreamVO liveStreamVO1 =new LiveStreamVO();
//		liveStreamVO1.setTeacherId("TC00001");
//		liveStreamVO1.setLsDate(new Timestamp(new java.util.Date().getTime()));
//		liveStreamVO1.setLsViewNum(1000);
//		liveStreamVO1.setLsContent(pic);
//		liveStreamJDBCDAO.insert(liveStreamVO1);
		
//		//修改
//		LiveStreamVO liveStreamVO2 =new LiveStreamVO();
//		liveStreamVO2.setLsId("LV00001");
//		liveStreamVO2.setTeacherId("TC00001");
//		liveStreamVO2.setLsDate(new Timestamp(new java.util.Date().getTime()));
//		liveStreamVO2.setLsViewNum(1000);
//		liveStreamVO2.setLsContent(pic);
//		liveStreamJDBCDAO.update(liveStreamVO2);
		
//		//刪除
//		liveStreamJDBCDAO.delete("TC00001");
		
		//查詢
		LiveStreamVO liveStreamVO3 = liveStreamJDBCDAO.findByPrimaryKey("LV00010");
		System.out.println("LsId="+liveStreamVO3.getLsId());
		System.out.println("TeacherId="+liveStreamVO3.getTeacherId());
		System.out.println("LsDate="+liveStreamVO3.getLsDate());
		System.out.println("LsViewNum="+liveStreamVO3.getLsViewNum());
		System.out.println("LsContent="+liveStreamVO3.getLsContent());
		
		//查詢全部
		List<LiveStreamVO> list = liveStreamJDBCDAO.getAll();
		for (LiveStreamVO aEmp : list) {
			System.out.println("LsId="+aEmp.getLsId());
			System.out.println("TeacherId="+aEmp.getTeacherId());
			System.out.println("LsDate="+aEmp.getLsDate());
			System.out.println("LsViewNum="+aEmp.getLsViewNum());
			System.out.println("LsContent="+aEmp.getLsContent());
			System.out.println();
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

}
