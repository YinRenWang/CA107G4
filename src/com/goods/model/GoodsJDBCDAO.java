package com.goods.model;

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

public class GoodsJDBCDAO implements GoodsDAO_interface {

	private static byte[] pic = null;

	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USER = "WESHARE";
	private static final String PASSWORD = "123456";

	private static final String INSERT_STMT = "INSERT INTO Goods VALUES (('GD'||LPAD(to_char(Goods_seq.NEXTVAL), 5, '0')),?,?,?,?,?,?)";
	private static final String UPDATE_Goods = "UPDATE Goods SET TeacherId=?, goodName=?, goodPrice=?, goodInfo=?, goodImg=?, goodStatus=? WHERE goodId = ?";
	private static final String UPDATE_Goods_NoPic = "UPDATE Goods SET TeacherId=?, goodName=?, goodPrice=?, goodInfo=?, goodStatus=? WHERE goodId = ?";
	private static final String FINDBYPK_STMT = "SELECT * FROM Goods WHERE GoodId = ?";
	private static final String UpdateStatus_STMT = "UPDATE Goods SET goodStatus = ? WHERE GOODID = ?";
	private static final String GET_ALL = "SELECT * FROM GOODS";
	private static final String GET_ALL_STATUS = "SELECT * FROM GOODS where goodStatus=?";
	private static final String DELETE_STMT = "DELETE FROM GOODS WHERE goodId = ?";

	private static final String GET_TEACHER_GOODS = "SELECT * FROM Goods WHERE TEACHERID = ?";

	@Override
	public List<GoodsVO> getGoodsByteacher(String teacher) {
		GoodsVO goodsVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<GoodsVO> glist = new ArrayList<>();

		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(GET_TEACHER_GOODS);

			pstmt.setString(1, teacher);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				goodsVO = new GoodsVO();
				goodsVO.setGoodId(rs.getString(1));
				goodsVO.setTeacherId(rs.getString(2));
				goodsVO.setGoodName(rs.getString(3));
				goodsVO.setGoodPrice(rs.getInt(4));
				goodsVO.setGoodInfo(rs.getString(5));
				goodsVO.setGoodStatus(rs.getInt(7));
				glist.add(goodsVO);
				System.out.println(goodsVO);
			}

		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return glist;
	}

	@Override
	public void insert(GoodsVO goodVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			System.out.println("DAO:" + goodVO);

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, goodVO.getTeacherId());
			pstmt.setString(2, goodVO.getGoodName());
			pstmt.setDouble(3, goodVO.getGoodPrice());
			pstmt.setString(4, goodVO.getGoodInfo());
			pstmt.setBytes(5, goodVO.getGoodImg());
			pstmt.setInt(6, goodVO.getGoodStatus());

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

	}

	@Override
	public int updateGood(GoodsVO goodVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rs = 0;

		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(UPDATE_Goods);
			pstmt.setString(1, goodVO.getTeacherId());
			pstmt.setString(2, goodVO.getGoodName());
			pstmt.setDouble(3, goodVO.getGoodPrice());
			pstmt.setString(4, goodVO.getGoodInfo());
			pstmt.setBytes(5, goodVO.getGoodImg());
			pstmt.setInt(6, goodVO.getGoodStatus());
			pstmt.setString(7, goodVO.getGoodId());

			rs = pstmt.executeUpdate();
			System.out.println("修改一筆資料");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
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
		return rs;
	}

	@Override
	public void updateGood_NoPic(GoodsVO goodVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(UPDATE_Goods_NoPic);
			pstmt.setString(1, goodVO.getTeacherId());
			pstmt.setString(2, goodVO.getGoodName());
			pstmt.setDouble(3, goodVO.getGoodPrice());
			pstmt.setString(4, goodVO.getGoodInfo());
			pstmt.setInt(6, goodVO.getGoodStatus());
			pstmt.setString(7, goodVO.getGoodId());

			pstmt.executeUpdate();
			System.out.println("修改一筆資料");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
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
	public void updateStatus(GoodsVO goodVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(UpdateStatus_STMT);

			pstmt.setInt(1, goodVO.getGoodStatus());
			pstmt.setString(2, goodVO.getGoodId());
			pstmt.executeUpdate();
		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

	}

	@Override
	public void delete(String goodId) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(DELETE_STMT);

			pstmt.setString(1, goodId);
			pstmt.executeUpdate();
		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public GoodsVO findByPK(String goodId) {
		GoodsVO goodsVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(FINDBYPK_STMT);

			pstmt.setString(1, goodId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				goodsVO = new GoodsVO();
				goodsVO.setGoodId(rs.getString("goodId"));
				goodsVO.setTeacherId(rs.getString("teacherId"));
				goodsVO.setGoodName(rs.getString("goodName"));
				goodsVO.setGoodPrice(rs.getInt("goodPrice"));
				goodsVO.setGoodInfo(rs.getString("goodInfo"));
				goodsVO.setGoodImg(rs.getBytes("goodImg"));
				goodsVO.setGoodStatus(rs.getInt("goodStatus"));
			}

		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return goodsVO;
	}

	@Override
	public List<GoodsVO> getAll() {
		List<GoodsVO> goodsList = new ArrayList<GoodsVO>();
		GoodsVO goodsVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				goodsVO = new GoodsVO();
				goodsVO.setGoodId(rs.getString("goodId"));
				goodsVO.setTeacherId(rs.getString("teacherId"));
				goodsVO.setGoodName(rs.getString("goodName"));
				goodsVO.setGoodPrice(rs.getInt("goodPrice"));
				goodsVO.setGoodInfo(rs.getString("goodInfo"));
				goodsVO.setGoodImg(rs.getBytes("goodImg"));
				goodsVO.setGoodStatus(rs.getInt("goodStatus"));
				goodsList.add(goodsVO);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return goodsList;
	}

	@Override
	public List<GoodsVO> getGoodsByStatus(int goodStatus) {
		List<GoodsVO> goodsList = new ArrayList<GoodsVO>();
		GoodsVO goodsVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STATUS);
			pstmt.setInt(1, goodStatus);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				goodsVO = new GoodsVO();
				goodsVO.setGoodId(rs.getString("goodId"));
				goodsVO.setTeacherId(rs.getString("teacherId"));
				goodsVO.setGoodName(rs.getString("goodName"));
				goodsVO.setGoodPrice(rs.getInt("goodPrice"));
				goodsVO.setGoodInfo(rs.getString("goodInfo"));
//				goodsVO.setGoodImg(rs.getBytes("goodImg"));
				goodsList.add(goodsVO);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return goodsList;
	}

	public static byte[] getPictureByteArray(String path) throws IOException {
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

	public static void main(String[] args) {

		GoodsJDBCDAO dao = new GoodsJDBCDAO();

		

		
		System.out.println(dao.getGoodsByteacher("TC00001"));
		
		
//		try {
//			pic = getPictureByteArray("images/01.jpg");
//		} catch (IOException e) {
//			e.printStackTrace();
//		}

		// insert
//		GoodsVO goods1 = new GoodsVO();
//		goods1.setTeacherId("TC00001");
//		goods1.setGoodName("深入淺出Servlet4");
//		goods1.setGoodPrice(7788);
//		goods1.setGoodInfo(null);
//		goods1.setGoodImg(null);
//		goods1.setGoodStatus(0);
//		System.out.println(goods1);
//		dao.insert(goods1);

//		public static void main(String[] args) {

//		GoodsService goodSvc = new GoodsService();		
//		
//		System.out.println(goodSvc.updateGood(GD00001,TC00002,AJax深入淺出, 500, AJax是簡單的, null, 0));
//				
//	}

		// update
//		GoodsVO goods2 = new GoodsVO();
//		goods2.setTeacherId("TC00002");
//		goods2.setGoodName("RWD");
//		goods2.setGoodPrice(9898555);
//		goods2.setGoodInfo("AAAA");
//		goods2.setGoodImg(pic);
//		goods2.setGoodStatus(1);
//		goods2.setGoodId("GD00001");
//		dao.updateGood(goods2);
//		System.out.println(dao);

//		 delete
//		dao.delete("GD00011");

		// findByPK
//		GoodsVO goods3 = dao.findByPK("GD00001");
//		System.out.println(goods3.getGoodId());
//		System.out.println(goods3.getTeacherId());
//		System.out.println(goods3.getGoodName());
//		System.out.println(goods3.getGoodPrice());
//		System.out.println(goods3.getGoodInfo());
//		System.out.println(goods3.getGoodImg());
//		System.out.println(goods3.getGoodStatus());

		// get_All
//		List<GoodsVO> list = dao.getAll();
//		for(GoodsVO good : list) {
//			System.out.print(good.getGoodId()+",");
//			System.out.print(good.getTeacherId()+",");
//			System.out.print(good.getGoodName()+",");
//			System.out.print(good.getGoodPrice()+",");
//			System.out.print(good.getGoodInfo()+",");
//			System.out.print(good.getGoodImg()+",");
//			System.out.print(good.getGoodStatus());
//			System.out.println();
//		}
	}

}
