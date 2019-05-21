package com.coursereport.model;

import java.util.List;

public class CourseReportService {
	
	private CourseReportDAO_interface dao;

	public CourseReportService() {
		dao = new CourseReportJDBCDAO();

	}
	
	public CourseReportVO addCourseReport(String memId, String inscId, String crContent, Integer crStatus) {
		
		CourseReportVO courseReportVO = new CourseReportVO();
		
		courseReportVO.setMemId(memId);
		courseReportVO.setInscId(inscId);
		courseReportVO.setCrContent(crContent);
		courseReportVO.setCrStatus(crStatus);
		dao.insert(courseReportVO);
		
		return courseReportVO;
	}

	public CourseReportVO updateCourseReport(String memId, String inscId, String crContent, Integer crStatus) {
		
		CourseReportVO courseReportVO = new CourseReportVO();
		
		courseReportVO.setCrStatus(crStatus);
		dao.update(courseReportVO);
		
		return courseReportVO;
		
	}
	public List<CourseReportVO> findByStatus(Integer crStatus){
		return dao.findByStatus(crStatus);
	}
	

	public List<CourseReportVO> getAll(){
		return dao.getAll();
		
	}
	
}
