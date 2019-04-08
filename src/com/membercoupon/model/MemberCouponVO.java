package com.membercoupon.model;

public class MemberCouponVO implements java.io.Serializable {
	private String couponId;
	private String memId;
	private Integer mcStatus;
	

	public String getCouponId() {
		return couponId;
	}


	public void setCouponId(String couponId) {
		this.couponId = couponId;
	}


	public String getMemId() {
		return memId;
	}


	public void setMemId(String memId) {
		this.memId = memId;
	}


	public Integer getMcStatus() {
		return mcStatus;
	}


	public void setMcStatus(Integer mcStatus) {
		this.mcStatus = mcStatus;
	}


	public MemberCouponVO() {
	
	}

}
