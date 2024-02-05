package kr.co.softsoldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.Beans.ReserveBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.mapper.MyPageMapper;

@Repository
public class MyPageDao {

	@Autowired
	private MyPageMapper myPageMapper;
	
	// 마이페이지 상단 info 창용
	public UserBean getMyPageTopInfo(int user_id) {
		return myPageMapper.getMyPageTopInfo(user_id);
	}
	
	// 마이페이지 결제 내역 조회 메소드
	public List<ReserveBean> getMyPageReserveList(int user_id) {
		return myPageMapper.getMyPageReserveList(user_id);
	}
	
	
	
}
