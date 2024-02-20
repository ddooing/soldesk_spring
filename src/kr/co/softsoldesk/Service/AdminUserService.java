package kr.co.softsoldesk.Service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.Beans.PageBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.dao.AdminUserDao;


@Service
public class AdminUserService {
	
	@Autowired
	private AdminUserDao adminUserDao;
	
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;

	@Value("${admin.listcnt}")
	private int admin_listcnt;

	@Value("${admin.paginationcnt}")
	private int admin_paginationcnt;
	
	public List<UserBean> getUserList(int page) {

		int start = (page - 1) * admin_listcnt;
		RowBounds rowBounds = new RowBounds(start, admin_listcnt);

		return adminUserDao.getUserList(rowBounds);
	}

	// 사용자 관리 페이징 처리
	public PageBean getAccountCnt(int currentPage) {

		int Account_Cnt = adminUserDao.getAccountCnt();
		PageBean pageBean = new PageBean(Account_Cnt, currentPage, admin_listcnt, admin_paginationcnt);

		return pageBean;

	}

	public List<UserBean> getNickSearchList(UserBean searchUserBean, int page) {

		int start = (page - 1) * admin_listcnt;
		RowBounds rowBounds = new RowBounds(start, admin_listcnt);

		return adminUserDao.getNickSearchList(searchUserBean, rowBounds);
	}

	public PageBean getNickSearchCnt(String keyword, int currentPage) {

		int nick_Cnt = adminUserDao.getNickSearchCnt(keyword);
		PageBean pageBean = new PageBean(nick_Cnt, currentPage, admin_listcnt, admin_paginationcnt);

		return pageBean;
	}

	public List<UserBean> getIdSearchList(UserBean searchUserBean, int page) {

		int start = (page - 1) * admin_listcnt;
		RowBounds rowBounds = new RowBounds(start, admin_listcnt);

		return adminUserDao.getIdSearchList(searchUserBean, rowBounds);
	}

	public PageBean getIdSearchCnt(String keyword, int currentPage) {

		int id_Cnt = adminUserDao.getIdSearchCnt(keyword);
		PageBean pageBean = new PageBean(id_Cnt, currentPage, admin_listcnt, admin_paginationcnt);

		return pageBean;
	}

	public List<UserBean> getEmailSearchList(UserBean searchUserBean, int page) {

		int start = (page - 1) * admin_listcnt;
		RowBounds rowBounds = new RowBounds(start, admin_listcnt);

		return adminUserDao.getEmailSearchList(searchUserBean, rowBounds);
	}

	public PageBean getEamilSearchCnt(String keyword, int currentPage) {
		int email_Cnt = adminUserDao.getEmailSearchCnt(keyword);
		PageBean pageBean = new PageBean(email_Cnt, currentPage, admin_listcnt, admin_paginationcnt);

		return pageBean;
	}

	public int deleteAdminUserInfo(int user_id) {
		return adminUserDao.deleteAdminUserInfo(user_id);
	}

	public UserBean getAdminModifyBean(int user_id) {
		return adminUserDao.getAdminModifyInfo(user_id);
	}

	public void AdminModifyBean(UserBean acModifyBean) {
		adminUserDao.AdminModifyInfo(acModifyBean);
	}
	
	// count 가져가기
	public UserBean getUserCountInfo(int user_id) {
		return adminUserDao.getUserCountInfo(user_id);
	}

}
