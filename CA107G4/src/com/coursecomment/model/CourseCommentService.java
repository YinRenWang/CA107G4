package com.coursecomment.model;

import java.util.List;

public class CourseCommentService {
	
	private CourseCommentDAO_interface dao;

	public CourseCommentService() {
		dao = new CourseCommentJDBCDAO();
	}
	
	public CourseCommentVO addCourseComment(String memId, String inscId, String ccContent) {
		
		CourseCommentVO courseCommentVO = new CourseCommentVO();
		courseCommentVO.setMemId(memId);
		courseCommentVO.setInscId(inscId);
		courseCommentVO.setCcContent(ccContent);
		
		return courseCommentVO;
		
	}
	
	public CourseCommentVO updateCourseComment(String ccId, String ccContent) {
	
		CourseCommentVO courseCommentVO = new CourseCommentVO();
		courseCommentVO.setCcId(ccId);
		courseCommentVO.setCcContent(ccContent);
		
		return courseCommentVO;
		
	}
	
	public void deleteCourseComment(String ccId) {
		dao.delete(ccId);
	}
	
	public List<CourseCommentVO> findByPrimaryKey(String xxxId){
		return dao.findByPrimaryKey(xxxId);
	}
	
	public List<CourseCommentVO> getAll(){
		return dao.getAll();
		
	}
	

}
