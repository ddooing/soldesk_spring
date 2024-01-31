package kr.co.softsoldesk.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.mapper.UserMapper;

@Repository
public class UserDao {
	
	@Autowired
	private UserMapper userMapper;
	
	
	public UserBean getLoginUserInfo(UserBean tempLoginUserBean) {
		
		return userMapper.getLoginUserInfo(tempLoginUserBean);
		
	}
	
}
