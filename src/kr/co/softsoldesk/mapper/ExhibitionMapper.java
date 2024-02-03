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
	
	// 전시회 최근 페이지 리스트
	@Select("SELECT \r\n"
			+ "    e.exhibition_id, \r\n"
			+ "    e.title, \r\n"
			+ "    e.regdate, \r\n"
			+ "    e.author, \r\n"
			+ "    e.price, \r\n"
			+ "    e.exhibition_start, \r\n"
			+ "    e.exhibition_end, \r\n"
			+ "    e.open, \r\n"
			+ "    e.holiday, \r\n"
			+ "    e.ticket_cnt, \r\n"
			+ "    e.address, \r\n"
			+ "    e.place, \r\n"
			+ "    e.site, \r\n"
			+ "    e.views, \r\n"
			+ "    e.latitude, \r\n"
			+ "    e.longitude, \r\n"
			+ "    e.state, \r\n"
			+ "    f1.path as main_poster_path, \r\n"
			+ "    f1.name as main_poster_name, \r\n"
			+ "    f2.path as detail_poster_path, \r\n"
			+ "    f2.name as detail_poster_name \r\n"
			+ "FROM \r\n"
			+ "    exhibition e \r\n"
			+ "    JOIN file_table f1 ON e.main_poster_file_id = f1.file_id \r\n"
			+ "    JOIN file_table f2 ON e.detail_poster_file_id = f2.file_id \r\n"
			+ "WHERE \r\n"
			+ "    e.exhibition_start BETWEEN SYSDATE AND SYSDATE + INTERVAL '30' DAY")
	List<ExhibitionBean> getRecentExhibitionInfo();
	
	// 전시회 페이지 곧종료 리스트
	@Select("SELECT \r\n"
			+ "    e.exhibition_id, \r\n"
			+ "    e.title, \r\n"
			+ "    e.regdate, \r\n"
			+ "    e.author, \r\n"
			+ "    e.price, \r\n"
			+ "    e.exhibition_start, \r\n"
			+ "    e.exhibition_end, \r\n"
			+ "    e.open, \r\n"
			+ "    e.holiday, \r\n"
			+ "    e.ticket_cnt, \r\n"
			+ "    e.address, \r\n"
			+ "    e.place, \r\n"
			+ "    e.site, \r\n"
			+ "    e.views, \r\n"
			+ "    e.latitude, \r\n"
			+ "    e.longitude, \r\n"
			+ "    e.state, \r\n"
			+ "    f1.path as main_poster_path, \r\n"
			+ "    f1.name as main_poster_name, \r\n"
			+ "    f2.path as detail_poster_path, \r\n"
			+ "    f2.name as detail_poster_name \r\n"
			+ "FROM \r\n"
			+ "    exhibition e \r\n"
			+ "    JOIN file_table f1 ON e.main_poster_file_id = f1.file_id \r\n"
			+ "    JOIN file_table f2 ON e.detail_poster_file_id = f2.file_id \r\n"
			+ "WHERE \r\n"
			+ "    e.exhibition_end BETWEEN SYSDATE AND SYSDATE + INTERVAL '30' DAY")
	List<ExhibitionBean> getSoonEndExhibitionInfo();
	
	
	@Select("SELECT \r\n"
			+ "    e.exhibition_id, \r\n"
			+ "    e.title, \r\n"
			+ "    e.regdate, \r\n"
			+ "    e.author, \r\n"
			+ "    e.price, \r\n"
			+ "    e.exhibition_start, \r\n"
			+ "    e.exhibition_end, \r\n"
			+ "    e.open, \r\n"
			+ "    e.holiday, \r\n"
			+ "    e.ticket_cnt, \r\n"
			+ "    e.address, \r\n"
			+ "    e.place, \r\n"
			+ "    e.site, \r\n"
			+ "    e.views, \r\n"
			+ "    e.latitude, \r\n"
			+ "    e.longitude, \r\n"
			+ "    e.state, \r\n"
			+ "    f1.path as main_poster_path, \r\n"
			+ "    f1.name as main_poster_name, \r\n"
			+ "    f2.path as detail_poster_path, \r\n"
			+ "    f2.name as detail_poster_name \r\n"
			+ "FROM \r\n"
			+ "    exhibition e \r\n"
			+ "    JOIN file_table f1 ON e.main_poster_file_id = f1.file_id \r\n"
			+ "    JOIN file_table f2 ON e.detail_poster_file_id = f2.file_id \r\n"
			+ "WHERE \r\n"
			+ "    e.price = 0")
	List<ExhibitionBean> getFreeExhibitionInfo();
	
}	
