package android.com.withdrawalrecord.model;
import java.sql.Date;
public class WithdrawalRecordVO implements java.io.Serializable{
	private String wrnum;
	private String memid;
	private Integer wrmoney;
	private Date wrtime;
	
	public String getWrnum() {
	return wrnum;
	}
	public void setWrnum(String wrnum) {
		this.wrnum = wrnum;
	}
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public Integer getWrmoney() {
		return wrmoney;
	}
	public void setWrmoney(Integer wrmoney) {
		this.wrmoney = wrmoney;
	}
	public Date getWrtime() {
		return wrtime;
	}
	public void setWrtime(Date wrtime) {
		this.wrtime = wrtime;
	}
	

	
	
}
