package kr.co.softsoldesk.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.Beans.ReserveBean;
import kr.co.softsoldesk.mapper.ReserveMapper;

@Repository
public class ReserveDao {

	@Autowired
	private ReserveMapper reserveMapper;
	
	/*
	public ReserveBean reserveTicket(ReserveBean tempReserveBean, UserBean loginUserBean, ExhibitionBean exhibitioninfoBean) {
		
		return reserveMapper.reserveTicket(tempReserveBean, loginUserBean, exhibitioninfoBean);
		
	}
	*/
	
	/*
	public void reserve_ing(ReserveBean ReserveBean) {
		 reserveMapper.reserve_ing(ReserveBean);
	}
	
	public void reserveAfterExhibitionCntIncrease(int ticket_count, int exhibition_id) {
		reserveMapper.reserveAfterExhibitionCntIncrease(ticket_count, exhibition_id);
	}
	*/
	
	
	public void checkoutReserveInfo(ReserveBean checkoutReserveBean ) {
		reserveMapper.checkoutReserveInfo(checkoutReserveBean);
	}
	
	public boolean checkOrderId(String orderId) {
		return reserveMapper.checkOrderId(orderId);
	}
	
	
	public int getPayment(String orderId) {
		return reserveMapper.getPayment(orderId);
	}
}
