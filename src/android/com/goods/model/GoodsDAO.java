package android.com.goods.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.query.Query;

import android.com.teacher.model.TeacherVO;
import hibernate.util.HibernateUtil;
import hibernate.util.TransBean2Map;

public class GoodsDAO implements GoodsDAO_interface {

	//private static final String GET_ALL = "select goodId, teacherId, goodName, goodPrice, goodInfo, goodStatus from Goods";
	private static final String GET_ALL = "from GoodsVO";

	@Override
	public void insert(GoodsVO goodVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(goodVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void update(GoodsVO goodVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(goodVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public GoodsVO findByPK(String goodId) {
		GoodsVO goodsVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			goodsVO = (GoodsVO) session.get(GoodsVO.class, goodId);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return goodsVO;

	}

	@Override
	public List<GoodsVO> getAll() {
		List<GoodsVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query<GoodsVO> query = session.createQuery(GET_ALL, GoodsVO.class);
			list = query.getResultList();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
		for(GoodsVO gvo : list) {
			gvo.setGoodImg(null);
		}
		
		
		return list;
	}


	public List<GoodsVO> findByAnyGoodsVO(GoodsVO goodsVO) {

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		List<GoodsVO> list = null;
		try {
			// 【●創建 CriteriaBuilder】
			CriteriaBuilder builder = session.getCriteriaBuilder();
			// 【●創建 CriteriaQuery】
			CriteriaQuery<GoodsVO> criteriaQuery = builder.createQuery(GoodsVO.class);
			// 【●創建 Root】
			Root<GoodsVO> root = criteriaQuery.from(GoodsVO.class);

			List<Predicate> predicateList = new ArrayList<Predicate>();
			
			
			Map<String, Object> map = TransBean2Map.transBean2Map(goodsVO);
			
			
			Set<String> keys = map.keySet();
			for (String key : keys) {
				Object value = map.get(key);
				if (value != null) {
					predicateList.add(get_aPredicate_For_AnyDB(builder, root, key, value));
				}
			}
			
			criteriaQuery.where(predicateList.toArray(new Predicate[predicateList.size()]));
			
			Query<GoodsVO> query = session.createQuery(criteriaQuery); 
			list = query.getResultList();

			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;

	}

	public static Predicate get_aPredicate_For_AnyDB(CriteriaBuilder builder, Root<GoodsVO> root, String columnName,
			Object value) {

		Predicate predicate = null;

		if ("goodPrice".equals(columnName) || "goodStatus".equals(columnName)) 
			predicate = builder.equal(root.get(columnName), (int)value);
		else if ("goodId".equals(columnName) || "goodName".equals(columnName) || "goodInfo".equals(columnName)) 
			predicate = builder.like(root.get(columnName), "%" + value + "%");
		else if ("teacherVO".equals(columnName)) 
			predicate = builder.equal(root.get(columnName), ((TeacherVO)value).getTeacherId());

		return predicate;
	}
	
	
	
	
	

}
