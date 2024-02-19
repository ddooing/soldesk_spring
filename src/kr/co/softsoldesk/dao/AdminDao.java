package kr.co.softsoldesk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.Beans.BannerApplyFormBean;
import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.ExhibitionDetailBean;
import kr.co.softsoldesk.Beans.FAQBean;
import kr.co.softsoldesk.Beans.MainBannerBean;
import kr.co.softsoldesk.Beans.QnABean;
import kr.co.softsoldesk.Beans.SubBannerBean;
import kr.co.softsoldesk.mapper.AdminMapper;

@Repository
public class AdminDao {

	@Autowired
	private AdminMapper adminMapper;
	
	
	
	
	
	
	
	
	// ============================= 관리자 페이지 배너 관리 =====================================
	
	// 모든 배너 가져가기 state 1
	public List<MainBannerBean> getAllShowMainbannerInfo() {
		return adminMapper.getAllShowMainbannerInfo();
	}
	
	// 모든 배너 가져가기 state 2
	public List<MainBannerBean> getAllHideMainbannerInfo() {
		return adminMapper.getAllHideMainbannerInfo();
	}
	
	// 메인 배너 관리 페이지 뱃지
	public MainBannerBean getMainBannerBadgeCnt() {
		return adminMapper.getMainBannerBadgeCnt();
	}
	
	// 메인 배너 관리 페이지 제목 검색
	public List<MainBannerBean> titleSearchMainbannerInfo(String search) {
		return adminMapper.titleSearchMainbannerInfo(search);
	}
	
	// 메인 배너 관리 페이지 제목 검색 뱃지 관련
	public MainBannerBean getTitleSearchMainBannerBadgeCnt(String search) {
		return adminMapper.getTitleSearchMainBannerBadgeCnt(search);
	}
	
	// 배너 순서 업데이트
	public void updateExposeOrder(int mainBannerId, int exposeOrder) {
		adminMapper.updateExposeOrder(mainBannerId, exposeOrder);
	}
	
	// Index 메인 페이지 메인 배너
	public List<MainBannerBean> IndexMainBannerBeanList() {
		return adminMapper.IndexMainBannerBeanList();
	}
	
	// 배너 삭제
	public void DeleteMainBanner(int main_banner_id) {
		adminMapper.DeleteMainBanner(main_banner_id);
	}
	
	// 배너 삭제시 삭제한 배너보다 노출순서 높은것들 1개씩 노출순서 내리기
	public void UpdateDeleteAndExpose_order(int expose_order) {
		adminMapper.UpdateDeleteAndExpose_order(expose_order);
	}
	
	// 배너 한개 모든 정보 가져가기 (배너 수정)
	public MainBannerBean getOneMainBannerInfo(int main_banner_id) {
		return adminMapper.getOneMainBannerInfo(main_banner_id);
	}
	
	// 메인 배너 수정시 사진 바꿀시 filetable에 추가
	public void addfiletableBanner(MainBannerBean mainBannerBean) {
		adminMapper.addfiletableBanner(mainBannerBean);
	}
	
	// 메인 배너 수정
	public void UpdateMainBanner(MainBannerBean mainBannerBean) {
		adminMapper.UpdateMainBanner(mainBannerBean);
	}
	
	// 메인 배너 수정시 state 값 비교 메소드
	public int getMainBannerState(int main_banner_id) {
		return adminMapper.getMainBannerState(main_banner_id);
	}
	
	// 메인 배너 수정시 state 최대 값 반환
	public int getMaxExposeOrder() {
		return adminMapper.getMaxExposeOrder();
	}
	
	// 메인 배너 수정시 state 값 1씩 내림
	public void UpdateExpose_order(int expose_order) {
		adminMapper.UpdateExpose_order(expose_order);
	}
	
	// 메인 배너 관리자 직접 추가
	public void AddmanagerMainBanner(MainBannerBean mainBannerBean) {
		adminMapper.AddmanagerMainBanner(mainBannerBean);
	}
	
	// 배너 신청 페이지
	public List<ExhibitionBean> getApply_personExhibitionlist(int user_id) {
		return adminMapper.getApply_personExhibitionlist(user_id);
	}
	
	// 배너 신청 폼에 insert
	public void insertbanner_apply_form(BannerApplyFormBean bannerApplyFormBean) {
		adminMapper.insertbanner_apply_form(bannerApplyFormBean);
	}
	
	// 배너 신청 시 file 테이블에 저장
	public void addfiletableBanner1(BannerApplyFormBean bannerApplyFormBean) {
		adminMapper.addfiletableBanner1(bannerApplyFormBean);
	}
	
	// 서브배너 관리자 페이지 showlist 가져가기
	public List<SubBannerBean> getAllShowSubbannerInfo() {
		return adminMapper.getAllShowSubbannerInfo();
	}
	
	// 서브배너 관리 페이지 뱃지
	public SubBannerBean getSubBannerBadgeCnt() {
		return adminMapper.getSubBannerBadgeCnt();
	}
	
	// 서브배너 제목 검색 리스트
	public List<SubBannerBean> titleSearchSubbannerInfo(String search) {
		return adminMapper.titleSearchSubbannerInfo(search);
	}
	
	// 서브배너 제목 검색 뱃지 관련
	public SubBannerBean getTitleSearchSubBannerBadgeCnt(String search) {
		return adminMapper.getTitleSearchSubBannerBadgeCnt(search);
	}
	
	// 서브 배너 hide (숨김 state=2) 리스트
	public List<SubBannerBean> getAllHideSubbannerInfo() {
		return adminMapper.getAllHideSubbannerInfo();
	}
	
	// 서브 배너 삭제
	public void DeleteSubBanner(int sub_banner_id) {
		adminMapper.DeleteSubBanner(sub_banner_id);
	}
	
	// 서브 배너 삭제시 expose_order 높은거 한개씩 내리기
	public void UpdateDeleteAndExpose_orderSub(int expose_order) {
		adminMapper.UpdateDeleteAndExpose_orderSub(expose_order);
	}
	
	// 서브 배너 수정 페이지 들어가기 위한 서브 배너 한개 모든 정보 가져가기
	public SubBannerBean getOneSubBannerInfo(int sub_banner_id) {
		return adminMapper.getOneSubBannerInfo(sub_banner_id);
	}
	
	// 서브 배너 수정시 state 값 확인하려고 사용하는 메소드
	public int getSubBannerState(int sub_banner_id) {
		return adminMapper.getSubBannerState(sub_banner_id);
	}
	
	// 서브 배너 업데이트시 파일 변경시에 파일테이블에 파일 저장
	public void addfiletableBanner2(SubBannerBean subBannerBean) {
		adminMapper.addfiletableBanner2(subBannerBean);
	}
	
	// 서브 배너 order_expose max 값 찾기
	public int getSubMaxExposeOrder() {
		return adminMapper.getSubMaxExposeOrder();
	}
	
	// 서브 배너 수정시 expose_order 값 재정렬
	public void UpdateSubBannerExpose_order(int expose_order) {
		adminMapper.UpdateSubBannerExpose_order(expose_order);
	}
	
	// 서브 배너 수정 업데이트
	public void UpdateSubBanner(SubBannerBean subBannerBean) {
		adminMapper.UpdateSubBanner(subBannerBean);
	}
	
	// 서브 배너 관리자 직접 추가
	public void AddmanagerSubBanner(SubBannerBean subBannerBean) {
		adminMapper.AddmanagerSubBanner(subBannerBean);
	}
	
	// 서브 배너 순서 변경 (드래그앤 드롭)
	public void updateSubExposeOrder(int subBannerId, int exposeOrder) {
		adminMapper.updateSubExposeOrder(subBannerId, exposeOrder);
	}
	
	// index 서브 배너 정보 가져가기
	public List<SubBannerBean> IndexSubBannerBeanList() {
		return adminMapper.IndexSubBannerBeanList();
	}
	
	// 관리자 페이지 메인 배너 신청 내역 가져오기
	public List<BannerApplyFormBean> getAllApplyMainbanner(RowBounds rowBounds) {
		return adminMapper.getAllApplyMainbanner(rowBounds);
	}
	
	// 관리자 페이지 메인 배너 신청 내역 페이징 처리 위한 개수 반환
	public int getAllApplyMainbannerCnt() {
		return adminMapper.getAllApplyMainbannerCnt();
	}
	
	// 관리자 페이지 서브 배너 신청 내역 가져오기
	public List<BannerApplyFormBean> getAllApplySubbanner(RowBounds rowBounds) {
		return adminMapper.getAllApplySubbanner(rowBounds);
	}
	
	// 관리자 페이지 서브 배너 신청 페이징 처리 위한 개수 반환
	public int getAllApplySubbannerCnt() {
		return adminMapper.getAllApplySubbannerCnt();
	}
	
	// 관리자 페이지 메인 배너 신청 내역 뱃지 관련
	public BannerApplyFormBean getMainBannerBadge() {
		return adminMapper.getMainBannerBadge();
	}

	// 관리자 페이지 서브 배너 신청 내역 뱃지 관련
	public BannerApplyFormBean getSubBannerBadge() {
		return adminMapper.getSubBannerBadge();
	}	
	
	// 관리자 페이지 메인 배너 신청 내역 전시회 제목 검색
	public List<BannerApplyFormBean> getMainBannerapplytitleSearch(String search, RowBounds rowBounds) {
		return adminMapper.getMainBannerapplytitleSearch(search, rowBounds);
	}
	
	// 관리자 페이지 메인 배너 신청 내역 전시회 제목 검색 페이징 처리를 위한 개수 반환
	public int getMainBannerapplytitleSearchCnt(String search) {
		return adminMapper.getMainBannerapplytitleSearchCnt(search);
	}
	
	// 관리자 페이지 메인 배너 전시회 제목 검색 뱃지 관련
	public BannerApplyFormBean getMainBannerapplytitlesearchBadge(String search) {
		return adminMapper.getMainBannerapplytitlesearchBadge(search);
	}
	
	// 관리자 페이지 서브 배너 신청 내역 전시회 제목 검색
	public List<BannerApplyFormBean> getSubBannerapplytitleSearch(String search, RowBounds rowBounds) {
		return adminMapper.getSubBannerapplytitleSearch(search, rowBounds);
	}
	
	// 관리자 페이지 서브 배너 신청 내역 전시회 제목 검색 페이징처리를 위한 개수 반환'
	public int getSubBannerapplytitleSearchCnt(String search) {
		return adminMapper.getSubBannerapplytitleSearchCnt(search);
	}
		
	// 관리자 페이지 서브 배너 전시회 제목 검색 뱃지 관련
	public BannerApplyFormBean getSubBannerapplytitlesearchBadge(String search) {
		return adminMapper.getSubBannerapplytitlesearchBadge(search);
	}	
	
	// 관리자 페이지 배너 취소 상태로 변경 state -> 3으로 변경
	public void UpdateApplyBannerCancle(int banner_apply_form_id) {
		adminMapper.UpdateApplyBannerCancle(banner_apply_form_id);
	}
	
	// 관리자 페이지 배너 요청 추가/상세 페에지
	public BannerApplyFormBean getBannerapplyDetail(int banner_apply_form_id) {
		return adminMapper.getBannerapplyDetail(banner_apply_form_id);
	}
	
	// 관리자 페이지 배너 신청 받은거 관리자가 확인하고 추가 (메인배너)
	public void addApplyMainBanner(MainBannerBean mainBannerBean) {
		adminMapper.addApplyMainBanner(mainBannerBean);
	}
	
	// 관리자 페이지 배너 신청 받은거 관리자가 확인하고 추가 (서브배너)
	public void addApplySubBanner(SubBannerBean subBannerBean) {
		adminMapper.addApplySubBanner(subBannerBean);
	}	
	
	// 관리자 페이지 배너 신청 받은거 관리자가 확인하고 추가 후 banner_apply_form 테이블 상태값 변경 (메인,서브배너 공통)
	public void updatebanner_apply_formState(int banner_apply_form_id) {
		adminMapper.updatebanner_apply_formState(banner_apply_form_id);
	}
}
