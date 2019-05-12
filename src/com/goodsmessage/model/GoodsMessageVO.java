package com.goodsmessage.model;

import java.io.Serializable;

public class GoodsMessageVO implements Serializable{

	private String goodMessageId;
	private String goodId;
	private String memId;
	private String messageContent;
	public GoodsMessageVO() {
		super();
	}
	public String getGoodMessageId() {
		return goodMessageId;
	}
	public void setGoodMessageId(String goodMessageId) {
		this.goodMessageId = goodMessageId;
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
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}	
}
