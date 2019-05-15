package android.com.member.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO implements MemberDAO_interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static byte[] img = null;

	private static final String INSERT_STMT = "INSERT INTO Member(memId,memIdCard,memPsw,memPswHint,memName,memSex,memImage,memEmail,memPhone,memBirth,memAdd,memText,memBank,memBalance,memBlock,memStatus,memPair,memSkill,memWantSkill) "
			+ "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,null,null,null)";

	private static final String REGIST_STMT = "INSERT INTO Member(memId,memIdCard,memPsw,memPswHint,memName,memSex,memImage,memEmail,memPhone,memBirth,memAdd,memBalance,memBlock,memStatus)"
			+ "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

	private static final String GET_ALL_STMT = "SELECT * FROM Member  order by memId";
	private static final String GET_ONE_STMT = "SELECT * FROM Member where memId = ?";
	private static final String GET_LOGIN_STMT = "SELECT * FROM Member where memId = ? and memPsw =?";
	private static final String UPDATE = "UPDATE Member set memPsw=?,memImage=?,memAdd=? ,memText=?, memBank=? ,memBalance=?,memBlock=?,memStatus=?,memSkill=?, memWantSkill=?,memPair=? where  memId =? ";
	private static final String UPDATE1 = "UPDATE Member set memBalance=? ,memBlock=? where memId =? ";
	private static final String EDIT_MEMBER_STMT = "UPDATE Member set memPsw=?,memImage=?,memAdd=? ,memText=?, memBank=?,memSkill=?, memWantSkill=? where  memId =? ";

	private static final String UPDATE_BALANCE = "UPDATE Member set memBalance=? where memId =? ";

	@Override
	public void insert(MemberVO memberVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, memberVO.getMemId());
			pstmt.setString(2, memberVO.getMemIdCard());
			pstmt.setString(3, memberVO.getMemPsw());
			pstmt.setString(4, memberVO.getMemPswHint());
			pstmt.setString(5, memberVO.getMemName());
			pstmt.setInt(6, memberVO.getMemSex());
			pstmt.setBytes(7, memberVO.getMemImage());
			pstmt.setString(8, memberVO.getMemEmail());
			pstmt.setString(9, memberVO.getMemPhone());
			pstmt.setDate(10, memberVO.getMemBirth());
			pstmt.setString(11, memberVO.getMemAdd());
			pstmt.setString(12, memberVO.getMemText());
			pstmt.setString(13, memberVO.getMemBank());
			pstmt.setInt(14, memberVO.getMemBalance());
			pstmt.setInt(15, memberVO.getMemBlock());
			pstmt.setInt(16, memberVO.getMemStatus());
			pstmt.setString(17, memberVO.getMemPair());
			pstmt.setString(18, memberVO.getMemSkill());
			pstmt.setString(19, memberVO.getMemWantSkill());

			pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
			con = ds.getConnection();
			pstmt = con.prepareStatement(REGIST_STMT);

			pstmt.setString(1, memberVO.getMemId());
			pstmt.setString(2, memberVO.getMemIdCard());
			pstmt.setString(3, memberVO.getMemPsw());
			pstmt.setString(4, memberVO.getMemPswHint());
			pstmt.setString(5, memberVO.getMemName());
			pstmt.setInt(6, memberVO.getMemSex());
			pstmt.setBytes(7, memberVO.getMemImage());
			pstmt.setString(8, memberVO.getMemEmail());
			pstmt.setString(9, memberVO.getMemPhone());
			pstmt.setDate(10, memberVO.getMemBirth());
			pstmt.setString(11, memberVO.getMemAdd());
			pstmt.setInt(12, memberVO.getMemBalance());
			pstmt.setInt(13, memberVO.getMemBlock());
			pstmt.setInt(14, memberVO.getMemStatus());

			pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, memberVO.getMemPsw());
			pstmt.setBytes(2, memberVO.getMemImage());
			pstmt.setString(3, memberVO.getMemAdd());
			pstmt.setString(4, memberVO.getMemText());
			pstmt.setString(5, memberVO.getMemBank());
			pstmt.setInt(6, memberVO.getMemBalance());
			pstmt.setInt(7, memberVO.getMemBlock());
			pstmt.setInt(8, memberVO.getMemStatus());
			pstmt.setString(9, memberVO.getMemSkill());
			pstmt.setString(10, memberVO.getMemWantSkill());
			pstmt.setString(11, memberVO.getMemPair());
			pstmt.setString(12, memberVO.getMemId());

			pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	public void editMember(MemberVO memberVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(EDIT_MEMBER_STMT);

			pstmt.setString(1, memberVO.getMemPsw());
			pstmt.setBytes(2, memberVO.getMemImage());
			pstmt.setString(3, memberVO.getMemAdd());
			pstmt.setString(4, memberVO.getMemText());
			pstmt.setString(5, memberVO.getMemBank());
			pstmt.setString(6, memberVO.getMemSkill());
			pstmt.setString(7, memberVO.getMemWantSkill());
			pstmt.setString(8, memberVO.getMemId());

			pstmt.executeUpdate();
			System.out.println("已修改一筆資料");

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, memberId);

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
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
			con = ds.getConnection();
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
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	public void update_balance(MemberVO memberVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(UPDATE_BALANCE);

			pstmt.setInt(1, memberVO.getMemBalance());
			pstmt.setString(1, memberVO.getMemId());

			pstmt.executeUpdate();

			con.commit();
		} catch (SQLException se) {
			try {
				con.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			throw new RuntimeException("A database error occured. " + se.getMessage());

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
	public void deduction(MemberVO memberVO, Connection con) {
		PreparedStatement pstmt = null;

		try {
			pstmt = con.prepareStatement(UPDATE1);

			pstmt.setInt(1, memberVO.getMemBalance());
			pstmt.setInt(2, memberVO.getMemBlock());
			pstmt.setString(3, memberVO.getMemId());

			pstmt.executeUpdate();
			// Handle any driver errors
		} catch (SQLException se) {
			if (con != null) {
				try {
					// 3●設定於當有exception發生時之catch區塊內
					System.err.print("Transaction is being ");
					System.err.println("rolled back-由-emp");
					con.rollback();
				} catch (SQLException excep) {
					throw new RuntimeException("rollback error occured. " + excep.getMessage());
				}
			}
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

}
