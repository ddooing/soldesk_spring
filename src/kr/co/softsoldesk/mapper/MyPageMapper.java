package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.ReserveBean;
import kr.co.softsoldesk.Beans.UserBean;

public interface MyPageMapper {
	
	// 마이페이지 상단 상태 확인용;;
		@Select("SELECT \r\n"
				+ "    u.user_id, \r\n"
				+ "    u.nickname, \r\n"
				+ "    u.exp, \r\n"
				+ "    u.point, \r\n"
				+ "    g.grade,\r\n"
				+ "    CASE\r\n"
				+ "        WHEN g.end_exp IS NULL THEN null\r\n"
				+ "        ELSE COALESCE(g.end_exp - u.exp, null)\r\n"
				+ "    END AS exp_to_next_level,\r\n"
				+ "    COALESCE(\r\n"
				+ "        (SELECT grade FROM (\r\n"
				+ "            SELECT grade, start_exp \r\n"
				+ "            FROM grade \r\n"
				+ "            WHERE start_exp > u.exp \r\n"
				+ "            ORDER BY start_exp\r\n"
				+ "        ) WHERE ROWNUM = 1), \r\n"
				+ "        null\r\n"
				+ "    ) AS next_grade\r\n"
				+ "FROM \r\n"
				+ "    user_table u\r\n"
				+ "LEFT JOIN \r\n"
				+ "    grade g ON u.exp >= g.start_exp AND (u.exp < g.end_exp OR g.end_exp IS NULL)\r\n"
				+ "WHERE \r\n"
				+ "    u.user_id = #{user_id}\r\n"
				+ "ORDER BY \r\n"
				+ "    u.user_id")
		UserBean getMyPageTopInfo(int user_id);
		
		// 마이페이지에서 예매 리스트 출력 위한 메소드
		@Select("SELECT \r\n"
				+ "    r.user_id, \r\n"
				+ "    r.exhibition_id, \r\n"
				+ "    r.reserve_date, \r\n"
				+ "    r.total_price, \r\n"
				+ "    r.ticket_count, \r\n"
				+ "    r.state,\r\n"
				+ "    e.title, \r\n"
				+ "    f.name AS main_poster_name,\r\n"
				+ "    f.path AS main_poster_path\r\n"
				+ "FROM \r\n"
				+ "    reserve r\r\n"
				+ "INNER JOIN \r\n"
				+ "    exhibition e ON r.exhibition_id = e.exhibition_id\r\n"
				+ "INNER JOIN \r\n"
				+ "    file_table f ON e.main_poster_file_id = f.file_id\r\n"
				+ "WHERE \r\n"
				+ "    r.user_id = #{user_id}")
		List<ReserveBean> getMyPageReserveList(int user_id);
		
		// 마이페이지 북마크 메소드
		@Select("SELECT \r\n"
				+ "    b.user_id,\r\n"
				+ "    b.exhibition_id,\r\n"
				+ "    f.path AS main_poster_path,\r\n"
				+ "    f.name AS main_poster_name\r\n"
				+ "FROM \r\n"
				+ "    bookmark b\r\n"
				+ "JOIN \r\n"
				+ "    exhibition e ON b.exhibition_id = e.exhibition_id\r\n"
				+ "JOIN \r\n"
				+ "    file_table f ON e.main_poster_file_id = f.file_id\r\n"
				+ "WHERE \r\n"
				+ "    b.user_id = #{user_id}")
		List<ExhibitionBean> getMyPageBookmarkList(int user_id);
		
}
