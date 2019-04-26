package com.inscourse.model;

import java.util.List;
import java.util.Map;


public interface InsCourseDAO_interface {
	public void insert(InsCourseVO insCourseVO);
	public void update(InsCourseVO insCourseVO);
	public void updateStatus(InsCourseVO insCourseVO);
	public void delete(String inscId);
	public InsCourseVO findByPrimaryKey(String inscId);
	public List<InsCourseVO> findByTeacher(String teacherId);
	public List<InsCourseVO> getAll();
	public List<InsCourseVO> findByCourse(String courseId);
    //萬用複合查詢(傳入參數型態Map)(回傳 List)
    public List<InsCourseVO> getAll(Map<String, String[]> map); 
}
