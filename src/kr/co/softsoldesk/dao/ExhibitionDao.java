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
	public List<ExhibitionBean> getExhibitionInfo() {
		
		return exhibitionMapper.getExhibitionInfo();
	}
	
	// 전시회 상세 조회 & 예매 정보넘길때 사용
	public ExhibitionBean getExhibitionDetailInfo(int exhibition_idx) {
		
		return exhibitionMapper.getExhibitionDetailInfo(exhibition_idx);
	}
}
