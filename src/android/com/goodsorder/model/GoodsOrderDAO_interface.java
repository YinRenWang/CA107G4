package android.com.goodsorder.model;

import java.util.List;
import java.util.Map;

import android.com.goods.model.GoodsVO;

public interface GoodsOrderDAO_interface {
	
	public void insert(GoodsOrderVO goodOrderVO);
	public void update(GoodsOrderVO goodOrderVO);
	public List<GoodsOrderVO> getAll();
	public List<GoodsOrderVO> findMyGoodOrderByMemId(String memId);
	public List<GoodsOrderVO> findByAnyGoodsOrderVO(GoodsOrderVO goodOrderVO);
}
