package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import kr.co.softsoldesk.Beans.ArchiveBean;
import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.QnABean;
import kr.co.softsoldesk.Beans.ReserveBean;
import kr.co.softsoldesk.Beans.ReviewBean;
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
				+ "    TO_CHAR(r.reserve_date, 'yyyy-mm-dd') AS reserve_date, \r\n"
				+ "    r.total_price, \r\n"
				+ "    r.ticket_count, \r\n"
				+ "    r.state,\r\n"
				+ "    r.reserve_id,\r\n"
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
				+ "    r.user_id = #{user_id} AND r.pay_state = 1"// 0216
				+ "order by r.reserve_id desc")
		List<ReserveBean> getMyPageReserveList(int user_id, RowBounds rowBounds);
		
		// 마이페이지 북마크 메소드
		@Select("SELECT \r\n"
				+ "    b.bookmark_id,\r\n"
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
				+ "    b.user_id = #{user_id} order by bookmark_id desc")
		List<ExhibitionBean> getMyPageBookmarkList(int user_id, RowBounds rowBounds);
		
		// 아카이브 정보 가져오는 메소드
		@Select("SELECT \r\n"
				+ "    r.reserve_id,\r\n"
				+ "    r.contents,\r\n"
				+ "    r.rating,\r\n"
				+ "    r.expose,\r\n"
				+ "    r.create_date,\r\n"
				+ "    r.modify_date,\r\n"
				+ "    TO_CHAR(rv.reserve_date, 'yyyy-mm-dd') AS reserve_date,\r\n"
				+ "    rv.ticket_count,\r\n"
				+ "    rv.total_price,\r\n"
				+ "    e.title,\r\n"
				+ "    e.place,\r\n"
				+ "    f.name AS main_poster_name,\r\n"
				+ "    f.path AS main_poster_path\r\n"
				+ "FROM \r\n"
				+ "    review r\r\n"
				+ "INNER JOIN \r\n"
				+ "    reserve rv ON r.reserve_id = rv.reserve_id\r\n"
				+ "INNER JOIN \r\n"
				+ "    user_table u ON rv.user_id = u.user_id\r\n"
				+ "INNER JOIN \r\n"
				+ "    exhibition e ON rv.exhibition_id = e.exhibition_id\r\n"
				+ "LEFT JOIN \r\n"
				+ "    file_table f ON e.main_poster_file_id = f.file_id\r\n"
				+ "WHERE \r\n"
				+ "    u.user_id = #{user_id} order by reserve_id desc")
		List<ArchiveBean> getArciveAllInfo(int user_id, RowBounds rowBounds);
		
		// 아카이브 1개 정보 reserve_id로 가져오기
		@Select("SELECT \r\n"
				+ "    r.reserve_id,\r\n"
				+ "    r.contents,\r\n"
				+ "    r.rating,\r\n"
				+ "    r.expose,\r\n"
				+ "    TO_CHAR(r.create_date, 'yyyy-mm-dd') AS create_date,\r\n"
				+ "    r.modify_date,\r\n"
				+ "    TO_CHAR(rv.reserve_date, 'yyyy-mm-dd') AS reserve_date,\r\n"
				+ "    rv.ticket_count,\r\n"
				+ "    rv.total_price,\r\n"
				+ "    e.title,\r\n"
				+ "    e.place,\r\n"
				+ "    f.name AS main_poster_name,\r\n"
				+ "    f.path AS main_poster_path\r\n"
				+ "FROM \r\n"
				+ "    review r\r\n"
				+ "INNER JOIN \r\n"
				+ "    reserve rv ON r.reserve_id = rv.reserve_id\r\n"
				+ "INNER JOIN \r\n"
				+ "    user_table u ON rv.user_id = u.user_id\r\n"
				+ "INNER JOIN \r\n"
				+ "    exhibition e ON rv.exhibition_id = e.exhibition_id\r\n"
				+ "LEFT JOIN \r\n"
				+ "    file_table f ON e.main_poster_file_id = f.file_id\r\n"
				+ "WHERE \r\n"
				+ "    rv.reserve_id = #{reserve_id}")
		ArchiveBean getArchiveOneInfo(int reserve_id);
		
		//
		
		
		// 마이페이지 아카이브 글등록(말이 등록이지 예매시 review 테이블에 insert한 부분 수정) 메소드
		@Update("UPDATE review SET contents = #{contents}, rating = #{rating}, expose = #{expose}, create_date = sysdate WHERE reserve_id = #{reserve_id}")
		void enrollArchive(ReviewBean reviewBean);
		
		// 마이페이지 아카이브 글수정 메소드
		@Update("UPDATE review SET contents=#{contents}, rating=#{rating}, expose=#{expose, jdbcType=INTEGER}, modify_date=sysdate WHERE reserve_id=#{reserve_id}")
		void modifyArchive(ReviewBean reviewBean);
		
		// 해당 유저 QnA 작성 리스트 가져오기
		@Select("SELECT \r\n"
				+ "    ROWNUM as row_number,\r\n"
				+ "    q.qna_id, \r\n"
				+ "    q.user_id, \r\n"
				+ "    q.title, \r\n"
				+ "    TO_CHAR(q.regdate, 'YYYY-MM-DD') AS regdate, \r\n"
				+ "    q.contents, \r\n"
				+ "    q.reply, \r\n"
				+ "    q.state \r\n"
				+ "FROM \r\n"
				+ "    (SELECT \r\n"
				+ "        qna_id, \r\n"
				+ "        user_id, \r\n"
				+ "        title, \r\n"
				+ "        regdate, \r\n"
				+ "        contents, \r\n"
				+ "        reply, \r\n"
				+ "        state \r\n"
				+ "     FROM \r\n"
				+ "        qna \r\n"
				+ "     WHERE \r\n"
				+ "        user_id = #{user_id}\r\n"
				+ "        AND state <> 2 \r\n"
				+ "     ORDER BY \r\n"
				+ "        qna_id DESC) q")
		List<QnABean> getUserQnAList(int user_id, RowBounds rowBounds);
		
		//QnA 등록 메소드
		@Insert("INSERT INTO qna (qna_id, user_id, title, regdate, contents, state) VALUES (QnA_id_seq.nextval, #{user_id}, #{title}, To_char(sysdate, 'yyyy-mm-dd'), #{contents}, 0)")
		void addUserQnA(QnABean qnaBean);
		
		// QnA 페이징 처리 위한 해당 유저 qna 개수 확인용
		@Select("select count(*) from qna where user_id = #{user_id}")
		int getQnAlistCnt(int user_id);
		
		// reserve 내역 페이징처리위한 해당 유저 전체 예매 개수 확인
		@Select("select count(*) from reserve where user_id = #{user_id}")
		int getreservelistCnt(int user_id);
		
		// bookmark 페이징처리를 위한 해당 유저 전체 북마크 개수 확인
		@Select("select count(*) from bookmark where user_id = #{user_id}")
		int getbookmarklistCnt(int user_id);
		
		// 아카이브 페이징처리를 위한 해당 유저 전체 아카이브 개수 확인
		@Select("SELECT \r\n"
				+ "    COUNT(r.review_id)\r\n"
				+ "FROM \r\n"
				+ "    user_table u\r\n"
				+ "JOIN \r\n"
				+ "    reserve rv ON u.user_id = rv.user_id\r\n"
				+ "JOIN \r\n"
				+ "    review r ON rv.reserve_id = r.reserve_id\r\n"
				+ "WHERE \r\n"
				+ "    u.user_id = #{user_id}")
		int getarchivelistCnt(int user_id);
}
