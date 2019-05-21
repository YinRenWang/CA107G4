package android.com.friendnexus.model;

import java.util.List;



public interface FriendNexusDAO_interface {
	public void insert(FriendNexusVO friendNexusVO);

	public FriendNexusVO findByPrimaryKey(String memId);

//	public void delete(String memId);

	public List<FriendNexusVO> getAll();

	public void update(FriendNexusVO friendNexusVO);

	

	public List<FriendNexusVO> friendNexus0(String memId); //送出申請

	public List<FriendNexusVO> friendNexus1(String memId); //成為好友

	

	
	
	
}
