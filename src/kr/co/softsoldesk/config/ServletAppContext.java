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
@EnableWebMvc //스캔한 패키지 내부의 클래스 중 Controller 어노테이션을 가지고 있는 클래스들을 Controller로 등록
@ComponentScan("kr.co.softsoldesk.controller")
@PropertySource("/WEB-INF/properties/db.properties")
public class ServletAppContext implements WebMvcConfigurer{
//Spring MVC 프로젝트에 관련된 설정을 하는 클래스
	
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
	//정적 파일 경로 매핑
		WebMvcConfigurer.super.addResourceHandlers(registry);
		registry.addResourceHandler("/**").addResourceLocations("/WEB-INF/resources/");
		//registry.addResourceHandler("/**").addResourceLocations("/WEB-INF/assets/");
	}

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
	//Controller의 메서드가 반환하는 파일 앞뒤에 경로의 확장지 추가
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
	

	
	//에러 프로퍼티 파일을 메시지로 등록
	@Bean
	public ReloadableResourceBundleMessageSource messageSource() {
		ReloadableResourceBundleMessageSource res = new ReloadableResourceBundleMessageSource();
		res.setBasename("/WEB-INF/properties/error_message");
		return res;
	}
	*/
}
