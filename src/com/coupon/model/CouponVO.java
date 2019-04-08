package com.coupon.model;

import java.sql.Date;

public class CouponVO implements java.io.Serializable {
	private String CouponId;
	private String CouponName;
	private Integer CouponDollar;
	private Integer CouponBalance;
	private Date CouponMFD;
	private Date CouponEXP;
	private Integer CouponStatus;
	
	public CouponVO() {
	}

	public String getCouponId() {
		return CouponId;
	}

	public void setCouponId(String couponId) {
		CouponId = couponId;
	}

	public String getCouponName() {
		return CouponName;
	}

	public void setCouponName(String couponName) {
		CouponName = couponName;
	}

	public Integer getCouponDollar() {
		return CouponDollar;
	}

	public void setCouponDollar(Integer couponDollar) {
		CouponDollar = couponDollar;
	}

	public Integer getCouponBalance() {
		return CouponBalance;
	}

	public void setCouponBalance(Integer couponBalance) {
		CouponBalance = couponBalance;
	}

	public Date getCouponMFD() {
		return CouponMFD;
	}

	public void setCouponMFD(Date couponMFD) {
		CouponMFD = couponMFD;
	}

	public Date getCouponEXP() {
		return CouponEXP;
	}

	public void setCouponEXP(Date couponEXP) {
		CouponEXP = couponEXP;
	}

	public Integer getCouponStatus() {
		return CouponStatus;
	}

	public void setCouponStatus(Integer couponStatus) {
		CouponStatus = couponStatus;
	}
	

}
