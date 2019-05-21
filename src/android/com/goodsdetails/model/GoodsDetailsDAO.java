package android.com.goodsdetails.model;

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

import android.com.goods.model.GoodsVO;
import android.com.goodsorder.model.GoodsOrderVO;
import hibernate.util.HibernateUtil;
import hibernate.util.TransBean2Map;

public class GoodsDetailsDAO implements GoodsDetailsDAO_interface {
	private static final String GET_ALL = "from GoodsDetailsVO";
	
	
	
	@Override
	public void insert(GoodsDetailsVO goodDetailsVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(goodDetailsVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void update(GoodsDetailsVO goodDetailsVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(goodDetailsVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}


	

	@Override
	public List<GoodsDetailsVO> getAll() {
		List<GoodsDetailsVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query<GoodsDetailsVO> query = session.createQuery(GET_ALL, GoodsDetailsVO.class);
			list = query.getResultList();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

	@Override
	public List<GoodsDetailsVO> findByAnyGoodsDetailsVO(GoodsDetailsVO goodsDetailsVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		List<GoodsDetailsVO> list = null;
		try {
			// 【●創建 CriteriaBuilder】
			CriteriaBuilder builder = session.getCriteriaBuilder();
			// 【●創建 CriteriaQuery】
			CriteriaQuery<GoodsDetailsVO> criteriaQuery = builder.createQuery(GoodsDetailsVO.class);
			// 【●創建 Root】
			Root<GoodsDetailsVO> root = criteriaQuery.from(GoodsDetailsVO.class);

			List<Predicate> predicateList = new ArrayList<Predicate>();
			
			
			Map<String, Object> map = TransBean2Map.transBean2Map(goodsDetailsVO);
			
			
			Set<String> keys = map.keySet();
			for (String key : keys) {
				Object value = map.get(key);
				if (value != null) {
					predicateList.add(get_aPredicate_For_AnyDB(builder, root, key, value));
				}
			}
			
			criteriaQuery.where(predicateList.toArray(new Predicate[predicateList.size()]));
			
			Query<GoodsDetailsVO> query = session.createQuery(criteriaQuery); 
			list = query.getResultList();

			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;

	}

	public static Predicate get_aPredicate_For_AnyDB(CriteriaBuilder builder, Root<GoodsDetailsVO> root, String columnName,
			Object value) {

		Predicate predicate = null;

		if ("goodAmount".equals(columnName)) 
			predicate = builder.equal(root.get(columnName), (int)value);
		else if ("goodRate".equals(columnName)) 
			predicate = builder.like(root.get(columnName), "%" + value + "%");
		else if ("goodScore".equals(columnName)) 
			predicate = builder.equal(root.get(columnName), (float)value);
		else if ("goodsOrderVO".equals(columnName)) 
			predicate = builder.equal(root.get(columnName), ((GoodsOrderVO)value).getGoodOrderId());
		else if ("goodsVO".equals(columnName)) 
			predicate = builder.equal(root.get(columnName), ((GoodsVO)value).getGoodId());

		return predicate;
	}

	
}
