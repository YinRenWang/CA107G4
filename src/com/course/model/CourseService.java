package com.course.model;

import java.util.ArrayList;
import java.util.List;

public class CourseService {
	
	private CourseDAO_interface dao;
	
	public CourseService() {
		dao = new CourseJDBCDAO();
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
	
	public CourseVO findByLike(String xxxName) {
		return dao.findByLike(xxxName);
	}
	public List<CourseVO> getAll(){
		return dao.getAll();
	} 

	public List<CourseVO> findByCourseType(Integer courseTypeId) {
		return dao.findCourseTypeId(courseTypeId);
	}
	
	
}

