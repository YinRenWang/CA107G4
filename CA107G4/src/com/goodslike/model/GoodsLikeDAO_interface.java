package com.goodslike.model;

import java.util.List;

public interface GoodsLikeDAO_interface {
	
	void insert(GoodsLikeVO goodLikeVO);
	void delete(String goodId,String memId);	
	List<GoodsLikeVO>getAll();
}
