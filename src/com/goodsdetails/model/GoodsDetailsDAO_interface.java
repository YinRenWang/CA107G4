package com.goodsdetails.model;

import java.util.List;

import com.goods.model.GoodsVO;
import com.goodsorder.model.GoodsOrderVO;



public interface GoodsDetailsDAO_interface {
	//void insert (GoodsDetailsVO goodDetailsVO);
	void update(GoodsDetailsVO goodDetailsVO);
	void delete(String goodOrderId, String goodId);
	GoodsDetailsVO findByPK(String goodOrderId, String goodId);
	List<GoodsDetailsVO>getAll();
	List<GoodsDetailsVO>getFindByPKAll(String goodOrderId);
	
	public void insertDetails(GoodsDetailsVO goodDetailsVO , java.sql.Connection con);
}
