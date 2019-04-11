package com.advertisement.model;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.administrator.model.AdministratorVO;

public class AdvertisementJDBCDAO implements AdvertisementDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "WESHARE";
	String passwd = "123456";
	
	private static byte[] img=null;
	
	//新增
	private static final String INSERT_STMT = "INSERT INTO  Advertisement (adId,inscId,adStatus,adMFD,adEXP,adImg) VALUES (('AD'||LPAD(to_char(Advertisement_seq.NEXTVAL), 5, '0')),?,?,?,?,?)";
			
	//修改
	private static final String UPDATE = "UPDATE  Advertisement set adStatus=?,adEXP=?,adImg=? where adId = ?";
	
	//刪除
	private static final String DELETE = "DELETE FROM Advertisement where adId = ?";
	
	//查詢
	private static final String GET_ALL_STMT = "SELECT * FROM  Advertisement";
	private static final String GET_ONE_STMT = "SELECT * FROM  Advertisement where adId = ?";

	@Override
	public void insert(AdvertisementVO advertisementVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, advertisementVO.getInscId());
			pstmt.setInt(2, advertisementVO.getAdStatus());
			pstmt.setDate(3,advertisementVO.getAdMFD());
			pstmt.setDate(4,advertisementVO.getAdEXP());
			pstmt.setBytes(5, advertisementVO.getAdImg());

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
	public void update(AdvertisementVO advertisementVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setInt(1, advertisementVO.getAdStatus());
			pstmt.setDate(2,advertisementVO.getAdEXP());
			pstmt.setBytes(3, advertisementVO.getAdImg());
			pstmt.setString(4,advertisementVO.getAdId());

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
	public AdvertisementVO findByPrimaryKey(String adId) {
		AdvertisementVO advertisementVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, adId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// deptVO 也稱為 Domain objects
				advertisementVO = new AdvertisementVO();
				advertisementVO.setAdId(rs.getString("adId"));
				advertisementVO.setInscId(rs.getString("inscID"));
				advertisementVO.setAdStatus(rs.getInt("adStatus"));
				advertisementVO.setAdMFD(rs.getDate("adMFD"));
				advertisementVO.setAdEXP(rs.getDate("adEXP"));
				advertisementVO.setAdImg(rs.getBytes("adImg"));
				try {
				advertisementVO.setAdImg(new byte[rs.getBinaryStream("adImg").available()]);
				} catch (IOException e) {
				e.printStackTrace();
				} catch(NullPointerException e) {
				e.printStackTrace();
				}
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
		return advertisementVO;
	}

	@Override
	public List<AdvertisementVO> getAll() {
		List<AdvertisementVO> list = new ArrayList<AdvertisementVO>();
		AdvertisementVO advertisementVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				advertisementVO = new AdvertisementVO();
				advertisementVO.setAdId(rs.getString("adId"));
				advertisementVO.setInscId(rs.getString("inscID"));
				advertisementVO.setAdStatus(rs.getInt("adStatus"));
				advertisementVO.setAdMFD(rs.getDate("adMFD"));
				advertisementVO.setAdEXP(rs.getDate("adEXP"));
				advertisementVO.setAdImg(rs.getBytes("adImg"));
				try {
					advertisementVO.setAdImg(new byte[rs.getBinaryStream("adImg").available()]);
					} catch (IOException e) {
					e.printStackTrace();
					} catch(NullPointerException e) {
					e.printStackTrace();
					}
				list.add(advertisementVO); // Store the row in the list
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
	
	// 使用byte[]方式EX:檔案 一次打包傳輸進去(檔案大小 小於200MB推薦)
			public static byte[] getPictureByteArray(String path) throws IOException {
				File file = new File(path);
				FileInputStream fis = new FileInputStream(file);
				ByteArrayOutputStream baos = new ByteArrayOutputStream();//輸出到
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
			public void delete(String adId) {
				Connection con = null;
				PreparedStatement pstmt = null;

				try {

					Class.forName(driver);
					con = DriverManager.getConnection(url, userid, passwd);
					pstmt = con.prepareStatement(DELETE);

					pstmt.setString(1,adId);

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
		AdvertisementJDBCDAO dao=new AdvertisementJDBCDAO();
		
		// 新增
//		try {
//		img=dao.getPictureByteArray("images/Java.png");
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		AdvertisementVO adVO1 = new AdvertisementVO();
//		adVO1.setInscId("IC00001");
//		adVO1.setAdStatus(1);
//		adVO1.setAdMFD(java.sql.Date.valueOf("2019-04-01"));
//		adVO1.setAdEXP(java.sql.Date.valueOf("2019-04-04"));
//		adVO1.setAdImg(img);
//		dao.insert(adVO1);
		
		// 修改
		AdvertisementVO adVO2 = new AdvertisementVO();
		try {
		img=dao.getPictureByteArray("/images/carosel_1.jpg");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		adVO2.setAdStatus(0);
		adVO2.setAdEXP(java.sql.Date.valueOf("2019-04-30"));
		adVO2.setAdImg(img);
		adVO2.setAdId("AD00001");
		dao.update(adVO2);
		
		//刪除
//		dao.delete("AD00001");
		
		// 查詢單一
//		AdvertisementVO adVO3 = dao.findByPrimaryKey("AD00001");
//		System.out.print(adVO3.getAdId() + ",");
//		System.out.print(adVO3.getInscId()+ ",");
//		System.out.print(adVO3.getAdStatus() + ",");
//		System.out.print(adVO3.getAdMFD() + ",");
//		System.out.print(adVO3.getAdEXP() + ",");
//		System.out.println(adVO3.getAdImg() + ",");
//		System.out.println("-----------------------------------------");
		
//		// 查詢全部
//		List<AdvertisementVO> list = dao.getAll();
//		for (AdvertisementVO adVO4 : list) {
//			System.out.print(adVO4.getAdId() + ",");
//			System.out.print(adVO4.getInscId()+ ",");
//			System.out.print(adVO4.getAdStatus() + ",");
//			System.out.print(adVO4.getAdMFD() + ",");
//			System.out.print(adVO4.getAdEXP() + ",");
//			System.out.println(adVO4.getAdImg() + ",");
//			System.out.println();
//		}
//		

	}



}
