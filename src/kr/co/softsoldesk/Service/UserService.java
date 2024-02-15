package kr.co.softsoldesk.Service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.Beans.PageBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.dao.UserDao;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;

	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;

	@Value("${admin.listcnt}")
	private int admin_listcnt;

	@Value("${admin.paginationcnt}")
	private int admin_paginationcnt;

	// 세션 로그인 객체
	public void getLoginUserInfo(UserBean tempLoginUserBean) {
		UserBean tempLoginUserBean2 = userDao.getLoginUserInfo(tempLoginUserBean);

		if (tempLoginUserBean2 != null) { // 로그인된 객체 user_id값, id, password 정보 저장
			loginUserBean.setUser_id(tempLoginUserBean2.getUser_id());
			loginUserBean.setId(tempLoginUserBean2.getId());
			loginUserBean.setPassword(tempLoginUserBean2.getPassword());
			loginUserBean.setState(tempLoginUserBean2.getState());

			loginUserBean.setUserLogin(true); // 로그인 성공 시 userLogin을 true로 설정
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

	// ================================================
	// 재호부분

	public boolean checkIdExist(String id) {

		String name = userDao.checkIdExist(id);

		if (name == null) {
			return true;
		} else {
			return false;
		}
	}

	public boolean checkNickExist(String nickname) {

		String name = userDao.checkNickExist(nickname);

		if (name == null) {
			return true;
		} else {
			return false;
		}

	}

	public void addUserInfo(UserBean joinUserBean) {

		userDao.addUserInfo(joinUserBean);
	}

	// --------------------
	public void getModifyUserInfo(UserBean modifyUserBean) {

		UserBean tempModifyUserBean = userDao.getModifyUserInfo(loginUserBean.getUser_id());

		modifyUserBean.setId(tempModifyUserBean.getId());
		modifyUserBean.setName(tempModifyUserBean.getName());
		modifyUserBean.setUser_id(tempModifyUserBean.getUser_id());
		modifyUserBean.setPassword(tempModifyUserBean.getPassword());
	}

	public void ModifyUserInfo(UserBean modifyUserBean) {
		modifyUserBean.setUser_id(loginUserBean.getUser_id());
		userDao.modifyUserInfo(modifyUserBean);
	}

	// -----------------------
	public void DeleteUserInfo(UserBean deleteUserBean) {
		deleteUserBean.setUser_id(loginUserBean.getUser_id());
		userDao.deleteUserInfo(deleteUserBean);
	}

	

}
