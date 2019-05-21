package com.goodsreport.model;

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

import oracle.jdbc.proxy.annotation.Pre;

public class GoodsReportDAO implements GoodsReportDAO_interface{
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
		

	private static final String INSERT_STMT = "INSERT INTO GOODSREPORT VALUES (('GR'||LPAD(to_char(GoodsReport_seq.NEXTVAL), 5, '0')),?,?,?,?)";
	private static final String UPDATE_STMT = "UPDATE GOODSREPORT SET GOODREPORTSTATUS = ? WHERE MEMID = ?";
	private static final String findByMemId = "SELECT * FROM GOODSREPORT WHERE MEMId = ?";
	private static final String DELETE_STMT = "DELETE FROM GOODSREPORT WHERE GOODREPORTID = ?";
	private static final String GET_ALL = "SELECT * FROM GOODSREPORT"; 
	@Override
	public void insert(GoodsReportVO goodsReportVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, goodsReportVO.getMemId());
			pstmt.setString(2, goodsReportVO.getGoodId());
			pstmt.setString(3, goodsReportVO.getGoodReportContent());
			pstmt.setInt(4, goodsReportVO.getGoodReportStatus());
			pstmt.executeUpdate();
			System.out.println("?��增�?筆�?��??");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public void update(GoodsReportVO goodsReportVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setInt(1, goodsReportVO.getGoodReportStatus());
			pstmt.setString(2, goodsReportVO.getMemId());
			pstmt.executeUpdate();
			
		}  catch (SQLException e) {
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
	public void delete(String goodReportId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE_STMT);
			pstmt.setString(1, goodReportId);
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
	public GoodsReportVO findByMemId(String memId) {
		GoodsReportVO report = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(findByMemId);
			pstmt.setString(1, memId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				report = new GoodsReportVO();
				report.setGoodReportId(rs.getString("GoodReportId"));
				report.setMemId(rs.getString("MemId"));
				report.setGoodId(rs.getString("GoodId"));
				report.setGoodReportContent(rs.getString("GoodReportContent"));
				report.setGoodReportStatus(rs.getInt("GoodReportStatus"));
				System.out.println(rs.getString("GoodId"));
				
			}
		}  catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
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
		return report;
	}
	@Override
	public List<GoodsReportVO> getAll() {
		List<GoodsReportVO> reportList = new ArrayList();
		GoodsReportVO report = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				report = new GoodsReportVO();
				report.setGoodReportId(rs.getString("GoodReportId"));
				report.setMemId(rs.getString("MEMID"));
				report.setGoodId(rs.getString("GoodId"));
				report.setGoodReportContent(rs.getString("GoodReportContent"));
				report.setGoodReportStatus(rs.getInt("GoodReportStatus"));
				reportList.add(report);
			}
		}  catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
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
		return reportList;
	}
	
	
	public static void main(String[] args) {
		
		GoodsReportDAO dao = new GoodsReportDAO();
		
		//add
//		GoodsReportVO report = new GoodsReportVO();
//		report.setMemId("weshare04");
//		report.setGoodId("GD00001");
//		report.setGoodReportContent("好�?��?��?��??");
//		report.setGoodReportStatus(1);
//		dao.insert(report);
		
		//update
		GoodsReportVO report1 = new GoodsReportVO();
		report1.setGoodReportStatus(0);
		report1.setMemId("weshare04");
		dao.update(report1);
		
		//findByMemId
//		GoodsReportVO report2 = dao.findByMemId("weshare02");
//		System.out.print(report2.getGoodReportId()+ ",");
//		System.out.print(report2.getGoodId()+ ",");
//		System.out.print(report2.getGoodReportContent()+ ",");
//		System.out.print(report2.getGoodReportStatus());
		
		//delete
//		dao.delete("GR00005");
		
		//getAll
//		List<GoodsReportVO> list =  dao.getAll();
//		for(GoodsReportVO reports : list) {
//			System.out.print(reports.getGoodReportId()+ ",");
//			System.out.print(reports.getMemId()+ ",");
//			System.out.print(reports.getGoodId()+ ",");
//			System.out.print(reports.getGoodReportContent()+ ",");
//			System.out.print(reports.getGoodReportStatus());
//			System.out.println();
//		}
		
		
	}
	
}

