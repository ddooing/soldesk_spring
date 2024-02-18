package kr.co.softsoldesk.config;

import javax.annotation.Resource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.Service.BoardService;
import kr.co.softsoldesk.intercepter.CheckLoginInterceptor;
import kr.co.softsoldesk.intercepter.CheckWriterInterceptor;
import kr.co.softsoldesk.intercepter.TopMenuInterceptor;
import kr.co.softsoldesk.mapper.AdminContentsMapper;
import kr.co.softsoldesk.mapper.BoardMapper;
import kr.co.softsoldesk.mapper.ExhibitionMapper;
import kr.co.softsoldesk.mapper.NoticeMapper;
import kr.co.softsoldesk.mapper.UserMapper;

@Configuration
@EnableWebMvc //스캔한 패키지 내부의 클래스 중 Controller 어노테이션을 가지고 있는 클래스 들을 Controller로 등록
@ComponentScan("kr.co.softsoldesk.controller")
@ComponentScan("kr.co.softsoldesk.dao")
@ComponentScan("kr.co.softsoldesk.Service")
@PropertySource("/WEB-INF/properties/db.properties")
public class ServletAppContext implements WebMvcConfigurer {
	//Spring MVC 프로젝트에 관련된 설정을 하는 클래스

	@Value("${db.classname}")
	private String db_classname;

	@Value("${db.url}")
	private String db_url;

	@Value("${db.username}")
	private String db_username;

	@Value("${db.password}")
	private String db_password;

	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;

	@Autowired
	private BoardService boardService;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		//정적 파일 경로 매핑
		WebMvcConfigurer.super.addResourceHandlers(registry);
		registry.addResourceHandler("/**").addResourceLocations("/WEB-INF/resources/");
		// registry.addResourceHandler("/**").addResourceLocations("/WEB-INF/assets/");
	}

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		//Controller의 메서드가 반환하는 파일 앞뒤에 경로와 확장자 추가
		WebMvcConfigurer.super.configureViewResolvers(registry);
		registry.jsp("/WEB-INF/views/", ".jsp");
	}

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
	public SqlSessionFactory factory(BasicDataSource source) throws Exception {

		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		factoryBean.setDataSource(source);
		//factoryBean.setTypeHandlersPackage("kr.co.softsoldesk.typehandler"); // TypeHandler가 위치한 패키지를 설정
		SqlSessionFactory factory = factoryBean.getObject();

		return factory;
	}
	
	@Bean		// 전시회 조회 
	public MapperFactoryBean<UserMapper> getUserMapper(SqlSessionFactory factory) throws Exception {

		MapperFactoryBean<UserMapper> factoryBean = new MapperFactoryBean<UserMapper>(UserMapper.class);

		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;

	}


	@Bean
	public MapperFactoryBean<BoardMapper> getBoardMapper(SqlSessionFactory factory) throws Exception {
	    // MapperFactoryBean 객체를 생성합니다. 이 객체는 MyBatis의 SQL 매핑을 담당합니다.
	    // BoardMapper 클래스를 이용하여 객체를 생성하고, SqlSessionFactory를 설정합니다.
	    MapperFactoryBean<BoardMapper> factoryBean = new MapperFactoryBean<BoardMapper>(BoardMapper.class);
	    factoryBean.setSqlSessionFactory(factory);
	    return factoryBean; // 생성한 MapperFactoryBean 객체를 반환합니다.
	}
	
	@Bean
	public MapperFactoryBean<AdminContentsMapper> getAdminContentsMapper(SqlSessionFactory factory) throws Exception {
	    // MapperFactoryBean 객체를 생성합니다. 이 객체는 MyBatis의 SQL 매핑을 담당합니다.
	    // BoardMapper 클래스를 이용하여 객체를 생성하고, SqlSessionFactory를 설정합니다.
	    MapperFactoryBean<AdminContentsMapper> factoryBean = new MapperFactoryBean<AdminContentsMapper>(AdminContentsMapper.class);
	    factoryBean.setSqlSessionFactory(factory);
	    return factoryBean; // 생성한 MapperFactoryBean 객체를 반환합니다.
	}
	
	@Bean
	public MapperFactoryBean<NoticeMapper> getNoticeMapper(SqlSessionFactory factory) throws Exception {
	    // MapperFactoryBean 객체를 생성합니다. 이 객체는 MyBatis의 SQL 매핑을 담당합니다.
	    // NoticeMapper 클래스를 이용하여 객체를 생성하고, SqlSessionFactory를 설정합니다.
	    MapperFactoryBean<NoticeMapper> factoryBean = new MapperFactoryBean<NoticeMapper>(NoticeMapper.class);
	    factoryBean.setSqlSessionFactory(factory);
	    return factoryBean; // 생성한 MapperFactoryBean 객체를 반환합니다.
	}
	
	@Bean		// 전시회 조회 
	public MapperFactoryBean<ExhibitionMapper> getExhibitionMapper(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<ExhibitionMapper> factoryBean = new MapperFactoryBean<ExhibitionMapper>(ExhibitionMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	
	

	@Bean
	public static PropertySourcesPlaceholderConfigurer placeholderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}

	// 에러메세지
	@Bean
	public ReloadableResourceBundleMessageSource messageSource() {
		ReloadableResourceBundleMessageSource res = new ReloadableResourceBundleMessageSource();
		res.setBasename("/WEB-INF/properties/error_message");
		return res;
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
	    TopMenuInterceptor topMenuInterceptor = new TopMenuInterceptor(loginUserBean);
	    CheckWriterInterceptor checkWriterInterceptor = new CheckWriterInterceptor(loginUserBean, boardService);
	    CheckLoginInterceptor checkLoginInterceptor = new CheckLoginInterceptor(loginUserBean);
	    
	    InterceptorRegistration reg1 = registry.addInterceptor(topMenuInterceptor);
	    reg1.addPathPatterns("/**");
	    
	    InterceptorRegistration reg2 = registry.addInterceptor(checkWriterInterceptor);
	    reg2.addPathPatterns("/board/modify", "/board/delete");
	    
	    InterceptorRegistration reg3 = registry.addInterceptor(checkLoginInterceptor);
	    reg3.addPathPatterns("/board/write");
	    /*
	    InterceptorRegistration reg4 = registry.addInterceptor(checkWriterInterceptor);
	    reg2.addPathPatterns("/comment_s");
	    
	    InterceptorRegistration reg5 = registry.addInterceptor(checkWriterInterceptor);
	    reg2.addPathPatterns("/comment_modify", "/comment_delete");
	     */
	}
	
}