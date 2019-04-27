package com.friendnexus.model;

import java.sql.Date;

public class FriendNexusVO implements java.io.Serializable {

	private String memId;
	private String friendAcc;
	private Integer friendstatus;

	

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getFriendAcc() {
		return friendAcc;
	}

	public void setFriendAcc(String friendAcc) {
		this.friendAcc = friendAcc;
	}

	public Integer getFriendstatus() {
		return friendstatus;
	}

	public void setFriendstatus(Integer friendstatus) {
		this.friendstatus = friendstatus;
	}

}
