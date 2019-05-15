package android.com.inscourse.model;

import java.util.List;

public interface InsCourseDAO_interface {
	public void insert(InsCourseVO insCourseVO);
	public void update(InsCourseVO insCourseVO);
	public void delete(String inscId);
	public InsCourseVO findByPrimaryKey(String inscId);
	public List<InsCourseVO> getAll();
	public void updateStatus(InsCourseVO insCourseVO);
	public List<InsCourseVO> findByCourse(String courseId);
	public List<InsCourseVO> findByTeacher(String teacherId);
}
