package xemphim.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import xemphim.model.Phim;

@Component("phimDAO")
public class PhimDAO {
	@Autowired
	private LocalSessionFactoryBean sessionFactory;

	@Transactional
	public int save(Phim phim) {
		Session s = sessionFactory.getObject().getCurrentSession();
		return (int) s.save(phim);
	}

	@Transactional
	public void update(Phim phim) {
		Session s = sessionFactory.getObject().getCurrentSession();
		s.saveOrUpdate(phim);
	}

	@Transactional
	public void delete(Phim phim) {
		Session s = sessionFactory.getObject().getCurrentSession();
		phim.setXoa(1);
		s.update(phim);
	}

	@Transactional
	public Phim find(int id) {
		Session s = sessionFactory.getObject().getCurrentSession();
		return s.get(Phim.class, id);
	}

	@Transactional
	public List<Phim> get() {
		Session s = sessionFactory.getObject().getCurrentSession();
		Query q = s.createQuery("From Phim Where xoa=0");
		return q.getResultList();
	}

	@Transactional
	public List<Phim> search(String keyword) {
		Session s = sessionFactory.getObject().getCurrentSession();
		Query q = s.createQuery("SELECT m FROM Phim m WHERE m.xoa=0 AND (m.ten LIKE :keyword "
				+ "OR m.dienvien LIKE :keyword OR m.daodien LIKE :keyword) ");
		q.setParameter("keyword", "%"+keyword+"%");
		return q.getResultList();
	}

}
