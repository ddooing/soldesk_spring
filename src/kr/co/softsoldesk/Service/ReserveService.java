package kr.co.softsoldesk.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.Beans.ReserveBean;
import kr.co.softsoldesk.dao.ReserveDao;

@Service
public class ReserveService {
	
	@Autowired
	private ReserveDao reserveDao;
	

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
	
	//pay_approval_state : 승인 상태 true로 update &  paymentKey 저장 
	public void approvalBefore(String orderId,String paymentKey)
	{
		 reserveDao.approvalBefore(orderId,paymentKey);
	}
	
	// 정말로 결제되었음 - pay_state 결제 상태 :true 로 update &  state(0:예매,1: 예매 취소) 예매가 되었음을 0으로 저장
	public void realReserveState(String orderId, String requestedAt,String approvedAt,String method )
	{
		reserveDao.realReserveState(orderId,requestedAt,approvedAt,method);
	}
	

	//payment가 0원 일 경우, 예매 정보 저장 
	public void paymentZeroReserveInfo(ReserveBean reserveInfo )
	{
		reserveDao.paymentZeroReserveInfo(reserveInfo);
	}



	
	
	
    
}
