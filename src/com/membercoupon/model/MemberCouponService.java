package com.membercoupon.model;

import java.util.List;

public class MemberCouponService {
	
	private MemberCouponDAO_interface dao;
	
	public MemberCouponService() {
		dao = new MemberCouponJDBCDAO();
	}

	public MemberCouponVO addMemberCouponVO(String couponId, String memId, Integer mcStatus) {
		MemberCouponVO memberCouponVO = new MemberCouponVO();
		memberCouponVO.setCouponId(couponId);
		memberCouponVO.setMemId(memId);
		memberCouponVO.setMcStatus(mcStatus);
		return memberCouponVO;
		
	}
	
	public MemberCouponVO updateMemberCouponVO(String couponId, String memId, Integer mcStatus) {
		MemberCouponVO memberCouponVO = new MemberCouponVO();
		memberCouponVO.setCouponId(couponId);
		memberCouponVO.setMemId(memId);
		memberCouponVO.setMcStatus(mcStatus);
		return memberCouponVO;
		
	}
	
	
	public MemberCouponVO findByPrimaryKey(String couponId,String memId) {
		return dao.findByPrimaryKey(couponId, memId);
		
		
	}
	public List<MemberCouponVO> getAll(){
		return dao.getAll();
		
	}

}
