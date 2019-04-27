package com.friendnexus.model;

import java.util.List;



public interface FriendNexusDAO_interface {
	public void insert(FriendNexusVO friendNexusVO);

	public FriendNexusVO findByPrimaryKey(String memId);
	
	public FriendNexusVO findByPrimaryKey(String memId,String frendAcc);

//	public void delete(String memId);

	public List<FriendNexusVO> getAll();

	public void update(FriendNexusVO friendNexusVO);

	

	public List<FriendNexusVO> friendNexus(String memId);

	

	
	
	
}
