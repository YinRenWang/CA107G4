package com.inscourse.model;

public class InsCourseVO implements java.io.Serializable{
	private String inscId;
	private String teacherId;
	private String courseId;
	private String inscLoc;      //可上課地點
	private Integer inscType;    //個人=0 團體=1
	private Integer inscPeople;  //人數
	private String inscLang;     //語言
	private Integer inscPrice;
	private String inscCourser;    //課綱
	private Integer inscStatus;  //上下架
	public String getInscId() {
		return inscId;
	}
	public void setInscId(String inscId) {
		this.inscId = inscId;
	}
	public String getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getInscLoc() {
		return inscLoc;
	}
	public void setInscLoc(String inscLoc) {
		this.inscLoc = inscLoc;
	}
	public Integer getInscType() {
		return inscType;
	}
	public void setInscType(Integer inscType) {
		this.inscType = inscType;
	}
	public Integer getInscPeople() {
		return inscPeople;
	}
	public void setInscPeople(Integer inscPeople) {
		this.inscPeople = inscPeople;
	}
	public String getInscLang() {
		return inscLang;
	}
	public void setInscLang(String inscLang) {
		this.inscLang = inscLang;
	}
	public Integer getInscPrice() {
		return inscPrice;
	}
	public void setInscPrice(Integer inscPrice) {
		this.inscPrice = inscPrice;
	}
	public String getInscCourser() {
		return inscCourser;
	}
	public void setInscCourser(String inscCourser) {
		this.inscCourser = inscCourser;
	}
	public Integer getInscStatus() {
		return inscStatus;
	}
	public void setInscStatus(Integer inscStatus) {
		this.inscStatus = inscStatus;
	}
}
