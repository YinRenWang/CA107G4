package android.com.goods.model;

import java.util.List;

public interface GoodsDAO_interface {
	
	public void insert(GoodsVO goodVO);
	public void update(GoodsVO goodVO);
	public GoodsVO findByPK(String goodId);
	public List<GoodsVO> getAll();
	
	public List<GoodsVO> findByAnyGoodsVO(GoodsVO goodsVO);
}
