package com.courselike.model;

import java.util.List;

public interface CourseLikeDAO_interface {
	
	public void insert(CourseLikeVO courseLikeVO);
	public void delete(String memId,String inscId);
	public CourseLikeVO findByPrimaryKey(String memId,String inscId);
	public List<CourseLikeVO> findByMemId(String memId);
	public List<CourseLikeVO> getAll();

}
