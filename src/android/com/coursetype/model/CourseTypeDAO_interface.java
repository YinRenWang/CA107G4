package android.com.coursetype.model;

import java.util.List;

public interface CourseTypeDAO_interface {
	public void insert(CourseTypeVO courseTypeVO);
	public void update(CourseTypeVO courseTypeVO);
	public void delete(Integer courseTypeId);
	public CourseTypeVO findByPrimaryKey(Integer courseTypeId);
	public List<CourseTypeVO> getAll();
}
