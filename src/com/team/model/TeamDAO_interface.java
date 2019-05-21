package com.team.model;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.joingroup.model.JoinGroupVO;





public interface TeamDAO_interface {
//	public TeamVO insert(TeamVO teamVO);
	public void update(TeamVO teamVO);

	
	public TeamVO getOneTeam(String inscID);

	public List<TeamVO> getAll();
	
	public TeamVO findByPrimaryKey1(String teamId);
	public TeamVO insert(TeamVO teamVO, JoinGroupVO joinGroupVO);

	public void deletTeam(String teamId, String leaderID);


	TeamVO insert(TeamVO teamVO);
	
	
//	public List<TeamVO> getAll(Map<String, String[]> map);
	
	
}
