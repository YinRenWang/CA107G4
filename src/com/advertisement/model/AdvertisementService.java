package com.advertisement.model;

import java.sql.Date;
import java.util.List;

public class AdvertisementService {
	
	private AdvertisementDAO_interface dao;

	public AdvertisementService() {
		dao = new AdvertisementJDBCDAO();
	}
	
	public AdvertisementVO addAdvertisement(String inscId,Integer adStatus,Date adMFD,Date adEXP,byte[] adImg) {
		
		AdvertisementVO advertisementVO = new AdvertisementVO();
		advertisementVO.setInscId(inscId);
		advertisementVO.setAdStatus(adStatus);
		advertisementVO.setAdMFD(adMFD);
		advertisementVO.setAdEXP(adEXP);
		advertisementVO.setAdImg(adImg);
		dao.insert(advertisementVO);
		
		return advertisementVO;
		
	}
	
	
	public AdvertisementVO updateAdvertisement(Integer adStatus,Date adEXP,byte[] adImg,String adId) {
		AdvertisementVO advertisementVO = new AdvertisementVO();
		advertisementVO.setAdStatus(adStatus);
		advertisementVO.setAdEXP(adEXP);
		advertisementVO.setAdImg(adImg);
		advertisementVO.setAdId(adId);
		dao.insert(advertisementVO);
		
		return advertisementVO;
	}
	
	public void deleteAdvertisement(String adId) {
		dao.delete(adId);
	}
	public AdvertisementVO getOneAdvertisement(String adId) {
		return dao.findByPrimaryKey(adId);
	}
	public List<AdvertisementVO> getAll(){
		return dao.getAll();
	}

}
