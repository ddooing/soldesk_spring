package kr.co.softsoldesk.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.Beans.ReserveBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.dao.MyPageDao;

@Service
public class MyPageService {

	@Autowired
	private MyPageDao myPageDao;
	
	// 마이페이지용 상단 Info창
	public UserBean getMyPageTopInfo(int user_id) {
		return myPageDao.getMyPageTopInfo(user_id);
	}
	
	// 마이페이지 예약 조회 리스트
	public List<ReserveBean> getMyPageReserveList(int user_id) {
		return myPageDao.getMyPageReserveList(user_id);
	}
	
	
	
	
}
