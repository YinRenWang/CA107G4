package com.joingroup.model;

import java.util.List;




public interface JoinGroupDAO_interface {
	


	 List<JoinGroupVO> getAll();
//	 public void delete(String m publicemId);
	 
     public List<JoinGroupVO> findByPrimaryKey(String memId);
     
     public void insert(JoinGroupVO joinGroupVO);
//	public void update(JoinGroupVO joinGroupVO);
	 
	 
	public void delete(String memId, String teamId);
	
	public JoinGroupVO findById(String memId, String teamId);

	public List<JoinGroupVO> findByTeamId(String teamId);
}
