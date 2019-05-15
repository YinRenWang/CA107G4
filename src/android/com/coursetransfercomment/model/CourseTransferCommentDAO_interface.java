package android.com.coursetransfercomment.model;

import java.util.List;


public interface CourseTransferCommentDAO_interface {
	public void insert(CourseTransferCommentVO courseTransferCommentVO);
	public void update(CourseTransferCommentVO courseTransferCommentVO);
	public void delete(String ctcId);
	public CourseTransferCommentVO findByPrimaryKey(String ctcId);
	public List<CourseTransferCommentVO> getAll();
	
}
