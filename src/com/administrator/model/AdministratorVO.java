package com.administrator.model;

public class AdministratorVO implements java.io.Serializable{
	private String admId;
	private String admPsw;
	private Integer admStatus;
	
	public AdministratorVO() {
	
	}
	public String getAdmId() {
		return admId;
	}
	public void setAdmId(String admId) {
		this.admId = admId;
	}
	public String getAdmPsw() {
		return admPsw;
	}
	public void setAdmPsw(String admPsw) {
		this.admPsw = admPsw;
	}
	public Integer getAdmStatus() {
		return admStatus;
	}
	public void setAdmStatus(Integer admStatus) {
		this.admStatus = admStatus;
	}
	
	

}
