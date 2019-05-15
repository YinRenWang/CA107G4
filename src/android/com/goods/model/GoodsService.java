package android.com.goods.model;

import java.util.List;

public class GoodsService {

	private GoodsDAO_interface dao;

	public GoodsService() {
		dao = new GoodsDAO();

	}
	
	public void add(GoodsVO goodsVO) {
		dao.insert(goodsVO);
	}

	public void update(GoodsVO goodsVO) {
		dao.update(goodsVO);
	}

	public GoodsVO getOneGood(String goodId) {
		return dao.findByPK(goodId);
	}

	public List<GoodsVO> getAll() {
		return dao.getAll();
	}

	public List<GoodsVO> findByAnyGoodsVO(GoodsVO goodsVO) {
		return dao.findByAnyGoodsVO(goodsVO);
	}
}
