package com.coupon.model;

import java.sql.Date;

public class CouponVO implements java.io.Serializable {
	private String couponId;
	private String couponName;
	private Integer couponDollar;
	private Integer couponBalance;
	private Date couponMFD;
	private Date couponEXP;
	private Integer couponStatus;
	

	public CouponVO() {

	}

	public String getCouponId() {
		return couponId;
	}

	public void setCouponId(String couponId) {
		this.couponId = couponId;
	}

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

	public Integer getCouponDollar() {
		return couponDollar;
	}

	public void setCouponDollar(Integer couponDollar) {
		this.couponDollar = couponDollar;
	}

	public Integer getCouponBalance() {
		return couponBalance;
	}

	public void setCouponBalance(Integer couponBalance) {
		this.couponBalance = couponBalance;
	}

	public Date getCouponMFD() {
		return couponMFD;
	}

	public void setCouponMFD(Date couponMFD) {
		this.couponMFD = couponMFD;
	}

	public Date getCouponEXP() {
		return couponEXP;
	}

	public void setCouponEXP(Date couponEXP) {
		this.couponEXP = couponEXP;
	}

	public Integer getCouponStatus() {
		return couponStatus;
	}

	public void setCouponStatus(Integer couponStatus) {
		this.couponStatus = couponStatus;
	}

	

}
