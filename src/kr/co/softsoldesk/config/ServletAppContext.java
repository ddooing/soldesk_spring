package kr.co.softsoldesk.config;

import java.util.concurrent.TimeUnit;

import javax.annotation.Resource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperFactoryBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.http.CacheControl;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.intercepter.TopMenuInterceptor;
import kr.co.softsoldesk.mapper.AdminContentsMapper;
import kr.co.softsoldesk.mapper.AdminExhibitionMapper;
import kr.co.softsoldesk.mapper.AdminMapper;
import kr.co.softsoldesk.mapper.AdminUserMapper;
import kr.co.softsoldesk.mapper.BannerMapper;
import kr.co.softsoldesk.mapper.BoardMapper;
import kr.co.softsoldesk.mapper.BookMarkMapper;
import kr.co.softsoldesk.mapper.ExhibitionMapper;
import kr.co.softsoldesk.mapper.MyPageMapper;
import kr.co.softsoldesk.mapper.PointDetailMapper;
import kr.co.softsoldesk.mapper.ReserveMapper;
import kr.co.softsoldesk.mapper.ReviewMapper;
import kr.co.softsoldesk.mapper.UserMapper;

@Configuration
@EnableWebMvc // ��ĵ�� ��Ű�� ������ Ŭ���� �� Controller ������̼��� ������ �ִ� Ŭ��������
				// Controller�� ���
@ComponentScan("kr.co.softsoldesk.controller")
@ComponentScan("kr.co.softsoldesk.dao")
@ComponentScan("kr.co.softsoldesk.Service")
@PropertySource("/WEB-INF/properties/db.properties")
public class ServletAppContext implements WebMvcConfigurer {
//Spring MVC ������Ʈ�� ���õ� ������ �ϴ� Ŭ����

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

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// ���� ���� ��� ����
		WebMvcConfigurer.super.addResourceHandlers(registry);
		registry.addResourceHandler("/**").addResourceLocations("/WEB-INF/resources/")
		.setCacheControl(CacheControl.maxAge(10, TimeUnit.MINUTES));
	}

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		// Controller�� �޼��尡 ��ȯ�ϴ� ���� �յڿ� ����� Ȯ���� �߰�
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
		SqlSessionFactory factory = factoryBean.getObject();

		return factory;
	}

	@Bean // 유저 매퍼
	public MapperFactoryBean<UserMapper> getUserMapper(SqlSessionFactory factory) throws Exception {

		MapperFactoryBean<UserMapper> factoryBean = new MapperFactoryBean<UserMapper>(UserMapper.class);

		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;

	}

	@Bean // 유저 매퍼
	public MapperFactoryBean<AdminMapper> getAdminMapper(SqlSessionFactory factory) throws Exception {

		MapperFactoryBean<AdminMapper> factoryBean = new MapperFactoryBean<AdminMapper>(AdminMapper.class);

		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;

	}

	@Bean // 보드 매퍼
	public MapperFactoryBean<BoardMapper> getBoardMapper(SqlSessionFactory factory) throws Exception {

		MapperFactoryBean<BoardMapper> factoryBean = new MapperFactoryBean<BoardMapper>(BoardMapper.class);

		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;

	}

	@Bean // 소감문 매퍼
	public MapperFactoryBean<ReviewMapper> getReviewMapper(SqlSessionFactory factory) throws Exception {

		MapperFactoryBean<ReviewMapper> factoryBean = new MapperFactoryBean<ReviewMapper>(ReviewMapper.class);

		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;

	}

	@Bean // 전시회 매퍼
	public MapperFactoryBean<ExhibitionMapper> getExhibitionMapper(SqlSessionFactory factory) throws Exception {

		MapperFactoryBean<ExhibitionMapper> factoryBean = new MapperFactoryBean<ExhibitionMapper>(
				ExhibitionMapper.class);

		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;

	}
	
	@Bean // 어드민 전시회 매퍼
	public MapperFactoryBean<AdminExhibitionMapper> getAdminExhibitionMapper(SqlSessionFactory factory) throws Exception {

		MapperFactoryBean<AdminExhibitionMapper> factoryBean = new MapperFactoryBean<AdminExhibitionMapper>(
				AdminExhibitionMapper.class);

		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;

	}
	
	@Bean // 어드민 유저 매퍼
	public MapperFactoryBean<AdminUserMapper> getAdminUserMapper(SqlSessionFactory factory) throws Exception {

		MapperFactoryBean<AdminUserMapper> factoryBean = new MapperFactoryBean<AdminUserMapper>(
				AdminUserMapper.class);

		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;

	}

	@Bean // 전시회 매퍼
	public MapperFactoryBean<MyPageMapper> getMypageMapper(SqlSessionFactory factory) throws Exception {

		MapperFactoryBean<MyPageMapper> factoryBean = new MapperFactoryBean<MyPageMapper>(MyPageMapper.class);

		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;

	}

	@Bean // 북마크 매퍼
	public MapperFactoryBean<BookMarkMapper> getBookmarkMapper(SqlSessionFactory factory) throws Exception {

		MapperFactoryBean<BookMarkMapper> factoryBean = new MapperFactoryBean<BookMarkMapper>(BookMarkMapper.class);

		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;

	}

	@Bean // 예약 매퍼
	public MapperFactoryBean<ReserveMapper> getReserveMapper(SqlSessionFactory factory) throws Exception {

		MapperFactoryBean<ReserveMapper> factoryBean = new MapperFactoryBean<ReserveMapper>(ReserveMapper.class);

		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;

	}

	@Bean // 어드민 콘텐츠 매퍼
	public MapperFactoryBean<AdminContentsMapper> getAdminContentsMapper(SqlSessionFactory factory) throws Exception {

		MapperFactoryBean<AdminContentsMapper> factoryBean = new MapperFactoryBean<AdminContentsMapper>(
				AdminContentsMapper.class);

		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;

	}

	@Bean // 포인트디테일 매퍼
	public MapperFactoryBean<PointDetailMapper> getpointDetailMapper(SqlSessionFactory factory) throws Exception {

		MapperFactoryBean<PointDetailMapper> factoryBean = new MapperFactoryBean<PointDetailMapper>(
				PointDetailMapper.class);

		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;

	}

	@Bean // 배너  매퍼
	public MapperFactoryBean<BannerMapper> getBannerMapper(SqlSessionFactory factory) throws Exception {

		MapperFactoryBean<BannerMapper> factoryBean = new MapperFactoryBean<BannerMapper>(
				BannerMapper.class);

		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;

	}
	@Bean
	public static PropertySourcesPlaceholderConfigurer placeholderConfigurer() {

		return new PropertySourcesPlaceholderConfigurer();
	}

	// ���� ������Ƽ ������ �޽����� ���
	@Bean
	public ReloadableResourceBundleMessageSource messageSource() {
		ReloadableResourceBundleMessageSource res = new ReloadableResourceBundleMessageSource();
		res.setBasename("/WEB-INF/properties/error_message");
		res.setDefaultEncoding("UTF-8");
		return res;
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		TopMenuInterceptor topMenuInterceptor = new TopMenuInterceptor(loginUserBean);

		InterceptorRegistration reg1 = registry.addInterceptor(topMenuInterceptor);
		reg1.addPathPatterns("/**");

	}

	@Bean // �뒪�봽留곸뿉�꽌 �뙆�씪 泥섎━ �븷 �닔 �엳�뒗 硫붿냼�뱶
	public StandardServletMultipartResolver multipartResolver() {

		return new StandardServletMultipartResolver();
	}

}
