package kr.co.softsoldesk.Service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.ReserveBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.dao.ReserveDao;

@Service
public class ReserveService {

	@Autowired
	private ReserveDao reserveDao;

	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;

	// 전시회 상세 페이지에서 예약하기 버튼 클릭
	public ReserveBean reservebtn_click(ReserveBean tempReserveBean) {
		return tempReserveBean;
	}

	public void reserve_ing(ReserveBean ReserveBean) {

		reserveDao.reserve_ing(ReserveBean);
	}

	public void reserveAfterExhibitionCntIncrease(int ticket_count, int exhibition_id) {
		reserveDao.reserveAfterExhibitionCntIncrease(ticket_count, exhibition_id);
	}

	
	public ReserveBean getReserve_idForMakeReview(String order_id) {
		return reserveDao.getReserve_idForMakeReview(order_id);
	}
}
