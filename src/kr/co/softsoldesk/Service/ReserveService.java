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
	
	// /checkout 에 대한 예매 정보 저장
	public void checkoutReserveInfo(ReserveBean checkoutReserveBean)
	{
		reserveDao.checkoutReserveInfo(checkoutReserveBean);
	}
	
	// 인증 결과인 orderId가  결제 요청전의 order_id인지 체크 
	public String  checkOrderId(String orderId) {
		return reserveDao.checkOrderId(orderId);
	}
	
	public ReserveBean validcheckOrderId(String orderId){
		
		return reserveDao.validcheckOrderId(orderId);
	}
	
	//orderid 통해서 payment 가져오기 
	public int getPayment(String orderId)
	{
		return reserveDao.getPayment(orderId);
	}
	
	//pay_approval_state : 승인 상태 true로 update &  paymentKey 저장 
	public void approvalBefore(String orderId,String paymentKey)
	{
		 reserveDao.approvalBefore(orderId,paymentKey);
	}
	
	// 정말로 결제되었음 - pay_state 결제 상태 :true 로 update &  state(0:예매,1: 예매 취소) 예매가 되었음을 0으로 저장
	public void realReserveState(String orderId )
	{
		reserveDao.realReserveState(orderId);
	}
	
	
	
	//-------------------
	
	//payment가 0원 일 경우, 예매 정보 저장 
	public void paymentZeroReserveInfo(ReserveBean reserveInfo )
	{
		reserveDao.paymentZeroReserveInfo(reserveInfo);
	}



	
	
	
    
}
