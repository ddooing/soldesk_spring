package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.QnABean;

public interface AdminMapper {

	
	// ===============================================QnA 관리========================================
	
	
	// QnA 모든 리스트 정보 가져오기
	@Select("SELECT \r\n"
			+ "    q.qna_id,\r\n"
			+ "    q.user_id,\r\n"
			+ "    q.title, \r\n"
			+ "    q.contents, \r\n"
			+ "    to_char(q.regdate, 'yyyy-mm-dd') as regdate, \r\n"
			+ "    q.state, \r\n"
			+ "    q.reply,\r\n"
			+ "    u.nickname\r\n"
			+ "FROM \r\n"
			+ "    QnA q\r\n"
			+ "JOIN \r\n"
			+ "    user_table u ON q.user_id = u.user_id \r\n order by q.qna_id desc")
	List<QnABean> getAllQnAInfo(RowBounds rowBounds);
	
	// QnA 1개 글 정보 가져오기
	@Select("SELECT \r\n"
			+ "    q.qna_id,\r\n"
			+ "    q.user_id,\r\n"
			+ "    q.title, \r\n"
			+ "    q.contents, \r\n"
			+ "    to_char(q.regdate, 'yyyy-mm-dd') as regdate, \r\n"
			+ "    q.state, \r\n"
			+ "    q.reply,\r\n"
			+ "    u.nickname\r\n"
			+ "FROM \r\n"
			+ "    QnA q\r\n"
			+ "JOIN \r\n"
			+ "    user_table u ON q.user_id = u.user_id\r\n"
			+ "WHERE\r\n"
			+ "    qna_id = #{qna_id}")
	QnABean getOneQnAInfo(int qna_id);
	
	
	// QnA 답변전, 답변완료, 총개수 가져오기
	@Select("SELECT \r\n"
			+ "    (SELECT COUNT(*) FROM QnA) AS total_count,\r\n"
			+ "    (SELECT COUNT(*) FROM QnA WHERE state = 1) AS state_1_count,\r\n"
			+ "    (SELECT COUNT(*) FROM QnA WHERE state = 0) AS state_0_count\r\n"
			+ "FROM \r\n"
			+ "    dual")
	QnABean getQnACount();
	
	// QnA 답변 달기 메소드
	@Update("UPDATE qna set reply = #{reply}, state = #{state} where qna_id = #{qna_id}")
	void updateQnAReply(QnABean qnaBean);
	
	// QnA 삭제처리 (실제로는 state값 2)
	@Update("UPDATE qna set state = 2 where qna_id = #{qna_id}")
	void deleteQnA(int qna_id);
	
	// QnA 복구처리 (state 2->1로변경)
	@Update("UPDATE qna SET state = #{state, jdbcType=INTEGER} WHERE qna_id = #{qna_id, jdbcType=INTEGER}")
	void recoveryQnA(@Param("state") int state, @Param("qna_id") int qna_id);
	
	// QnA 닉네임 검색 메소드
	@Select("SELECT \r\n"
			+ "    q.qna_id,\r\n"
			+ "    q.user_id,\r\n"
			+ "    q.title,\r\n"
			+ "    q.contents,\r\n"
			+ "    TO_CHAR(q.regdate, 'YYYY-MM-DD') AS regdate,\r\n"
			+ "    q.state,\r\n"
			+ "    q.reply,\r\n"
			+ "    u.nickname\r\n"
			+ "FROM \r\n"
			+ "    QnA q\r\n"
			+ "JOIN \r\n"
			+ "    user_table u ON q.user_id = u.user_id\r\n"
			+ "WHERE \r\n"
			+ "    UPPER(nickname) LIKE '%' || UPPER(#{search}) || '%'\r\n"
			+ "ORDER BY \r\n"
			+ "    q.qna_id DESC")
	List<QnABean> getnicknameSearchQnAInfo(@Param("search") String search);
	
	// QnA 제목 검색 메소드
	@Select("SELECT \r\n"
			+ "    q.qna_id,\r\n"
			+ "    q.user_id,\r\n"
			+ "    q.title,\r\n"
			+ "    q.contents,\r\n"
			+ "    TO_CHAR(q.regdate, 'YYYY-MM-DD') AS regdate,\r\n"
			+ "    q.state,\r\n"
			+ "    q.reply,\r\n"
			+ "    u.nickname\r\n"
			+ "FROM \r\n"
			+ "    QnA q\r\n"
			+ "JOIN \r\n"
			+ "    user_table u ON q.user_id = u.user_id\r\n"
			+ "WHERE \r\n"
			+ "    UPPER(title) LIKE '%' || UPPER(#{search}) || '%'\r\n"
			+ "ORDER BY \r\n"
			+ "    q.qna_id DESC")
	List<QnABean> gettitleSearchQnAInfo(@Param("search") String search);
	
	// QnA 제목 검색 개수 반환 메소드
	@Select("SELECT \r\n"
	        + "    COUNT(*) AS total_count,\r\n"
	        + "    COUNT(CASE WHEN q.state = 1 THEN 1 END) AS state_1_count,\r\n"
	        + "    COUNT(CASE WHEN q.state = 0 THEN 1 END) AS state_0_count\r\n"
	        + "FROM \r\n"
	        + "    QnA q\r\n"
	        + "JOIN \r\n"
	        + "    user_table u ON q.user_id = u.user_id\r\n"
	        + "WHERE \r\n"
	        + "    UPPER(q.title) LIKE '%' || UPPER(#{search}) || '%'")
	QnABean gettitleSearchQnACount(@Param("search") String search);
	
	// QnA 닉네임 검색 개수 반환 메소드
	@Select("SELECT \r\n"
	        + "    COUNT(*) AS total_count,\r\n"
	        + "    COUNT(CASE WHEN q.state = 1 THEN 1 END) AS state_1_count,\r\n"
	        + "    COUNT(CASE WHEN q.state = 0 THEN 1 END) AS state_0_count\r\n"
	        + "FROM \r\n"
	        + "    QnA q\r\n"
	        + "JOIN \r\n"
	        + "    user_table u ON q.user_id = u.user_id\r\n"
	        + "WHERE \r\n"
	        + "    UPPER(u.nickname) LIKE '%' || UPPER(#{search}) || '%'")
	QnABean getnicknameSearchQnACount(@Param("search") String search);	
	
	
	// QnA 선택 삭제 (말이 삭제지 state 값 2으로 업데이트)
	@Update("UPDATE qna SET state = 2 where qna_id=#{qna_id}")
    void deleteSelectedQnA(@Param("qna_id") int qna_id);
	
	// QnA 페이징 처리를 위한 총 qna 개수 반환 메소드
	@Select("SELECT count(*) from qna")
	int getTotalQnACnt();
	
	
	
	// ===============================================전시회 관리========================================
	
	// 전시회 관리 첫 페이지 찍혀오는 리스트 
	@Select("SELECT \r\n"
			+ "    exhibition_id, \r\n"
			+ "    title, \r\n"
			+ "    author, \r\n"
			+ "    To_char(exhibition_start, 'yyyy-mm-dd') as exhibition_start, \r\n"
			+ "    To_char(exhibition_end, 'yyyy-mm-dd') as exhibition_end, \r\n"
			+ "    price, \r\n"
			+ "    CASE \r\n"
			+ "        WHEN SYSDATE < exhibition_start THEN '전시예정'\r\n"
			+ "        WHEN SYSDATE > exhibition_end THEN '종료됨'\r\n"
			+ "        ELSE '전시중' \r\n"
			+ "    END AS open_state\r\n"
			+ "FROM \r\n"
			+ "    exhibition\r\n"
			+ "ORDER BY exhibition_id asc")
	List<ExhibitionBean> getAdminexhibitionmange(RowBounds rowBounds);
	
	
	// 전시회 관리 페이징 처리
	@Select("select count(*) from exhibition")
	int getExhibitionCnt();
}
