package com.joingroup.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.member.model.MemberVO;
import com.teacher.model.TeacherVO;





public class JoinGroupJDBCDAO implements JoinGroupDAO_interface {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "WESHARE";
	String passwd = "123456";

	private static final String INSERT_GOINGROUP = "INSERT INTO JoinGroup (memId,teamId) VALUES (?,?)";
	private static final String GET_ONE_STMT = "SELECT * FROM JOINGROUP where MEMID=?";
	private static final String GET_ONE_ONLY = "SELECT * FROM JOINGROUP where MEMID=? and TEAMID=?";
	private static final String GET_TEAMONE_STMT = "SELECT * FROM JOINGROUP where TeamId=?";
	private static final String GET_ALL_STMT = "SELECT memId,teamId FROM joinGroup order by memId";
	private static final String UPDATE = "UPDATE JoinGroup set memid=?, teamId=? where memid = ?";
	private static final String DELETE = 
			"DELETE FROM JoinGroup where memid = ? And teamId = ?";
	
	@Override
	public void insert(JoinGroupVO joinGroupVO){
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_GOINGROUP);

			pstmt.setString(1, joinGroupVO.getMemId());
			pstmt.setString(2, joinGroupVO.getTeamId());
			pstmt.executeUpdate();
	

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			System.out.println("1");
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			System.out.println("2");
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
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
	public List<JoinGroupVO> findByPrimaryKey(String memId) {
		List<JoinGroupVO> list = new ArrayList<JoinGroupVO>();
		JoinGroupVO joinGroupVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);

			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setString(1, memId);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {

				joinGroupVO = new JoinGroupVO();
				joinGroupVO.setMemId(rs.getString("memId"));
				joinGroupVO.setTeamId(rs.getString("teamId"));
				
				list.add(joinGroupVO);
			}

			// Handle any driver errors
		} catch (Exception se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
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
	public List<JoinGroupVO> findByTeamId(String teamId) {
		List<JoinGroupVO> list = new ArrayList<JoinGroupVO>();
		JoinGroupVO joinGroupVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);

			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_TEAMONE_STMT);
			pstmt.setString(1, teamId);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {

				joinGroupVO = new JoinGroupVO();
				joinGroupVO.setMemId(rs.getString("memId"));
				joinGroupVO.setTeamId(rs.getString("teamId"));
				
				list.add(joinGroupVO);
			}

			// Handle any driver errors
		} catch (Exception se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
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
	public List<JoinGroupVO> getAll() {
		List<JoinGroupVO> list = new ArrayList<JoinGroupVO>();
		JoinGroupVO joinGroupVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				joinGroupVO = new JoinGroupVO();
				joinGroupVO.setMemId(rs.getString("memId"));
				joinGroupVO.setTeamId(rs.getString("teamId"));

				list.add(joinGroupVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
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
		public void delete(String memId,String teamId) {

			Connection con = null;
			PreparedStatement pstmt = null;

			try {

				Class.forName(driver);
				con = DriverManager.getConnection(url, userid, passwd);
				pstmt = con.prepareStatement(DELETE);

				pstmt.setString(1, memId);
				pstmt.setString(2, teamId);
				pstmt.executeUpdate();

				// Handle any driver errors
			} catch (ClassNotFoundException e) {
				throw new RuntimeException("Couldn't load database driver. "
						+ e.getMessage());
				// Handle any SQL errors
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
				// Clean up JDBC resources
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
		public JoinGroupVO findById(String memId, String teamId) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			JoinGroupVO joinGroupVO =new JoinGroupVO();


			try {

				Class.forName(driver);
				con = DriverManager.getConnection(url, userid, passwd);
				pstmt = con.prepareStatement(GET_ONE_ONLY);
				
				pstmt.setString(1, memId);
				pstmt.setString(2, teamId);
				
				rs = pstmt.executeQuery();


				while (rs.next()) {
					joinGroupVO = new JoinGroupVO();
					joinGroupVO.setMemId(rs.getString("memId"));
					joinGroupVO.setTeamId(rs.getString("teamId"));
				}

				// Handle any driver errors
			}
			catch (ClassNotFoundException e) {
				throw new RuntimeException("Couldn't load database driver. "
						+ e.getMessage());
				// Handle any SQL errors
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
				// Clean up JDBC resources
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
			return joinGroupVO;
			
		}

	public static void main(String[] args) {
		JoinGroupJDBCDAO dao = new JoinGroupJDBCDAO();
////
//		JoinGroupVO JoinGroupVO3 = new JoinGroupVO();
//		JoinGroupVO3.setMemId("weshare02");
//		JoinGroupVO3.setTeamId("TM00002");
//		dao.insert(JoinGroupVO3);
//		System.out.println("------以新增資料---------");
		
//		JoinGroupVO JoinGroupVO3 = new JoinGroupVO();
//		JoinGroupVO3=dao.findById("weshare02", "TM00002");
//		System.out.println(JoinGroupVO3);
		
		
//
//		JoinGroupVO JoinGroupVO1 = dao.findByPrimaryKey("weshare01");
//		System.out.print(JoinGroupVO1.getMemId() + ",");
//		System.out.println(JoinGroupVO1.getTeamId() + ",");
//
//		System.out.println("---------------------");
//
//		List<JoinGroupVO> list = dao.getAll();
//		for (JoinGroupVO JoinGroupV02 : list) {
//			System.out.print(JoinGroupV02.getMemId() + ",");
//			System.out.println(JoinGroupV02.getTeamId());
//			System.out.println();
//			
//			System.out.println("---------------------");
//			
//			dao.delete("weshare01","TM00002");
//			
//			System.out.println("---------------------");
//			
			
//			List<JoinGroupVO> list = dao.findByPrimaryKey("weshare04");
//			for (JoinGroupVO JoinGroupV05 : list) {
//				System.out.print(JoinGroupV05.getMemId() + ",");
//				System.out.println(JoinGroupV05.getTeamId());
//				System.out.println();
				
				List<JoinGroupVO> list = dao.findByTeamId("TM00003");
				for (JoinGroupVO JoinGroupV06 : list) {
					System.out.print(JoinGroupV06.getTeamId() + ",");
					System.out.println(JoinGroupV06.getMemId());
					System.out.println();
		}
	


		
	}
	



	

	

}
