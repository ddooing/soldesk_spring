package kr.co.softsoldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.Beans.BannerApplyFormBean;
import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.mapper.BannerMapper;

@Repository
public class BannerDao {
	
	@Autowired
	private BannerMapper bannerMapper;
	// 승연 ```````````````````````````````````````````````
	
	public void insertbanner_apply(BannerApplyFormBean bannerApplyFormBean)
	{
		bannerMapper.insertbanner_apply(bannerApplyFormBean);
	}
	// 배너 신청 시 file 테이블에 저장
	public void addfiletableBanner1(BannerApplyFormBean bannerApplyFormBean) {
		bannerMapper.addfiletableBanner1(bannerApplyFormBean);
	}
	// 전시회 추가 파일테이블에서 file_id 가져오기
	public int getFileId(String name) {
		
		return bannerMapper.getFileId(name); 
	}
	// 배너 신청 페이지
	public List<ExhibitionBean> getApply_personExhibitionlist(int user_id) {
		return bannerMapper.getApply_personExhibitionlist(user_id);
	}
	
	// 1.success 검증 1- orderid 를 통해 체크하기
	public BannerApplyFormBean validcheckOrderId(String orderId) {
		return bannerMapper.validcheckOrderId(orderId);
	}
	
	// 2. 승인 성공 후, 모두 저장 
	 	// tosscontroller 의 approvalBefore 와 realReserveState 를 한번에 처리함

	// 정말로 결제되었음 - pay_state 결제 상태 :true 로 update &  state(0:예매,1: 예매 취소) 예매가 되었음을 0으로 저장
	//pay_approval_state : 승인 상태 true로 update &  paymentKey 저장 
	public void realPaymentState(String orderId, String requestedAt,String approvedAt,String method,String paymentKey )
	{
		bannerMapper.realPaymentState(orderId,requestedAt,approvedAt,method,paymentKey);
	}
	
	//배너 결제 정보 가져오기 
	public BannerApplyFormBean getBannerPaymentInfo(String orderId)
	{
		return bannerMapper.getBannerPaymentInfo(orderId);
	}
}
