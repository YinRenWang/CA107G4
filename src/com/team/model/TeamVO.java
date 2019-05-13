package com.team.model;
import java.sql.Date;
public class TeamVO implements java.io.Serializable {
	
	private String teamId;
	private String leaderID;
	private String inscID;
	private Date teamMFD;
	private Date teamEXP;
	private Integer teamStatus;
	public String getTeamId() {
		return teamId;
	}
	public void setTeamId(String teamId) {
		this.teamId = teamId;
	}
	public String getLeaderID() {
		return leaderID;
	}
	public void setLeaderID(String leaderID) {
		this.leaderID = leaderID;
	}
	public String getInscID() {
		return inscID;
	}
	public void setInscID(String inscID) {
		this.inscID = inscID;
	}
	public Date getTemaMFD() {
		return teamMFD;
	}
	public void setTemaMFD(Date temaMFD) {
		this.teamMFD = temaMFD;
	}
	public Date getTeamEXP() {
		return teamEXP;
	}
	public void setTeamEXP(Date teamEXP) {
		this.teamEXP = teamEXP;
	}
	public Integer getTeamStatus() {
		return teamStatus;
	}
	public void setTeamStatus(Integer teamStatus) {
		this.teamStatus = teamStatus;
	}

}
