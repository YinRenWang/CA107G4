package android.com.coursetransfer.model;

import java.util.List;


public interface CourseTransferDAO_interface {
	public void insert(CourseTransferVO courseTransferVO);
	public void update(CourseTransferVO courseTransferVO);
	public void delete(String ctId);
	public CourseTransferVO findByPrimaryKey(String ctId);
	public List<CourseTransferVO> getAll();
}
