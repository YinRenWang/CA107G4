package com.goodsdetails.model;

import java.io.Serializable;

public class GoodsDetailsVO implements Serializable{

	private String goodOrderId;
	private String goodId;
	private Integer goodAmount;
	private Double goodScore;
	private String goodRate;
	
	public GoodsDetailsVO() {
		super();
	}
	public String getGoodOrderId() {
		return goodOrderId;
	}
	public void setGoodOrderId(String goodOrderId) {
		this.goodOrderId = goodOrderId;
	}
	public String getGoodId() {
		return goodId;
	}
	public void setGoodId(String goodId) {
		this.goodId = goodId;
	}
	public Integer getGoodAmount() {
		return goodAmount;
	}
	public void setGoodAmount(Integer goodAmount) {
		this.goodAmount = goodAmount;
	}
	public Double getGoodScore() {
		return goodScore;
	}
	public void setGoodScore(Double goodScore) {
		this.goodScore = goodScore;
	}
	public String getGoodRate() {
		return goodRate;
	}
	public void setGoodRate(String goodRate) {
		this.goodRate = goodRate;
	}
}
