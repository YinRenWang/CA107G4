package com.goods.model;

import java.util.List;

public interface GoodsDAO_interface {

	List<GoodsVO> getGoodsByteacher(String teacher); 
	
	void insert(GoodsVO goodVO);

	int updateGood(GoodsVO goodVO);
	
	void updateGood_NoPic(GoodsVO goodVO);

	void updateStatus(GoodsVO goodVO);

	void delete(String goodId);

	GoodsVO findByPK(String goodId);

	List<GoodsVO> getAll();

	List<GoodsVO> getGoodsByStatus(int goodStatus); //前台顯示上架商品
	
	
	
}
