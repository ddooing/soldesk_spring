package kr.co.softsoldesk.dao;

import java.util.List;

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
	

	
	public ReserveBean validcheckOrderId(String orderId){
		
		return reserveMapper.validcheckOrderId(orderId);
	}

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
	
	/*
	public List<ReserveBean> getReserveList()
	{
		return reserveMapper.getReserveList();
	}
	*/
	
	//첫 결제 내역 날짜 받기
	public String getFirstPayDate()
	{
		return reserveMapper.getFirstPayDate();
	}
	
	public List<ReserveBean> getReserveList(String startDate,String endDate,String payment_method,String exhibition_title,String user_name)
	{
		return reserveMapper.getReserveList(startDate,endDate,payment_method,exhibition_title,user_name);
	}
	//0216 
	//관리자 취소
	public ReserveBean getCancelList(int reserve_id ) {
		return reserveMapper.getCancelList(reserve_id);
	}
	
	//결제 상태 취소로 변경
	public void updatePaymentCancle(int reserve_id )
	{
		reserveMapper.updatePaymentCancle(reserve_id);
	}
	
}