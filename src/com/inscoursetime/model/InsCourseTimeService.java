package com.inscoursetime.model;

import java.sql.Timestamp;
import java.util.List;

public class InsCourseTimeService {
	
	private InsCourseTimeDAO_interface dao;
	
	public void insertInsCourseTime(String inscId, Timestamp inscMFD, Timestamp inscEXP) {
		InsCourseTimeVO insCourseTimeVO = new InsCourseTimeVO();
		insCourseTimeVO.setInscId(inscId);
		insCourseTimeVO.setInscMFD(inscMFD);
		insCourseTimeVO.setInscEXP(inscEXP);
		dao.insert(insCourseTimeVO);
		
	}
	public void updateInsCourseTime(String inscId, Timestamp inscMFD, Timestamp inscEXP) {
		InsCourseTimeVO insCourseTimeVO = new InsCourseTimeVO();
		insCourseTimeVO.setInscId(inscId);
		insCourseTimeVO.setInscMFD(inscMFD);
		insCourseTimeVO.setInscEXP(inscEXP);
		dao.update(insCourseTimeVO);
		
		
	}
	public void deleteInsCourseTime(String inscTimeId) {
		dao.delete(inscTimeId);
		
	}
	public InsCourseTimeVO getOneInsCourseTime(String inscTimeId) {
		return dao.findByPrimaryKey(inscTimeId);
		
	}
	public List<InsCourseTimeVO> getAll(){
		return dao.getAll();
		
	}

}
