package com.goodslike.model;

import java.io.Serializable;

public class GoodsLikeVO implements Serializable{

	private String goodId;
	private String memId;
	public GoodsLikeVO() {
		super();
	}
	public String getGoodId() {
		return goodId;
	}
	public void setGoodId(String goodId) {
		this.goodId = goodId;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	
}
