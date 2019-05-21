package com.goodsmessage.model;

import java.util.List;

public interface GoodsMessageDAO_interface {
	
	void insert(GoodsMessageVO goodsMessage);
	void delete(String goodMessageId);	
	List<GoodsMessageVO>getAll();
}
