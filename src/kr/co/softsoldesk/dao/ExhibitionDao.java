package kr.co.softsoldesk.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.ExhibitionDetailBean;
import kr.co.softsoldesk.Beans.ReviewBean;
import kr.co.softsoldesk.mapper.ExhibitionMapper;

@Repository
public class ExhibitionDao {

	@Autowired
	ExhibitionMapper exhibitionMapper;
	
	// 인기 순 조회
	public List<ExhibitionBean> getPopularExhibitionInfo(RowBounds rowBounds) {
		
		return exhibitionMapper.getPopularExhibitionInfo(rowBounds);
	}
	
	// 인기순 조회 페이징 처리
	public int getPopularExhibitionCnt() {
		return exhibitionMapper.getPopularExhibitionCnt();
	}
	
	// 전시회 상세 조회 & 예매 정보넘길때 사용
	public ExhibitionBean getExhibitionDetailInfo(int exhibition_id) {
		
		return exhibitionMapper.getExhibitionDetailInfo(exhibition_id);
	}
	
	// 조회수 증가
	public void increaseViewsExhibition(int exhibition_id) {
		
		 exhibitionMapper.increaseViewsExhibition(exhibition_id);
	}
	
	// 전시회 페이지 최근
	public List<ExhibitionBean> getRecentExhibitionInfo(RowBounds rowBounds) {
		return exhibitionMapper.getRecentExhibitionInfo(rowBounds);
	}
	
	// 전시회 페이지 최근 페이징 처리
	public int getRecentExhibitionCnt() {
		return exhibitionMapper.getRecentExhibitionCnt();
	}
	
	// 전시회 페이지 곧종료
	public List<ExhibitionBean> getSoonEndExhibitionInfo(RowBounds rowBounds) {
		return exhibitionMapper.getSoonEndExhibitionInfo(rowBounds);
	}
	
	// 전시회 페이지 곧종료 페이징 처리
	public int getsoonEndExhibitionCnt() {
		return exhibitionMapper.getsoonEndExhibitionCnt();
	}
	
	// 전시회 페이지 무료
	public List<ExhibitionBean> getFreeExhibitionInfo(RowBounds rowBounds) {
		return exhibitionMapper.getFreeExhibitionInfo(rowBounds);
	}
	
	// 전시회 페이지 무료 페이징 처리
	public int getFreeExhibitionCnt() {
		return exhibitionMapper.getFreeExhibitionCnt();
	}
	
	// 메인 인덱스 인기 전시 캐러셀
	public List<ExhibitionBean> getIndexPagePopularExhibitionInfo() {
		return exhibitionMapper.getIndexPagePopularExhibitionInfo();
	}
	
	// 메인 인덱스 곧전시 전시 캐러셀
	public List<ExhibitionBean> getIndexPageSoonExhibitionInfo() {
		return exhibitionMapper.getIndexPageSoonExhibitionInfo();
	}
	
	// 메인 인덱스 현재 전시 캐러셀
	public List<ExhibitionBean> getIndexPagecurrentExhibitionInfo() {
		return exhibitionMapper.getIndexPagecurrentExhibitionInfo();
	}
	
	// 전시회 클릭시 리뷰 정보 가져가기
	public List<ReviewBean> getExhibition_clickReviewAllInfo(int exhibition_id, RowBounds rowBounds) {
		return exhibitionMapper.getExhibition_clickReviewAllInfo(exhibition_id, rowBounds);
	}
	
	// 해당 전시회 리뷰 평균 점수 반환
	public double getExhibitionReviewAVG(int exhibition_id) {
		return exhibitionMapper.getExhibitionReviewAVG(exhibition_id);
	}
	
	// 해당 전시 리뷰 개수 반환 메소드 리뷰 페이징처리
	public int getExhibitionReviewCnt(int exhibition_id) {
		return exhibitionMapper.getExhibitionReviewCnt(exhibition_id);
	}
	//전시회 제목 
	public String getExhibitionTitle(int exhibition_id) {
		return exhibitionMapper.getExhibitionTitle(exhibition_id);
	}
	public void increase_exhibitionTotalTicket(int exhibition_id,int ticket_cnt) {
		exhibitionMapper.increase_exhibitionTotalTicket(exhibition_id,ticket_cnt);
	}
	
	public List<ExhibitionBean>SearchExhibition(String title, RowBounds rowBounds){
		return exhibitionMapper.SearchExhibition(title, rowBounds);
	}
	
	public int SearchExhibitionCnt(String title) {
		return exhibitionMapper.SearchExhibitionCnt(title);
	}
	
	public List<ExhibitionBean>AllExhibition(RowBounds rowBounds){
		return exhibitionMapper.AllExhibition(rowBounds);
	}
	
	public int AllExhibitionCnt() {
		return exhibitionMapper.AllExhibitionCnt();
	}
	
	// =================== 전시회 등록신청 =======================
	//전시회 등록 테이블에 추가
	public void AddExhibition_Enroll(ExhibitionDetailBean exhibitionDetailBean) {
		exhibitionMapper.AddExhibition_Enroll(exhibitionDetailBean);
	}
	
	// =================== 메인배너 관리자 직접 추가 ==============
	//메인배너 관리자 직접 추가 모든 전시회 id, title 가져오기
	public List<ExhibitionBean> getexhibitionallTitle() {
		return exhibitionMapper.getexhibitionallTitle();
	}
}
