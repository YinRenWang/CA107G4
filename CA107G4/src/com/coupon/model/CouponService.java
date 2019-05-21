package com.coupon.model;

import java.sql.Date;
import java.util.List;

public class CouponService {

	private CouponDAO_interface dao;

	public CouponService() {
		dao =new CouponJDBCDAO();
	}
	
	public CouponVO addCoupon(String couponId,String couponName,Integer couponDollar,Integer couponBalance,Date couponMFD,Date couponEXP,Integer couponStatus) {
		
		CouponVO couponVO = new CouponVO();
		
		couponVO.setCouponId(couponId);
		couponVO.setCouponName(couponName);
		couponVO.setCouponDollar(couponDollar);
		couponVO.setCouponBalance(couponBalance);
		couponVO.setCouponMFD(couponMFD);
		couponVO.setCouponEXP(couponEXP);
		couponVO.setCouponStatus(couponStatus);
		dao.insert(couponVO);
		
		return couponVO;
		
	}
	public CouponVO updateCoupon(String couponId,Integer couponDollar,Integer couponBalance,Date couponEXP,Integer couponStatus) {
		
		CouponVO couponVO = new CouponVO();
		
		couponVO.setCouponId(couponId);
		couponVO.setCouponDollar(couponDollar);
		couponVO.setCouponBalance(couponBalance);
		couponVO.setCouponEXP(couponEXP);
		couponVO.setCouponStatus(couponStatus);
		dao.update(couponVO);
		
		return couponVO;
		
	}
	public void deleteCoupon(String couponId) {
		dao.delete(couponId);
		
	}
	public CouponVO getOneCoupon(String couponId) {
		return dao.findByPrimaryKey(couponId);
		
	}
	public List<CouponVO> getAll(){
		return dao.getAll();
		
	}

}
