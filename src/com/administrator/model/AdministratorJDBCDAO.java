package com.administrator.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdministratorJDBCDAO implements AdministratorDAO_interface{
	    
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
//		String url = "jdbc:oracle:thin:@localhost:49161:XE";
		String userid = "WESHARE";
		String passwd = "123456";
		
		//新增
		private static final String INSERT_STMT = "INSERT INTO Coupon VALUES (?,?,?,?,?,?)";
		
		//修改
		private static final String UPDATE = "UPDATE Administrator set admPsw=?, admStatus=? where admId = ?";

		//刪除
		private static final String DELETE = "DELETE FROM Administrator where admId = ?";
		
		//查詢
		private static final String GET_ALL_STMT = "SELECT admId , admPsw, admStatus FROM Administrator";
		private static final String GET_ONE_STMT = "SELECT admId , admPsw, admStatus FROM Administrator where admId = ?";

	@Override
	public void insert(AdministratorVO administratorVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, administratorVO.getAdmId());
			pstmt.setString(2, administratorVO.getAdmPsw());
			pstmt.setInt(3, administratorVO.getAdmStatus());

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
	public void update(AdministratorVO administratorVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			
			pstmt.setString(1, administratorVO.getAdmPsw());
			pstmt.setInt(2, administratorVO.getAdmStatus());
			pstmt.setString(3, administratorVO.getAdmId());

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
	public AdministratorVO findByPrimaryKey(String admId) {
		AdministratorVO administratorVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, admId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// deptVO 也稱為 Domain objects
				administratorVO = new AdministratorVO();
				administratorVO.setAdmId(rs.getString("AdmId"));
				administratorVO.setAdmPsw(rs.getString("AdmPsw"));
				administratorVO.setAdmStatus(rs.getInt("AdmStatus"));
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
		return administratorVO;
	}


	@Override
	public List<AdministratorVO> getAll() {
		List<AdministratorVO> list = new ArrayList<AdministratorVO>();
		AdministratorVO administratorVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				administratorVO = new AdministratorVO();
				administratorVO.setAdmId(rs.getString("AdmId"));
				administratorVO.setAdmPsw(rs.getString("AdmPsw"));
				administratorVO.setAdmStatus(rs.getInt("AdmStatus"));
				list.add(administratorVO); // Store the row in the list
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
	public void delete(String admId) {
		

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1,admId);

			pstmt.executeUpdate();
			System.out.println("已刪除一筆資料");

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
	
	public static void main(String[] args) {
		AdministratorJDBCDAO dao=new AdministratorJDBCDAO();

		// 新增
//		AdministratorVO admin1 = new AdministratorVO();
//		admin1.setAdmId("root2");
//		admin1.setAdmPsw("root2");
//		admin1.setAdmStatus(0);
//		dao.insert(admin1);

		// 修改
//		AdministratorVO admin2 = new AdministratorVO();
//		admin2.setAdmPsw("root2");
//		admin2.setAdmStatus(1);
//		admin2.setAdmId("root2");
//		dao.update(admin2);
		
		//刪除
//		dao.delete("founder");

		// 查詢單一
//		AdministratorVO admin3= dao.findByPrimaryKey("root");
//		System.out.println(admin3.getAdmId() + ",");
//		System.out.println(admin3.getAdmPsw() + ",");
//		System.out.println(admin3.getAdmStatus()+ ",");
//		System.out.println("---------------------");

//		// 查詢全部
		List<AdministratorVO> list = dao.getAll();
		for (AdministratorVO administratorVO : list) {
			System.out.println(administratorVO.getAdmId() + ",");
			System.out.println(administratorVO.getAdmPsw() + ",");
			System.out.println(administratorVO.getAdmStatus()+ ",");
			System.out.println();
		}
	
	}



}
