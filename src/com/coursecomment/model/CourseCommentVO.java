package com.coursecomment.model;

public class CourseCommentVO implements java.io.Serializable {
	private String ccId;
	private String memId;
	private String inscId;
	private String ccContent;

	public CourseCommentVO() {
		
	}

	public String getCcId() {
		return ccId;
	}

	public void setCcId(String ccId) {
		this.ccId = ccId;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getInscId() {
		return inscId;
	}

	public void setInscId(String inscId) {
		this.inscId = inscId;
	}

	public String getCcContent() {
		return ccContent;
	}

	public void setCcContent(String ccContent) {
		this.ccContent = ccContent;
	}

	
	

}
