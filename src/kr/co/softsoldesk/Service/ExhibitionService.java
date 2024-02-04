package kr.co.softsoldesk.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.dao.ExhibitionDao;

@Service
public class ExhibitionService {

	@Autowired
	private ExhibitionDao exhibitionDao;
	
	// 인기카테고리 조회
	public List<ExhibitionBean> getPopularExhibitionInfo() {
		
		return exhibitionDao.getPopularExhibitionInfo();
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
	public List<ExhibitionBean> getRecentExhibitionInfo() {
		return exhibitionDao.getRecentExhibitionInfo();
	}
	
	// 전시회 페이지 곧종료 카테고리 조회
	public List<ExhibitionBean> getSoonEndExhibitionInfo() {
		return exhibitionDao.getSoonEndExhibitionInfo();
	}
	
	// 전시회 페이지 무료 카테고리 조회
	public List<ExhibitionBean> getFreeExhibitionInfo() {
		return exhibitionDao.getFreeExhibitionInfo();
	}
	
	// 메인 인덱스 인기 캐러셀
	public List<ExhibitionBean> getIndexPagePopularExhibitionInfo() {
		return exhibitionDao.getIndexPagePopularExhibitionInfo();
	}	
	
	// 메인 인덱스 곧전시 캐러셀
	public List<ExhibitionBean> getIndexPageSoonExhibitionInfo() {
		return exhibitionDao.getIndexPageSoonExhibitionInfo();
	}
}
