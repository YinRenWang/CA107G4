package android.com.withdrawalrecord.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;





public class WithdrawalRecordJDBCDAO implements WithdrawalRecordDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "WESHARE";
	String passwd = "123456";

	private static final String INSERT_WITHDRAWALRECORD = "INSERT INTO WithdrawalRecord (wrnum,memid,wrmoney,wrtime) VALUES (('WI'||LPAD(to_char(WITHDRAWALRECORD_seq.NEXTVAL), 5, '0')), ?, ?, ?)";

	private static final String GET_ONE_STMT = "SELECT * FROM WITHDRAWALRECORD where WRNUM=?";

	private static final String UPDATE = "UPDATE WITHDRAWALRECORD set memid=?, wrmoney=?, wrtime=? where wrnum = ?";

	private static final String GET_ALL_STMT = 
			"SELECT wrnum,memid,wrmoney,wrtime FROM WITHDRAWALRECORD ORDER BY WRMONEY DESC";
	private static final String GET_ALL_STMT1 = 
			"SELECT * FROM WITHDRAWALRECORD where (case when memid=? then 1 else 0 end+ case when wrnum=? then 1 else 0 end)>=1 ORDER BY WRNUM DESC";
	private static final String INSERT_2="INSERT INTO WithdrawalRecord (wrnum,memid,wrmoney,wrtime) VALUES (('WI'||LPAD(to_char(WITHDRAWALRECORD_seq.NEXTVAL), 5, '0')), ?, ?, to_date( to_char( sysdate, 'dd-mm-yy' ), 'dd-mm-yy' ) )";
//	private static final String GET_Emps_ByDeptno_STMT = "SELECT wrnum,memid,to_char(wrtime,'yyyy-mm-dd') wrtime,sal,FROM WITHDRAWALRECORD where memid = ? order by wrnum";		
//	
	@Override
	public void insert(WithdrawalRecordVO withdrawalRecordVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_WITHDRAWALRECORD);

			pstmt.setString(1, withdrawalRecordVO.getMemid());
			pstmt.setInt(2, withdrawalRecordVO.getWrmoney());
			pstmt.setDate(3, withdrawalRecordVO.getWrtime());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
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
	public void update(WithdrawalRecordVO withdrawalRecordVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, withdrawalRecordVO.getMemid());
			pstmt.setInt(2, withdrawalRecordVO.getWrmoney());
			pstmt.setDate(3, withdrawalRecordVO.getWrtime());
			pstmt.setString(4, withdrawalRecordVO.getWrnum());
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
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
	public WithdrawalRecordVO findByPrimaryKey(String Wrnum) {

		WithdrawalRecordVO WithdrawalRecordVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setString(1, Wrnum);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				WithdrawalRecordVO = new WithdrawalRecordVO();
				WithdrawalRecordVO.setWrnum(rs.getString("wrnum"));
				WithdrawalRecordVO.setMemid(rs.getString("memid"));
				WithdrawalRecordVO.setWrmoney(rs.getInt("wrmoney"));
				WithdrawalRecordVO.setWrtime(rs.getDate("wrtime"));
				
			}

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
		return WithdrawalRecordVO;
	}
	
	
	@Override
	public List<WithdrawalRecordVO> getAll() {
		List<WithdrawalRecordVO> list = new ArrayList<WithdrawalRecordVO>();
		WithdrawalRecordVO withdrawalRecordVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				withdrawalRecordVO = new WithdrawalRecordVO();
				withdrawalRecordVO.setWrnum(rs.getString("wrnum"));
				withdrawalRecordVO.setMemid(rs.getString("memid"));
				withdrawalRecordVO.setWrmoney(rs.getInt("wrmoney"));
				withdrawalRecordVO.setWrtime(rs.getDate("wrtime"));
				list.add(withdrawalRecordVO); // Store the row in the list
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
	
//	@Override
//	public Set<WithdrawalRecordVO> getEmpsByDeptno(Integer deptno) {
//		Set<WithdrawalRecordVO> set = new LinkedHashSet<WithdrawalRecordVO>();
//		WithdrawalRecordVO withdrawalRecordVO = null;
//	
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//	
//		try {
//	
//			con = ds.getConnection();
//			pstmt = con.prepareStatement(GET_Emps_ByDeptno_STMT);
//			pstmt.setInt(1, deptno);
//			rs = pstmt.executeQuery();
//	
//			while (rs.next()) {
//				withdrawalRecordVO = new WithdrawalRecordVO();
//				withdrawalRecordVO.setWrnum(rs.getString("wrnum"));
//				withdrawalRecordVO.setMemid(rs.getString("memid"));
//				withdrawalRecordVO.setWrmoney(rs.getInt("wrmoney"));
//				withdrawalRecordVO.setWrtime(rs.getDate("wrtime"));
//				
//				set.add(withdrawalRecordVO); // Store the row in the vector
//			}
//	
//			// Handle any SQL errors
//		} catch (SQLException se) {
//			throw new RuntimeException("A database error occured. "
//					+ se.getMessage());
//		} finally {
//			if (rs != null) {
//				try {
//					rs.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (con != null) {
//				try {
//					con.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
//		return set;
//	}
	
	
		
	

	
//---------------------------------------------------------------------------------------------------

	
	
	
	
	
	
	@Override
	public List<WithdrawalRecordVO> findByKey(String memId){
		List<WithdrawalRecordVO> list = new ArrayList<WithdrawalRecordVO>();
		WithdrawalRecordVO withdrawalRecordVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT1);
			pstmt.setString(1, memId);
			pstmt.setString(2, memId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				withdrawalRecordVO = new WithdrawalRecordVO();
				withdrawalRecordVO.setWrnum(rs.getString("wrnum"));
				withdrawalRecordVO.setMemid(rs.getString("memid"));
				withdrawalRecordVO.setWrmoney(rs.getInt("wrmoney"));
				withdrawalRecordVO.setWrtime(rs.getDate("wrtime"));
				
				list.add(withdrawalRecordVO); // Store the row in the list
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
//------------------------------------------------------------------------------------------
	public static void main(String[] args) {

		WithdrawalRecordJDBCDAO dao = new WithdrawalRecordJDBCDAO();

//



//		WithdrawalRecordVO WithdrawalRecordVO2 = new WithdrawalRecordVO();
//
//		WithdrawalRecordVO2.setMemid("weshare01");
//		WithdrawalRecordVO2.setWrmoney(900);
//		WithdrawalRecordVO2.setWrtime(java.sql.Date.valueOf("2019-03-25"));
//		WithdrawalRecordVO2.setWrnum("WI00004");
//		dao.update(WithdrawalRecordVO2);
//		System.out.println("---------------------");
//

		WithdrawalRecordVO WithdrawalRecordVO3 = dao.findByPrimaryKey("WI00003");
		System.out.print(WithdrawalRecordVO3.getWrnum() + ",");
		System.out.print(WithdrawalRecordVO3.getMemid() + ",");
		System.out.print(WithdrawalRecordVO3.getWrmoney() + ",");
		System.out.println(WithdrawalRecordVO3.getWrtime());
////
//		System.out.println("---------------------");
//
//	
//
//		
//		  List<WithdrawalRecordVO> list = dao.getAll();
//	   for (WithdrawalRecordVO aWithdrawalRecord : list) {
//		System.out.print(aWithdrawalRecord.getWrnum() + ",");
//		System.out.print(aWithdrawalRecord.getMemid() + ",");
//		System.out.print(aWithdrawalRecord.getWrmoney() + ",");
//		System.out.println(aWithdrawalRecord.getWrtime());
//		System.out.println("---------------------");
//	}
		
		

	   
//		List<WithdrawalRecordVO> list = dao.findByKey("weshare01");
//		for (WithdrawalRecordVO withdrawalRecordVO3 : list) {
//			System.out.println(withdrawalRecordVO3.getWrnum()+ ",");
//			System.out.println(withdrawalRecordVO3.getMemid()+ ",");
//			System.out.println(withdrawalRecordVO3.getWrmoney()+ ",");
//			System.out.println(withdrawalRecordVO3.getWrtime()+ ",");
			
//			System.out.println("---------------------");
		
	}
	

		@Override
		public void insert2(WithdrawalRecordVO withdrawalRecordVO, Connection con) {

			PreparedStatement pstmt = null;

			try {

				pstmt = con.prepareStatement(INSERT_2);

				pstmt.setString(1, withdrawalRecordVO.getMemid());
				pstmt.setInt(2, withdrawalRecordVO.getWrmoney());

				pstmt.executeUpdate();
			} catch (SQLException se) {
						if (con != null) {
							try {
								// 3●設定於當有exception發生時之catch區塊內
								System.err.print("Transaction is being ");
								System.err.println("rolled back-由-emp");
								con.rollback();
							} catch (SQLException excep) {
								throw new RuntimeException("rollback error occured. "
										+ excep.getMessage());
							}
						}
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
					}

		
		
		
		}


	
	
	

}
