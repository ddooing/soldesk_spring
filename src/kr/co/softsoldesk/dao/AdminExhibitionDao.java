package kr.co.softsoldesk.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.ExhibitionDetailBean;
import kr.co.softsoldesk.mapper.AdminExhibitionMapper;

@Repository
public class AdminExhibitionDao {
	
	@Autowired
	private AdminExhibitionMapper adminExhibitionMapper;
	
	// ============================= 전시회 관리 =======================
	
		// 전시회 관리 페이지 찍혀오는 값 가져가기
		public List<ExhibitionBean> getAdminexhibitionmange(RowBounds rowBounds) {
			return adminExhibitionMapper.getAdminexhibitionmange(rowBounds);
		}
		
		// 전시회 관리 페이지 전시회 총개수, 전시예정, 진행중, 종료전시 반환
		public ExhibitionBean getExhibitionCount() {
			return adminExhibitionMapper.getExhibitionCount();
		}
		
		// 전시회 관리 페이징 처리
		public int getExhibitionCnt() {
			return adminExhibitionMapper.getExhibitionCnt();
		}
		
		// 전시회 관리 작가 검색
		public List<ExhibitionBean> getauthorSearchExhibitionInfo(String search) {
			return adminExhibitionMapper.getauthorSearchExhibitionInfo(search);
		}
		
		// 전시회 관리 작가 검색 중 총 전시 개수, 전시예정 , 종료 전시 개수 반환
		public ExhibitionBean getauthorSearchExhibitionCount(String search) {
			return adminExhibitionMapper.getauthorSearchExhibitionCount(search);
		}
		
		// 전시회 관리 작가 검색 페이징 처리
		public int getauthorSearchExhibitionCnt(String search) {
			return adminExhibitionMapper.getauthorSearchExhibitionCnt(search);
		}
		
		// 전시회 관리 제목 검색
		public List<ExhibitionBean> gettitleSearchExhibitionInfo(String search, RowBounds rowBounds) {
			return adminExhibitionMapper.gettitleSearchExhibitionInfo(search, rowBounds);
		}
		
		// 전시회 관리 제목 검색 중 총 전시 개수, 전시예정, 종료 전시 개수 반환
		public ExhibitionBean gettitleSearchExhibitionCount(String search) {
			return adminExhibitionMapper.gettitleSearchExhibitionCount(search);
		}
		
		// 전시회 관리 제목 검색 페이징 처리
		public int gettitleSearchExhibitionCnt(String search) {
			return adminExhibitionMapper.gettitleSearchExhibitionCnt(search);
		}
		
		// 전시회 관리 전시회 수정
		public ExhibitionDetailBean getAllDetailExhibitionBean(int exhibition_id) {
			return adminExhibitionMapper.getAllDetailExhibitionBean(exhibition_id);
		}
		
		// 전시회 수정 업데이트문 1 (file table)
		public void UpdateExhibitionInfo1(String name, int file_id) {
			adminExhibitionMapper.UpdateExhibitionInfo1(name, file_id);
		}
		
		// 전시회 수정 업데이트문 2 (exhibition table)
		public void UpdateExhibitionInfo2(ExhibitionDetailBean exhibitiondetailBean) {
			adminExhibitionMapper.UpdateExhibitionInfo2(exhibitiondetailBean);
		}
		
		// 전시회 추가 파일테이블 1
		public void addfiletableExhibition(ExhibitionDetailBean exhibitionDetailBean) {
					
			adminExhibitionMapper.addfiletableExhibition(exhibitionDetailBean);
		}
		
		// 전시회 추가 파일테이블에서 file_id 가져오기
		public int getFileId(String name) {
			
			return adminExhibitionMapper.getFileId(name); 
		}
		
		
		// 전시회 추가 전시회테이블 2
		public void addexhibitiontableExhibition(ExhibitionDetailBean exhibitionDetailBean) {
			
			adminExhibitionMapper.addexhibitiontableExhibition(exhibitionDetailBean);
		}
		
		// ====================== 전시회 등록 신청 ===========================
		// 전시회 등록 신청 관리자 페이지 리스트
		public List<ExhibitionDetailBean> getAllExhibitionEnroll(RowBounds rowBounds) {
			return adminExhibitionMapper.getAllExhibitionEnroll(rowBounds);
		}
		
		// 전시회 등록 신청 관리자 페이지 페이징처리
		public int getEnrollExhibitionCnt() {
			return adminExhibitionMapper.getEnrollExhibitionCnt();
		}
		
		// 전시회 등록 신청 한개 모든 정보 가져오기
		public ExhibitionDetailBean getOneEnrollExhitiion(int exhibition_enroll_id) {
			return adminExhibitionMapper.getOneEnrollExhitiion(exhibition_enroll_id);
		}
		
		// 전시회 등록 신청 -> 전시회 등록 할때
		public void addEnrollexhibitiontableExhibition(ExhibitionDetailBean exhibitionDetailBean) {
			adminExhibitionMapper.addEnrollexhibitiontableExhibition(exhibitionDetailBean);
		}
		
		// 전시회 등록 신청 한 후 상태값 변경
		public void UpdateExhibitionEnrollState(int enroll_state, int exhibition_enroll_id) {
			adminExhibitionMapper.UpdateExhibitionEnrollState(enroll_state, exhibition_enroll_id);
		}
		
		// 전시회 등록 신청 관리자 페이지 뱃지에 넣을 개수 반환
		public ExhibitionDetailBean getEnrollExhibitionbadgeCnt() {
			return adminExhibitionMapper.getEnrollExhibitionbadgeCnt();
		}
		
		// 전시회 등록 신청 제목 검색
		public List<ExhibitionDetailBean> getEnrollExhibitionSearchTitle(String search, RowBounds rowBounds) {
			return adminExhibitionMapper.getEnrollExhibitionSearchTitle(search, rowBounds);
		}
		
		// 전시회 등록 신청 제목 검색 중 배지 개수 반환
		public ExhibitionDetailBean getEnrollExhibitionSearchTitleBadgeCnt(String search) {
			return adminExhibitionMapper.getEnrollExhibitionSearchTitleBadgeCnt(search);
		}
		
		// 전시회 등록 신청 제목 검색 페이징 처리를 위한 검색시 총개수 반환
		public int getEnrollExhibitionSearchTitletotalCnt(String search) {
			return adminExhibitionMapper.getEnrollExhibitionSearchTitletotalCnt(search);
		}
		
		// 전시회 등록 신청 신청인 검색
		public List<ExhibitionDetailBean> getEnrollExhibitionSearchapply_person(String search, RowBounds rowBounds) {
			return adminExhibitionMapper.getEnrollExhibitionSearchapply_person(search, rowBounds);
		}
		
		// 전시회 등록 신청 신청인 검색 중 배지 개수 반환
		public ExhibitionDetailBean getEnrollExhibitionSearchapply_personBadgeCnt(String search) {
			return adminExhibitionMapper.getEnrollExhibitionSearchapply_personBadgeCnt(search);
		}
		
		// 전시회 등록 신청 신청인 검색 페이징 처리를 위한 검색시 총개수 반환
		public int getEnrollExhibitionSearchapply_persontotalCnt(String search) {
			return adminExhibitionMapper.getEnrollExhibitionSearchapply_persontotalCnt(search);
		}
		
		// 전시회 등록 신청 작가 검색
		public List<ExhibitionDetailBean> getEnrollExhibitionSearchauthor(String search, RowBounds rowBounds) {
			return adminExhibitionMapper.getEnrollExhibitionSearchauthor(search, rowBounds); 
		}
		
		// 전시회 등록 신청 작가 검색 중 배지 개수 반환
		public ExhibitionDetailBean getEnrollExhibitionSearchauthorBadgeCnt(String search) {
			return adminExhibitionMapper.getEnrollExhibitionSearchauthorBadgeCnt(search);
		}
		
		// 전시회 등록 신청 작가 검색 페이징 처리를 위한 검색시 총개수 반환
		public int getEnrollExhibitionSearchauthortotalCnt(String search) {
			return adminExhibitionMapper.getEnrollExhibitionSearchauthortotalCnt(search);
		}
		
		// 전시회 등록 신청 상태 검색
		public List<ExhibitionDetailBean> getEnrollExhibitionSearchstate(int search, RowBounds rowBounds) {
			return adminExhibitionMapper.getEnrollExhibitionSearchstate(search, rowBounds);
		}
		
		// 전시회 등록 신청 상태 검색 중 배지 개수 반환
		public ExhibitionDetailBean getEnrollExhibitionSearchstateBadgeCnt(int search) {
			return adminExhibitionMapper.getEnrollExhibitionSearchstateBadgeCnt(search);
		}
		
		// 전시회 등록 신청 상태 검색 페이징 처리를 위한 검색시 총개수 반환
		public int getEnrollExhibitionSearchstatetotalCnt(int search) {
			return adminExhibitionMapper.getEnrollExhibitionSearchstatetotalCnt(search);
		}

}
