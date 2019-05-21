package com.teacher.model;

import java.util.List;

public interface TeacherDAO_interface {
	public void insert(TeacherVO teacherVO);
	public void update(TeacherVO teacherVO);
	public void delete(String teacherId);
	public void updateStatus(Integer teacherStatus,String teacherId);
	public TeacherVO findByPrimaryKey(String xxxId);
	public TeacherVO findByStatus(String memId);
	public List<TeacherVO> getAll();
	public List<TeacherVO> getAllStatus(Integer teacherStatus);
	public TeacherVO findByMemId(String memId);
}
