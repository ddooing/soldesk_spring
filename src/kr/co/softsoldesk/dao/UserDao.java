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
		
		return userMapper.getLoginUserInfo(tempLoginUserBean);
		
	}
	
	// 세션객체에서 가져온 user_id 값을 가지고 로그인 된 모든 정보를 가져옴
	public UserBean getLoginUserAllInfo(int user_id) {
		
		return userMapper.getLoginUserAllInfo(user_id);
	}
	
	// 유저의 등급 가져오기
	public UserBean getUserGrade(int user_id) {
		return userMapper.getUserGrade(user_id);
	}
	
	// 유저테이블 포인트 적립
	public void UpdatepointPlus(int point, int user_id) {
		userMapper.UpdatepointPlus(point, user_id);
	}
	
	// 유저테이블 포인트 사용
	public void UpdatepointMinus(int point, int user_id) {
		userMapper.UpdatepointMinus(point, user_id);
	}
	
	// 경험치 증가
	public void IncreaseExp(int exp, int user_id) {
		userMapper.IncreaseExp(exp, user_id);
	}
	
	
	
}