package kr.co.softsoldesk.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.annotation.SessionScope;

import kr.co.softsoldesk.Beans.UserBean;

@Configuration
public class RootAppContext {
//������Ʈ �۾� �� ����� bean�� �����ϴ� Ŭ����
	
	@Bean("loginUserBean")
	@SessionScope
	public UserBean loginUserBean() {
	    return new UserBean();
	}
	
}
