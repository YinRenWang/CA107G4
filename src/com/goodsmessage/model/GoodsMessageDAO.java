package com.goodsmessage.model;

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

public class GoodsMessageDAO implements GoodsMessageDAO_interface{
    
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
	private static final String INSERT_STMT = "INSERT INTO GOODSMESSAGE VALUES (('GM'||LPAD(to_char(GOODSMESSAGE_seq.NEXTVAL), 5, '0')),?,?,?)";
	private static final String DELETE_STMT = "DELETE FROM GOODSMESSAGE WHERE GOODSMESSAGEID = ?";
	private static final String GET_ALL = "SELECT * FROM GOODSMESSAGE"; 

	@Override
	public void insert(GoodsMessageVO goodsMessage) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, goodsMessage.getGoodId());
			pstmt.setString(2, goodsMessage.getMemId());
			pstmt.setString(3, goodsMessage.getMessageContent());
			pstmt.executeUpdate();
		}  catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delete(String goodMessageId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE_STMT);
			pstmt.setString(1, goodMessageId);
			pstmt.executeUpdate();
	
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<GoodsMessageVO> getAll() {
		List<GoodsMessageVO> messageList = new ArrayList<GoodsMessageVO>();
		GoodsMessageVO message = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				message = new GoodsMessageVO();
				message.setGoodMessageId(rs.getString("GoodsMessageId"));
				message.setGoodId(rs.getString("GoodId"));
				message.setMemId(rs.getString("MemId"));
				message.setMessageContent(rs.getString("MessageContent"));
				messageList.add(message);
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
		return messageList;
	}
	
	public static void main(String[] args) {
		GoodsMessageDAO dao = new GoodsMessageDAO();
		
		//insert
//		GoodsMessageVO message = new GoodsMessageVO();
//		message.setGoodId("GD00002");
//		message.setMemId("weshare02");
//		message.setMessageContent("30cm好�?��??");
//		dao.insert(message);
		
		//delete
//		dao.delete("GM00005");
		
		//getAll
		List<GoodsMessageVO> list = dao.getAll();
		for(GoodsMessageVO message : list) {
			System.out.print(message.getGoodMessageId()+ ",");
			System.out.print(message.getGoodId()+ ",");
			System.out.print(message.getMemId()+ ",");
			System.out.print(message.getMessageContent());
			System.out.println();
		}
	
	}


}
