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
            
            System.out.println(loginUserBean.getUser_id());
            
            loginUserBean.setUserLogin(true); // 로그인 성공 시 userLogin을 true로 설정

            System.out.println(loginUserBean.isUserLogin()); // 이 부분에서 로그인 상태 확인
        } 
    }
	
	// 로그인 된 모든 정보 가져옴
	public UserBean getLoginUserAllInfo(int user_id) {
		
		return userDao.getLoginUserAllInfo(user_id);
	}
	
	// 유저의 등급 가져오기
	public UserBean getUserGrade(int user_id) {
		return userDao.getUserGrade(user_id);
	}
	
	// 유저테이블 포인트 적립
	public void UpdatepointPlus(int point, int user_id) {
		userDao.UpdatepointPlus(point, user_id);
	}
	
	// 유저테이블 포인트 사용
	public void UpdatepointMinus(int point, int user_id) {
		userDao.UpdatepointMinus(point, user_id);
	}
	
	// 경험치 증가
	public void IncreaseExp(int exp, int user_id) {
		userDao.IncreaseExp(exp, user_id);
	}
	
}
