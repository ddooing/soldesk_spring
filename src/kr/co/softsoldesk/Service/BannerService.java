package kr.co.softsoldesk.Service;

import java.io.File;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.softsoldesk.Beans.BannerApplyFormBean;
import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.dao.BannerDao;


@Service
public class BannerService {
	
	@Autowired
	private BannerDao bannerDao;
	
	@Value("${path.mainupload}")
	private String path_mainupload;
	
	@Value("${path.detailupload}")
	private String path_detailupload;
	
	@Value("${path.mainbannerupload}")
	private String path_mainbannerupload;
	
	@Value("${path.subbannerupload}")
	private String path_subbannerupload;
	
	@Value("${admin.listcnt}")
	private int admin_listcnt;
	
	@Value("${admin.paginationcnt}")
	private int admin_paginationcnt;
	
	
	private String saveMainBannerUploadFile(MultipartFile upload_file) {	// 메인 배너 업로드 경로
		
		String file_name = System.currentTimeMillis() + "_" + FilenameUtils.getBaseName(upload_file.getOriginalFilename()) 
						   + "." + FilenameUtils.getExtension(upload_file.getOriginalFilename());
		
		
		// 파일 저장 위치에 저장하기 
		try {
			upload_file.transferTo(new File(path_mainbannerupload+"/"+file_name));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return file_name;
	}
	
	private String saveSubBannerUploadFile(MultipartFile upload_file) {	// 서브 배너 업로드 경로
		
		String file_name = System.currentTimeMillis() + "_" + FilenameUtils.getBaseName(upload_file.getOriginalFilename()) 
						   + "." + FilenameUtils.getExtension(upload_file.getOriginalFilename());
		
		
		// 파일 저장 위치에 저장하기 
		try {
			upload_file.transferTo(new File(path_subbannerupload+"/"+file_name));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return file_name;
	}
	// 메인 배너 신청시 배너 파일 저장
	public void addfiletableBannerBannerApplyFormBean(BannerApplyFormBean bannerApplyFormBean) {
		MultipartFile main_banner_upload_file  = bannerApplyFormBean.getBanner_file();
			
		if(main_banner_upload_file.getSize()>0) {
			String main_banner_file_name = saveMainBannerUploadFile(main_banner_upload_file);
			
			// file_table name, path set
			bannerApplyFormBean.setName(main_banner_file_name);
			bannerApplyFormBean.setPath("/Spring_Project_Dream/img/main_banner/");
				
			// file_table 에 저장
			bannerDao.addfiletableBanner1(bannerApplyFormBean);
				
			// 저장된 파일 file_id bannerApplyFormBean에 set 해줌
			bannerApplyFormBean.setBanner_file_id(bannerDao.getFileId(main_banner_file_name));
		}
	}
	
	// 서브 배너 신청시 배너 파일 저장
		public void addfiletableBannerSubBannerApplyFormBean(BannerApplyFormBean bannerApplyFormBean) {
			MultipartFile main_banner_upload_file  = bannerApplyFormBean.getBanner_file();
				
			if(main_banner_upload_file.getSize()>0) {
				String main_banner_file_name = saveSubBannerUploadFile(main_banner_upload_file);
				
				// file_table name, path set
				bannerApplyFormBean.setName(main_banner_file_name);
				bannerApplyFormBean.setPath("/Spring_Project_Dream/img/sub_banner/");
					
				// file_table 에 저장
				bannerDao.addfiletableBanner1(bannerApplyFormBean);
					
				// 저장된 파일 file_id bannerApplyFormBean에 set 해줌
				bannerApplyFormBean.setBanner_file_id(bannerDao.getFileId(main_banner_file_name));
			}
		}
	
	// 배너 신청시 파일테이블에 파일 저장
	public void addfiletableBanner1(BannerApplyFormBean bannerApplyFormBean) {
		bannerDao.addfiletableBanner1(bannerApplyFormBean);
	}
		
		
	public void insertbanner_apply(BannerApplyFormBean bannerApplyFormBean)
	{
		bannerDao.insertbanner_apply(bannerApplyFormBean);
	}
	// 배너 신청 페이지 신청인이 신청한 전시회 목록 가져가기 (select용)
	public List<ExhibitionBean> getApply_personExhibitionlist(int user_id) {
		return bannerDao.getApply_personExhibitionlist(user_id);
	}
	
	// 1.success 검증 1- orderid 를 통해 체크하기
	public BannerApplyFormBean validcheckOrderId(String orderId) {
		return bannerDao.validcheckOrderId(orderId);
	}
	
	
	
	// 2. 승인 성공 후, 모두 저장 
 	// tosscontroller 의 approvalBefore 와 realReserveState 를 한번에 처리함


	// 정말로 결제되었음 - pay_state 결제 상태 :true 로 update &  state(0:예매,1: 예매 취소) 예매가 되었음을 0으로 저장
	//pay_approval_state : 승인 상태 true로 update &  paymentKey 저장 
	public void realPaymentState(String orderId, String requestedAt,String approvedAt,String method,String paymentKey )
	{
		bannerDao.realPaymentState(orderId,requestedAt,approvedAt,method,paymentKey);
	}
	
	
	
	//배너 결제 정보 가져오기 
	public BannerApplyFormBean getBannerPaymentInfo(String orderId)
	{
		return bannerDao.getBannerPaymentInfo(orderId);
	}
	
	
	//0216
	//배너 결제 내역 첫 날짜 받기
	public String getFirstPayDate()
	{
		return bannerDao.getFirstPayDate();
	}
	
	// 배너 결제 내역 
	public List<BannerApplyFormBean> getBannerPaymentInfoList(String startDate,String endDate,String payment_method,Integer banner_type,String user_name)
	{
		
		return bannerDao.getBannerPaymentInfoList(startDate, endDate, payment_method,banner_type, user_name);
		
		
	}
	
	
	//관리자 취소
	public void getCancelBanner(int banner_apply_form_id ) {
		bannerDao.getCancelBanner(banner_apply_form_id);
	}
	
}
