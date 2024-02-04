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
	
	// 세션 로그인 객체
	public void getLoginUserInfo(UserBean tempLoginUserBean) {
        UserBean tempLoginUserBean2 = userDao.getLoginUserInfo(tempLoginUserBean);

        if (tempLoginUserBean2 != null) {		// 로그인된 객체 user_id값, id, password 정보 저장
        	loginUserBean.setUser_id(tempLoginUserBean2.getUser_id());
            loginUserBean.setId(tempLoginUserBean2.getId());
            loginUserBean.setPassword(tempLoginUserBean2.getPassword());
            
            System.out.println("로그인한 유저 아이디 : "+loginUserBean.getUser_id());
            
            loginUserBean.setUserLogin(true); // 로그인 성공 시 userLogin을 true로 설정

            System.out.println("로그인 여부 확인 :  "+loginUserBean.isUserLogin()); // 이 부분에서 로그인 상태 확인
        } 
    }
	
	// 로그인 된 모든 정보 가져옴
	public UserBean getLoginUserAllInfo(int user_id) {
		
		return userDao.getLoginUserAllInfo(user_id);
	}
	
	//포인트와 경험치 증가 
	public void point_expIncrease(int user_id,int point)
	{
		userDao.point_expIncrease(user_id,point);
	}
	
	//레벨 가져오기
	public String getLevel(int user_id)
	{
		return userDao.getLevel(user_id);
	}
	
	
	
}
