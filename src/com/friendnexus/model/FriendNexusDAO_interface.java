package com.friendnexus.model;

import java.util.List;



public interface FriendNexusDAO_interface {
	public void insert(FriendNexusVO friendNexusVO);

	public FriendNexusVO findByPrimaryKey(String memId);

	public void delete(String friendAcc,String memId);
	public void deletememId(String memId, String friendAcc);

	public List<FriendNexusVO> getAll();

	public void update(FriendNexusVO friendNexusVO);

	

	public List<FriendNexusVO> friendNexus0(String friendAcc); //送出申請

	public List<FriendNexusVO> friendNexus1(String memId); //成為好友

	

	

	

	
	
	
}
