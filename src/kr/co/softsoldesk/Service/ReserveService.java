package kr.co.softsoldesk.Service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.Beans.PageBean;
import kr.co.softsoldesk.Beans.ReserveBean;
import kr.co.softsoldesk.dao.ReserveDao;

@Service
public class ReserveService {
	
	@Autowired
	private ReserveDao reserveDao;
	

	@Value("${admin.listcnt}")
	private int admin_listcnt;
	
	@Value("${admin.paginationcnt}")
	private int admin_paginationcnt;
	
	
	// /checkout 에 대한 예매 정보 저장
	public void checkoutReserveInfo(ReserveBean checkoutReserveBean)
	{
		reserveDao.checkoutReserveInfo(checkoutReserveBean);
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

	/*
	public List<ReserveBean> getReserveList()
	{
		return reserveDao.getReserveList();
	}
	*/
	
	//첫 결제 내역 날짜 받기
	public String getFirstPayDate()
	{
		return reserveDao.getFirstPayDate();
	}
	
	//총 개수 반환
	public PageBean getReserveListCnt(String startDate,String endDate,String payment_method,String exhibition_title,String user_name,int currentPage)
	{
		int searchautor_Cnt=  reserveDao.getReserveListCnt(startDate,endDate,payment_method,exhibition_title,user_name);
		System.out.println("서비스 searchautor_Cnt : "+searchautor_Cnt);
		PageBean pageBean = new PageBean(searchautor_Cnt, currentPage, admin_listcnt, admin_paginationcnt);
		System.out.println("pageBean min : "+pageBean.getMin());
		System.out.println("pageBean CurrentPage : "+pageBean.getCurrentPage());
		System.out.println("pageBean max : "+pageBean.getMax());
		System.out.println("pageBean cnt : "+pageBean.getPageCnt());
		
		System.out.println("pageBean prePage : "+pageBean.getPrevPage());
		System.out.println("pageBean nextPage : "+pageBean.getNextPage());
		return pageBean;
	}
	
	public List<ReserveBean> getReserveList(String startDate,String endDate,String payment_method,String exhibition_title,String user_name, int page)
	{
		int start = (page - 1) * admin_listcnt;
		RowBounds rowBounds = new RowBounds(start, admin_listcnt);
		return reserveDao.getReserveList(startDate,endDate,payment_method,exhibition_title,user_name,rowBounds);
	}
	
	//0216 
	//관리자 취소
	public ReserveBean getCancelList(int reserve_id ) {
		return reserveDao.getCancelList(reserve_id);
	}
    
	//결제 상태 취소로 변경
	public void updatePaymentCancle(int reserve_id )
	{
		reserveDao.updatePaymentCancle(reserve_id);
	}
}