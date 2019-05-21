package com.membercoupon.model;

import java.util.List;

public interface MemberCouponDAO_interface {
	
	public void insert(MemberCouponVO memberCouponVO);
	public void update(MemberCouponVO memberCouponVO);
	public MemberCouponVO findByPrimaryKey(String couponId,String memId);
	public List<MemberCouponVO> getAll();

}
