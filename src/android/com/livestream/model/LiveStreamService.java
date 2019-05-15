package android.com.livestream.model;

import java.sql.Timestamp;
import java.util.List;

public class LiveStreamService {
	
	private LiveStreamDAO_interface dao;
	
	public LiveStreamService() {
		dao = new LiveStreamDAO();
	}

	public LiveStreamVO insert(String teacherId, Timestamp lsDate, Integer lsViewNum, byte[] lsContent) {
		
		LiveStreamVO liveStreamVO=new LiveStreamVO();
		liveStreamVO.setTeacherId(teacherId);
		liveStreamVO.setLsDate(lsDate);
		liveStreamVO.setLsViewNum(lsViewNum);
		liveStreamVO.setLsContent(lsContent);
		dao.insert(liveStreamVO);
		return liveStreamVO;
	}
	public LiveStreamVO update(String lsId,String teacherId, Timestamp lsDate, Integer lsViewNum, byte[] lsContent) {
		
		LiveStreamVO liveStreamVO=new LiveStreamVO();
		liveStreamVO.setLsId(lsId);
		liveStreamVO.setTeacherId(teacherId);
		liveStreamVO.setLsDate(lsDate);
		liveStreamVO.setLsViewNum(lsViewNum);
		liveStreamVO.setLsContent(lsContent);
		dao.update(liveStreamVO);
		return liveStreamVO;
		
	}
	public void delete(String lsId) {
		dao.delete(lsId);
		
	}
	public LiveStreamVO findByPrimaryKey(String lsId) {
		return dao.findByPrimaryKey(lsId);
		
	}
	public List<LiveStreamVO> getAll(){
		return dao.getAll();
		
	}
	public List<LiveStreamVO> getAll(String teacherId){
		return dao.getAll(teacherId);
	}

	public LiveStreamVO update(LiveStreamVO liveStreamVO) {
		dao.update(liveStreamVO);
		return liveStreamVO;
		
	}

}
