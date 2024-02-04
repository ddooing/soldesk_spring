package kr.co.softsoldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.mapper.ExhibitionMapper;

@Repository
public class ExhibitionDao {

	@Autowired
	ExhibitionMapper exhibitionMapper;
	
	// 인기 순 조회
	public List<ExhibitionBean> getPopularExhibitionInfo() {
		
		return exhibitionMapper.getPopularExhibitionInfo();
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
	public List<ExhibitionBean> getRecentExhibitionInfo() {
		return exhibitionMapper.getRecentExhibitionInfo();
	}
	
	// 전시회 페이지 곧종료
	public List<ExhibitionBean> getSoonEndExhibitionInfo() {
		return exhibitionMapper.getSoonEndExhibitionInfo();
	}
	
	// 전시회 페이지 무료
	public List<ExhibitionBean> getFreeExhibitionInfo() {
		return exhibitionMapper.getFreeExhibitionInfo();
	}
	
	// 메인 인덱스 인기 전시 캐러셀
	public List<ExhibitionBean> getIndexPagePopularExhibitionInfo() {
		return exhibitionMapper.getIndexPagePopularExhibitionInfo();
	}
	
	// 메인 인덱스 곧전시 전시 캐러셀
	public List<ExhibitionBean> getIndexPageSoonExhibitionInfo() {
		return exhibitionMapper.getIndexPageSoonExhibitionInfo();
	}
}
