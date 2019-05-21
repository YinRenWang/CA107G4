package android.com.goodsdetails.model;

import java.util.List;



public class GoodsDetailsService {
	private GoodsDetailsDAO_interface dao;

	public GoodsDetailsService() {
		this.dao = new GoodsDetailsDAO();
	}
	
	public void add(GoodsDetailsVO goodsDetailsVO) {
		dao.insert(goodsDetailsVO);
	}
	public void update(GoodsDetailsVO goodsDetailsVO) {
		dao.update(goodsDetailsVO);
	}
	
	public List<GoodsDetailsVO> getAll(){
		return dao.getAll();
	}
	
	
	public List<GoodsDetailsVO> findByAnyGoodsDetailsVO(GoodsDetailsVO goodsDetailsVO){
		return dao.findByAnyGoodsDetailsVO(goodsDetailsVO);
	}
	
	
//	public List<GoodsDetailsVO> findByOrderId(String goodOrderId) {
//		return dao.findByOrderId(goodOrderId);
//	}
//	
//	public List<GoodsDetailsVO> findByGoodId(String goodId) {
//		return dao.getByGoodId(goodId);
//	}
	
}
