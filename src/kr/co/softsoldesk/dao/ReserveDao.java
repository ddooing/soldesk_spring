package kr.co.softsoldesk.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.Beans.ReserveBean;
import kr.co.softsoldesk.mapper.ReserveMapper;

@Repository
public class ReserveDao {

	@Autowired
	private ReserveMapper reserveMapper;
	

	
	public void checkoutReserveInfo(ReserveBean checkoutReserveBean ) {
		reserveMapper.checkoutReserveInfo(checkoutReserveBean);
	}
	
	public String  checkOrderId(String orderId) {
		return reserveMapper.checkOrderId(orderId);
	}
	
	
	public ReserveBean validcheckOrderId(String orderId){
		
		return reserveMapper.validcheckOrderId(orderId);
	}
	/*
	public int getPayment(String orderId) {
		return reserveMapper.getPayment(orderId);
	}*/
	
	public void approvalBefore(String orderId,String paymentKey)
	{
		 reserveMapper.approvalBefore(orderId,paymentKey);
	}
	
	public void realReserveState(String orderId,String requestedAt,String approvedAt,String method)
	{
		reserveMapper.realReserveState(orderId,requestedAt,approvedAt,method);
	}
	
	//-------------
	//payment가 0원 일 경우, 예매 정보 저장 
	public void paymentZeroReserveInfo(ReserveBean reserveInfo )
	{
		reserveMapper.paymentZeroReserveInfo(reserveInfo);
	}
	
	
}
