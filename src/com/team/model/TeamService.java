package com.team.model;

import java.sql.Date;
import java.util.List;



public class TeamService {

	private TeamDAO_interface dao;

	public TeamService() {
		dao = new TeamDAO();
	}

	public TeamVO addTeam(String leaderID, String inscID, java.sql.Date teamMFD, java.sql.Date teamEXP,
			Integer teamStatus) {

		TeamVO teamVO = new TeamVO();

		teamVO.setLeaderID(leaderID);
		teamVO.setInscID(inscID);
		teamVO.setTemaMFD(teamMFD);
		teamVO.setTeamEXP(teamEXP);
		teamVO.setTeamStatus(teamStatus);
		dao.insert(teamVO);

		return teamVO;

	}

	public TeamVO updateTeam(String teamId, String leaderID, String inscID, java.sql.Date teamMFD,
			java.sql.Date teamEXP, Integer teamStatus) {

		TeamVO teamVO = new TeamVO();

		teamVO.setTeamId(teamId);
		teamVO.setLeaderID(leaderID);
		teamVO.setInscID(inscID);
		teamVO.setTemaMFD(teamMFD);
		teamVO.setTeamEXP(teamEXP);
		teamVO.setTeamStatus(teamStatus);
		dao.update(teamVO);

		return teamVO;

	}

//	public void deleteTeam(String teamId) {
//		dao.delete(teamId);
//	}

	public TeamVO getOneTeam(String inscID) {
		return dao.getOneTeam(inscID);
	}
	
	public TeamVO findByPrimaryKey1(String teamId) {
		return dao.findByPrimaryKey1(teamId);
	}
	
	
	public List<TeamVO> getAll() {
		return dao.getAll();
	}
	

}
