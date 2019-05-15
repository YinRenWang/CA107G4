package android.com.coursetransfer.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CourseTransferJDBCDAO implements CourseTransferDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "weshare";
	String passwd = "123456";
	
	final String INSERT_STMT = "INSERT INTO COURSETRANSFER VALUES('CT'||LPAD(Course_seq.NEXTVAL,5,'0'),?,?,?,?,?)";
	final String UPDATE_STMT = "UPDATE COURSETRANSFER SET CTBUYER=?,OLDCRVID=?,NEWCRVID=?,CTDATE=?,CTPRICE=? WHERE CTID=?";
	final String DELETE_COURSETRANSFER = "DELETE FROM COURSETRANSFER WHERE CTID=?";;
	final String SEARCH_COURSETRANSFER = "SELECT * FROM COURSETRANSFER WHERE CTID=?";
	final String SEARCH_COURSETRANSFERALL = "SELECT * FROM COURSETRANSFER";
	
	
	@Override
	public void insert(CourseTransferVO courseTransferVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, courseTransferVO.getCtBuyer());
			pstmt.setString(2, courseTransferVO.getOldCrvId());
			pstmt.setString(3, courseTransferVO.getNewCrvId());
			pstmt.setTimestamp(4, courseTransferVO.getCtDate());
			pstmt.setInt(5, courseTransferVO.getCtPrice());
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
	public void update(CourseTransferVO courseTransferVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setString(1, courseTransferVO.getCtBuyer());
			pstmt.setString(2, courseTransferVO.getOldCrvId());
			pstmt.setString(3, courseTransferVO.getNewCrvId());
			pstmt.setTimestamp(4, courseTransferVO.getCtDate());
			pstmt.setInt(5, courseTransferVO.getCtPrice());
			pstmt.setString(6, courseTransferVO.getCtId());
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
 	public void delete(String courseTransferId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			con.setAutoCommit(false);
			
			pstmt = con.prepareStatement(DELETE_COURSETRANSFER);
			
			pstmt.setString(1, courseTransferId);
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
	public CourseTransferVO findByPrimaryKey(String courseTransferId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SEARCH_COURSETRANSFER);
			
			pstmt.setString(1, courseTransferId);
			rs = pstmt.executeQuery();
			CourseTransferVO courseTransferVO = new CourseTransferVO(); 
			while(rs.next()) {
				courseTransferVO.setCtId(courseTransferId);
				courseTransferVO.setCtBuyer(rs.getString("ctBuyer"));
				courseTransferVO.setOldCrvId(rs.getString("oldCrvId"));
				courseTransferVO.setNewCrvId(rs.getString("newCrvId"));
				courseTransferVO.setCtDate(rs.getTimestamp("ctDate"));
				courseTransferVO.setCtPrice(rs.getInt("ctPrice"));
			}
			return courseTransferVO;
			
			
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
	public List<CourseTransferVO> getAll() {
		List<CourseTransferVO> list = new ArrayList<CourseTransferVO>();
		CourseTransferVO courseTransferVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SEARCH_COURSETRANSFERALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				courseTransferVO = new CourseTransferVO();
				courseTransferVO.setCtId(rs.getString("ctId"));
				courseTransferVO.setCtBuyer(rs.getString("ctBuyer"));
				courseTransferVO.setOldCrvId(rs.getString("oldCrvId"));
				courseTransferVO.setNewCrvId(rs.getString("newCrvId"));
				courseTransferVO.setCtDate(rs.getTimestamp("ctDate"));
				courseTransferVO.setCtPrice(rs.getInt("ctPrice"));
				list.add(courseTransferVO);
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
		
		CourseTransferJDBCDAO courseTransferJDBCDAO = new CourseTransferJDBCDAO();
		
		
		
//		//新增
//		CourseTransferVO courseTransferVO1 =new CourseTransferVO();
//		courseTransferVO1.setCtBuyer("weshare01");
//		courseTransferVO1.setOldCrvId("CR00002");
//		courseTransferVO1.setNewCrvId("CR00001");
//		courseTransferVO1.setCtDate(new Timestamp(new java.util.Date().getTime()));
//		courseTransferVO1.setCtPrice(50505050);
//		courseTransferJDBCDAO.insert(courseTransferVO1);
		
//		//修改
//		CourseTransferVO courseTransferVO2 =new CourseTransferVO();
//		courseTransferVO2.setCtBuyer("weshare01");
//		courseTransferVO2.setOldCrvId("CR00002");
//		courseTransferVO2.setNewCrvId("CR00001");
//		courseTransferVO2.setCtDate(new Timestamp(new java.util.Date().getTime()));
//		courseTransferVO2.setCtPrice(50505050);
//		courseTransferVO2.setCtId("CT00002");
//		courseTransferJDBCDAO.update(courseTransferVO2);
		
//		//刪除
//		courseTransferJDBCDAO.delete("CT00001");
		
//		//查詢
//		CourseTransferVO courseTransferVO3 = courseTransferJDBCDAO.findByPrimaryKey("CT00001");
//		System.out.println("CourseId="+courseTransferVO3.getCtId());
//		System.out.println("ctBuyer="+courseTransferVO3.getCtBuyer());
//		System.out.println("oldCrvId="+courseTransferVO3.getOldCrvId());
//		System.out.println("newCrvId="+courseTransferVO3.getNewCrvId());
//		System.out.println("ctDate="+courseTransferVO3.getCtDate());
//		System.out.println("ctPrice="+courseTransferVO3.getCtPrice());
		
		//查詢全部
		List<CourseTransferVO> list = courseTransferJDBCDAO.getAll();
		for (CourseTransferVO aEmp : list) {
			System.out.println("CourseId="+aEmp.getCtId());
			System.out.println("ctBuyer="+aEmp.getCtBuyer());
			System.out.println("oldCrvId="+aEmp.getOldCrvId());
			System.out.println("newCrvId="+aEmp.getNewCrvId());
			System.out.println("ctDate="+aEmp.getCtDate());
			System.out.println("ctPrice="+aEmp.getCtPrice());
			System.out.println();
		}
		
	}

}