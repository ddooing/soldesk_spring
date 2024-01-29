package kr.co.softsoldesk.Service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.dao.UserDao;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;
	
	public void getLoginUserInfo(UserBean tempLoginUserBean) {
        UserBean tempLoginUserBean2 = userDao.getLoginUserInfo(tempLoginUserBean);

        if (tempLoginUserBean2 != null) {		// 로그인된 객체 모든 정보 저장
        	loginUserBean.setUser_idx(tempLoginUserBean2.getUser_idx());
            loginUserBean.setId(tempLoginUserBean2.getId());
            loginUserBean.setPw(tempLoginUserBean2.getPw());
            
            loginUserBean.setUserLogin(true); // 로그인 성공 시 userLogin을 true로 설정

            System.out.println(loginUserBean.isUserLogin()); // 이 부분에서 로그인 상태 확인
        } 
    }
	
	// 로그인 된 모든 정보 가져옴
	public UserBean getLoginUserAllInfo(int user_idx) {
		
		return userDao.getLoginUserAllInfo(user_idx);
	}
	
}
