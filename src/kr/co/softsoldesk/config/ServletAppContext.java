package kr.co.softsoldesk.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;




@Configuration
@EnableWebMvc //��ĵ�� ��Ű�� ������ Ŭ���� �� Controller ������̼��� ������ �ִ� Ŭ�������� Controller�� ���
@ComponentScan("kr.co.softsoldesk.controller")
@PropertySource("/WEB-INF/properties/db.properties")
public class ServletAppContext implements WebMvcConfigurer{
//Spring MVC ������Ʈ�� ���õ� ������ �ϴ� Ŭ����
	
	@Value("${db.classname}")
	   private String db_classname;
	   
	   @Value("${db.url}")
	   private String db_url;
	   
	   @Value("${db.username}")
	   private String db_username;
	   
	   @Value("${db.password}")
	   private String db_password;
	   

	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
	//���� ���� ��� ����
		WebMvcConfigurer.super.addResourceHandlers(registry);
		registry.addResourceHandler("/**").addResourceLocations("/WEB-INF/resources/");
		//registry.addResourceHandler("/**").addResourceLocations("/WEB-INF/assets/");
	}

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
	//Controller�� �޼��尡 ��ȯ�ϴ� ���� �յڿ� ����� Ȯ���� �߰�
		WebMvcConfigurer.super.configureViewResolvers(registry);
		registry.jsp("/WEB-INF/views/",".jsp");
	}

	/*
	@Bean
	public BasicDataSource dataSource() {
		BasicDataSource source = new BasicDataSource();
		source.setDriverClassName(db_classname);
		source.setUrl(db_url);
		source.setUsername(db_username);
		source.setPassword(db_password);
		
		return source;
	}
	
	@Bean
	public SqlSessionFactory factory(BasicDataSource source) throws Exception{
		
		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		factoryBean.setDataSource(source);
		SqlSessionFactory factory = factoryBean.getObject();
		
		return factory;
	}
	

	
	//���� ������Ƽ ������ �޽����� ���
	@Bean
	public ReloadableResourceBundleMessageSource messageSource() {
		ReloadableResourceBundleMessageSource res = new ReloadableResourceBundleMessageSource();
		res.setBasename("/WEB-INF/properties/error_message");
		return res;
	}
	*/
}
