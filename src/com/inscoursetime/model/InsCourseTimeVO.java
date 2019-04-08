package com.inscoursetime.model;

import java.sql.Timestamp ;

public class InsCourseTimeVO implements java.io.Serializable  {
	private String inscTimeId;
	private String inscId;
	private Timestamp inscTime;            

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

	public Timestamp getInscTime() {
		return inscTime;
	}

	public void setInscTime(Timestamp inscTime) {
		this.inscTime = inscTime;
	}
	
	

}
