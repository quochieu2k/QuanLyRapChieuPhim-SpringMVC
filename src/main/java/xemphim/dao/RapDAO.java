package xemphim.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import xemphim.model.Rap;

@Component("rapDAO")
public class RapDAO {
	@Autowired
	private LocalSessionFactoryBean sessionFactory;

	
	@Transactional
	public int save(Rap rap){  
		Session s = sessionFactory.getObject().getCurrentSession();
	    return (int) s.save(rap);
	}  
	
	@Transactional
	public void update(Rap rap){  
		Session s = sessionFactory.getObject().getCurrentSession();
	    s.saveOrUpdate(rap);
	}  
	
	@Transactional
	public void delete(Rap rap){  
		Session s = sessionFactory.getObject().getCurrentSession();
		rap.setXoa(1);
	    s.update(rap);
	}  
//	
	@Transactional
	public Rap find(int id){  
		Session s = sessionFactory.getObject().getCurrentSession();
	    return s.get(Rap.class, id);
	}  
//	
	@Transactional
	public List<Rap> get(){    
		Session s = sessionFactory.getObject().getCurrentSession();
		Query q = s.createQuery("From Rap Where xoa=0");
		return q.getResultList();
	}    
}
