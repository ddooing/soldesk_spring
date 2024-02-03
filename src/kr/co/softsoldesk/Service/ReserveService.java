package kr.co.softsoldesk.Service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.Beans.ReserveBean;
import kr.co.softsoldesk.Beans.UserBean;
import kr.co.softsoldesk.dao.ReserveDao;

@Service
public class ReserveService {
	
	@Autowired
	private ReserveDao reserveDao;
	
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;

	/*
	public ReserveBean reserveTicket(ReserveBean tempReserveBean, UserBean loginUserBean, ExhibitionBean exhibitioninfoBean) {
		
		return reserveDao.reserveTicket(tempReserveBean, loginUserBean, exhibitioninfoBean);
	}
	*/
	
	// 전시회 상세 페이지에서 예약하기 버튼 클릭
	public ReserveBean reservebtn_click(ReserveBean tempReserveBean) {
		
		 return tempReserveBean;
	}
	
	public boolean point_use(int current_point, int point_deduction) {	// point 사용자 보유 포인트 use_point 사용 point
		
		if(current_point>=point_deduction) {
			return true;
		} else {
			return false;
		}
		
	}
	/*
	public void reserve_ing(ReserveBean ReserveBean) {
		
		 reserveDao.reserve_ing(ReserveBean);
	}
	
	
	public void reserveAfterExhibitionCntIncrease(int ticket_count, int exhibition_id) {
		reserveDao.reserveAfterExhibitionCntIncrease(ticket_count,exhibition_id);
	}
	*/
	// /checkout 에 대한 예매 정보 저장
	public void checkoutReserveInfo(ReserveBean checkoutReserveBean)
	{
		reserveDao.checkoutReserveInfo(checkoutReserveBean);
	}
	
	// 인증 결과인 orderId가  결제 요청전의 order_id인지 체크 
	public boolean checkOrderId(String orderId) {
		return reserveDao.checkOrderId(orderId);
	}
	
	//orderid 통해서 payment 가져오기 
	public int getPayment(String orderId)
	{
		return reserveDao.getPayment(orderId);
	}
}
