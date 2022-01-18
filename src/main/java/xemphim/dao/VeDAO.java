package xemphim.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import xemphim.model.Ve;
import xemphim.model.VeFood;

@Component("veDAO")
public class VeDAO {
	
	@Autowired
	private LocalSessionFactoryBean sessionFactory;
	
	@Transactional
	public int save(Ve ve){  
		Session s = sessionFactory.getObject().getCurrentSession();
	    return (int) s.save(ve);
	}
	
	@Transactional
	public int saveVeFood(VeFood vefood) {
		Session s = sessionFactory.getObject().getCurrentSession();
	    return (int) s.save(vefood);
	}
	
	@Transactional
	public void delete(Ve ve){  
		Session s = sessionFactory.getObject().getCurrentSession();
		ve.setXoa(1);
	    s.update(ve);
	}  
	
	@Transactional
	public Ve find(int id){  
		Session s = sessionFactory.getObject().getCurrentSession();
	    return s.get(Ve.class, id);
	    
	}  
	
	@Transactional
	public List<Ve> get(){    
		Session s = sessionFactory.getObject().getCurrentSession();
		Query q = s.createQuery("From Ve Where xoa=0");
		return q.getResultList();
	}   
	
	@Transactional
	public List<VeFood> getVeFood(int id){    
		Session s = sessionFactory.getObject().getCurrentSession();
		Query q = s.createQuery("From VeFood Where ve.id="+id);
		return q.getResultList();
	}   
	
	@Transactional
	public List<String> getGheDaDat(int idSuatchieu){
		Session s = sessionFactory.getObject().getCurrentSession();
		Query q = s.createQuery("Select ghe From Ve ve Where ve.suatchieu.id=:id And ve.xoa=0");
		q.setParameter("id", idSuatchieu);
		return q.getResultList();
	}
	
	@Transactional
	public int getDoanhThu() {
		int doanhthu = 0;
		List<Ve> ves = this.get();
		for(Ve ve : ves) {
			doanhthu += ve.getSuatchieu().getGiave();
			for(VeFood vefood : ve.getVeFoods()) {
				doanhthu += vefood.getSoluong()*vefood.getFastfood().getGia();
			}
		}
		return doanhthu;
	}

}
