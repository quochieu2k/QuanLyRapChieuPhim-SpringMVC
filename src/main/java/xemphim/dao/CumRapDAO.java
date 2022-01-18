package xemphim.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import xemphim.model.Cumrap;

@Component("cumRapDAO")
public class CumRapDAO {
	
	@Autowired
	private LocalSessionFactoryBean sessionFactory;
	
	@Transactional
	public int save(Cumrap cumrap){  
		Session s = sessionFactory.getObject().getCurrentSession();
	    return (int) s.save(cumrap);
	}  
	
	@Transactional
	public void update(Cumrap cumrap){  
		Session s = sessionFactory.getObject().getCurrentSession();
	    s.saveOrUpdate(cumrap);
	}  
	
	@Transactional
	public void delete(Cumrap cumrap){  
		Session s = sessionFactory.getObject().getCurrentSession();
		cumrap.setXoa(1);
	    s.update(cumrap);
	}  
	
	@Transactional
	public Cumrap find(int id){  
		Session s = sessionFactory.getObject().getCurrentSession();
	    return s.get(Cumrap.class, id);
	    
	}  
	
	@Transactional
	public List<Cumrap> get(){    
		Session s = sessionFactory.getObject().getCurrentSession();
		Query q = s.createQuery("From Cumrap Where xoa=0");
		return q.getResultList();
	}    
}
