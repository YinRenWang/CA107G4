package com.advertisement.model;

import java.util.List;


public interface AdvertisementDAO_interface {
		public void insert(AdvertisementVO advertisementVO);
		public void update(AdvertisementVO advertisementVO);
		public void delete(String adId);
		public AdvertisementVO findByPrimaryKey(String adId);
		public List<AdvertisementVO> getAll();

}
