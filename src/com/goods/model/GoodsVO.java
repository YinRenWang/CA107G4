package com.goods.model;

import java.io.Serializable;
import java.util.Arrays;

	public class GoodsVO implements Serializable{
		
	private String goodId;
	private String teacherId;
	private String goodName;
	private Integer goodPrice;
	private String goodInfo;
	private byte[] goodImg;
	private Integer goodStatus;
	private Integer quantity = 1;
	
	public GoodsVO() {
		super();
	}
	
	public String getGoodId() {
		return goodId;
	}
	public void setGoodId(String goodId) {
		this.goodId = goodId;
	}
	public String getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}
	public String getGoodName() {
		return goodName;
	}
	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}
	public Integer getGoodPrice() {
		return goodPrice;
	}
	public void setGoodPrice(Integer goodPrice) {
		this.goodPrice = goodPrice;
	}
	public String getGoodInfo() {
		return goodInfo;
	}
	public void setGoodInfo(String goodInfo) {
		this.goodInfo = goodInfo;
	}
	public byte[] getGoodImg() {
		return goodImg;
	}
	public void setGoodImg(byte[] goodImg) {
		this.goodImg = goodImg;
	}
	public Integer getGoodStatus() {
		return goodStatus;
	}
	public void setGoodStatus(Integer goodStatus) {
		this.goodStatus = goodStatus;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
	
	@Override
	public String toString() {
		return "GoodsVO [goodId=" + goodId + ", teacherId=" + teacherId + ", goodName=" + goodName + ", goodPrice="
				+ goodPrice + ", goodInfo=" + goodInfo + ", goodImg=" + Arrays.toString(goodImg) + ", goodStatus="
				+ goodStatus + ", quantity=" + quantity + "]";
	}

	//不加入重複
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((goodId == null) ? 0 : goodId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		GoodsVO other = (GoodsVO) obj;
		if (goodId == null) {
			if (other.goodId != null)
				return false;
		} else if (!goodId.equals(other.goodId))
			return false;
		return true;
	}
}
