package kr.co.softsoldesk.Service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.ExhibitionDetailBean;
import kr.co.softsoldesk.Beans.PageBean;
import kr.co.softsoldesk.Beans.ReviewBean;
import kr.co.softsoldesk.dao.ExhibitionDao;

@Service
public class ExhibitionService {

	@Autowired
	private ExhibitionDao exhibitionDao;
	
	// 전시회 페이지 페이징 처리
	@Value("${exhibition.listcnt}")
	private int exhibition_listcnt;
	
	@Value("${exhibition.paginationcnt}")
	private int exhibition_paginationcnt;
	
	// 전시회 상세 페이지 리뷰 페이징 처리
	@Value("${exhibitionreview.listcnt}")
	private int exhibitionreview_listcnt;
	
	@Value("${exhibitionreview.paginationcnt}")
	private int exhibitionreview_paginationcnt;
	
	// 인기카테고리 조회
	public List<ExhibitionBean> getPopularExhibitionInfo(int page) {
		
		int start = (page - 1) * exhibition_listcnt;
		RowBounds rowBounds = new RowBounds(start, exhibition_listcnt);

		
		return exhibitionDao.getPopularExhibitionInfo(rowBounds);
	}
	
	// 인기 카테고리 페이징 처리
	public PageBean getPopularExhibitionCnt(int currentPage) {
		
		int popexhibition_Cnt = exhibitionDao.getPopularExhibitionCnt();		// 해당게시판의 전체 게시글의 숫자
		PageBean pageBean = new PageBean(popexhibition_Cnt, currentPage, exhibition_listcnt, exhibition_paginationcnt);
		
		
		return pageBean;
		
	}
	
	// 전시회 상세페이지 조회 (전시회 모든정보 객체)
	public ExhibitionBean getExhibitionDetailInfo(int exhibition_id) {
		
		return exhibitionDao.getExhibitionDetailInfo(exhibition_id);
	}
	
	// 조회수 증가
	public void increaseViewsExhibition(int exhibition_id) {
		
		exhibitionDao.increaseViewsExhibition(exhibition_id);
	}
	
	// 전시회 페이지 최근 카테고리 조회
	public List<ExhibitionBean> getRecentExhibitionInfo(int page) {
		
		int start = (page - 1) * exhibition_listcnt;
		RowBounds rowBounds = new RowBounds(start, exhibition_listcnt);
		
		return exhibitionDao.getRecentExhibitionInfo(rowBounds);
	}
	
	// 전시회 페이지 최근 카테고리 페이징 처리
	public PageBean getRecentExhibitionCnt(int currentPage) {
		
		int recentexhibition_Cnt = exhibitionDao.getRecentExhibitionCnt();
		PageBean pageBean = new PageBean(recentexhibition_Cnt, currentPage, exhibition_listcnt, exhibition_paginationcnt);
		
		return pageBean;
	}
	
	// 전시회 페이지 곧종료 카테고리 조회
	public List<ExhibitionBean> getSoonEndExhibitionInfo(int page) {
		
		int start = (page - 1) * exhibition_listcnt;
		RowBounds rowBounds = new RowBounds(start, exhibition_listcnt);
		
		return exhibitionDao.getSoonEndExhibitionInfo(rowBounds);
	}
	
	// 전시회 페이지 곧종료 카테고리 페이징 처리
	public PageBean getsoonEndExhibitionCnt(int currentPage) {
		
		int SoonEndexhibition_Cnt = exhibitionDao.getsoonEndExhibitionCnt();
		PageBean pageBean = new PageBean(SoonEndexhibition_Cnt, currentPage, exhibition_listcnt, exhibition_paginationcnt);
		
		return pageBean;
	}
	
	// 전시회 페이지 무료 카테고리 조회
	public List<ExhibitionBean> getFreeExhibitionInfo(int page) {
		
		int start = (page - 1) * exhibition_listcnt;
		RowBounds rowBounds = new RowBounds(start, exhibition_listcnt);
		
		return exhibitionDao.getFreeExhibitionInfo(rowBounds);
	}
	
	// 전시회 페이지 무료 카테고리 페이징 처리
	public PageBean getFreeExhibitionCnt(int currentPage) {
		
		int freeexhibition_Cnt = exhibitionDao.getFreeExhibitionCnt();
		PageBean pageBean = new PageBean(freeexhibition_Cnt, currentPage, exhibition_listcnt, exhibition_paginationcnt);
		
		return pageBean;
	}
	
	// 메인 인덱스 인기 캐러셀
	public List<ExhibitionBean> getIndexPagePopularExhibitionInfo() {
		return exhibitionDao.getIndexPagePopularExhibitionInfo();
	}	
	
	// 메인 인덱스 곧전시 캐러셀
	public List<ExhibitionBean> getIndexPageSoonExhibitionInfo() {
		return exhibitionDao.getIndexPageSoonExhibitionInfo();
	}
	
	// 메인 인덱스 현재 전시 캐러셀
	public List<ExhibitionBean> getIndexPagecurrentExhibitionInfo() {
		return exhibitionDao.getIndexPagecurrentExhibitionInfo();
	}
	
	// 전시회 클릭시 리뷰정보 가져가기
	public List<ReviewBean> getExhibition_clickReviewAllInfo(int exhibition_id, int page) {
		
		int start = (page - 1) * exhibitionreview_listcnt;
		RowBounds rowBounds = new RowBounds(start, exhibitionreview_listcnt);

		
		return exhibitionDao.getExhibition_clickReviewAllInfo(exhibition_id, rowBounds);
	}
	
	// 해당 전시회 리뷰 평균 점수 반환
	public double getExhibitionReviewAVG(int exhibition_id) {
		return exhibitionDao.getExhibitionReviewAVG(exhibition_id);
	}
	
	// 전시회 클릭(상세) 페이지 리뷰 페이징 처리
	public PageBean getExhibitionReviewCnt(int exhibition_id, int currentPage) {
		
		int review_Cnt = exhibitionDao.getExhibitionReviewCnt(exhibition_id);
		PageBean pageBean = new PageBean(review_Cnt, currentPage, exhibitionreview_listcnt, exhibitionreview_paginationcnt);
		// 전체 게시글/현재 페이지/페이지제한(10)/화면에 보여지는 버튼의 최대개수(10)를 매개변수로 하는 pageBean을 객체로 생성해 리턴
		
		return pageBean;
	}
	//전시회 제목 
	public String getExhibitionTitle(int exhibition_id) {
		return exhibitionDao.getExhibitionTitle(exhibition_id);
	}
	//예매된 티켓 수를 전시회 정보 update
	public void increase_exhibitionTotalTicket(int exhibition_id,int ticket_cnt) {
		exhibitionDao.increase_exhibitionTotalTicket(exhibition_id,ticket_cnt);
	}
	
	// 전시회 검색 리스트
	public List<ExhibitionBean>SearchExhibition(String title, int page){
		int start = (page - 1) * exhibition_listcnt;
		RowBounds rowBounds = new RowBounds(start, exhibition_listcnt);
		
		return exhibitionDao.SearchExhibition(title, rowBounds);
	}
	
	public PageBean SearchExhibitionCnt(String title, int currentPage) {
		
		int search_Cnt = exhibitionDao.SearchExhibitionCnt(title);
		PageBean pageBean = new PageBean(search_Cnt, currentPage, exhibition_listcnt, exhibition_paginationcnt);
		// 전체 게시글/현재 페이지/페이지제한(10)/화면에 보여지는 버튼의 최대개수(10)를 매개변수로 하는 pageBean을 객체로 생성해 리턴
		
		return pageBean;
	}
	
	// 전시회 검색없음 리스트
	public List<ExhibitionBean>AllExhibition(int page){
		int start = (page - 1) * exhibition_listcnt;
		RowBounds rowBounds = new RowBounds(start, exhibition_listcnt);
		
		return exhibitionDao.AllExhibition(rowBounds);
	}
	
	public PageBean AllExhibitionCnt(int currentPage) {
		
		int all_Cnt = exhibitionDao.AllExhibitionCnt();
		PageBean pageBean = new PageBean(all_Cnt, currentPage, exhibition_listcnt, exhibition_paginationcnt);
		// 전체 게시글/현재 페이지/페이지제한(10)/화면에 보여지는 버튼의 최대개수(10)를 매개변수로 하는 pageBean을 객체로 생성해 리턴
		
		return pageBean;
	}
	
	
	// ========================== 전시회 등록 신청 ==================
	
	// exhibition_enroll 테이블에 추가
	public void AddExhibition_Enroll(ExhibitionDetailBean exhibitionDetailBean) {
		
		// 전시시간 String으로 open 에 set해줌
		String open = (exhibitionDetailBean.getOpen_time() + " - " + exhibitionDetailBean.getClose_time());
		exhibitionDetailBean.setOpen(open);
		
		// 상태값 등록신청 1 로 set해줌
		exhibitionDetailBean.setEnroll_state(1);
		
		
		exhibitionDao.AddExhibition_Enroll(exhibitionDetailBean);
	}
	
	// ================== 메인 배너 관리자 직접 추가 ================
	
	// exhibition_id, title 반환
	public List<ExhibitionBean> getexhibitionallTitle() {
		return exhibitionDao.getexhibitionallTitle();
	}
}
