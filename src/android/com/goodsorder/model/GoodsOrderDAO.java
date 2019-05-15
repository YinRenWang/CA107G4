package android.com.goodsorder.model;

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

import android.com.member.model.MemberVO;
import hibernate.util.HibernateUtil;
import hibernate.util.TransBean2Map;

public class GoodsOrderDAO implements GoodsOrderDAO_interface {
	private static final String GET_ALL = "from GoodsOrderVO";
	private static final String FIND_BY_MEMID = "from GoodsOrderVO where memId= ?0";

	@Override
	public void insert(GoodsOrderVO goodOrderVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(goodOrderVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void update(GoodsOrderVO goodOrderVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(goodOrderVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public List<GoodsOrderVO> getAll() {
		List<GoodsOrderVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query<GoodsOrderVO> query = session.createQuery(GET_ALL, GoodsOrderVO.class);
			list = query.getResultList();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

	@Override
	public List<GoodsOrderVO> findMyGoodOrderByMemId(String memId) {
		List<GoodsOrderVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query<GoodsOrderVO> query = session.createQuery(FIND_BY_MEMID, GoodsOrderVO.class);
			query.setParameter(0, memId);
			list = query.getResultList();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

	@Override
	public List<GoodsOrderVO> findByAnyGoodsOrderVO(GoodsOrderVO goodsOrderVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		List<GoodsOrderVO> list = null;
		try {
			// 【●創建 CriteriaBuilder】
			CriteriaBuilder builder = session.getCriteriaBuilder();
			// 【●創建 CriteriaQuery】
			CriteriaQuery<GoodsOrderVO> criteriaQuery = builder.createQuery(GoodsOrderVO.class);
			// 【●創建 Root】
			Root<GoodsOrderVO> root = criteriaQuery.from(GoodsOrderVO.class);

			List<Predicate> predicateList = new ArrayList<Predicate>();

			Map<String, Object> map = TransBean2Map.transBean2Map(goodsOrderVO);

			Set<String> keys = map.keySet();
			for (String key : keys) {
				Object value = map.get(key);
				if (value != null) {
					predicateList.add(get_aPredicate_For_AnyDB(builder, root, key, value));
				}
			}

			criteriaQuery.where(predicateList.toArray(new Predicate[predicateList.size()]));

			Query<GoodsOrderVO> query = session.createQuery(criteriaQuery);
			list = query.getResultList();

			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;

	}

	public static Predicate get_aPredicate_For_AnyDB(CriteriaBuilder builder, Root<GoodsOrderVO> root,
			String columnName, Object value) {

		Predicate predicate = null;

		if ("goodOrdStatus".equals(columnName) || "goodTotalPrice".equals(columnName))
			predicate = builder.equal(root.get(columnName), (int) value);
		else if ("goodOrderId".equals(columnName) || "buyerName".equals(columnName) || "buyerAddress".equals(columnName)
				|| "buyerPhone".equals(columnName))
			predicate = builder.like(root.get(columnName), "%" + value + "%");
		else if ("memberVO".equals(columnName))
			predicate = builder.equal(root.get(columnName), ((MemberVO) value).getMemId());
		else if ("goodDate".equals(columnName)) // 用於date
			predicate = builder.equal(root.get(columnName), (java.sql.Timestamp) value);
		return predicate;
	}
}
