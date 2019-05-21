package android.com.member.model;

import java.sql.Date;
import java.util.List;

public class MemberService {
	
	private MemberDAO_interface dao;

	public MemberService() {
		dao = new MemberDAO();

	}
	
	public void update_balance(MemberVO memberVO) {
		dao.update(memberVO);
	}
	
	public MemberVO addMember(String memId, String memSkill, String memWantSkill, String memPair, String memIdCard, String memPsw,
			String memPswHint, String memName, Integer memSex, byte[] memImage, String memEmail, String memPhone,
			Date memBirth, String memAdd, String memText, String memBank, Integer memBalance, Integer memBlock,
			Integer memStatus) {
		
		MemberVO memberVO = new MemberVO(); 
		
		memberVO.setMemId(memId);
		memberVO.setMemIdCard(memIdCard);
		memberVO.setMemPsw(memPsw);
		memberVO.setMemPswHint(memPswHint);
		memberVO.setMemName(memName);
		memberVO.setMemSex(memSex);
		memberVO.setMemImage(memImage);
		memberVO.setMemEmail(memEmail);
		memberVO.setMemPhone(memPhone);
		memberVO.setMemBirth(memBirth);
		memberVO.setMemAdd(memAdd);
		memberVO.setMemText(memText);
		memberVO.setMemBank(memBank);
		memberVO.setMemBalance(memBalance);
		memberVO.setMemBlock(memBlock);
		memberVO.setMemStatus(memStatus);
		memberVO.setMemPair(memPair);
		memberVO.setMemSkill(memSkill);
		memberVO.setMemWantSkill(memWantSkill);
		dao.insert(memberVO);
		
		return memberVO;
	}
	
	
	public MemberVO regMember(
			String memId, 
			String memIdCard,
			String memPsw,
			String memPswHint,
			String memName, 
			Integer memSex,
			byte[] memImage,
			String memEmail, 
			String memPhone,
			Date memBirth,
			String memAdd, 
			Integer memBalance, 
			Integer memBlock,
			Integer memStatus) {
		
		MemberVO memberVO = new MemberVO(); 
		
		memberVO.setMemId(memId);
		memberVO.setMemIdCard(memIdCard);
		memberVO.setMemPsw(memPsw);
		memberVO.setMemPswHint(memPswHint);
		memberVO.setMemName(memName);
		memberVO.setMemSex(memSex);
		memberVO.setMemImage(memImage);
		memberVO.setMemEmail(memEmail);
		memberVO.setMemPhone(memPhone);
		memberVO.setMemBirth(memBirth);
		memberVO.setMemAdd(memAdd);
		memberVO.setMemBalance(memBalance);
		memberVO.setMemBlock(memBlock);
		memberVO.setMemStatus(memStatus);
		dao.registered(memberVO);
		
		return memberVO;
	}
	
	
	public MemberVO updateMember(String memId, String memSkill, String memWantSkill, String memPair, String memIdCard, String memPsw,
			byte[] memImage, String memEmail, String memAdd, String memText, String memBank, Integer memBalance, Integer memBlock,
			Integer memStatus) {
		
		MemberVO memberVO = new MemberVO(); 
		
		memberVO.setMemPsw(memPsw);
		memberVO.setMemImage(memImage);
		memberVO.setMemAdd(memAdd);
		memberVO.setMemText(memText);
		memberVO.setMemBank(memBank);
		memberVO.setMemBalance(memBalance);
		memberVO.setMemBlock(memBlock);
		memberVO.setMemStatus(memStatus);
		memberVO.setMemSkill(memSkill);
		memberVO.setMemWantSkill(memWantSkill);
		memberVO.setMemPair(memPair);
		memberVO.setMemId(memId);
		dao.update(memberVO);
		
		return memberVO;
	}
	
	public MemberVO editMember(String memId, String memSkill, String memWantSkill, String memPsw,
			byte[] memImage, String memAdd, String memText, String memBank) {
		
		MemberVO memberVO = new MemberVO(); 
		
		memberVO.setMemImage(memImage);
		memberVO.setMemPsw(memPsw);
		memberVO.setMemAdd(memAdd);
		memberVO.setMemText(memText);
		memberVO.setMemBank(memBank);
		memberVO.setMemSkill(memSkill);
		memberVO.setMemWantSkill(memWantSkill);
		memberVO.setMemId(memId);
		dao.editMember(memberVO);
		
		return memberVO;
	}
	
    public MemberVO getOneMember(String memberId) {
    	return dao.findByPrimaryKey(memberId);
    }
    
    
     public List<MemberVO> getAll(){
    	return dao.getAll();
    }
    	
}
