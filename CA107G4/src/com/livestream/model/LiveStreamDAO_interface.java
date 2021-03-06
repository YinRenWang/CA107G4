package com.livestream.model;

import java.util.List;

public interface LiveStreamDAO_interface {
	public void insert(LiveStreamVO liveStreamVO);
	public void update(LiveStreamVO liveStreamVO);
	public void delete(String lsId);
	public LiveStreamVO findByPrimaryKey(String lsId);
	public List<LiveStreamVO> getAll();
	public List<LiveStreamVO> getAllnoNull();
	public List<LiveStreamVO> getAllnoNull(String teacherId);
	public List<LiveStreamVO> getAll(String teacherId);
	public LiveStreamVO getLastVideo(String teacherId);
}
