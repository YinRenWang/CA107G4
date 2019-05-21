package com.goodsorder.model;

import java.sql.Timestamp;
import java.util.List;

import com.goodsdetails.model.GoodsDetailsVO;

public class GoodsOrderService {
	
	private GoodsOrderDAO_interface dao;
	
	public GoodsOrderService() {
		dao = new GoodsOrderDAO();
	}
	
	public List<GoodsOrderVO> getMemOrder(String memId) {
		return dao.findByMem(memId);
	}
	
	public GoodsOrderVO getOneOrder(String goodOrderId) {
		return dao.findByPk(goodOrderId);
	}
	
	public List<GoodsOrderVO> getAllOrder() {
		return dao.getAll();
	}
	
	
	public GoodsOrderVO insertOrders (GoodsOrderVO goodOrderVO, List<GoodsDetailsVO> list) {
		return dao.insertOrders(goodOrderVO, list);
		
	}
	
	
	
	public GoodsOrderVO insert(String goodOrderId, String memId, Integer goodTotalPrice,
			Timestamp goodDate, String buyerName,String buyerAddress, String buyerPhone,
			Integer goodOrdStatus) {
		
		GoodsOrderVO goodOrderVO = new GoodsOrderVO();
		goodOrderVO.setGoodOrderId(goodOrderId);
		goodOrderVO.setMemId(memId);
		goodOrderVO.setGoodTotalPrice(goodTotalPrice);
		goodOrderVO.setGoodDate(goodDate);
		goodOrderVO.setBuyerName(buyerName);
		goodOrderVO.setBuyerAddress(buyerAddress);
		goodOrderVO.setBuyerPhone(buyerPhone);
		goodOrderVO.setGoodOrdStatus(goodOrdStatus);
		dao.insert(goodOrderVO);
		
		return goodOrderVO;
	}
	
	public GoodsOrderVO updateBuyerData(String buyerName, String buyerAddress, String buyerPhone) {
		
		GoodsOrderVO goodOrderVO = new GoodsOrderVO();
		goodOrderVO.setBuyerName(buyerName);
		goodOrderVO.setBuyerAddress(buyerAddress);
		goodOrderVO.setBuyerPhone(buyerPhone);
		dao.updateBuyerData(goodOrderVO);
		
		return goodOrderVO;
	}
	
	public GoodsOrderVO updateAll(String goodOrderId, String memId, Integer goodTotalPrice,
			Timestamp goodDate, String buyerName,String buyerAddress, String buyerPhone,
			Integer goodOrdStatus) {
			
		GoodsOrderVO goodOrderVO = new GoodsOrderVO();
		goodOrderVO.setGoodOrderId(goodOrderId);
		goodOrderVO.setMemId(memId);
		goodOrderVO.setGoodTotalPrice(goodTotalPrice);
		goodOrderVO.setGoodDate(goodDate);
		goodOrderVO.setBuyerName(buyerName);
		goodOrderVO.setBuyerAddress(buyerAddress);
		goodOrderVO.setBuyerPhone(buyerPhone);
		goodOrderVO.setGoodOrdStatus(goodOrdStatus);
		dao.updateAll(goodOrderVO);
		
		return goodOrderVO;
	}
}
