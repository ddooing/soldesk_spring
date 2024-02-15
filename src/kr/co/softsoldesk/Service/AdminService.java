package kr.co.softsoldesk.Service;

import java.io.File;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.co.softsoldesk.Beans.BannerApplyFormBean;
import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.ExhibitionDetailBean;
import kr.co.softsoldesk.Beans.FAQBean;
import kr.co.softsoldesk.Beans.MainBannerBean;
import kr.co.softsoldesk.Beans.PageBean;
import kr.co.softsoldesk.Beans.QnABean;
import kr.co.softsoldesk.Beans.SubBannerBean;
import kr.co.softsoldesk.dao.AdminDao;
import kr.co.softsoldesk.dao.AdminExhibitionDao;

@Service
public class AdminService {

	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private AdminExhibitionDao adminExhibitionDao;
	
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
	
	// ============================파일 처리 =====================================
	
	
	
	
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

		
	
	
	
	
	
	
	// =========================== 관리자페이지 배너 관리 ==========================
	// 모든 배너 가져가기 state 1
	public List<MainBannerBean> getAllShowMainbannerInfo() {
		return adminDao.getAllShowMainbannerInfo();
	}
	
	// 모든 배너 가져가기 state 2
	public List<MainBannerBean> getAllHideMainbannerInfo() {
		return adminDao.getAllHideMainbannerInfo();
	}
	
	// 배너 관리 페이지 배지 관련
	public MainBannerBean getMainBannerBadgeCnt() {
		return adminDao.getMainBannerBadgeCnt();
	}
	
	// 배너 관리 페이지 제목 검색 리스트
	public List<MainBannerBean> titleSearchMainbannerInfo(String search) {
		return adminDao.titleSearchMainbannerInfo(search);
	}
	
	// 배너 관리 페이지 제목 검색 뱃지 관련
	public MainBannerBean getTitleSearchMainBannerBadgeCnt(String search) {
		return adminDao.getTitleSearchMainBannerBadgeCnt(search);
	}
	
	// 배너 순서 업데이트
	public void updateExposeOrder(String[] ids) {
        for (int i = 0; i < ids.length; i++) {
            int bannerId = Integer.parseInt(ids[i]);
            adminDao.updateExposeOrder(bannerId, i + 1);
        }
    }
	
	// Index 페이지 메인 배너 가져가기
	public List<MainBannerBean> IndexMainBannerBeanList() {
		return adminDao.IndexMainBannerBeanList();
	}
	
	// 메인 배너 삭제
	public void DeleteMainBanner(int main_banner_id) {
		adminDao.DeleteMainBanner(main_banner_id);
	}
	
	// 메인 배너 삭제 시 삭제한 배너보다 노출 순서 높은거 1개씩 줄이기
	public void UpdateDeleteAndExpose_order(int expose_order) {
		adminDao.UpdateDeleteAndExpose_order(expose_order);
	}
	
	// 메인 배너 한개 모든 정보 가져가기
	public MainBannerBean getOneMainBannerInfo(int main_banner_id) {
		return adminDao.getOneMainBannerInfo(main_banner_id);
	}
	
	// 메인 배너 수정시 파일 변경시 filetable에 추가
	public void addfiletableBanner(MainBannerBean mainBannerBean) {
		MultipartFile main_banner_upload_file  = mainBannerBean.getMain_banner_file();
		
		if(main_banner_upload_file.getSize()>0) {
			String main_banner_file_name = saveMainBannerUploadFile(main_banner_upload_file);
			
			// file_table 메인포스터 이름 저장
			mainBannerBean.setName(main_banner_file_name);
			mainBannerBean.setPath("/Spring_Project_Dream/img/main_banner/");
			
			// file_table 상세포스터 이름 저장
			adminDao.addfiletableBanner(mainBannerBean);
			
			// 저장된 파일 file_id exhibitionDetailBean에 set 해줌
			mainBannerBean.setBanner_file_id(adminExhibitionDao.getFileId(main_banner_file_name));
		}
	}

	// 메인 배너 수정
	public void UpdateMainBanner(MainBannerBean mainBannerBean) {
		adminDao.UpdateMainBanner(mainBannerBean);
	}
	
	// 메인 배너 수정 시 state 값 변경 확인 메소드
	public int getMainBannerState(int main_banner_id) {
		return adminDao.getMainBannerState(main_banner_id);
	}
	
	// 메인 배너 수정 시 expose_order 최대 값 반환
	public int getMaxExposeOrder() {
		return adminDao.getMaxExposeOrder();
	}
	
	// 메인 배너 수정 시 expose_order 값 1씩 내림
	public void UpdateExpose_order(int expose_order) {
		adminDao.UpdateExpose_order(expose_order);
	}
	
	// 메인 배너 관리자 직접 추가
	public void AddmanagerMainBanner(MainBannerBean mainBannerBean) {
		adminDao.AddmanagerMainBanner(mainBannerBean);
	}
	
	// 배너 신청 페이지 신청인이 신청한 전시회 목록 가져가기 (select용)
	public List<ExhibitionBean> getApply_personExhibitionlist(int user_id) {
		return adminDao.getApply_personExhibitionlist(user_id);
	}
	
	// 배너 신청 테이블에 insert
	public void insertbanner_apply_form(BannerApplyFormBean bannerApplyFormBean) {
		adminDao.insertbanner_apply_form(bannerApplyFormBean);
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
			adminDao.addfiletableBanner1(bannerApplyFormBean);
				
			// 저장된 파일 file_id bannerApplyFormBean에 set 해줌
			bannerApplyFormBean.setBanner_file_id(adminExhibitionDao.getFileId(main_banner_file_name));
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
				adminDao.addfiletableBanner1(bannerApplyFormBean);
					
				// 저장된 파일 file_id bannerApplyFormBean에 set 해줌
				bannerApplyFormBean.setBanner_file_id(adminExhibitionDao.getFileId(main_banner_file_name));
			}
		}
	
	// 배너 신청시 파일테이블에 파일 저장
	public void addfiletableBanner1(BannerApplyFormBean bannerApplyFormBean) {
		adminDao.addfiletableBanner1(bannerApplyFormBean);
	}
	
	// 서브 배너 관리자 페이지 showlist 페이지
	public List<SubBannerBean> getAllShowSubbannerInfo() {
		return adminDao.getAllShowSubbannerInfo();
	}
	
	// 서브 배너 뱃지 관련
	public SubBannerBean getSubBannerBadgeCnt() {
		return adminDao.getSubBannerBadgeCnt();
	}
	
	// 서브 배너 제목 검색 리스트
	public List<SubBannerBean> titleSearchSubbannerInfo(String search) {
		return adminDao.titleSearchSubbannerInfo(search);
	}
	
	// 서브 배너 제목 검색 뱃지 관련
	public SubBannerBean getTitleSearchSubBannerBadgeCnt(String search) {
		return adminDao.getTitleSearchSubBannerBadgeCnt(search);
	}
	
	// 서브 배너 hide(숨김 state=2) 리스트
	public List<SubBannerBean> getAllHideSubbannerInfo() {
		return adminDao.getAllHideSubbannerInfo();
	}
	
	// 서브 배너 삭제
	public void DeleteSubBanner(int sub_banner_id) {
		adminDao.DeleteSubBanner(sub_banner_id);
	}
	
	// 서브 배너 삭제 시 삭제한 배너의 expose_order보다 큰거 expose_order 한개씩 내리기
	public void UpdateDeleteAndExpose_orderSub(int expose_order) {
		adminDao.UpdateDeleteAndExpose_orderSub(expose_order);
	}
	
	// 서브 배너 수정 페이지 들어가기 위한 모든 정보 가져가기
	public SubBannerBean getOneSubBannerInfo(int sub_banner_id) {
		return adminDao.getOneSubBannerInfo(sub_banner_id);
	}
	
	// 서브 배너 수정시 state 값 변경 확인 메소드'
	public int getSubBannerState(int sub_banner_id) {
		return adminDao.getSubBannerState(sub_banner_id);
	}
	
	// 서브 배너 업데이트 시 파일 변경할 경우 파일 테이블에 파일 저장
	public void addfiletableBanner2(SubBannerBean subBannerBean) {
		MultipartFile sub_banner_upload_file  = subBannerBean.getSub_banner_file();
		
		if(sub_banner_upload_file.getSize()>0) {
			String sub_banner_file_name = saveSubBannerUploadFile(sub_banner_upload_file);
			
			// file_table name, path set
			subBannerBean.setName(sub_banner_file_name);
			subBannerBean.setPath("/Spring_Project_Dream/img/sub_banner/");
			
			// file_table 저정
			adminDao.addfiletableBanner2(subBannerBean);
			
			// 저장된 파일 file_id exhibitionDetailBean에 set 해줌
			subBannerBean.setBanner_file_id(adminExhibitionDao.getFileId(sub_banner_file_name));
		}
	}
	
	// 서브 배너 order_expose max 값 반환
	public int getSubMaxExposeOrder() {
		return adminDao.getSubMaxExposeOrder();
	}
	
	// 서브 배너 업데이트 시 expose_order 값 재정렬
	public void UpdateSubBannerExpose_order(int expose_order) {
		adminDao.UpdateSubBannerExpose_order(expose_order);
	}
	
	// 서브 배너 업데이트
	public void UpdateSubBanner(SubBannerBean subBannerBean) {
		adminDao.UpdateSubBanner(subBannerBean);
	}
	
	// 서브 배너 관리자 직접 추가
	public void AddmanagerSubBanner(SubBannerBean subBannerBean) {
		adminDao.AddmanagerSubBanner(subBannerBean);
	}
	
	// 서브 배너 expose_order 순서 변경 (드래그앤 드롭)
	public void updateSubExposeOrder(String[] ids) {
        for (int i = 0; i < ids.length; i++) {
            int bannerId = Integer.parseInt(ids[i]);
            adminDao.updateSubExposeOrder(bannerId, i + 1);
        }
	}
	
	// index 서브 배너 정보 가져가기
	public List<SubBannerBean> IndexSubBannerBeanList() {
		return adminDao.IndexSubBannerBeanList();
	}
	
	// 관리자 페이지 메인 배너 신청 내역 가져오기
	public List<BannerApplyFormBean> getAllApplyMainbanner(int page) {
		
		int start = (page - 1) * admin_listcnt;
		RowBounds rowBounds = new RowBounds(start, admin_listcnt);
		
		return adminDao.getAllApplyMainbanner(rowBounds);
	}
	
	// 관리자 페이지 메인 배너 신청 내역 페이징 처리를 위한 총 개수 반환
	public PageBean getAllApplyMainbannerCnt(int currentPage) {
		
		int mainbannerapply_Cnt = adminDao.getAllApplyMainbannerCnt();
		PageBean pageBean = new PageBean(mainbannerapply_Cnt, currentPage, admin_listcnt, admin_paginationcnt);
		
		return pageBean;
	}
		
	// 관리자 페이지 서브 배너 신청 내역 가져오기
	public List<BannerApplyFormBean> getAllApplySubbanner(int page) {
		
		int start = (page - 1) * admin_listcnt;
		RowBounds rowBounds = new RowBounds(start, admin_listcnt);
		
		return adminDao.getAllApplySubbanner(rowBounds);
	}
	
	// 관리자 페이지 서브 배너 신청 내역 페이징 처리를 위한 총 개수 반환
	public PageBean getAllApplySubbannerCnt(int currentPage) {
		
		int subbannerapply_Cnt = adminDao.getAllApplySubbannerCnt();
		PageBean pageBean = new PageBean(subbannerapply_Cnt, currentPage, admin_listcnt, admin_paginationcnt);
		
		return pageBean;
	}
	
	// 관리자 페이지 메인 배너 신청 내역 뱃지 관련
	public BannerApplyFormBean getMainBannerBadge() {
		return adminDao.getMainBannerBadge();
	}

	// 관리자 페이지 서브 배너 신청 내역 뱃지 관련
	public BannerApplyFormBean getSubBannerBadge() {
		return adminDao.getSubBannerBadge();
	}		
	
	// 관리자 페이지 메인 배너 신청 내역 전시회 제목 검색
	public List<BannerApplyFormBean> getMainBannerapplytitleSearch(String search, int page) {
		
		int start = (page - 1) * admin_listcnt;
		RowBounds rowBounds = new RowBounds(start, admin_listcnt);
		
		return adminDao.getMainBannerapplytitleSearch(search, rowBounds);
	}
	
	// 관리자 페이지 메인 배너 신청 내역 전시회 제목 검색 페이징 처리를 위한 개수 반환
	public PageBean getMainBannerapplytitleSearchCnt(String search, int currentPage) {
		
		int maintitlesearch_Cnt = adminDao.getMainBannerapplytitleSearchCnt(search);
		PageBean pageBean = new PageBean(maintitlesearch_Cnt, currentPage, admin_listcnt, admin_paginationcnt);
		
		return pageBean;
	}
	
	// 관리자 페이지 메인 배너 전시회 제목 검색 뱃지 관련
	public BannerApplyFormBean getMainBannerapplytitlesearchBadge(String search) {
		return adminDao.getMainBannerapplytitlesearchBadge(search);
	}
	
	// 관리자 페이지 서브 배너 신청 내역 전시회 제목 검색
	public List<BannerApplyFormBean> getSubBannerapplytitleSearch(String search, int page) {
		
		int start = (page - 1) * admin_listcnt;
		RowBounds rowBounds = new RowBounds(start, admin_listcnt);
		
		return adminDao.getSubBannerapplytitleSearch(search, rowBounds);
	}
	
	// 관리자 페이지 서브 배너 신청 내역 전시회 제목 검색 페이징 처리를 위한 개수 반환
	public PageBean getSubBannerapplytitleSearchCnt(String search, int currentPage) {
		
		int subtitlesearch_Cnt = adminDao.getSubBannerapplytitleSearchCnt(search);
		PageBean pageBean = new PageBean(subtitlesearch_Cnt, currentPage, admin_listcnt, admin_paginationcnt);
		
		return pageBean;
	}		
		
	// 관리자 페이지 서브 배너 전시회 제목 검색 뱃지 관련
	public BannerApplyFormBean getSubBannerapplytitlesearchBadge(String search) {
		return adminDao.getSubBannerapplytitlesearchBadge(search);
	}	
	
	// 관리자 페이지 배너 취소 상태로 변경 state -> 3으로 변경
	public void UpdateApplyBannerCancle(int banner_apply_form_id) {
		adminDao.UpdateApplyBannerCancle(banner_apply_form_id);
	}
	
	// 관리자 페이지 배너 추가/상세 페이지
	public BannerApplyFormBean getBannerapplyDetail(int banner_apply_form_id) {
		return adminDao.getBannerapplyDetail(banner_apply_form_id);
	}
	
	// 관리자 페이지 배너 신청 받은거 관리자가 확인하고 추가 (메인배너)
	public void addApplyMainBanner(MainBannerBean mainBannerBean) {
		adminDao.addApplyMainBanner(mainBannerBean);
	}
		
	// 관리자 페이지 배너 신청 받은거 관리자가 확인하고 추가 (서브배너)
	public void addApplySubBanner(SubBannerBean subBannerBean) {
		adminDao.addApplySubBanner(subBannerBean);
	}	
	
	// 관리자 페이지 배너 신청 받은거 관리자가 확인하고 추가 후 banner_apply_form 테이블 상태값 변경(메인, 서브배너 공통)
	public void updatebanner_apply_formState(int banner_apply_form_id) {
		adminDao.updatebanner_apply_formState(banner_apply_form_id);
	}
	
}

