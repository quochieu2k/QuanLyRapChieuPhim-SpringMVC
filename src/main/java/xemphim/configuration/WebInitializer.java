package xemphim.configuration;

import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.filter.HiddenHttpMethodFilter;
import org.springframework.web.servlet.DispatcherServlet;

public class WebInitializer implements WebApplicationInitializer {

	@Override
	public void onStartup(ServletContext container) throws ServletException {

		//filter mapping utf8
		FilterRegistration.Dynamic filterRegistration = container.addFilter("characterEncodingFilter",
				new CharacterEncodingFilter("UTF-8", true, true));
		filterRegistration.addMappingForUrlPatterns(null, false, "/*");

		filterRegistration = container.addFilter("hiddenHttpMethodFilter", new HiddenHttpMethodFilter());
		filterRegistration.addMappingForUrlPatterns(null, false, "/*");
		

		//config web application
		AnnotationConfigWebApplicationContext ctx = new AnnotationConfigWebApplicationContext();
		ctx.scan("xemphim");
		ctx.register(TilesApplicationConfiguration.class);
		container.addListener(new ContextLoaderListener(ctx));

		DispatcherServlet dispatcherServlet = new DispatcherServlet(ctx);
		dispatcherServlet.setThrowExceptionIfNoHandlerFound(true);

		ServletRegistration.Dynamic servlet = container.addServlet("dispatcher", dispatcherServlet);
		servlet.setLoadOnStartup(1);
		servlet.addMapping("/");
	}

}
