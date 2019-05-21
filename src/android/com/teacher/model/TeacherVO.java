package android.com.teacher.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "TEACHER")
public class TeacherVO implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private String teacherId;
	private String memId;
	private Integer teacherStatus;
	private String teacherCity;
	private String teacherEdu; //學歷
	private byte[] diplomaImg;  //學歷照片
	private String teacherText; //老師介紹
	
	@Id
	@GenericGenerator(name = "teacher", strategy = "generator.MyGenerator")
	@GeneratedValue(generator = "teacher")
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
	public Integer getTeacherStatus() {
		return teacherStatus;
	}
	public void setTeacherStatus(Integer teacherStatus) {
		this.teacherStatus = teacherStatus;
	}
	public String getTeacherCity() {
		return teacherCity;
	}
	public void setTeacherCity(String teacherCity) {
		this.teacherCity = teacherCity;
	}
	public String getTeacherEdu() {
		return teacherEdu;
	}
	public void setTeacherEdu(String teacherEdu) {
		this.teacherEdu = teacherEdu;
	}
	public byte[] getDiplomaImg() {
		return diplomaImg;
	}
	public void setDiplomaImg(byte[] diplomaImg) {
		this.diplomaImg = diplomaImg;
	}
	public String getTeacherText() {
		return teacherText;
	}
	public void setTeacherText(String teacherText) {
		this.teacherText = teacherText;
	}
}
