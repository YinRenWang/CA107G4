package android.com.coursereservation.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import android.com.inscoursetime.model.InsCourseTimeJDBCDAO;
import android.com.inscoursetime.model.InsCourseTimeVO;
import android.com.member.model.MemberJDBCDAO;
import android.com.member.model.MemberVO;
import android.com.withdrawalrecord.model.WithdrawalRecordJDBCDAO;
import android.com.withdrawalrecord.model.WithdrawalRecordVO;


public class CourseReservationJDBCDAO implements CourseReservationDAO_interface {
	static CourseReservationJDBCDAO dao=new CourseReservationJDBCDAO();
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
//	String url = "jdbc:oracle:thin:@localhost:49161:XE";
	String userid = "WESHARE";
	String passwd = "123456";
	
	//新增
	private static final String INSERT_STMT = "Insert into CourseReservation values ('CR'||LPAD(to_char(CourseReservation_seq.NEXTVAL),5,'0'),?,?,?,?,?,?,?,?,?,?,?,?,null,?)";
	
	//修改
	private static final String UPDATE = "UPDATE CourseReservation set teamId=?, crvStatus=?, classStatus=?, TranStatus=? , crvScore=?, crvRate=? where crvId = ?";
	
	//查詢訂單評價
	private static final String GET_ALL_RATE ="SELECT MEMID,CRVSCORE,CRVRATE FROM CourseReservation WHERE CLASSSTATUS='1' AND INSCID=? ORDER BY CRVID DESC";
	
	//查詢全部
	private static final String GET_ALL_STMT = "SELECT * FROM CourseReservation";
	
	//複合查詢1
	private static final String GET_XXXID_STMT = "SELECT * FROM CourseReservation where (case when crvId=? then 1 else 0 end+ case when teacherId=? then 1 else 0 end+ case when memId=? then 1 else 0 end)>=1";
	
	//複合查詢2
		private static final String GET_STATUS_STMT ="SELECT * FROM CourseReservation where (case when crvStatus=? then 1 else 0 end+ case when classStatus=? then 1 else 0 end+ case when tranStatus=? then 1 else 0 end)>=1";
	
	//更新訂單狀態
		private static final String UPDATE_CLASS_STATUS = "UPDATE CourseReservation set CLASSStatus=? WHERE CRVID=?";
	
	@Override
	public void insert(CourseReservationVO courseReservationVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT,Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1,courseReservationVO.getTeacherId());
			pstmt.setString(2,courseReservationVO.getMemId());
			pstmt.setString(3,courseReservationVO.getInscId());
			pstmt.setString(4,courseReservationVO.getTeamId());
			pstmt.setInt(5,courseReservationVO.getCrvStatus());
			pstmt.setInt(6,courseReservationVO.getClassStatus());
			pstmt.setInt(7,courseReservationVO.getTranStatus());
			pstmt.setTimestamp(8,courseReservationVO.getCrvMFD());
			pstmt.setTimestamp(9,courseReservationVO.getCrvEXP());
			pstmt.setString(10,courseReservationVO.getCrvLoc());
			pstmt.setDouble(11,courseReservationVO.getCrvTotalTime());
			pstmt.setDouble(12,courseReservationVO.getCrvTotalPrice());
			pstmt.setString(13, courseReservationVO.getCrvRate());
			pstmt.executeUpdate();
		
			ResultSet rs=pstmt.getGeneratedKeys();
		        if(rs.next()){
		        System.out.println(rs.getString(1));
		        }
			System.out.println("已新增一筆資料");

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
	public void update(CourseReservationVO courseReservationVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setString(1,courseReservationVO.getTeamId());
			pstmt.setInt(2,courseReservationVO.getCrvStatus());
			pstmt.setInt(3,courseReservationVO.getClassStatus());
			pstmt.setInt(4,courseReservationVO.getTranStatus());
			pstmt.setDouble(5,courseReservationVO.getCrvScore());
			pstmt.setString(6, courseReservationVO.getCrvRate());
			pstmt.setString(7, courseReservationVO.getCrvId());
			pstmt.executeUpdate();
			System.out.println("已修改一筆資料");

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
	public List<CourseReservationVO> findByStatus(Integer xxxStatus) {
		List<CourseReservationVO> list = new ArrayList<CourseReservationVO>();
		CourseReservationVO courseReservationVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_STATUS_STMT);
			pstmt.setInt(1, xxxStatus);
			pstmt.setInt(2, xxxStatus);
			pstmt.setInt(3, xxxStatus);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				courseReservationVO = new CourseReservationVO();
				courseReservationVO.setCrvId(rs.getString("crvId"));
				courseReservationVO.setTeacherId(rs.getString("teacherId"));
				courseReservationVO.setMemId(rs.getString("memId"));
				courseReservationVO.setInscId(rs.getString("inscId"));
				courseReservationVO.setTeamId(rs.getString("teamId"));
				courseReservationVO.setCrvStatus(rs.getInt("crvStatus"));
				courseReservationVO.setClassStatus(rs.getInt("classStatus"));
				courseReservationVO.setTranStatus(rs.getInt("tranStatus"));
				courseReservationVO.setCrvMFD(rs.getTimestamp("crvMFD"));
				courseReservationVO.setCrvEXP(rs.getTimestamp("crvEXP"));
				courseReservationVO.setCrvLoc(rs.getString("crvLoc"));
				courseReservationVO.setCrvTotalTime(rs.getDouble("crvTotalTime"));
				courseReservationVO.setCrvTotalPrice(rs.getDouble("crvTotalPrice"));
				courseReservationVO.setCrvScore(rs.getDouble("crvScore"));
				courseReservationVO.setCrvRate(rs.getString("crvRate"));
				list.add(courseReservationVO); // Store the row in the list
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

	@Override
	public List<CourseReservationVO> findByPrimaryKey(String xxxId) {
		List<CourseReservationVO> list = new ArrayList<CourseReservationVO>();
		CourseReservationVO courseReservationVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_XXXID_STMT);
			pstmt.setString(1, xxxId);
			pstmt.setString(2, xxxId);
			pstmt.setString(3, xxxId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				courseReservationVO = new CourseReservationVO();
				courseReservationVO.setCrvId(rs.getString("crvId"));
				courseReservationVO.setTeacherId(rs.getString("teacherId"));
				courseReservationVO.setMemId(rs.getString("memId"));
				courseReservationVO.setInscId(rs.getString("inscId"));
				courseReservationVO.setTeamId(rs.getString("teamId"));
				courseReservationVO.setCrvStatus(rs.getInt("crvStatus"));
				courseReservationVO.setClassStatus(rs.getInt("classStatus"));
				courseReservationVO.setTranStatus(rs.getInt("tranStatus"));
				courseReservationVO.setCrvMFD(rs.getTimestamp("crvMFD"));
				courseReservationVO.setCrvEXP(rs.getTimestamp("crvEXP"));
				courseReservationVO.setCrvLoc(rs.getString("crvLoc"));
				courseReservationVO.setCrvTotalTime(rs.getDouble("crvTotalTime"));
				courseReservationVO.setCrvTotalPrice(rs.getDouble("crvTotalPrice"));
				courseReservationVO.setCrvScore(rs.getDouble("crvScore"));
				courseReservationVO.setCrvRate(rs.getString("crvRate"));
				list.add(courseReservationVO); // Store the row in the list
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

	@Override
	public List<CourseReservationVO> getAll() {
		List<CourseReservationVO> list = new ArrayList<CourseReservationVO>();
		CourseReservationVO courseReservationVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				courseReservationVO = new CourseReservationVO();
				courseReservationVO.setCrvId(rs.getString("crvId"));
				courseReservationVO.setTeacherId(rs.getString("teacherId"));
				courseReservationVO.setMemId(rs.getString("memId"));
				courseReservationVO.setInscId(rs.getString("inscId"));
				courseReservationVO.setTeamId(rs.getString("teamId"));
				courseReservationVO.setCrvStatus(rs.getInt("crvStatus"));
				courseReservationVO.setClassStatus(rs.getInt("classStatus"));
				courseReservationVO.setTranStatus(rs.getInt("tranStatus"));
				courseReservationVO.setCrvMFD(rs.getTimestamp("crvMFD"));
				courseReservationVO.setCrvEXP(rs.getTimestamp("crvEXP"));
				courseReservationVO.setCrvLoc(rs.getString("crvLoc"));
				courseReservationVO.setCrvTotalTime(rs.getDouble("crvTotalTime"));
				courseReservationVO.setCrvTotalPrice(rs.getDouble("crvTotalPrice"));
				courseReservationVO.setCrvScore(rs.getDouble("crvScore"));
				courseReservationVO.setCrvRate(rs.getString("crvRate"));
				list.add(courseReservationVO); // Store the row in the list
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

	@Override
	public List<CourseReservationVO> findByRate(String inscId) {
		List<CourseReservationVO> list = new ArrayList<CourseReservationVO>();
		CourseReservationVO courseReservationVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_RATE);
			pstmt.setString(1, inscId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				courseReservationVO = new CourseReservationVO();
				courseReservationVO.setMemId(rs.getString("memId"));
				courseReservationVO.setCrvScore(rs.getDouble("crvScore"));
				courseReservationVO.setCrvRate(rs.getString("crvRate"));
				list.add(courseReservationVO); // Store the row in the list
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

	
	public static void main(String[] args) {
		// 新增
		CourseReservationVO courseReservationVO1 = new CourseReservationVO();
		courseReservationVO1.setTeacherId("TC00002");
		courseReservationVO1.setMemId("weshare01");
		courseReservationVO1.setInscId("IC00002");
		courseReservationVO1.setTeamId(null);
		courseReservationVO1.setCrvStatus(1);
		courseReservationVO1.setClassStatus(1);
		courseReservationVO1.setTranStatus(0);
		courseReservationVO1.setCrvMFD(java.sql.Timestamp.valueOf("2019-04-02 12:00:00"));
		courseReservationVO1.setCrvEXP(java.sql.Timestamp.valueOf("2019-04-02 14:00:00"));
		courseReservationVO1.setCrvLoc("台北市信義區信義路六段22號");
		courseReservationVO1.setCrvTotalTime(2.0);
		courseReservationVO1.setCrvTotalPrice(1000.0);
		courseReservationVO1.setCrvScore(4.50);
		courseReservationVO1.setCrvRate("老師超厲害,教的超好!!");
		dao.insert(courseReservationVO1);
			
		// 修改
//		CourseReservationVO courseReservationVO2 = new CourseReservationVO();
//		courseReservationVO2.setTeamId("TM00001");
//		courseReservationVO2.setCrvStatus(1);
//		courseReservationVO2.setClassStatus(1);
//		courseReservationVO2.setTranStatus(0);
//		courseReservationVO2.setCrvScore(5.00);
//		courseReservationVO2.setCrvRate("老師教的超好!!");
//		courseReservationVO2.setCrvId("CR00002");
//		dao.update(courseReservationVO2);
		
		// 查詢全部
//		List<CourseReservationVO> list = dao.getAll();
//		for (CourseReservationVO courseReservationVO3 : list) {
//			System.out.print(courseReservationVO3.getCrvId()+",");
//			System.out.print(courseReservationVO3.getCrvDate()+ ",");
//			System.out.print(courseReservationVO3.getTeacherId()+ ",");
//			System.out.print(courseReservationVO3.getMemId()+ ",");
//			System.out.print(courseReservationVO3.getTeamId()+ ",");
//			System.out.print(courseReservationVO3.getCrvStatus()+ ",");
//			System.out.print(courseReservationVO3.getClassStatus()+ ",");
//			System.out.print(courseReservationVO3.getTranStatus()+ ",");
//			System.out.print(courseReservationVO3.getCrvMFD()+ ",");
//			System.out.print(courseReservationVO3.getCrvEXP()+ ",");
//			System.out.print(courseReservationVO3.getCrvLoc()+ ",");
//			System.out.print(courseReservationVO3.getCrvTotalTime()+ ",");
//			System.out.print(courseReservationVO3.getCrvTotalPrice()+ ",");
//			System.out.print(courseReservationVO3.getCrvScore()+ ",");
//			System.out.println(courseReservationVO3.getCrvRate()+ ",");
//			System.out.println();
//		}
		
		// 複合查詢
//		List<CourseReservationVO> list = dao.findByPrimaryKey("TC00001");
//		for (CourseReservationVO courseReservationVO4 : list) {
//			System.out.print(courseReservationVO4.getCrvId()+",");
//			System.out.print(courseReservationVO4.getCrvDate()+ ",");
//			System.out.print(courseReservationVO4.getTeacherId()+ ",");
//			System.out.print(courseReservationVO4.getMemId()+ ",");
//			System.out.print(courseReservationVO4.getTeamId()+ ",");
//			System.out.print(courseReservationVO4.getCrvStatus()+ ",");
//			System.out.print(courseReservationVO4.getClassStatus()+ ",");
//			System.out.print(courseReservationVO4.getTranStatus()+ ",");
//			System.out.print(courseReservationVO4.getCrvMFD()+ ",");
//			System.out.print(courseReservationVO4.getCrvEXP()+ ",");
//			System.out.print(courseReservationVO4.getCrvLoc()+ ",");
//			System.out.print(courseReservationVO4.getCrvTotalTime()+ ",");
//			System.out.print(courseReservationVO4.getCrvTotalPrice()+ ",");
//			System.out.print(courseReservationVO4.getCrvScore()+ ",");
//			System.out.println(courseReservationVO4.getCrvRate()+ ",");
//			System.out.println();
//		}
		
		// 複合查詢狀態
				List<CourseReservationVO> list = dao.findByRate("IC00001");
				for (CourseReservationVO courseReservationVO5 : list) {
					System.out.print(courseReservationVO5.getMemId()+ ",");
					System.out.print(courseReservationVO5.getCrvScore()+ ",");
					System.out.println(courseReservationVO5.getCrvRate()+ ",");
					System.out.println();
				}
		
		
	

	}

	@Override
	public void insertWithMemberWithRecod(CourseReservationVO courseReservationVO, MemberVO memberVO,WithdrawalRecordVO withdrawalRecordVO,InsCourseTimeVO inscoursetimeVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
	
			// 1●設定於 pstm.executeUpdate()之前
    		con.setAutoCommit(false);
    		
    		//新增訂單
    		pstmt = con.prepareStatement(INSERT_STMT,Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1,courseReservationVO.getTeacherId());
			pstmt.setString(2,courseReservationVO.getMemId());
			pstmt.setString(3,courseReservationVO.getInscId());
			pstmt.setString(4,courseReservationVO.getTeamId());
			pstmt.setInt(5,courseReservationVO.getCrvStatus());
			pstmt.setInt(6,courseReservationVO.getClassStatus());
			pstmt.setInt(7,courseReservationVO.getTranStatus());
			pstmt.setTimestamp(8,courseReservationVO.getCrvMFD());
			pstmt.setTimestamp(9,courseReservationVO.getCrvEXP());
			pstmt.setString(10,courseReservationVO.getCrvLoc());
			pstmt.setDouble(11,courseReservationVO.getCrvTotalTime());
			pstmt.setDouble(12,courseReservationVO.getCrvTotalPrice());
			pstmt.setString(13, courseReservationVO.getCrvRate());
			pstmt.executeUpdate();
		
		    	//掘取對應的自增主鍵值
				String crvId = null;
				ResultSet rs = pstmt.getGeneratedKeys();
				if (rs.next()) {
					crvId = rs.getString(1);
					System.out.println("自增主鍵值= " + crvId +"(剛新增成功的主編號");
				} else {
					System.out.println("未取得自增主鍵值");
				}
				rs.close();
				//先刪除時間
				InsCourseTimeJDBCDAO dao1 =new InsCourseTimeJDBCDAO();
				dao1.delete(courseReservationVO.getInscTimeId());
				
				// 再同時修改餘額
				MemberJDBCDAO dao2= new MemberJDBCDAO();
				Integer dollar=courseReservationVO.getCrvTotalPrice().intValue();
				Integer balance=memberVO.getMemBalance();
				memberVO.setMemBalance(balance-dollar);
				dao2.deduction(memberVO,con);
				
				//再同時新增交易紀錄
				WithdrawalRecordJDBCDAO dao3=new WithdrawalRecordJDBCDAO();
				withdrawalRecordVO.setMemid(memberVO.getMemId());
				withdrawalRecordVO.setWrmoney(-dollar);
				dao3.insert2(withdrawalRecordVO, con);
				// 2●設定於 pstm.executeUpdate()之後
				con.commit();
				con.setAutoCommit(true);
				System.out.println("訂單編號"+crvId+"購買人"+memberVO.getMemName()+"已扣了"+dollar+"剩餘"+memberVO.getMemBalance());
				

				// Handle any driver errors
			} catch (ClassNotFoundException e) {
				throw new RuntimeException("Couldn't load database driver. "
						+ e.getMessage());
				// Handle any SQL errors
			} catch (SQLException se) {
				if (con != null) {
					try {
						// 3●設定於當有exception發生時之catch區塊內
						System.err.print("Transaction is being ");
						System.err.println("rolled back-由-dept");
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
	public void updateClassStatus(String crvId) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_CLASS_STATUS);
			pstmt.setInt(1,1);
			pstmt.setString(2,crvId);
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

}
