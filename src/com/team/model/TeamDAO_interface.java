package com.team.model;

import java.sql.Date;
import java.util.List;
import java.util.Map;





public interface TeamDAO_interface {
	public void insert(TeamVO teamVO);
	public void update(TeamVO teamVO);

//	public void delete(String teamId);
	public TeamVO getOneTeam(String inscID);

	public List<TeamVO> getAll();
	
	public TeamVO findByPrimaryKey1(String teamId);
	
	
//	public List<TeamVO> getAll(Map<String, String[]> map);
	
	
}
