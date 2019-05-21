package com.membercoupon.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.administrator.model.AdministratorVO;


public class MemberCouponJDBCDAO implements MemberCouponDAO_interface {
	static MemberCouponJDBCDAO dao=new MemberCouponJDBCDAO();
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "WESHARE";
	String passwd = "123456";
	
	//新增
	private static final String INSERT_STMT = "INSERT INTO MemberCoupon VALUES (?,?,?)";
	
	//修改
	private static final String UPDATE = "UPDATE MemberCoupon set mcStatus= ? where couponId = ? and memId= ?";;
	
	//查詢
	private static final String GET_ALL_STMT = "SELECT * FROM MemberCoupon";
	private static final String GET_ONE_STMT = "SELECT * FROM MemberCoupon where couponId = ? and memId= ?";

	@Override
	public void insert(MemberCouponVO memberCouponVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1,memberCouponVO.getCouponId());
			pstmt.setString(2,memberCouponVO.getMemId());
			pstmt.setInt(3,memberCouponVO.getMcStatus());

			pstmt.executeUpdate();
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
	public void update(MemberCouponVO memberCouponVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			
			pstmt.setInt(1,memberCouponVO.getMcStatus());
			pstmt.setString(2,memberCouponVO.getCouponId());
			pstmt.setString(3,memberCouponVO.getMemId());
			


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
	public MemberCouponVO findByPrimaryKey(String couponId,String memId){
		MemberCouponVO memberCouponVO=null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setString(1, couponId);
			pstmt.setString(2, memId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// deptVO 也稱為 Domain objects
				memberCouponVO = new MemberCouponVO();
				memberCouponVO.setCouponId(rs.getString("couponId"));
				memberCouponVO.setMemId(rs.getString("memId"));
				memberCouponVO.setMcStatus(rs.getInt("mcStatus"));
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
		return memberCouponVO;
	}

	@Override
	public List<MemberCouponVO> getAll() {
		List<MemberCouponVO> list = new ArrayList<MemberCouponVO>();
		MemberCouponVO memberCouponVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				memberCouponVO = new MemberCouponVO();
				memberCouponVO.setCouponId(rs.getString("couponId"));
				memberCouponVO.setMemId(rs.getString("memId"));
				memberCouponVO.setMcStatus(rs.getInt("mcStatus"));
				list.add(memberCouponVO); // Store the row in the list
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
//		MemberCouponVO memberCouponVO1 = new MemberCouponVO();
//		memberCouponVO1.setCouponId("50MONEYOFF");
//		memberCouponVO1.setMemId("weshare04");
//		memberCouponVO1.setMcStatus(1);
//		dao.insert(memberCouponVO1);
		
		// 修改
//		MemberCouponVO memberCouponVO2 = new MemberCouponVO();
//		memberCouponVO2.setMcStatus(1);
//		memberCouponVO2.setCouponId("FIRSTORDER500");
//		memberCouponVO2.setMemId("weshare03");
//		dao.update(memberCouponVO2);
		
		// 查詢單一
//		MemberCouponVO memberCouponVO3= dao.findByPrimaryKey("FIRSTORDER500","weshare01");
//		System.out.println(memberCouponVO3.getCouponId() + ",");
//		System.out.println(memberCouponVO3.getMemId() + ",");
//		System.out.println(memberCouponVO3.getMcStatus()+ ",");
//		System.out.println("---------------------");
		
//		// 查詢全部
		List<MemberCouponVO> list = dao.getAll();
		for (MemberCouponVO memberCouponVO4 : list) {
			System.out.println(memberCouponVO4.getCouponId() + ",");
			System.out.println(memberCouponVO4.getMemId() + ",");
			System.out.println(memberCouponVO4.getMcStatus()+ ",");
			System.out.println("---------------------");
		}
		
		
	}

}
