package android.com.course.model;

import java.util.ArrayList;
import java.util.List;

public class CourseService {
	
	private CourseDAO_interface dao;
	
	public CourseService() {
		dao = new CourseDAO();
	}

	public void addCourse(String courseId,Integer courseTypeId,String courseName) {
		CourseVO courseVO  = new CourseVO();
		courseVO.setCourseTypeId(courseTypeId);
		courseVO.setCourseName(courseName);
		dao.insert(courseVO);
	}
	public CourseVO findOneById(String courseId) {
		return dao.findByPrimaryKey(courseId);
	}
	public List<CourseVO> getAll(){
		List<CourseVO> list = new ArrayList<>();
		return dao.getAll();
	}
	
	public List<CourseVO> findByCourseType(Integer courseTypeId){
		return dao.findByCourseType(courseTypeId);
	}
	
}

