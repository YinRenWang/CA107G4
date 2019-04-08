package com.coursecomment.model;

import java.util.List;

public interface CourseCommentDAO_interface {
	public void insert(CourseCommentVO courseCommentVO);
	public void delete(String ccId);
	public List<CourseCommentVO> findByPrimaryKey(String xxxId); 
	public List<CourseCommentVO> getAll();
	
	
}
