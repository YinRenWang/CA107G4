package com.administrator.model;

import java.util.*;

public interface AdministratorDAO_interface {
	public void insert(AdministratorVO administratorVO);
	public void update(AdministratorVO administratorVO);
	public AdministratorVO findByPrimaryKey(String admId);
	public List<AdministratorVO> getAll();

}
