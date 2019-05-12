package com.goodsorder.model;

import java.sql.Connection;
import java.util.List;

import com.goods.model.GoodsVO;
import com.goodsdetails.model.GoodsDetailsVO;



public interface GoodsOrderDAO_interface {
	
	void insert(GoodsOrderVO goodOrderVO);
	void updateBuyerData(GoodsOrderVO goodOrderVO);
	void updateAll(GoodsOrderVO goodOrderVO);
	void delete(String goodOrderId);
	//GoodsOrderVO findByMem(String memId);
	GoodsOrderVO findByPk(String goodOrderId);
	List<GoodsOrderVO> getAll();
	List<GoodsOrderVO> findByMem(String memId);
	
	public GoodsOrderVO insertOrders(GoodsOrderVO goodOrderVO , List<GoodsDetailsVO> list);
}
