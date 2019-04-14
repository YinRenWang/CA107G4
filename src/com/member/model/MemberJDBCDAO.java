package com.member.model;

import java.io.*;
import java.sql.*;
import java.util.*;


public class MemberJDBCDAO implements MemberDAO_interface {
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "WESHARE";
	String passwd = "123456";
	
	private static byte[] img=null;
	
	private static final String INSERT_STMT = 
		  "INSERT INTO Member(memId,memIdCard,memPsw,memPswHint,memName,memSex,memImage,memEmail,memPhone,memBirth,memAdd,memText,memBank,memBalance,memBlock,memStatus,memPair,memSkill,memWantSkill) "
		+ "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,null,null,null)";
	
	private static final String REGIST_STMT = 
			  "INSERT INTO Member(memId,memIdCard,memPsw,memPswHint,memName,memSex,memImage,memEmail,memPhone,memBirth,memAdd,memBalance,memBlock,memStatus)"
			+ "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private static final String GET_ALL_STMT = 
		"SELECT * FROM Member  order by memId";
	private static final String GET_ONE_STMT = 
		"SELECT * FROM Member where memId = ?";
	private static final String GET_LOGIN_STMT = 
			"SELECT * FROM Member where memId = ? and memPsw =?";
	private static final String UPDATE = 
			"UPDATE Member set memPsw=?,memImage=?,memAdd=? ,memText=?, memBank=? ,memBalance=?,memBlock=?,memStatus=?,memSkill=?, memWantSkill=?,memPair=? where  memId =? ";
	private static final String EDIT_MEMBER_STMT = 
			"UPDATE Member set memPsw=?,memImage=?,memAdd=? ,memText=?, memBank=?,memSkill=?, memWantSkill=? where  memId =? ";
	
	@Override
	public void insert(MemberVO memberVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1,memberVO.getMemId());
			pstmt.setString(2,memberVO.getMemIdCard());
			pstmt.setString(3,memberVO.getMemPsw());
			pstmt.setString(4,memberVO.getMemPswHint());
			pstmt.setString(5,memberVO.getMemName());
			pstmt.setInt(6,memberVO.getMemSex());
			pstmt.setBytes(7,memberVO.getMemImage());
			pstmt.setString(8, memberVO.getMemEmail());
			pstmt.setString(9, memberVO.getMemPhone());
			pstmt.setDate(10, memberVO.getMemBirth());
			pstmt.setString(11,memberVO.getMemAdd());
			pstmt.setString(12,memberVO.getMemText());
			pstmt.setString(13,memberVO.getMemBank());
			pstmt.setInt(14,memberVO.getMemBalance());
			pstmt.setInt(15,memberVO.getMemBlock());
			pstmt.setInt(16,memberVO.getMemStatus());
			pstmt.setString(17,memberVO.getMemPair());
			pstmt.setString(18,memberVO.getMemSkill());
			pstmt.setString(19,memberVO.getMemWantSkill());
	
			
		

			pstmt.executeUpdate();

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
	public void registered(MemberVO memberVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(REGIST_STMT);

			pstmt.setString(1,memberVO.getMemId());
			pstmt.setString(2,memberVO.getMemIdCard());
			pstmt.setString(3,memberVO.getMemPsw());
			pstmt.setString(4,memberVO.getMemPswHint());
			pstmt.setString(5,memberVO.getMemName());
			pstmt.setInt(6,memberVO.getMemSex());
			pstmt.setBytes(7,memberVO.getMemImage());
			pstmt.setString(8, memberVO.getMemEmail());
			pstmt.setString(9, memberVO.getMemPhone());
			pstmt.setDate(10, memberVO.getMemBirth());
			pstmt.setString(11,memberVO.getMemAdd());
			pstmt.setInt(12,memberVO.getMemBalance());
			pstmt.setInt(13,memberVO.getMemBlock());
			pstmt.setInt(14,memberVO.getMemStatus());

			pstmt.executeUpdate();

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
	public void update(MemberVO memberVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setString(1,memberVO.getMemPsw());
			pstmt.setBytes(2,memberVO.getMemImage());
			pstmt.setString(3,memberVO.getMemAdd());
			pstmt.setString(4,memberVO.getMemText());
			pstmt.setString(5,memberVO.getMemBank());
			pstmt.setInt(6,memberVO.getMemBalance());
			pstmt.setInt(7,memberVO.getMemBlock());
			pstmt.setInt(8, memberVO.getMemStatus());
			pstmt.setString(9,memberVO.getMemSkill());
			pstmt.setString(10,memberVO.getMemWantSkill());
			pstmt.setString(11,memberVO.getMemPair());
			pstmt.setString(12, memberVO.getMemId());

		

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
	public MemberVO findByPrimaryKey(String memberId) {
		MemberVO memberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1,memberId);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				memberVO = new MemberVO();
				memberVO.setMemId(rs.getString("memId"));
				memberVO.setMemSkill(rs.getString("memSkill"));
				memberVO.setMemWantSkill(rs.getString("memWantSkill"));
				memberVO.setMemPair(rs.getString("memPair"));
				memberVO.setMemPsw(rs.getString("memPsw"));
				memberVO.setMemPswHint(rs.getString("memPswHint"));
				memberVO.setMemIdCard(rs.getString("memIdCard"));
				memberVO.setMemName(rs.getString("memName"));
				memberVO.setMemSex(rs.getInt("memSex"));
				memberVO.setMemImage(rs.getBytes("memImage"));
				try {
					memberVO.setMemImage(new byte[rs.getBinaryStream("memImage").available()]);
				} catch (IOException e) {
					e.printStackTrace();
				} catch(NullPointerException e) {
					e.printStackTrace();
				}
				memberVO.setMemEmail(rs.getString("memEmail"));
				memberVO.setMemPhone(rs.getString("memPhone"));
				memberVO.setMemBirth(rs.getDate("memBirth"));
				memberVO.setMemAdd(rs.getString("memAdd"));
				memberVO.setMemText(rs.getString("memText"));
				memberVO.setMemBank(rs.getString("memBank"));
				memberVO.setMemBalance(rs.getInt("memBalance"));
				memberVO.setMemBlock(rs.getInt("memBlock"));
				memberVO.setMemStatus(rs.getInt("memStatus"));
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
		return memberVO;
		
	}

	@Override
	public List<MemberVO> getAll() {
		List<MemberVO> list = new ArrayList<MemberVO>();
		MemberVO memberVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
		
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				memberVO = new MemberVO();
				memberVO.setMemId(rs.getString("memId"));
				memberVO.setMemSkill(rs.getString("memSkill"));
				memberVO.setMemWantSkill(rs.getString("memWantSkill"));
				memberVO.setMemPair(rs.getString("memPair"));
				memberVO.setMemPsw(rs.getString("memPsw"));
				memberVO.setMemPswHint(rs.getString("memPswHint"));
				memberVO.setMemIdCard(rs.getString("memIdCard"));
				memberVO.setMemName(rs.getString("memName"));
				memberVO.setMemSex(rs.getInt("memSex"));
				memberVO.setMemImage(rs.getBytes("memImage"));
//				try {
//					memberVO.setMemImage(new byte[rs.getBinaryStream("memImage").available()]);
//				} catch (IOException e) {
//					e.printStackTrace();
//				} catch(NullPointerException e) {
//					e.printStackTrace();
//				}
				memberVO.setMemEmail(rs.getString("memEmail"));
				memberVO.setMemPhone(rs.getString("memPhone"));
				memberVO.setMemBirth(rs.getDate("memBirth"));
				memberVO.setMemAdd(rs.getString("memAdd"));
				memberVO.setMemText(rs.getString("memText"));
				memberVO.setMemBank(rs.getString("memBank"));
				memberVO.setMemBalance(rs.getInt("memBalance"));
				memberVO.setMemBlock(rs.getInt("memBlock"));
				memberVO.setMemStatus(rs.getInt("memStatus"));
				
			
			
			
				list.add(memberVO); // Store the row in the list
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
		return list;
	}
	
	@Override
	public void editMember(MemberVO memberVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(EDIT_MEMBER_STMT);
			
			pstmt.setString(1,memberVO.getMemPsw());
			pstmt.setBytes(2,memberVO.getMemImage());
			pstmt.setString(3,memberVO.getMemAdd());
			pstmt.setString(4,memberVO.getMemText());
			pstmt.setString(5,memberVO.getMemBank());
			pstmt.setString(6,memberVO.getMemSkill());
			pstmt.setString(7,memberVO.getMemWantSkill());
			pstmt.setString(8, memberVO.getMemId());

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

	
		
	public static void main(String[] args) {
		MemberJDBCDAO dao=new MemberJDBCDAO();
		
		//新增
//		try {
//		img=dao.getPictureByteArray("images/1.jpg");
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		MemberVO memberVO1 = new MemberVO();
//		memberVO1.setMemId("weshare05");;
//		memberVO1.setMemIdCard("A218913537");
//		memberVO1.setMemPsw("123456");
//		memberVO1.setMemPswHint("123456");
//		memberVO1.setMemName("史嘉蕾·喬韓森");
//		memberVO1.setMemSex(1);
//		memberVO1.setMemImage(img);
//		memberVO1.setMemEmail("BlackWidow@gmail.com");
//		memberVO1.setMemPhone("0912345678");
//		memberVO1.setMemBirth(java.sql.Date.valueOf("1985-03-24"));
//		memberVO1.setMemAdd("桃園市中壢區中央路232巷12號");
//		memberVO1.setMemText("黑寡婦有著世界級的運動員水準能力，她能令身體做出許多高難度的複雜動作。她也是一名大師等級的武術高手，精通空手道、柔道、法式拳擊等各式武技。");
//		memberVO1.setMemBank("012454102301979");
//		memberVO1.setMemBalance(1315902);
//		memberVO1.setMemBlock(0);
//		memberVO1.setMemStatus(1);
//		memberVO1.setMemPair(null);
//		memberVO1.setMemSkill(null);
//		memberVO1.setMemWantSkill(null);
//		dao.insert(memberVO1);
		
		// 查詢全部
//		List<MemberVO> list = dao.getAll();
//		for (MemberVO memberVO2 : list) {
//			System.out.print(memberVO2.getMemId() + ",");
//			System.out.print(memberVO2.getMemPsw()+ ",");
//			System.out.print(memberVO2.getMemPswHint()+ ",");
//			System.out.print(memberVO2.getMemIdCard()+ ",");
//			System.out.print(memberVO2.getMemName()+ ",");
//			System.out.print(memberVO2.getMemSex()+ ",");
//			System.out.print(memberVO2.getMemImage()+ ",");
//			System.out.print(memberVO2.getMemEmail()+ ",");
//			System.out.print(memberVO2.getMemPhone()+ ",");
//			System.out.print(memberVO2.getMemBirth()+ ",");
//			System.out.print(memberVO2.getMemAdd()+ ",");
//			System.out.print(memberVO2.getMemText()+ ",");
//			System.out.print(memberVO2.getMemBank()+ ",");
//			System.out.print(memberVO2.getMemBalance()+ ",");
//			System.out.print(memberVO2.getMemBlock()+ ",");
//			System.out.print(memberVO2.getMemStatus()+ ",");
//			System.out.print(memberVO2.getMemSkill()+ ",");
//			System.out.print(memberVO2.getMemWantSkill()+ ",");
//			System.out.print(memberVO2.getMemPair()+ ",");
//	
//			System.out.println("---------------------");
//		}
//		
		// 查詢單筆
		MemberVO memberVO3 = dao.findByPrimaryKey("weshare03");
			System.out.print(memberVO3.getMemId() + ",");
			System.out.print(memberVO3.getMemPsw()+ ",");
			System.out.print(memberVO3.getMemPswHint()+ ",");
			System.out.print(memberVO3.getMemIdCard()+ ",");
			System.out.print(memberVO3.getMemName()+ ",");
			System.out.print(memberVO3.getMemSex()+ ",");
			Base64.Encoder encoder = Base64.getEncoder();
			String encodedText = encoder.encodeToString(memberVO3.getMemImage());
			System.out.println("???"+encodedText);
			System.out.print(memberVO3.getMemEmail()+ ",");
			System.out.print(memberVO3.getMemPhone()+ ",");
			System.out.print(memberVO3.getMemBirth()+ ",");
			System.out.print(memberVO3.getMemAdd()+ ",");
			System.out.print(memberVO3.getMemText()+ ",");
			System.out.print(memberVO3.getMemBank()+ ",");
			System.out.print(memberVO3.getMemBalance()+ ",");
			System.out.print(memberVO3.getMemBlock()+ ",");
			System.out.print(memberVO3.getMemStatus()+ ",");
			System.out.print(memberVO3.getMemSkill()+ ",");
			System.out.print(memberVO3.getMemWantSkill()+ ",");
			System.out.print(memberVO3.getMemPair()+ ",");
	
			System.out.println("---------------------");
		
//		 修改
//		MemberVO memberVO4 = new MemberVO();
//		memberVO4.setMemPsw("222222");
//		try {
//		img=dao.getPictureByteArray("E:/programming/CA107_Workspace/CA107G4/WebContent/images/blob/01.jpg");
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}		
//		memberVO4.setMemImage(img);
//		memberVO4.setMemAdd("桃園市中壢區永樂路31號");
//		memberVO4.setMemText("神力女超人是一位亞馬遜（基於希臘神話中的亞馬遜）的戰士公主，在她的家鄉被稱作天堂島的黛安娜公主（英語：Princess Diana of Themyscira）。在家鄉之外的地方，她有時也會用黛安娜·普林斯（英語：Diana Prince）這個偽裝身份的名字。她一出生就擁有超乎常人的力量和戰鬥技能，所配戴的武器包括「真言套索」、「神力手鐲」，並在部分故事中還擁有隱形戰機和有著治癒能力的紫雷。神力女超人於第二次世界大戰時期誕生，該角色最初被詮釋成會和軸心國軍隊以及各式各樣的超級反派戰鬥，到近年來的故事線則更著重於人物、神和怪物等希臘神話中的角色。自從她出道數十年，神力女超人時常對抗一心想對亞馬遜不利的各種經典反派，包括阿瑞斯、豹女、女巫瑟西與巨化女等。神力女超人也常在超級英雄團隊美國正義會（1941年）和正義聯盟（1960年）");
//		memberVO4.setMemBank("012587469523145");
//		memberVO4.setMemBalance(50000);
//		memberVO4.setMemBlock(1200);
//		memberVO4.setMemStatus(1);
//		memberVO4.setMemSkill("0007");
//		memberVO4.setMemWantSkill("0008");
//		memberVO4.setMemPair("weshare03");
//		memberVO4.setMemId("weshare01");
//		dao.update(memberVO4);
			
			//註冊
//			try {
//			img=dao.getPictureByteArray("C://1.jpeg");
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			MemberVO memberVO1 = new MemberVO();
//			memberVO1.setMemId("weshare05");;
//			memberVO1.setMemIdCard("A218913537");
//			memberVO1.setMemPsw("123456");
//			memberVO1.setMemPswHint("123456");
//			memberVO1.setMemName("史嘉蕾·喬韓森");
//			memberVO1.setMemSex(1);
//			memberVO1.setMemImage(img);
//			memberVO1.setMemEmail("BlackWidow@gmail.com");
//			memberVO1.setMemPhone("0912345678");
//			memberVO1.setMemBirth(java.sql.Date.valueOf("1985-03-24"));
//			memberVO1.setMemAdd("桃園市中壢區中央路232巷12號");
//			memberVO1.setMemBalance(0);
//			memberVO1.setMemBlock(0);
//			memberVO1.setMemStatus(0);
//			dao.registered(memberVO1);
				
		
			
		


	}

	







}
