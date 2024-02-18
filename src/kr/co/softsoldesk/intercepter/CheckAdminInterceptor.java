package kr.co.softsoldesk.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.softsoldesk.Beans.UserBean;

public class CheckAdminInterceptor implements HandlerInterceptor{
	
	private UserBean loginUserBean;
	
	public CheckAdminInterceptor(UserBean loginUserBean) {
		this.loginUserBean = loginUserBean;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		if(loginUserBean.getState() != 3 || loginUserBean.isUserLogin() == false) {
			
			String contextPath = request.getContextPath();
			response.sendRedirect(contextPath+"/user/not_admin");
		}
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
}
