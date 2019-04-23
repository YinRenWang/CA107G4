package com.coursereservation.model;

import java.util.List;

public interface CourseReservationDAO_interface {
	public void insert(CourseReservationVO courseReservationVO);
	public void update(CourseReservationVO courseReservationVO);
	public List<CourseReservationVO> findByStatus(Integer xxxStatus);
	public List<CourseReservationVO> findByRate(String inscId);
	public List<CourseReservationVO> findByPrimaryKey(String xxxId); 
	public List<CourseReservationVO> getAll();

}
