package com.member.model;

import java.util.List;
import java.util.Map;
import java.util.Set;

public interface MemberDAO_interface {
	  public void insert(MemberVO memberVO);
	  public void update(MemberVO memberVO);
	  public void registered(MemberVO memberVO);
	  public void editMember(MemberVO memberVO);
      public MemberVO findByPrimaryKey(String memberId);
      public List<MemberVO> getAll();
      //萬用複合查詢(傳入參數型態Map)(回傳 List)
//      public List<MemberVO> getAll(Map<String, String[]> map); 
	

}
