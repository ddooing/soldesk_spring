package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.softsoldesk.Beans.ExhibitionBean;

public interface ExhibitionMapper {
	
	// 전시회 인기 페이지 조회	(상태값 1:현재 전시중인 전시중에서만)
	@Select("SELECT e.exhibition_id, e.title, e.regdate, e.author, e.price, e.exhibition_start, e.exhibition_end, e.open, e.holiday, e.ticket_cnt, e.address, e.place, e.site, e.views, e.latitude, e.longitude, e.state, f1.path as main_poster_path, f1.name as main_poster_name, f2.path as detail_poster_path, f2.name as detail_poster_name FROM exhibition e JOIN file_table f1 ON e.main_poster_file_id = f1.file_id JOIN file_table f2 ON e.detail_poster_file_id = f2.file_id AND SYSDATE BETWEEN e.exhibition_start AND e.exhibition_end ORDER BY e.ticket_cnt desc")
	List<ExhibitionBean> getPopularExhibitionInfo();
	
	// 전시회 상세페이지 조회
	@Select("SELECT e.exhibition_id, e.title, e.regdate, e.author, e.price, e.exhibition_start, e.exhibition_end, e.open, e.holiday, e.ticket_cnt, e.address, e.place, e.site, e.views, e.latitude, e.longitude, e.state, f1.path as main_poster_path, f1.name as main_poster_name, f2.path as detail_poster_path, f2.name as detail_poster_name FROM exhibition e JOIN file_table f1 ON e.main_poster_file_id = f1.file_id JOIN file_table f2 ON e.detail_poster_file_id = f2.file_id AND exhibition_id = #{exhibition_id}")
	ExhibitionBean getExhibitionDetailInfo(int exhibition_id);
	
	// 전시회 클릭시 조회수 증가
	@Update("UPDATE exhibition SET views = views + 1 WHERE exhibition_id = #{exhibition_id}")
	void increaseViewsExhibition(int exhibition_id);
	
	
	//전시회 exhibition_id 로 제목 조회 
	@Select("select title from exhibition where exhibition_id=#{exhibition_id}")
	String getExhibitionTitle(int exhibition_id);

}	
