package android.com.coursetype.model;

import java.util.List;

public class CourseTypeService {
	private CourseTypeDAO_interface dao;
	
	
	
	public CourseTypeService() {
		dao = new CourseTypeDAO();
	}
	
	public void addCourseType(Integer courseTypeId, String courseTypeName) {
		CourseTypeVO courseTypeVO  = new CourseTypeVO();
		courseTypeVO.setCourseTypeName(courseTypeName);
		dao.insert(courseTypeVO);
	}
	public CourseTypeVO findOneById(Integer courseTypeId) {
		return dao.findByPrimaryKey(courseTypeId);
	}

	public List<CourseTypeVO> getAll(){
		return dao.getAll();
	}

}
