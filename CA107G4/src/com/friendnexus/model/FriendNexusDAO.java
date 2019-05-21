package com.friendnexus.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;







public class FriendNexusDAO implements FriendNexusDAO_interface {
	private static DataSource ds = null;

	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_FriendNexus = "INSERT INTO FRIENDNEXUS (memId,friendAcc,friendstatus) VALUES (?, ?, ?)";
	private static final String GET_ONE_STMT = "SELECT * FROM FRIENDNEXUS where memId=?";
	private static final String DELETE_friendacc = "DELETE FROM FRIENDNEXUS where friendacc =? AND memId= ?";
	private static final String DELETE_memId = "DELETE FROM FRIENDNEXUS where memId =? AND friendacc= ?";
	private static final String GET_ALL_STMT0 = "SELECT * FROM FRIENDNEXUS where FRIENDSTATUS='0' AND friendAcc= ?";
	private static final String GET_ALL_STMT1 = "SELECT * FROM FRIENDNEXUS where FRIENDSTATUS='1' AND memId= ?";
	private static final String GET_ALL_STMT = "SELECT memId,friendAcc,friendstatus FROM FriendNexus order by memId";
	
	private static final String UPDATE = "UPDATE FRIENDNEXUS set friendstatus =1 where memId = ? AND FRIENDACC= ?";

	@Override
	public void insert(FriendNexusVO scorpionChatRecordVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_FriendNexus);

			pstmt.setString(1, scorpionChatRecordVO.getMemId());
			pstmt.setString(2, scorpionChatRecordVO.getFriendAcc());
			pstmt.setInt(3, scorpionChatRecordVO.getFriendstatus());

			pstmt.executeUpdate();

			// Handle any driver errors
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
	public FriendNexusVO findByPrimaryKey(String memId) {

		FriendNexusVO FriendNexusVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setString(1, memId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				FriendNexusVO = new FriendNexusVO();
				FriendNexusVO.setMemId(rs.getString("memId"));
				FriendNexusVO.setFriendAcc(rs.getString("friendAcc"));
				FriendNexusVO.setFriendstatus(rs.getInt("friendstatus"));

			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
		return FriendNexusVO;
	}

	@Override
	public List<FriendNexusVO> getAll() {
		List<FriendNexusVO> list = new ArrayList<FriendNexusVO>();
		FriendNexusVO friendNexusVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// scorpionChatRecordVO 也稱為 Domain objects
				friendNexusVO = new FriendNexusVO();
				friendNexusVO.setMemId(rs.getString("memId"));
				friendNexusVO.setFriendAcc(rs.getString("friendAcc"));
				friendNexusVO.setFriendstatus(rs.getInt("friendstatus"));
				list.add(friendNexusVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
	public List<FriendNexusVO> friendNexus0(String friendAcc) {
		List<FriendNexusVO> list = new ArrayList<FriendNexusVO>();
		FriendNexusVO friendNexusVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT0);
			pstmt.setString(1, friendAcc);;
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// scorpionChatRecordVO 也稱為 Domain objects
				friendNexusVO = new FriendNexusVO();
				friendNexusVO.setMemId(rs.getString("memId"));
				friendNexusVO.setFriendAcc(rs.getString("friendAcc"));
				friendNexusVO.setFriendstatus(rs.getInt("friendstatus"));
				list.add(friendNexusVO);
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
	public List<FriendNexusVO> friendNexus1(String memId) {
		List<FriendNexusVO> list = new ArrayList<FriendNexusVO>();
		FriendNexusVO friendNexusVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT1);
			pstmt.setString(1, memId);;
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// scorpionChatRecordVO 也稱為 Domain objects
				friendNexusVO = new FriendNexusVO();
				friendNexusVO.setMemId(rs.getString("memId"));
				friendNexusVO.setFriendAcc(rs.getString("friendAcc"));
				friendNexusVO.setFriendstatus(rs.getInt("friendstatus"));
				list.add(friendNexusVO);
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
	
	public void update(FriendNexusVO friendNexusVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, friendNexusVO.getMemId());
			pstmt.setString(2, friendNexusVO.getFriendAcc());

			pstmt.executeUpdate();

			// Handle any driver errors
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
	public void deletememId(String memId,String friendAcc) {
		int updateCount_EMPs = 0;

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			// 1●設定於 pstm.executeUpdate()之前
			con.setAutoCommit(false);

			// 先刪除員工
			pstmt = con.prepareStatement(DELETE_friendacc);
			pstmt.setString(1, memId);
			pstmt.setString(2, friendAcc);
			updateCount_EMPs = pstmt.executeUpdate();
			// 再刪除部門
			

			// 2●設定於 pstm.executeUpdate()之後
			con.commit();
			con.setAutoCommit(true);
			
			
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
			public void delete(String friendAcc,String memId) {
				int updateCount_EMPs = 0;

				Connection con = null;
				PreparedStatement pstmt = null;

				try {

					con = ds.getConnection();

					// 1●設定於 pstm.executeUpdate()之前
					con.setAutoCommit(false);

					// 先刪除員工
					pstmt = con.prepareStatement(DELETE_friendacc);
					pstmt.setString(1, friendAcc);
					pstmt.setString(2, memId);
					updateCount_EMPs = pstmt.executeUpdate();
					// 再刪除部門
					

					// 2●設定於 pstm.executeUpdate()之後
					con.commit();
					con.setAutoCommit(true);
					
					
					// Handle any driver errors
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



	


	public static void main(String[] args) {
		FriendNexusDAO dao = new FriendNexusDAO();

		// 新增
//		FriendNexusVO FriendNexusVO1 = new FriendNexusVO();
//		FriendNexusVO1.setMemId("weshare05");
//		FriendNexusVO1.setFriendAcc("weshare03");
//		FriendNexusVO1.setFriendstatus(1);
//
//		dao.insert(FriendNexusVO1);

//		 查詢
//		FriendNexusVO FriendNexusVO2 = dao.findByPrimaryKey("weshare02");
//		System.out.print(FriendNexusVO2.getMemId() + ",");
//		System.out.print(FriendNexusVO2.getFriendAcc() + ",");
//		System.out.println(FriendNexusVO2.getFriendstatus() + ",");
//
//		System.out.println("---------------------");

		// 查詢
//		List<FriendNexusVO> list = dao.getAll();
//		for (FriendNexusVO FriendNexusVO3 : list) {
//			System.out.print(FriendNexusVO3.getMemId() + ",");
//			System.out.print(FriendNexusVO3.getFriendAcc() + ",");
//			System.out.println(FriendNexusVO3.getFriendstatus());
//			System.out.println();
//		}
	
		
		List<FriendNexusVO> list = dao.friendNexus0("weshare03");
		for (FriendNexusVO FriendNexusVO3 : list) {
			System.out.print(FriendNexusVO3.getMemId() + ",");
			System.out.print(FriendNexusVO3.getFriendAcc() + ",");
			System.out.println(FriendNexusVO3.getFriendstatus());
			System.out.println();
		}
//		System.out.println("---------------------");
		
//		FriendNexusVO FriendNexusVO4 = new FriendNexusVO();
//		FriendNexusVO4.setMemId("weshare02");
//		FriendNexusVO4.setFriendAcc("weshare04");
//		dao.update(FriendNexusVO4);
//		System.out.println("---------------------");
		

//	List<FriendNexusVO> list = dao.friendNexus1("weshare02");
//	for (FriendNexusVO FriendNexusVO3 : list) {
//		System.out.print(FriendNexusVO3.getMemId() + ",");
//		System.out.print(FriendNexusVO3.getFriendAcc() + ",");
//		System.out.println(FriendNexusVO3.getFriendstatus());
//		System.out.println();
//	}
	dao.delete("weshare03", "weshare02");
	System.out.println("---------------------");
	}


}
