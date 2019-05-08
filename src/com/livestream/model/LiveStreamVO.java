package com.livestream.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class LiveStreamVO implements Serializable {
	private String lsId;
	private String teacherId;
	private Timestamp lsDate;
	private Integer lsViewNum;
	private byte[] lsContent;
	public String getLsId() {
		return lsId;
	}
	public void setLsId(String lsId) {
		this.lsId = lsId;
	}
	public String getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}
	public Timestamp getLsDate() {
		return lsDate;
	}
	public void setLsDate(Timestamp lsDate) {
		this.lsDate = lsDate;
	}
	public Integer getLsViewNum() {
		return lsViewNum;
	}
	public void setLsViewNum(Integer lsViewNum) {
		this.lsViewNum = lsViewNum;
	}
	public byte[] getLsContent() {
		return lsContent;
	}
	public void setLsContent(byte[] lsContent) {
		this.lsContent = lsContent;
	}
}
