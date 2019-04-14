package com.inscoursetime.model;

import java.util.List;

public interface InsCourseTimeDAO_interface {
	
	public void insert(InsCourseTimeVO insCourseTimeVO);
	public void update(InsCourseTimeVO insCourseTimeVO);
	public void delete(String inscTimeId);
	public InsCourseTimeVO findByPrimaryKey(String inscTimeId);
	public List<InsCourseTimeVO> getAll();

}
