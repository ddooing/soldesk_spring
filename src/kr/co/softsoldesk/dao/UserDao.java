package kr.co.softsoldesk.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.mapper.UserMapper;

@Repository
public class UserDao {
	
	@Autowired
	private UserMapper userMapper;
	
	// 로그인 시에 최소 정보 가져옴 (세션객체)
	public UserBean getLoginUserInfo(UserBean tempLoginUserBean) {
		
		System.out.println("userid"+tempLoginUserBean.getName());
		return userMapper.getLoginUserInfo(tempLoginUserBean);
		
	}
	
	// 세션객체에서 가져온 user_id 값을 가지고 로그인 된 모든 정보를 가져옴
	public UserBean getLoginUserAllInfo(int user_id) {
		
		return userMapper.getLoginUserAllInfo(user_id);
	}
}
