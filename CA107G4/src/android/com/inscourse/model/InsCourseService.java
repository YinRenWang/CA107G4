package android.com.inscourse.model;

import java.util.List;

public class InsCourseService {
	private InsCourseDAO_interface dao;

	public InsCourseService() {
		dao = new InsCourseDAO();
	}

	public void addInsCourse(String teacherId, String courseId, String inscLoc, Integer inscType,
			Integer inscPeople, String inscLang, Integer inscPrice, String inscCourser, Integer inscStatus) {
		
		InsCourseVO insCourseVO = new InsCourseVO();
		insCourseVO.setTeacherId(teacherId);
		insCourseVO.setCourseId(courseId);
		insCourseVO.setInscLoc(inscLoc);
		insCourseVO.setInscType(inscType);
		insCourseVO.setInscPeople(inscPeople);
		insCourseVO.setInscLang(inscLang);
		insCourseVO.setInscPrice(inscPrice);
		insCourseVO.setInscCourser(inscCourser);
		insCourseVO.setInscStatus(inscStatus);
		dao.insert(insCourseVO);
	}
	
	public InsCourseVO updateInsCourse(String inscId, String teacherId, String courseId, String inscLoc, Integer inscType,
			Integer inscPeople, String inscLang, Integer inscPrice, String inscCourser, Integer inscStatus) {
		
		InsCourseVO insCourseVO = new InsCourseVO();
		insCourseVO.setInscId(inscId);
		insCourseVO.setTeacherId(teacherId);
		insCourseVO.setCourseId(courseId);
		insCourseVO.setInscLoc(inscLoc);
		insCourseVO.setInscType(inscType);
		insCourseVO.setInscPeople(inscPeople);
		insCourseVO.setInscLang(inscLang);
		insCourseVO.setInscPrice(inscPrice);
		insCourseVO.setInscCourser(inscCourser);
		insCourseVO.setInscStatus(inscStatus);
		dao.update(insCourseVO);
		return insCourseVO;
	}
	

	
	public void updateStatus(String inscId,Integer inscStatus) {

		InsCourseVO insCourseVO = new InsCourseVO();
		insCourseVO.setInscStatus(inscStatus);
		dao.updateStatus(insCourseVO);
	}
	
	public InsCourseVO findOneById(String inscId) {
		return dao.findByPrimaryKey(inscId);
	}
	public List<InsCourseVO> getAll(){
		return dao.getAll();
	}
	public List<InsCourseVO> findByCourse(String courseId){
		return dao.findByCourse(courseId);
	}
	public List<InsCourseVO> findByTeacher(String teacherId){
		return dao.findByTeacher(teacherId);
	}
}
