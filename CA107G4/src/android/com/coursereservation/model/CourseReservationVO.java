package android.com.coursereservation.model;

import java.sql.Date;
import java.sql.Timestamp;

public class CourseReservationVO {
	
	private String crvId;
	private String teacherId;
	private String memId;
	private String inscId;
	private String teamId;
	private Integer crvStatus;
	private Integer classStatus;
	private Integer tranStatus;
	private Timestamp crvMFD;
	private Timestamp crvEXP;
	private String crvLoc;
	private Double crvTotalTime;
	private Double crvTotalPrice;
	private Double crvScore;
	private String crvRate;
	private String inscTimeId;
	
	public String getCrvId() {
		return crvId;
	}
	public void setCrvId(String crvId) {
		this.crvId = crvId;
	}
	public String getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
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
	public String getTeamId() {
		return teamId;
	}
	public void setTeamId(String teamId) {
		this.teamId = teamId;
	}
	public Integer getCrvStatus() {
		return crvStatus;
	}
	public void setCrvStatus(Integer crvStatus) {
		this.crvStatus = crvStatus;
	}
	public Integer getClassStatus() {
		return classStatus;
	}
	public void setClassStatus(Integer classStatus) {
		this.classStatus = classStatus;
	}
	public Integer getTranStatus() {
		return tranStatus;
	}
	public void setTranStatus(Integer tranStatus) {
		this.tranStatus = tranStatus;
	}
	public Timestamp getCrvMFD() {
		return crvMFD;
	}
	public void setCrvMFD(Timestamp crvMFD) {
		this.crvMFD = crvMFD;
	}
	public Timestamp getCrvEXP() {
		return crvEXP;
	}
	public void setCrvEXP(Timestamp crvEXP) {
		this.crvEXP = crvEXP;
	}
	public String getCrvLoc() {
		return crvLoc;
	}
	public void setCrvLoc(String crvLoc) {
		this.crvLoc = crvLoc;
	}
	public Double getCrvTotalTime() {
		return crvTotalTime;
	}
	public void setCrvTotalTime(Double crvTotalTime) {
		this.crvTotalTime = crvTotalTime;
	}
	public Double getCrvTotalPrice() {
		return crvTotalPrice;
	}
	public void setCrvTotalPrice(Double crvTotalPrice) {
		this.crvTotalPrice = crvTotalPrice;
	}
	public Double getCrvScore() {
		return crvScore;
	}
	public void setCrvScore(Double crvScore) {
		this.crvScore = crvScore;
	}
	public String getCrvRate() {
		return crvRate;
	}
	public void setCrvRate(String crvRate) {
		this.crvRate = crvRate;
	}
	public String getInscTimeId() {
		return inscTimeId;
	}
	public void setInscTimeId(String inscTimeId) {
		this.inscTimeId = inscTimeId;
	}

	
	

}
