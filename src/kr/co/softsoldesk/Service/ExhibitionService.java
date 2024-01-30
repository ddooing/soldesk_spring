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
	
	public List<ExhibitionBean> getPopularExhibitionInfo() {
		
		return exhibitionDao.getPopularExhibitionInfo();
	}
	
	// 전시회 상세페이지 조회 (전시회 모든정보 객체)
	public ExhibitionBean getExhibitionDetailInfo(int exhibition_idx) {
		
		return exhibitionDao.getExhibitionDetailInfo(exhibition_idx);
	}
	
	// 조회수 증가
	public void increaseViewsExhibition(int exhibition_idx) {
		
		exhibitionDao.increaseViewsExhibition(exhibition_idx);
	}
	
}
