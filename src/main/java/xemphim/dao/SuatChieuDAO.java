package xemphim.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import xemphim.model.Suatchieu;

@Component("suatChieuDAO")
public class SuatChieuDAO {

	@Autowired
	private LocalSessionFactoryBean sessionFactory;
	
	@Transactional
	public int save(Suatchieu suatchieu){  
		Session s = sessionFactory.getObject().getCurrentSession();
	    return (int) s.save(suatchieu);
	}  
	
	@Transactional
	public void update(Suatchieu suatchieu){  
		Session s = sessionFactory.getObject().getCurrentSession();
	    s.saveOrUpdate(suatchieu);
	}  
	
	@Transactional
	public void delete(Suatchieu suatchieu){  
		Session s = sessionFactory.getObject().getCurrentSession();
		suatchieu.setXoa(1);
	    s.update(suatchieu);
	}  
//	
	@Transactional
	public Suatchieu find(int id){  
		Session s = sessionFactory.getObject().getCurrentSession();
	    return s.get(Suatchieu.class, id);
	}  
	
	@Transactional
	public List<Suatchieu> get(){    
		Session s = sessionFactory.getObject().getCurrentSession();
		Query q = s.createQuery("From Suatchieu Where xoa=0");
		return q.getResultList();
	}   
	
	@Transactional
	public List<Suatchieu> getByMovieAndDate(int id,Date date){
		Session s = sessionFactory.getObject().getCurrentSession();
		Query q = s.createQuery("From Suatchieu Where phim.id=:id AND ngay=:date AND xoa=0");
		q.setParameter("id", id);
		q.setParameter("date", date);
		return q.getResultList();
	}
	
}
