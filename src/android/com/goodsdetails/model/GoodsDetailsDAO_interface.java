package android.com.goodsdetails.model;

import java.util.List;

import android.com.goods.model.GoodsVO;

public interface GoodsDetailsDAO_interface {
	public void insert (GoodsDetailsVO goodDetailsVO);
	public void update(GoodsDetailsVO goodDetailsVO);
	public List<GoodsDetailsVO>getAll();
	public List<GoodsDetailsVO> findByAnyGoodsDetailsVO(GoodsDetailsVO goodsDetailsVO);
}
