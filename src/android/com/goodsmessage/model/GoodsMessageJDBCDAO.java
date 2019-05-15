package android.com.goodsmessage.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GoodsMessageJDBCDAO implements GoodsMessageDAO_interface{
	
	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USER = "WESHARE";
	private static final String PASSWORD = "123456";

	private static final String INSERT_STMT = "INSERT INTO GOODSMESSAGE VALUES (('GM'||LPAD(to_char(GOODSMESSAGE_seq.NEXTVAL), 5, '0')),?,?,?)";
	private static final String DELETE_STMT = "DELETE FROM GOODSMESSAGE WHERE GOODSMESSAGEID = ?";
	private static final String GET_ALL = "SELECT * FROM GOODSMESSAGE"; 

	@Override
	public void insert(GoodsMessageVO goodsMessage) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, goodsMessage.getGoodId());
			pstmt.setString(2, goodsMessage.getMemId());
			pstmt.setString(3, goodsMessage.getMessageContent());
			pstmt.executeUpdate();
			System.out.println("?��增�?筆�?��??");
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delete(String goodMessageId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(DELETE_STMT);
			pstmt.setString(1, goodMessageId);
			pstmt.executeUpdate();
			System.out.println("?��?���?筆�?��??");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
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
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
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
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
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
		GoodsMessageJDBCDAO dao = new GoodsMessageJDBCDAO();
		
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
