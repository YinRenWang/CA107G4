package android.com.coursetransfercomment.model;

import java.io.Serializable;

public class CourseTransferCommentVO implements Serializable {
	private String ctcId;
	private String ctId;
	private String memId;
	private String ctcContent;
	public String getCtcId() {
		return ctcId;
	}
	public void setCtcId(String ctcId) {
		this.ctcId = ctcId;
	}
	public String getCtId() {
		return ctId;
	}
	public void setCtId(String ctId) {
		this.ctId = ctId;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getCtcContent() {
		return ctcContent;
	}
	public void setCtcContent(String ctcContent) {
		this.ctcContent = ctcContent;
	}
}
