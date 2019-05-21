package com.joingroup.model;

import java.sql.Date;

public class JoinGroupVO implements java.io.Serializable{
	
	private String memId;
	private String teamId;
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String emId) {
		this.memId = emId;
	}
	public String getTeamId() {
		return teamId;
	}
	public void setTeamId(String teamId) {
		this.teamId = teamId;
	}
	

}
