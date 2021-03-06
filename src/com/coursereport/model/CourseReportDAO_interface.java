package com.coursereport.model;

import java.util.List;

public interface CourseReportDAO_interface {
	public void insert(CourseReportVO courseReportVO);
	public void update(CourseReportVO courseReportVO);
	public CourseReportVO findByPrimaryKey(String crId);
	public List<CourseReportVO> findByStatus(Integer crStatus);
	public List<CourseReportVO> findByKey(String xxxId); 
	public List<CourseReportVO> getAll();

}

