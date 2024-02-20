package kr.co.softsoldesk.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.mapper.AdminUserMapper;


@Repository
public class AdminUserDao {
	
	@Autowired
	private AdminUserMapper adminUserMapper;
	
	// -------------------------

		public List<UserBean> getUserList(RowBounds rowBounds) {
			return adminUserMapper.getUserList(rowBounds);
		}

		// 사용자 관리 페이징처리
		public int getAccountCnt() {
			return adminUserMapper.getAccountCnt();
		}

		public List<UserBean> getNickSearchList(UserBean searchUserBean, RowBounds rowBounds) {
			return adminUserMapper.getNickSearchList(searchUserBean, rowBounds);
		}

		// 사용자 관리 닉네임 검색 페이징처리
		public int getNickSearchCnt(String keyword) {
			return adminUserMapper.getNickSearchCnt(keyword);
		}

		public List<UserBean> getIdSearchList(UserBean searchUserBean, RowBounds rowBounds) {
			return adminUserMapper.getIdSearchList(searchUserBean, rowBounds);
		}

		// 사용자관리 아이디 검색 페이징 처리
		public int getIdSearchCnt(String keyword) {
			return adminUserMapper.getIdSearchCnt(keyword);
		}

		public List<UserBean> getEmailSearchList(UserBean searchUserBean, RowBounds rowBounds) {
			return adminUserMapper.getEmailSearchList(searchUserBean, rowBounds);
		}

		public int getEmailSearchCnt(String keyword) {
			return adminUserMapper.getEmailSearchCnt(keyword);
		}

		public int deleteAdminUserInfo(int user_id) {
			return adminUserMapper.deleteAdminUserInfo(user_id);
		}

		public UserBean getAdminModifyInfo(int user_id) {
			return adminUserMapper.getAdminModifyInfo(user_id);
		}

		public void AdminModifyInfo(UserBean acModifyBean) {
			adminUserMapper.AdminModifyInfo(acModifyBean);
		}

		// count 가져가기
		public UserBean getUserCountInfo(int user_id) {
			return adminUserMapper.getUserCountInfo(user_id);
		}
}
