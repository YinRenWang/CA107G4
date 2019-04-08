package com.advertisement.model;

import java.sql.Date;

public class AdvertisementVO implements java.io.Serializable  {
	private String adId;
	private String inscId;
	private Integer adStatus;
	private Date adMFD;
	private Date adEXP;
	private byte[] adImg;
	
	public AdvertisementVO() {
	
	}
	public String getAdId() {
		return adId;
	}
	public void setAdId(String adId) {
		this.adId = adId;
	}
	public String getInscId() {
		return inscId;
	}
	public void setInscId(String inscId) {
		this.inscId = inscId;
	}
	public Integer getAdStatus() {
		return adStatus;
	}
	public void setAdStatus(Integer adStatus) {
		this.adStatus = adStatus;
	}
	public Date getAdMFD() {
		return adMFD;
	}
	public void setAdMFD(Date adMFD) {
		this.adMFD = adMFD;
	}
	public Date getAdEXP() {
		return adEXP;
	}
	public void setAdEXP(Date adEXP) {
		this.adEXP = adEXP;
	}
	public byte[] getAdImg() {
		return adImg;
	}
	public void setAdImg(byte[] adImg) {
		this.adImg = adImg;
	}

}
