package com.inscoursetime.model;

import java.sql.Timestamp ;

public class InsCourseTimeVO implements java.io.Serializable  {
	private String inscTimeId;
	private String inscId;
	private Timestamp inscMFD;
	private Timestamp inscEXP;

	public InsCourseTimeVO() {

	}

	public String getInscTimeId() {
		return inscTimeId;
	}

	public void setInscTimeId(String inscTimeId) {
		this.inscTimeId = inscTimeId;
	}

	public String getInscId() {
		return inscId;
	}

	public void setInscId(String inscId) {
		this.inscId = inscId;
	}

	public Timestamp getInscMFD() {
		return inscMFD;
	}

	public void setInscMFD(Timestamp inscMFD) {
		this.inscMFD = inscMFD;
	}

	public Timestamp getInscEXP() {
		return inscEXP;
	}

	public void setInscEXP(Timestamp inscEXP) {
		this.inscEXP = inscEXP;
	}

	public InsCourseTimeVO(String inscTimeId, String inscId, Timestamp inscMFD, Timestamp inscEXP) {
	
	}
	
	

}
