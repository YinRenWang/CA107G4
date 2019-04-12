package com.member.model;

import java.sql.Date;

public class MemberVO  implements java.io.Serializable {
	private String memId;
	private String memSkill;
	private String memWantSkill;
	private String memPair;
	private String memIdCard;
	private String memPsw;
	private String memPswHint;
	private String memName;
	private Integer memSex;
	private byte[] memImage;
	private String memEmail;
	private String memPhone;
	private Date 	memBirth;
	private String  memAdd;
	private String memText;
	private String memBank;
	private Integer memBalance;
	private Integer memBlock;
	private Integer memStatus;

	
	public MemberVO() {

	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemIdCard() {
		return memIdCard;
	}

	public void setMemIdCard(String memIdCard) {
		this.memIdCard = memIdCard;
	}

	public String getMemPsw() {
		return memPsw;
	}

	public void setMemPsw(String memPsw) {
		this.memPsw = memPsw;
	}

	public String getMemPswHint() {
		return memPswHint;
	}

	public void setMemPswHint(String memPswHint) {
		this.memPswHint = memPswHint;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public Integer getMemSex() {
		return memSex;
	}

	public void setMemSex(Integer memSex) {
		this.memSex = memSex;
	}

	public byte[] getMemImage() {
		return memImage;
	}

	public void setMemImage(byte[] memImage) {
		this.memImage = memImage;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public String getMemPhone() {
		return memPhone;
	}

	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}

	public Date getMemBirth() {
		return memBirth;
	}

	public void setMemBirth(Date memBirth) {
		this.memBirth = memBirth;
	}

	public String getMemAdd() {
		return memAdd;
	}

	public void setMemAdd(String memAdd) {
		this.memAdd = memAdd;
	}

	public String getMemText() {
		return memText;
	}

	public void setMemText(String memText) {
		this.memText = memText;
	}

	public String getMemBank() {
		return memBank;
	}

	public void setMemBank(String memBank) {
		this.memBank = memBank;
	}

	public Integer getMemBalance() {
		return memBalance;
	}

	public void setMemBalance(Integer memBalance) {
		this.memBalance = memBalance;
	}

	public Integer getMemBlock() {
		return memBlock;
	}

	public void setMemBlock(Integer memBlock) {
		this.memBlock = memBlock;
	}

	public Integer getMemStatus() {
		return memStatus;
	}

	public void setMemStatus(Integer memStatus) {
		this.memStatus = memStatus;
	}

	public String getMemSkill() {
		return memSkill;
	}

	public void setMemSkill(String memSkill) {
		this.memSkill = memSkill;
	}

	public String getMemWantSkill() {
		return memWantSkill;
	}

	public void setMemWantSkill(String memWantSkill) {
		this.memWantSkill = memWantSkill;
	}

	public String getMemPair() {
		return memPair;
	}

	public void setMemPair(String memPair) {
		this.memPair = memPair;
	}




	
}
