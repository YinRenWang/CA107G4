package com.teacher.model;

import java.util.List;

public interface TeacherDAO_interface {
	public void insert(TeacherVO teacherVO);
	public void update(TeacherVO teacherVO);
	public void delete(String teacherId);
	public TeacherVO findByPrimaryKey(String teacherId);
	public List<TeacherVO> getAll();
}
