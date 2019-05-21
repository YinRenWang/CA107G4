package com.goodsreport.model;

import java.util.List;


public interface GoodsReportDAO_interface {
	
	void insert(GoodsReportVO goodsReportVO);
	void update(GoodsReportVO goodsReportVO);
	void delete(String goodReportId);
	GoodsReportVO findByMemId(String memId);
	List<GoodsReportVO>getAll();
}
