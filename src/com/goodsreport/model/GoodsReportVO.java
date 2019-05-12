package com.goodsreport.model;

import java.io.Serializable;

public class GoodsReportVO implements Serializable{
	private String goodReportId;
	private String memId;
	private String goodId;
	private String goodReportContent;
	private Integer goodReportStatus;
	public GoodsReportVO() {
		super();
	}
	public String getGoodReportId() {
		return goodReportId;
	}
	public void setGoodReportId(String goodReportId) {
		this.goodReportId = goodReportId;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getGoodId() {
		return goodId;
	}
	public void setGoodId(String goodId) {
		this.goodId = goodId;
	}
	public String getGoodReportContent() {
		return goodReportContent;
	}
	public void setGoodReportContent(String goodReportContent) {
		this.goodReportContent = goodReportContent;
	}
	public Integer getGoodReportStatus() {
		return goodReportStatus;
	}
	public void setGoodReportStatus(Integer goodReportStatus) {
		this.goodReportStatus = goodReportStatus;
	}
}
