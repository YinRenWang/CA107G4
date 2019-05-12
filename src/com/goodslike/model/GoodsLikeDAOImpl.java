package com.goodslike.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GoodsLikeDAOImpl implements GoodsLikeDAO_interface {

	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USER = "weshare";
	private static final String PASSWORD = "123456";

	private static final String INSERT_STMT = "INSERT INTO GoodsLike VALUES (?,?)";
	private static final String DELETE_STMT = "DELETE FROM GoodsLike where goodId = ? and memId = ? ";
	private static final String GET_ALL = "SELECT * FROM GoodsLike";

	@Override
	public void insert(GoodsLikeVO goodLikeVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, goodLikeVO.getGoodId());
			pstmt.setString(2, goodLikeVO.getMemId());
			pstmt.executeUpdate();
			System.out.println("已新增一筆資料");

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
	public void delete(String goodId, String memId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(DELETE_STMT);
			pstmt.setString(1, goodId);
			pstmt.setString(2, memId);
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
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
				}
			}
		}
	}

	@Override
	public List<GoodsLikeVO> getAll() {
		List<GoodsLikeVO> likeList = new ArrayList<GoodsLikeVO>();
		GoodsLikeVO like = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				like = new GoodsLikeVO();
				like.setGoodId(rs.getString("GoodId"));
				like.setMemId(rs.getString("MemId"));
				likeList.add(like);
			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs == null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt == null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
			if (con == null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return likeList;
	}

	public static void main(String[] args) {

		GoodsLikeDAOImpl dao = new GoodsLikeDAOImpl();
		// insert
//		GoodsLikeVO goodLikeVO = new GoodsLikeVO();
//		goodLikeVO.setGoodId("GD00003");
//		goodLikeVO.setMemId("weshare03");
//		dao.insert(goodLikeVO);
		
		// delete
//		dao.delete("GD00003", "weshare03");
		
		// getAll
//		List<GoodsLikeVO> list = dao.getAll();
//		for(GoodsLikeVO likes : list) {
//			System.out.print(likes.getGoodId()+ ",");
//			System.out.print(likes.getMemId());
//			System.out.println();
//		}
	}
}
