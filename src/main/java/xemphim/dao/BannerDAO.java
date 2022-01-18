package xemphim.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import xemphim.model.Banner;

@Component("bannerDAO")
public class BannerDAO {
	
	@Autowired
	private LocalSessionFactoryBean sessionFactory;
	
	@Transactional
	public int save(Banner banner){  
		Session s = sessionFactory.getObject().getCurrentSession();
	    return (int) s.save(banner);
	}  
	
	@Transactional
	public void update(Banner banner){  
		Session s = sessionFactory.getObject().getCurrentSession();
	    s.saveOrUpdate(banner);
	}  
	
	@Transactional
	public void delete(Banner banner){  
		Session s = sessionFactory.getObject().getCurrentSession();
		banner.setXoa(1);
	    s.update(banner);
	}  
	
	@Transactional
	public Banner find(int id){  
		Session s = sessionFactory.getObject().getCurrentSession();
	    return s.get(Banner.class, id);
	    
	}  
	
	@Transactional
	public List<Banner> get(){    
		Session s = sessionFactory.getObject().getCurrentSession();
		Query q = s.createQuery("From Banner Where xoa=0");
		return q.getResultList();
	}    

}
