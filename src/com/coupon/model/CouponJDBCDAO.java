package com.coupon.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.administrator.model.AdministratorVO;


public class CouponJDBCDAO implements CouponDAO_interface {
	static CouponJDBCDAO dao=new CouponJDBCDAO();
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "WESHARE";
	String passwd = "123456";
	
	//新增
	private static final String INSERT_STMT = "INSERT INTO Coupon VALUES (?,?,?,?,?,?,?)";
			
	//修改
	private static final String UPDATE = "UPDATE Coupon set couponBalance=?, couponEXP=? , couponStatus=? where couponId = ?";
			
	//查詢
	private static final String GET_ALL_STMT = "SELECT * FROM Coupon";
	private static final String GET_ONE_STMT = "SELECT * FROM Coupon where couponId = ?";


	@Override
	public void insert(CouponVO couponVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, couponVO.getCouponId());
			pstmt.setString(2, couponVO.getCouponName());
			pstmt.setInt(3, couponVO.getCouponDollar());
			pstmt.setInt(4,couponVO.getCouponBalance());
			pstmt.setDate(5, couponVO.getCouponMFD());
			pstmt.setDate(6, couponVO.getCouponEXP());
			pstmt.setInt(7, couponVO.getCouponStatus());


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
	public void update(CouponVO couponVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setInt(1,couponVO.getCouponBalance());
			pstmt.setDate(2, couponVO.getCouponEXP());
			pstmt.setInt(3, couponVO.getCouponStatus());
			pstmt.setString(4, couponVO.getCouponId());
			
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
	public CouponVO findByPrimaryKey(String couponId) {
		CouponVO couponVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, couponId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// deptVO 也稱為 Domain objects
				couponVO = new CouponVO();
				couponVO.setCouponId(rs.getString("couponId"));
				couponVO.setCouponName(rs.getString("couponName"));
				couponVO.setCouponDollar(rs.getInt("couponDollar"));
				couponVO.setCouponBalance(rs.getInt("couponBalance"));
				couponVO.setCouponMFD(rs.getDate("couponMFD"));
				couponVO.setCouponEXP(rs.getDate("couponEXP"));
				couponVO.setCouponStatus(rs.getInt("couponStatus"));	
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
		return couponVO;
	}

	@Override
	public List<CouponVO> getAll() {
		List<CouponVO> list = new ArrayList<CouponVO>();
		CouponVO couponVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				couponVO = new CouponVO();
				couponVO.setCouponId(rs.getString("couponId"));
				couponVO.setCouponName(rs.getString("couponName"));
				couponVO.setCouponDollar(rs.getInt("couponDollar"));
				couponVO.setCouponBalance(rs.getInt("couponBalance"));
				couponVO.setCouponMFD(rs.getDate("couponMFD"));
				couponVO.setCouponEXP(rs.getDate("couponEXP"));
				couponVO.setCouponStatus(rs.getInt("couponStatus"));	
		
				list.add(couponVO); // Store the row in the list
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
//		CouponVO couponVO1 = new CouponVO();
//		couponVO1.setCouponId("50MONEYOFF");
//		couponVO1.setCouponName("折扣50元");
//		couponVO1.setCouponDollar(50);
//		couponVO1.setCouponBalance(666);
//		couponVO1.setCouponMFD(java.sql.Date.valueOf("2019-04-02"));
//		couponVO1.setCouponEXP(java.sql.Date.valueOf("2019-05-20"));
//		couponVO1.setCouponStatus(1);
//
//		dao.insert(couponVO1);
		
		// 修改
//		CouponVO couponVO2 = new CouponVO();
//		couponVO2.setCouponBalance(10);
//		couponVO2.setCouponEXP(java.sql.Date.valueOf("2019-04-8"));
//		couponVO2.setCouponStatus(0);
//		couponVO2.setCouponId("50MONEYOFF");
//		dao.update(couponVO2);
		
		// 查詢單一
//		CouponVO couponVO3 = dao.findByPrimaryKey("FIRSTORDER500");
//		System.out.print(couponVO3.getCouponId()+ ",");
//		System.out.print(couponVO3.getCouponName()+ ",");
//		System.out.print(couponVO3.getCouponDollar()+ ",");
//		System.out.print(couponVO3.getCouponBalance()+ ",");
//		System.out.print(couponVO3.getCouponMFD()+ ",");
//		System.out.print(couponVO3.getCouponEXP()+ ",");
//		System.out.println(couponVO3.getCouponStatus()+ ",");
//		System.out.println("---------------------------------------------");
		
		// 查詢全部
		List<CouponVO> list = dao.getAll();
		for (CouponVO couponVO4 : list) {
			System.out.print(couponVO4.getCouponId()+ ",");
			System.out.print(couponVO4.getCouponName()+ ",");
			System.out.print(couponVO4.getCouponDollar()+ ",");
			System.out.print(couponVO4.getCouponBalance()+ ",");
			System.out.print(couponVO4.getCouponMFD()+ ",");
			System.out.print(couponVO4.getCouponEXP()+ ",");
			System.out.println(couponVO4.getCouponStatus()+ ",");
			System.out.println("---------------------------------------------");
		}
		
		
	

	}

}
