package com.administrator.model;

import java.util.List;

public class AdministratorService {
	
	private AdministratorDAO_interface dao;
	
	public AdministratorService() {
		dao = new AdministratorDAO();

	}
	
	public AdministratorVO addAdministrator(String admId,String admPsw,Integer admStatus) {
		AdministratorVO administratorVO = new AdministratorVO();
		
		administratorVO.setAdmId(admId);
		administratorVO.setAdmPsw(admPsw);
		administratorVO.setAdmStatus(admStatus);
		dao.insert(administratorVO);
		return administratorVO;
	}
	
	public AdministratorVO updateAdministrator(String admId,String admPsw,Integer admStatus) {
		AdministratorVO administratorVO = new AdministratorVO();
		
		administratorVO.setAdmId(admId);
		administratorVO.setAdmPsw(admPsw);
		administratorVO.setAdmStatus(admStatus);
		dao.update(administratorVO);
		return administratorVO;
	}
	
	public AdministratorVO getOneAdministrator(String admId) {
		return dao.findByPrimaryKey(admId);
	}

	public List<AdministratorVO> getAll() {
		return dao.getAll();
	}
	
	

}
