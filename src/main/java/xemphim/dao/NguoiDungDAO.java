package xemphim.dao;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import xemphim.model.Banner;
import xemphim.model.Fastfood;
import xemphim.model.LoginForm;
import xemphim.model.Nguoidung;

@Component("nguoiDungDAO")
public class NguoiDungDAO {
	
	@Autowired
	private LocalSessionFactoryBean sessionFactory;
	
	@Transactional
	public int save(Nguoidung nguoidung){  
		Session s = sessionFactory.getObject().getCurrentSession();
	    return (int) s.save(nguoidung);
	}  
	
	@Transactional
	public void delete(Nguoidung nguoidung){  
		Session s = sessionFactory.getObject().getCurrentSession();
		nguoidung.setXoa(1);
	    s.update(nguoidung);
	}  
	
	@Transactional
	public Nguoidung find(int id){  
		Session s = sessionFactory.getObject().getCurrentSession();
	    return s.get(Nguoidung.class, id);
	    
	}  
	
	@Transactional
	public Nguoidung findByEmail(String email){  
		Session s = sessionFactory.getObject().getCurrentSession();
		Query query = s.createQuery("From Nguoidung n Where n.email = :email And n.xoa = 0");
		query.setParameter("email", email);
		try {
			return (Nguoidung) query.getSingleResult();
		}catch(NoResultException e) {
			return null;
		}
	}  
	
	@Transactional
	public List<Nguoidung> get(){    
		Session s = sessionFactory.getObject().getCurrentSession();
		Query q = s.createQuery("From Nguoidung Where xoa=0");
		return q.getResultList();
	}

	@Transactional
	public void update(Nguoidung nguoidung){  
		Session s = sessionFactory.getObject().getCurrentSession();
	    s.update(nguoidung);
	}   
	
	@Transactional
	public boolean checkUser(String email) {
		Session s = sessionFactory.getObject().getCurrentSession();
		Query query = s.createQuery("From Nguoidung n Where n.email = :email And n.xoa = 0");
		query.setParameter("email", email);
		return query.getResultList().isEmpty();
	}

}
