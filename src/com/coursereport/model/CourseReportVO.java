package com.coursereport.model;

public class CourseReportVO implements java.io.Serializable {
	private String crId;
	private String memId;
	private String inscId;
	private String crContent;
	private Integer crStatus;
	
	public CourseReportVO() {
	}

	public String getCrId() {
		return crId;
	}

	public void setCrId(String crId) {
		this.crId = crId;
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

	public String getCrContent() {
		return crContent;
	}

	public void setCrContent(String crContent) {
		this.crContent = crContent;
	}

	public Integer getCrStatus() {
		return crStatus;
	}

	public void setCrStatus(Integer crStatus) {
		this.crStatus = crStatus;
	}


	
	

}
