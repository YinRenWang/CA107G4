package android.com.coursetransfer.model;

import java.sql.Timestamp;

public class CourseTransferVO implements java.io.Serializable{
	private String ctId;
	private String ctBuyer;
	private String oldCrvId;
	private String newCrvId;
	private Timestamp ctDate;
	private Integer ctPrice;
	public String getCtId() {
		return ctId;
	}
	public void setCtId(String ctId) {
		this.ctId = ctId;
	}
	public String getCtBuyer() {
		return ctBuyer;
	}
	public void setCtBuyer(String ctBuyer) {
		this.ctBuyer = ctBuyer;
	}
	public String getOldCrvId() {
		return oldCrvId;
	}
	public void setOldCrvId(String oldCrvId) {
		this.oldCrvId = oldCrvId;
	}
	public String getNewCrvId() {
		return newCrvId;
	}
	public void setNewCrvId(String newCrvId) {
		this.newCrvId = newCrvId;
	}
	public Timestamp getCtDate() {
		return ctDate;
	}
	public void setCtDate(Timestamp ctDate) {
		this.ctDate = ctDate;
	}
	public Integer getCtPrice() {
		return ctPrice;
	}
	public void setCtPrice(Integer ctPrice) {
		this.ctPrice = ctPrice;
	}
}
