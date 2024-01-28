package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.Beans.ExhibitionBean;

public interface ExhibitionMapper {
	
	// 전시회 페이지 조회
	@Select("SELECT exhibition_idx, title, regdate, show_start, show_end, author, price, exhibition_start, exhibition_end, open, holiday, address, place, site, X, Y, state, main_poster_filepath, detail_poster_filepath FROM exhibition")
	List<ExhibitionBean> getExhibitionInfo();
	
	// 전시회 상세페이지 조회
	@Select("SELECT exhibition_idx, title, regdate, show_start, show_end, author, price, exhibition_start, exhibition_end, open, holiday, address, place, site, X, Y, state, main_poster_filepath, detail_poster_filepath FROM exhibition WHERE exhibition_idx = #{exhibition_idx}")
	ExhibitionBean getExhibitionDetailInfo(int exhibition_idx);
}	
