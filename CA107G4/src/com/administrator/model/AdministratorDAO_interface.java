package com.administrator.model;

import java.util.*;

public interface AdministratorDAO_interface {
	public void insert(AdministratorVO administratorVO);
	public void update(AdministratorVO administratorVO);
	public void delete(String admId);
	public AdministratorVO findByPrimaryKey(String admId);
	public List<AdministratorVO> getAll();

}
