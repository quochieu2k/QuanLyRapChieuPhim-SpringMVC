package xemphim.configuration;

import java.util.Properties;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;

@Configuration
@PropertySource("classpath:database.properties")
public class HibernateConfiguration {
	@Autowired
	Environment env;

	// sesssion factory
	@Bean
	public LocalSessionFactoryBean getSessionFactory() {
		LocalSessionFactoryBean factory = new LocalSessionFactoryBean();
		factory.setPackagesToScan("xemphim.model");
		factory.setDataSource(getDataSource());
		factory.setHibernateProperties(hibernateProperties());
		return factory;
	}

	// data source
	@Bean(name = "dataSource")
	public DataSource getDataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();

		dataSource.setDriverClassName(env.getProperty("hibernate.driver"));
		dataSource.setUrl(env.getProperty("hibernate.url"));
		dataSource.setUsername(env.getProperty("hibernate.username"));
		dataSource.setPassword(env.getProperty("hibernate.password"));

		return dataSource;
	}

	// hibernate properties
	private Properties hibernateProperties() {
		Properties props = new Properties();
		props.setProperty(org.hibernate.cfg.Environment.DIALECT, env.getProperty("hibernate.dialect"));
		props.setProperty(org.hibernate.cfg.Environment.SHOW_SQL, env.getProperty("hibernate.showSql"));
		return props;
	}

	// transaction manager
	@Bean
	public HibernateTransactionManager transactionManager() {
		HibernateTransactionManager h = new HibernateTransactionManager();
		h.setSessionFactory(getSessionFactory().getObject());
		return h;
	}
}
