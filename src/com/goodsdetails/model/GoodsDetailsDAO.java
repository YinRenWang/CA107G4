package com.goodsdetails.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.goods.model.GoodsJDBCDAO;
import com.goods.model.GoodsVO;
import com.goodsorder.model.GoodsOrderJDBCDAO;
import com.goodsorder.model.GoodsOrderVO;

public class GoodsDetailsDAO implements GoodsDetailsDAO_interface{
	// 一個應用程式中,針對一個資料庫 ,共用一個DataSource即可
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO GoodsDetails VALUES (?,?,?,null,null)";
	private static final String UPDATE_STMT = "UPDATE GoodsDetails SET GOODAMOUNT = ?, goodScore = ? , goodRate = ? WHERE GOODORDERID = ?and GOODID = ?";
	private static final String DELETE_STMT = "DELETE FROM GoodsDetails where GOODORDERID = ?";
	private static final String FIND_BY_PK = "SELECT * FROM GoodsDetails WHERE GOODORDERID = ? and GoodId=?";
	private static final String FIND_BY_PKALL = "SELECT * FROM GoodsDetails WHERE GOODORDERID = ?";
	private static final String GET_ALL = "SELECT * FROM GoodsDetails";
	
//	@Override
//	public void insert(GoodsDetailsVO goodDetailsVO) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		try {
//			Class.forName(DRIVER);
//			con = DriverManager.getConnection(URL, USER, PASSWORD);
//			pstmt = con.prepareStatement(INSERT_STMT);
//			
//			pstmt.setString(1, goodDetailsVO.getGoodOrderId());
//			pstmt.setString(2, goodDetailsVO.getGoodId());
//			pstmt.setInt(3, goodDetailsVO.getGoodAmount());
//			pstmt.setDouble(4, goodDetailsVO.getGoodScore());
//			pstmt.setString(5, goodDetailsVO.getGoodRate());
//			pstmt.executeUpdate();
//			System.out.println("新增一筆資料");
//			
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
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
//	}
	
	@Override
	public void insertDetails(GoodsDetailsVO goodDetailsVO, Connection con) {
		
		PreparedStatement pstmt = null;
		
		try {

			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1,goodDetailsVO.getGoodOrderId());
			pstmt.setString(2,goodDetailsVO.getGoodId());
			pstmt.setInt(3, goodDetailsVO.getGoodAmount());
			pstmt.executeUpdate();												
			
			// Handle any SQL errors
		} catch (SQLException se) {
			if (con != null) {
				try {
					// 3●設定於當有exception發生時之catch區塊內
					System.err.print("Transaction is being ");
					System.err.println("rolled back-由-Details");
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
		
	
//	@Override
//	public void insertWithDetails(GoodsDetailsVO goodDetailsVO, List<GoodsOrderVO> list) {
//		
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		
//		try {
//
//			Class.forName(DRIVER);
//			con = DriverManager.getConnection(URL, USER, PASSWORD);
//			
//			// 1●設定於 pstm.executeUpdate()之前
//    		con.setAutoCommit(false);
//    		String cols[] = {"GODDSORDERID"};   		
//    		pstmt = con.prepareStatement(INSERT_STMT , cols);
//    		pstmt.setString(1, goodDetailsVO.getGoodId());
//			pstmt.setInt(2, goodDetailsVO.getGoodAmount());
//			pstmt.setDouble(3, goodDetailsVO.getGoodScore());
//			pstmt.setString(4, goodDetailsVO.getGoodRate());
//			pstmt.executeUpdate();
//			//掘取對應的自增主鍵值
//			String next_orderId = null;
//			ResultSet rs = pstmt.getGeneratedKeys();
//			if (rs.next()) {
//				next_orderId = rs.getString(1);
//				System.out.println("自增主鍵值= " + next_orderId +"(剛新增成功的訂單編號)");
//			}else {
//				System.out.println("未取得自增主鍵值");
//			}
//			rs.close();
//			
//			GoodsOrderJDBCDAO dao = new GoodsOrderJDBCDAO();
//			System.out.println("list.size()-A="+list.size());
//			for (GoodsOrderVO aOrder : list) {
//				aOrder.setGoodOrderId(next_orderId);
//				dao.insertOrder(aOrder,con);
//			}
//			
//			// 2●設定於 pstm.executeUpdate()之後
//				con.commit();
//				con.setAutoCommit(true);
//				
//				System.out.println("list.size()-B="+list.size());
//				System.out.println("新增訂單編號" + next_orderId + "時,共有物品" + list.size()
//						+ "人同時被新增");
//				// Handle any driver errors
//		}catch (ClassNotFoundException e) {
//			throw new RuntimeException("Couldn't load database driver. "
//					+ e.getMessage());
//			// Handle any SQL errors
//		}catch (SQLException se) {
//			if (con != null) {
//				try {
//					// 3●設定於當有exception發生時之catch區塊內
//					System.err.print("Transaction is being ");
//					System.err.println("rolled back-由-detail");
//					con.rollback();
//				} catch (SQLException excep) {
//					throw new RuntimeException("rollback error occured. "
//							+ excep.getMessage());
//				}
//			}
//			throw new RuntimeException("A database error occured. "
//					+ se.getMessage());
//			// Clean up JDBC resources
//		}finally {
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
//		
//		
//	}
	
	
	@Override
	public void update(GoodsDetailsVO goodDetailsVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setInt(1, goodDetailsVO.getGoodAmount());
			pstmt.setDouble(2, goodDetailsVO.getGoodScore());
			pstmt.setString(3, goodDetailsVO.getGoodRate());
			pstmt.setString(4, goodDetailsVO.getGoodOrderId());
			pstmt.setString(5, goodDetailsVO.getGoodId());
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
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
	public void delete(String goodOrderId, String goodId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE_STMT);
			pstmt.setString(1, goodOrderId);
			pstmt.setString(2, goodId);
			pstmt.executeUpdate();
			System.out.println("已刪除一筆");
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
	public GoodsDetailsVO findByPK(String goodOrderId, String goodId) {
		GoodsDetailsVO details = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FIND_BY_PK);
			pstmt.setString(1, goodOrderId);
			pstmt.setString(2, goodId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				details = new GoodsDetailsVO();
				details.setGoodOrderId(rs.getString("GoodOrderId"));
				details.setGoodId(rs.getString("GoodId"));
				details.setGoodAmount(rs.getInt("GoodAmount"));
				details.setGoodScore(rs.getDouble("GoodScore"));
				details.setGoodRate(rs.getString("GoodRate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
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
		
		return details;
	}
	
	public List<GoodsDetailsVO>getFindByPKAll(String goodOrderId){
		List<GoodsDetailsVO> detailsList = new ArrayList<GoodsDetailsVO>();
		GoodsDetailsVO details = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FIND_BY_PKALL);
			pstmt.setString(1, goodOrderId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			    details = new GoodsDetailsVO();
				details.setGoodOrderId(rs.getString("GOODORDERID"));
				details.setGoodId(rs.getString("GoodId"));
				details.setGoodAmount(rs.getInt("GoodAmount"));
				details.setGoodScore(rs.getDouble("GoodScore"));
				details.setGoodRate(rs.getString("GoodRate"));
				detailsList.add(details);
			}
		} catch (SQLException e) {
			e.printStackTrace();
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
		return detailsList;
		
		
		
	}
	
	
	@Override
	public List<GoodsDetailsVO> getAll() {
		List<GoodsDetailsVO> detailsList = new ArrayList<GoodsDetailsVO>();
		GoodsDetailsVO details = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			    details = new GoodsDetailsVO();
				details.setGoodOrderId(rs.getString("GOODORDERID"));
				details.setGoodId(rs.getString("GoodId"));
				details.setGoodAmount(rs.getInt("GoodAmount"));
				details.setGoodScore(rs.getDouble("GoodScore"));
				details.setGoodRate(rs.getString("GoodRate"));
				detailsList.add(details);
			}
		} catch (SQLException e) {
			e.printStackTrace();
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
		return detailsList;
	}
	
	
	public static void main(String[] args) {
	
		GoodsDetailsDAO dao = new GoodsDetailsDAO();
		
		GoodsDetailsVO detailVO = new GoodsDetailsVO();
		detailVO.setGoodId("Java");
		detailVO.setGoodAmount(10);
		detailVO.setGoodScore(3.1);
		detailVO.setGoodRate("範例說明舉的好");
		
		List<GoodsOrderVO> testlist = new ArrayList<GoodsOrderVO>();
		GoodsOrderVO orderXX = new GoodsOrderVO();
		orderXX.setMemId("weshare01");
		orderXX.setGoodTotalPrice(8000);
		orderXX.setGoodDate(new Timestamp(new java.util.Date().getTime()));
		orderXX.setBuyerName("游宗叡");
		orderXX.setBuyerAddress("瑞芳");
		orderXX.setBuyerPhone("0936167890");
		orderXX.setGoodOrdStatus(0);
		
		testlist.add(orderXX);
	//	dao.insertWithDetails(detailVO, testlist);
		
		
	
	//insert 
//	GoodsDetailsVO detail = new GoodsDetailsVO();
//	detail.setGoodOrderId("GO00003");
//	detail.setGoodId("GD00003");
//	detail.setGoodAmount(66);
//	detail.setGoodScore(new Double(2.3));
//	detail.setGoodRate("缺乏範例練習");
//	dao.insert(detail);
	
	//update
//	GoodsDetailsVO detalis2 = new GoodsDetailsVO();
//	detalis2.setGoodAmount(66);
//	detalis2.setGoodScore(new Float(3.5));
//	detalis2.setGoodRate("評價");
//	detalis2.setGoodOrderId("GO00003");
//	detalis2.setGoodId("GD00005");
//	dao.update(detalis2);
	
	//delete
//	dao.delete("GO00004", "GD00001");
	
	//findByPK
//	GoodsDetailsVO details = dao.findByPK("GO00004", "GD00001");
//	System.out.print(details.getGoodOrderId()+ ",");
//	System.out.print(details.getGoodId()+ ",");
//	System.out.print(details.getGoodAmount()+ ",");
//	System.out.print(details.getGoodScore()+ ",");
//	System.out.print(details.getGoodRate());
//	System.out.println();
	
	//getAll
//	List<GoodsDetailsVO> list = dao.getAll();
//	for(GoodsDetailsVO details : list) {
//		System.out.print(details.getGoodOrderId()+ ",");
//		System.out.print(details.getGoodId()+ ",");
//		System.out.print(details.getGoodAmount()+",");
//		System.out.print(details.getGoodScore()+",");
//		System.out.print(details.getGoodRate());
//		System.out.println();
//	}
	}





}
