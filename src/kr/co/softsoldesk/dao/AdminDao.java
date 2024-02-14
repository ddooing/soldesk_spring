package kr.co.softsoldesk.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.Beans.BannerApplyFormBean;
import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.ExhibitionDetailBean;
import kr.co.softsoldesk.Beans.MainBannerBean;
import kr.co.softsoldesk.Beans.QnABean;
import kr.co.softsoldesk.Beans.SubBannerBean;
import kr.co.softsoldesk.mapper.AdminMapper;

@Repository
public class AdminDao {

	@Autowired
	private AdminMapper adminMapper;
	
	// ============================QnA==============================
	
	// 관리자 페이지 QnA 모든 리스트 가져오기
	public List<QnABean> getAllQnAInfo(RowBounds rowBounds) {
		return adminMapper.getAllQnAInfo(rowBounds);
	}
	
	// 관리자 페이지 QnA 한개 정보 가져오기
	public QnABean getOneQnAInfo(int qna_id) {
		return adminMapper.getOneQnAInfo(qna_id);
	}
	
	// 관리자 페이지 QnA 모든 개수 가져오기
	public QnABean getQnACount() {
		return adminMapper.getQnACount();
	}
	
	// 관리자 페이지 QnA 답변 달기
	public void updateQnAReply(QnABean qnaBean) {
		adminMapper.updateQnAReply(qnaBean);
	}
	
	// QnA 삭제 처리(state 값 3으로 변경)
	public void deleteQnA(int qna_id) {
		adminMapper.deleteQnA(qna_id);
	}
	
	// QnA 복구 처리 (state 값 1로 변경)
	public void recoveryQnA(int state, int qna_id) {
		adminMapper.recoveryQnA(state, qna_id);
	}
	
	// QnA 닉네임 검색 메소드
	public List<QnABean> getnicknameSearchQnAInfo(String search, RowBounds rowBounds) {
		return adminMapper.getnicknameSearchQnAInfo(search, rowBounds);
	}
	
	// QnA 닉네임 검색 페이징처리 총개수 반환
	public int getnicknameSearchQnACnt(String search) {
		return adminMapper.getnicknameSearchQnACnt(search);
	}
	
	// QnA 제목 검색 메소드
	public List<QnABean> gettitleSearchQnAInfo(String search, RowBounds rowBounds) {
		return adminMapper.gettitleSearchQnAInfo(search, rowBounds);
	}
	
	// QnA 제목 검색 페이징처리 총개수 반환
	public int gettitleSearchQnACnt(String search) {
		return adminMapper.gettitleSearchQnACnt(search);
	}
	
	// QnA 제목 검색 개수 반환 메소드
	public QnABean gettitleSearchQnACount(String search) {
		return adminMapper.gettitleSearchQnACount(search);
	}
	
	// QnA 닉네임 검색 개수 반환 메소드
	public QnABean getnicknameSearchQnACount(String search) {
		return adminMapper.getnicknameSearchQnACount(search);
	}
	
	// QnA 선택 삭제 메소드
	public void deleteSelectedQnA(int qna_id) {
		adminMapper.deleteSelectedQnA(qna_id);
	}
	
	// QnA 페이징 처리를 위한 총 qna 개수 반환
	public int getTotalQnACnt() {
		return adminMapper.getTotalQnACnt();
	}
	
	
	// ============================= 전시회 관리 =======================
	
	// 전시회 관리 페이지 찍혀오는 값 가져가기
	public List<ExhibitionBean> getAdminexhibitionmange(RowBounds rowBounds) {
		return adminMapper.getAdminexhibitionmange(rowBounds);
	}
	
	// 전시회 관리 페이지 전시회 총개수, 전시예정, 진행중, 종료전시 반환
	public ExhibitionBean getExhibitionCount() {
		return adminMapper.getExhibitionCount();
	}
	
	// 전시회 관리 페이징 처리
	public int getExhibitionCnt() {
		return adminMapper.getExhibitionCnt();
	}
	
	// 전시회 관리 작가 검색
	public List<ExhibitionBean> getauthorSearchExhibitionInfo(String search) {
		return adminMapper.getauthorSearchExhibitionInfo(search);
	}
	
	// 전시회 관리 작가 검색 중 총 전시 개수, 전시예정 , 종료 전시 개수 반환
	public ExhibitionBean getauthorSearchExhibitionCount(String search) {
		return adminMapper.getauthorSearchExhibitionCount(search);
	}
	
	// 전시회 관리 작가 검색 페이징 처리
	public int getauthorSearchExhibitionCnt(String search) {
		return adminMapper.getauthorSearchExhibitionCnt(search);
	}
	
	// 전시회 관리 제목 검색
	public List<ExhibitionBean> gettitleSearchExhibitionInfo(String search, RowBounds rowBounds) {
		return adminMapper.gettitleSearchExhibitionInfo(search, rowBounds);
	}
	
	// 전시회 관리 제목 검색 중 총 전시 개수, 전시예정, 종료 전시 개수 반환
	public ExhibitionBean gettitleSearchExhibitionCount(String search) {
		return adminMapper.gettitleSearchExhibitionCount(search);
	}
	
	// 전시회 관리 제목 검색 페이징 처리
	public int gettitleSearchExhibitionCnt(String search) {
		return adminMapper.gettitleSearchExhibitionCnt(search);
	}
	
	// 전시회 관리 전시회 수정
	public ExhibitionDetailBean getAllDetailExhibitionBean(int exhibition_id) {
		return adminMapper.getAllDetailExhibitionBean(exhibition_id);
	}
	
	// 전시회 수정 업데이트문 1 (file table)
	public void UpdateExhibitionInfo1(String name, int file_id) {
		adminMapper.UpdateExhibitionInfo1(name, file_id);
	}
	
	// 전시회 수정 업데이트문 2 (exhibition table)
	public void UpdateExhibitionInfo2(ExhibitionDetailBean exhibitiondetailBean) {
		adminMapper.UpdateExhibitionInfo2(exhibitiondetailBean);
	}
	
	// 전시회 추가 파일테이블 1
	public void addfiletableExhibition(ExhibitionDetailBean exhibitionDetailBean) {
				
		adminMapper.addfiletableExhibition(exhibitionDetailBean);
	}
	
	// 전시회 추가 파일테이블에서 file_id 가져오기
	public int getFileId(String name) {
		
		return adminMapper.getFileId(name); 
	}
	
	
	// 전시회 추가 전시회테이블 2
	public void addexhibitiontableExhibition(ExhibitionDetailBean exhibitionDetailBean) {
		
		adminMapper.addexhibitiontableExhibition(exhibitionDetailBean);
	}
	
	// ====================== 전시회 등록 신청 ===========================
	// 전시회 등록 신청 관리자 페이지 리스트
	public List<ExhibitionDetailBean> getAllExhibitionEnroll(RowBounds rowBounds) {
		return adminMapper.getAllExhibitionEnroll(rowBounds);
	}
	
	// 전시회 등록 신청 관리자 페이지 페이징처리
	public int getEnrollExhibitionCnt() {
		return adminMapper.getEnrollExhibitionCnt();
	}
	
	// 전시회 등록 신청 한개 모든 정보 가져오기
	public ExhibitionDetailBean getOneEnrollExhitiion(int exhibition_enroll_id) {
		return adminMapper.getOneEnrollExhitiion(exhibition_enroll_id);
	}
	
	// 전시회 등록 신청 -> 전시회 등록 할때
	public void addEnrollexhibitiontableExhibition(ExhibitionDetailBean exhibitionDetailBean) {
		adminMapper.addEnrollexhibitiontableExhibition(exhibitionDetailBean);
	}
	
	// 전시회 등록 신청 한 후 상태값 변경
	public void UpdateExhibitionEnrollState(int enroll_state, int exhibition_enroll_id) {
		adminMapper.UpdateExhibitionEnrollState(enroll_state, exhibition_enroll_id);
	}
	
	// 전시회 등록 신청 관리자 페이지 뱃지에 넣을 개수 반환
	public ExhibitionDetailBean getEnrollExhibitionbadgeCnt() {
		return adminMapper.getEnrollExhibitionbadgeCnt();
	}
	
	// 전시회 등록 신청 제목 검색
	public List<ExhibitionDetailBean> getEnrollExhibitionSearchTitle(String search, RowBounds rowBounds) {
		return adminMapper.getEnrollExhibitionSearchTitle(search, rowBounds);
	}
	
	// 전시회 등록 신청 제목 검색 중 배지 개수 반환
	public ExhibitionDetailBean getEnrollExhibitionSearchTitleBadgeCnt(String search) {
		return adminMapper.getEnrollExhibitionSearchTitleBadgeCnt(search);
	}
	
	// 전시회 등록 신청 제목 검색 페이징 처리를 위한 검색시 총개수 반환
	public int getEnrollExhibitionSearchTitletotalCnt(String search) {
		return adminMapper.getEnrollExhibitionSearchTitletotalCnt(search);
	}
	
	// 전시회 등록 신청 신청인 검색
	public List<ExhibitionDetailBean> getEnrollExhibitionSearchapply_person(String search, RowBounds rowBounds) {
		return adminMapper.getEnrollExhibitionSearchapply_person(search, rowBounds);
	}
	
	// 전시회 등록 신청 신청인 검색 중 배지 개수 반환
	public ExhibitionDetailBean getEnrollExhibitionSearchapply_personBadgeCnt(String search) {
		return adminMapper.getEnrollExhibitionSearchapply_personBadgeCnt(search);
	}
	
	// 전시회 등록 신청 신청인 검색 페이징 처리를 위한 검색시 총개수 반환
	public int getEnrollExhibitionSearchapply_persontotalCnt(String search) {
		return adminMapper.getEnrollExhibitionSearchapply_persontotalCnt(search);
	}
	
	// 전시회 등록 신청 작가 검색
	public List<ExhibitionDetailBean> getEnrollExhibitionSearchauthor(String search, RowBounds rowBounds) {
		return adminMapper.getEnrollExhibitionSearchauthor(search, rowBounds); 
	}
	
	// 전시회 등록 신청 작가 검색 중 배지 개수 반환
	public ExhibitionDetailBean getEnrollExhibitionSearchauthorBadgeCnt(String search) {
		return adminMapper.getEnrollExhibitionSearchauthorBadgeCnt(search);
	}
	
	// 전시회 등록 신청 작가 검색 페이징 처리를 위한 검색시 총개수 반환
	public int getEnrollExhibitionSearchauthortotalCnt(String search) {
		return adminMapper.getEnrollExhibitionSearchauthortotalCnt(search);
	}
	
	// 전시회 등록 신청 상태 검색
	public List<ExhibitionDetailBean> getEnrollExhibitionSearchstate(int search, RowBounds rowBounds) {
		return adminMapper.getEnrollExhibitionSearchstate(search, rowBounds);
	}
	
	// 전시회 등록 신청 상태 검색 중 배지 개수 반환
	public ExhibitionDetailBean getEnrollExhibitionSearchstateBadgeCnt(int search) {
		return adminMapper.getEnrollExhibitionSearchstateBadgeCnt(search);
	}
	
	// 전시회 등록 신청 상태 검색 페이징 처리를 위한 검색시 총개수 반환
	public int getEnrollExhibitionSearchstatetotalCnt(int search) {
		return adminMapper.getEnrollExhibitionSearchstatetotalCnt(search);
	}
	
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
	public Integer getMainBannerState(int main_banner_id) {
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
	public Integer getSubBannerState(int sub_banner_id) {
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
	
	// 승연 ```````````````````````````````````````````````
	
	public void insertbanner_apply(BannerApplyFormBean bannerApplyFormBean)
	{
		adminMapper.insertbanner_apply(bannerApplyFormBean);
	}
}
