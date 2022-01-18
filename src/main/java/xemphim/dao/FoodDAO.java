package xemphim.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import xemphim.model.Fastfood;

@Component("foodDAO")
public class FoodDAO {
	
	@Autowired
	private LocalSessionFactoryBean sessionFactory;
	
	@Transactional
	public int save(Fastfood fastfood){  
		Session s = sessionFactory.getObject().getCurrentSession();
	    return (int) s.save(fastfood);
	}  
	
	@Transactional
	public void update(Fastfood fastfood){  
		Session s = sessionFactory.getObject().getCurrentSession();
	    s.saveOrUpdate(fastfood);
	}  
	
	@Transactional
	public void delete(Fastfood fastfood){  
		Session s = sessionFactory.getObject().getCurrentSession();
		fastfood.setXoa(1);
	    s.update(fastfood);
	}  
	
	@Transactional
	public Fastfood find(int id){  
		Session s = sessionFactory.getObject().getCurrentSession();
	    return s.get(Fastfood.class, id);
	    
	}  
	
	@Transactional
	public List<Fastfood> get(){    
		Session s = sessionFactory.getObject().getCurrentSession();
		Query q = s.createQuery("From Fastfood Where xoa=0");
		return q.getResultList();
	}    

}
