package com.goodsdetails.model;

import java.util.List;

import com.goods.model.GoodsJDBCDAO;

public class GoodsDetailsService {
	
	private GoodsDetailsDAO_interface dao;
	
	public GoodsDetailsService() {
		dao = new GoodsDetailsDAO();
		
	}
	
	public List<GoodsDetailsVO> getAll(){
		return dao.getAll() ;
	}
	
	public List<GoodsDetailsVO> getFindByPKAll(String goodOrderId){
		return dao.getFindByPKAll(goodOrderId) ;
	}
	
	
}
