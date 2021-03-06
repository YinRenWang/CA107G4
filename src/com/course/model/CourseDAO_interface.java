package com.course.model;

import java.util.List;

public interface CourseDAO_interface {
	public void insert(CourseVO courseVO);
	public void update(CourseVO courseVO);
	public void delete(String courseId);
	public CourseVO findByPrimaryKey(String courseId);
	public CourseVO  findByLike(String xxxName);
	public List<CourseVO> getAll();
	public List<CourseVO> findCourseTypeId(Integer courseType);
}
