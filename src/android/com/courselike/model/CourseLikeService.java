package android.com.courselike.model;

import java.util.List;

public class CourseLikeService {

	private CourseLikeDAO_interface dao;

	public CourseLikeService() {
		dao = new CourseLikeDAO();

	}

	public CourseLikeVO addCourseLike(String memId, String inscId) {

		CourseLikeVO courseLikeVO = new CourseLikeVO();

		courseLikeVO.setMemId(memId);
		courseLikeVO.setInscId(inscId);
		dao.insert(courseLikeVO);

		return courseLikeVO;

	}

	public void deleteCourseLike(String memId, String inscId) {
		dao.delete(memId, inscId);
	}

	public CourseLikeVO getOneCourseLike(String memId, String inscId) {
		return dao.findByPrimaryKey(memId, inscId);
	}

	public List<CourseLikeVO> getMemIdCourseLike(String memId) {
		return dao.findByMemId(memId);
	}

	public List<CourseLikeVO> getAll() {
		return dao.getAll();
	}

}
