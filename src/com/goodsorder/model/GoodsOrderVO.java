package com.goodsorder.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class GoodsOrderVO implements Serializable{

	private String goodOrderId;
	private String memId;
	private Integer goodTotalPrice;
	private Timestamp goodDate;
	private String buyerName;
	private String buyerAddress;
	private String buyerPhone;
	private Integer goodOrdStatus;
	
	public String getGoodOrderId() {
		return goodOrderId;
	}
	public void setGoodOrderId(String goodOrderId) {
		this.goodOrderId = goodOrderId;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public Integer getGoodTotalPrice() {
		return goodTotalPrice;
	}
	public void setGoodTotalPrice(Integer goodTotalPrice) {
		this.goodTotalPrice = goodTotalPrice;
	}
	public Timestamp getGoodDate() {
		return goodDate;
	}
	public void setGoodDate(Timestamp goodDate) {
		this.goodDate = goodDate;
	}
	public String getBuyerName() {
		return buyerName;
	}
	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}
	public String getBuyerAddress() {
		return buyerAddress;
	}
	public void setBuyerAddress(String buyerAddress) {
		this.buyerAddress = buyerAddress;
	}
	public String getBuyerPhone() {
		return buyerPhone;
	}
	public void setBuyerPhone(String buyerPhone) {
		this.buyerPhone = buyerPhone;
	}
	public Integer getGoodOrdStatus() {
		return goodOrdStatus;
	}
	public void setGoodOrdStatus(Integer goodOrdStatus) {
		this.goodOrdStatus = goodOrdStatus;
	}
	public GoodsOrderVO() {
	
	}
	
	
	
}
