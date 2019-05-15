package android.com.livestream.model;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import hibernate.util.HibernateUtil;


public class LiveStreamDAO implements LiveStreamDAO_interface {
	
	private static final String GET_ALL_STMT = "from LiveStreamVO order by lsId";
	private static final String GET_ALL_TEACHERID = "from LiveStreamVO order by lsId";

	@Override
	public void insert(LiveStreamVO liveStreamVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(liveStreamVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void update(LiveStreamVO liveStreamVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(liveStreamVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void delete(String lsId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			LiveStreamVO liveStreamVO = (LiveStreamVO) session.get(LiveStreamVO.class, lsId);
			session.delete(liveStreamVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public LiveStreamVO findByPrimaryKey(String lsId) {
		LiveStreamVO liveStreamVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			liveStreamVO=(LiveStreamVO)session.get(LiveStreamVO.class, lsId);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return liveStreamVO;
	}

	@Override
	public List<LiveStreamVO> getAll() {
		List<LiveStreamVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query<LiveStreamVO> query = session.createQuery(GET_ALL_STMT, LiveStreamVO.class);
			list = query.getResultList();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
	
	@Override
	public List<LiveStreamVO> getAll(String teacherId) {
		List<LiveStreamVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query<LiveStreamVO> query = session.createQuery("from LiveStreamVO where teacherId=?0");
			query.setParameter(0, teacherId);
			list = query.getResultList();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
	public static void main(String[] args) {

		LiveStreamDAO dao = new LiveStreamDAO();

		// 新增
//		LiveStreamVO liveStreamVO1 = new LiveStreamVO();
//		liveStreamVO1.setTeacherId("TC00001");
//		liveStreamVO1.setLsDate(java.sql.Timestamp.valueOf("2019-04-22 16:00:00"));
//		liveStreamVO1.setLsViewNum(100);
//		liveStreamVO1.setLsContent(null);
//		dao.insert(liveStreamVO1);

		// 修改
//		LiveStreamVO liveStreamVO2 = new LiveStreamVO();
//		liveStreamVO2.setLsId("LV00001");
//		liveStreamVO2.setTeacherId("TC00001");
//		liveStreamVO2.setLsDate(java.sql.Timestamp.valueOf("2019-04-22 16:00:00"));
//		liveStreamVO2.setLsViewNum(100);
//		liveStreamVO2.setLsContent(null);
//		dao.update(liveStreamVO2);

		// 刪除
//		dao.delete("LV00001");

		// 查詢
//		LiveStreamVO liveStreamVO3 = dao.findByPrimaryKey("LV00001");
//		System.out.print(liveStreamVO3.getLsId() + ",");
//		System.out.print(liveStreamVO3.getTeacherId() + ",");
//		System.out.print(liveStreamVO3.getLsDate() + ",");
//		System.out.print(liveStreamVO3.getLsViewNum() + ",");
//		System.out.println("---------------------");

//		// 查詢
//		List<LiveStreamVO> list = dao.getAll();
//		for (LiveStreamVO aLV : list) {
//			System.out.print(aLV.getLsId() + ",");
//			System.out.print(aLV.getTeacherId() + ",");
//			System.out.print(aLV.getLsDate() + ",");
//			System.out.print(aLV.getLsViewNum() + ",");
//			System.out.println();
//		}
		
		
		

	}


}
