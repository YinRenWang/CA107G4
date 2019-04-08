package com.coupon.model;

import java.util.List;

public interface CouponDAO_interface {
	public void insert(CouponVO couponVO);
	public void update(CouponVO couponVO);
	public CouponVO findByPrimaryKey(String couponId);
	public List<CouponVO> getAll();

}
