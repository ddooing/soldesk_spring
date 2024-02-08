package kr.co.softsoldesk.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.mapper.UserMapper;

@Repository
public class UserDao {

	@Autowired
	private UserMapper userMapper;

	// ======================================
	// 승찬부분

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

	// ========================================================
	// 재호 부분
	public String checkIdExist(String id) {

		return userMapper.checkIdExist(id);
	}

	public String checkNickExist(String nickname) {

		return userMapper.checkNickExist(nickname);
	}

	public void addUserInfo(UserBean joinUserBean) {

		userMapper.addUserInfo(joinUserBean);
	}

	public UserBean getModifyUserInfo(int user_id) {

		return userMapper.getModifyUserInfo(user_id);

	}

	public void modifyUserInfo(UserBean modifyUserBean) {
		userMapper.modifyUserInfo(modifyUserBean);
	}

	public void deleteUserInfo(UserBean deleteUserBean) {
		userMapper.deleteUserInfo(deleteUserBean);
	}
	// -------------------------

	public List<UserBean> getUserList(RowBounds rowBounds) {
		return userMapper.getUserList(rowBounds);
	}

	// 사용자 관리 페이징처리
	public int getAccountCnt() {
		return userMapper.getAccountCnt();
	}

	public List<UserBean> getNickSearchList(UserBean searchUserBean, RowBounds rowBounds) {
		return userMapper.getNickSearchList(searchUserBean, rowBounds);
	}

	// 사용자 관리 닉네임 검색 페이징처리
	public int getNickSearchCnt(String keyword) {
		return userMapper.getNickSearchCnt(keyword);
	}

	public List<UserBean> getIdSearchList(UserBean searchUserBean, RowBounds rowBounds) {
		return userMapper.getIdSearchList(searchUserBean, rowBounds);
	}

	// 사용자관리 아이디 검색 페이징 처리
	public int getIdSearchCnt(String keyword) {
		return userMapper.getIdSearchCnt(keyword);
	}

	public List<UserBean> getEmailSearchList(UserBean searchUserBean, RowBounds rowBounds) {
		return userMapper.getEmailSearchList(searchUserBean, rowBounds);
	}

	public int getEmailSearchCnt(String keyword) {
		return userMapper.getEmailSearchCnt(keyword);
	}

	public int deleteAdminUserInfo(int user_id) {
		return userMapper.deleteAdminUserInfo(user_id);
	}

	public UserBean getAdminModifyInfo(int user_id) {
		return userMapper.getAdminModifyInfo(user_id);
	}

	public void AdminModifyInfo(UserBean acModifyBean) {
		userMapper.AdminModifyInfo(acModifyBean);
	}

}
