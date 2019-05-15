package android.com.goodslike.model;

import java.util.List;

public interface GoodsLikeDAO_interface {
	
	public void insert(GoodsLikeVO goodLikeVO);
	public void delete(GoodsLikeVO goodLikeVO);	
	public List<GoodsLikeVO> getAll();
	//public List<GoodsLikeVO> findByAnyGoodsLikeVO(GoodsLikeVO goodLikeVO);
	public List<GoodsLikeVO> findByGoodId(String goodId);
	public List<GoodsLikeVO> findByMemId(String memId);
}
