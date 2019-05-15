package android.com.teacher.model;

import java.util.List;

public class TeacherService {
	private TeacherDAO_interface dao;
	
	public TeacherService(){
		dao = new TeacherDAO();
	}
	
	public void addTeacher(String memId, Integer teacherStatus, String teacherCity, String teacherEdu,byte[] diplomaImg, String teacherText) {
		TeacherVO teacherVO = new TeacherVO();
		teacherVO.setMemId(memId);
		teacherVO.setTeacherStatus(teacherStatus);
		teacherVO.setTeacherCity(teacherCity);
		teacherVO.setTeacherEdu(teacherEdu);
		teacherVO.setDiplomaImg(diplomaImg);
		teacherVO.setTeacherText(teacherText);
		dao.insert(teacherVO);
	}
	
	public TeacherVO findOneById(String xxxId) {
		return dao.findByPrimaryKey(xxxId);
	}
	
	public void updateStatus(Integer teacherStatus, String teacherId) {
		dao.updateStatus(teacherStatus, teacherId);
	}
	
	public List<TeacherVO> getAll(){
		return dao.getAll();
	}
	
	public List<TeacherVO> getAllStatus(Integer teacherStatus){
		return dao.getAllStatus(teacherStatus);
	}
	public TeacherVO findByStatus(String memId) {
		return dao.findByStatus(memId);
	}
	public TeacherVO findByMemId(String memId) {
		return dao.findByMemId(memId);
	}
}
