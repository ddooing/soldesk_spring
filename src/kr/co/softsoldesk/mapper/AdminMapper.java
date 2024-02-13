package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import kr.co.softsoldesk.Beans.BannerApplyFormBean;
import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.ExhibitionDetailBean;
import kr.co.softsoldesk.Beans.MainBannerBean;
import kr.co.softsoldesk.Beans.QnABean;
import kr.co.softsoldesk.Beans.SubBannerBean;

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
	List<QnABean> getnicknameSearchQnAInfo(@Param("search") String search, RowBounds rowBounds);
	
	// QnA 닉네임 검색 페이징 처리를 위한 검색된 총개수 반환
	@Select("SELECT \r\n"
			+ "    count(*)\r\n"
			+ "FROM \r\n"
			+ "    QnA q\r\n"
			+ "JOIN \r\n"
			+ "    user_table u ON q.user_id = u.user_id\r\n"
			+ "WHERE \r\n"
			+ "    UPPER(u.nickname) LIKE '%' || UPPER(#{search}) || '%'\r\n"
			+ "ORDER BY \r\n"
			+ "    q.qna_id DESC")
	int getnicknameSearchQnACnt(@Param("search") String search);
	
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
	List<QnABean> gettitleSearchQnAInfo(@Param("search") String search, RowBounds rowBounds);
	
	// QnA 제목 검색 페이징 처리를 위한 검색된 총개수 반환
	@Select("SELECT \r\n"
			+ "    count(*)\r\n"
			+ "FROM \r\n"
			+ "    QnA q\r\n"
			+ "JOIN \r\n"
			+ "    user_table u ON q.user_id = u.user_id\r\n"
			+ "WHERE \r\n"
			+ "    UPPER(q.title) LIKE '%' || UPPER(#{search}) || '%'\r\n"
			+ "ORDER BY \r\n"
			+ "    q.qna_id DESC")
	int gettitleSearchQnACnt(@Param("search") String search);
	
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
			+ "    state, \r\n"
			+ "    price, \r\n"
			+ "    CASE \r\n"
			+ "        WHEN SYSDATE < exhibition_start THEN '전시예정'\r\n"
			+ "        WHEN SYSDATE > exhibition_end THEN '종료됨'\r\n"
			+ "        ELSE '전시중' \r\n"
			+ "    END AS open_state\r\n"
			+ "FROM \r\n"
			+ "    exhibition\r\n"
			+ "ORDER BY exhibition_id desc")
	List<ExhibitionBean> getAdminexhibitionmange(RowBounds rowBounds);
	
	// 전시회 총개수 전시중, 전시예정, 종료전시 개수 반환
	@Select("SELECT \r\n"
			+ "    COUNT(*) AS total_exhibitions_count,\r\n"
			+ "    COUNT(CASE WHEN SYSDATE < exhibition_start THEN 1 END) AS upcoming_exhibitions_count,\r\n"
			+ "    COUNT(CASE WHEN SYSDATE > exhibition_end THEN 1 END) AS past_exhibitions_count,\r\n"
			+ "    COUNT(CASE WHEN SYSDATE BETWEEN exhibition_start AND exhibition_end THEN 1 END) AS current_exhibitions_count\r\n"
			+ "FROM \r\n"
			+ "    exhibition")
	ExhibitionBean getExhibitionCount();
	
	
	// 전시회 관리 페이징 처리
	@Select("select count(*) from exhibition")
	int getExhibitionCnt();
	
	// 전시회 관리 작가 검색
	@Select("SELECT \r\n"
			+ "    exhibition_id, \r\n"
			+ "    title, \r\n"
			+ "    author, \r\n"
			+ "    TO_CHAR(exhibition_start, 'YYYY-MM-DD') AS exhibition_start, \r\n"
			+ "    TO_CHAR(exhibition_end, 'YYYY-MM-DD') AS exhibition_end, \r\n"
			+ "    price, \r\n"
			+ "    CASE \r\n"
			+ "        WHEN SYSDATE < exhibition_start THEN '전시예정'\r\n"
			+ "        WHEN SYSDATE > exhibition_end THEN '종료됨'\r\n"
			+ "        ELSE '전시중' \r\n"
			+ "    END AS open_state\r\n"
			+ "FROM \r\n"
			+ "    exhibition\r\n"
			+ "WHERE \r\n"
			+ "    UPPER(author) LIKE '%' || UPPER(#{search}) || '%'\r\n"
			+ "ORDER BY \r\n"
			+ "    exhibition_id ASC")
	List<ExhibitionBean> getauthorSearchExhibitionInfo(@Param("search") String search);
	
	// 전시회 관리 작가 검색 전시회 총개수 전시중, 전시예정, 종료전시 개수 반환
	@Select("SELECT \r\n"
			+ "    COUNT(*) AS total_exhibitions_count,\r\n"
			+ "    COUNT(CASE WHEN SYSDATE < exhibition_start THEN 1 END) AS upcoming_exhibitions_count,\r\n"
			+ "    COUNT(CASE WHEN SYSDATE > exhibition_end THEN 1 END) AS past_exhibitions_count,\r\n"
			+ "    COUNT(CASE WHEN SYSDATE BETWEEN exhibition_start AND exhibition_end THEN 1 END) AS current_exhibitions_count\r\n"
			+ "FROM \r\n"
			+ "    exhibition\r\n"
			+ "WHERE \r\n"
			+ "    UPPER(author) LIKE '%' || UPPER(#{search}) || '%'")
	ExhibitionBean getauthorSearchExhibitionCount(@Param("search") String search);
	
	// 전시회 관리 작가 검색 페이징 처리 위한 검색 총 개수 반환
	@Select("SELECT \r\n"
			+ "    count(*)\r\n"
			+ "FROM \r\n"
			+ "    exhibition\r\n"
			+ "WHERE \r\n"
			+ "    UPPER(author) LIKE '%' || UPPER(#{search}) || '%'\r\n"
			+ "ORDER BY \r\n"
			+ "    exhibition_id ASC")
	int getauthorSearchExhibitionCnt(@Param("search") String search);
	
	// 전시회 관리 제목 검색
	@Select("SELECT \r\n"
			+ "    exhibition_id, \r\n"
			+ "    title, \r\n"
			+ "    author, \r\n"
			+ "    TO_CHAR(exhibition_start, 'YYYY-MM-DD') AS exhibition_start, \r\n"
			+ "    TO_CHAR(exhibition_end, 'YYYY-MM-DD') AS exhibition_end, \r\n"
			+ "    price, \r\n"
			+ "    CASE \r\n"
			+ "        WHEN SYSDATE < exhibition_start THEN '전시예정'\r\n"
			+ "        WHEN SYSDATE > exhibition_end THEN '종료됨'\r\n"
			+ "        ELSE '전시중' \r\n"
			+ "    END AS open_state\r\n"
			+ "FROM \r\n"
			+ "    exhibition\r\n"
			+ "WHERE \r\n"
			+ "    UPPER(title) LIKE '%' || UPPER(#{search}) || '%'\r\n"
			+ "ORDER BY \r\n"
			+ "    exhibition_id ASC")
	List<ExhibitionBean> gettitleSearchExhibitionInfo(@Param("search") String search, RowBounds rowBounds);
	
	// 전시회 관리 제목 검색 전시회 총개수 전시중, 전시예정, 종료전시 개수 반환
	@Select("SELECT \r\n"
			+ "    COUNT(*) AS total_exhibitions_count,\r\n"
			+ "    COUNT(CASE WHEN SYSDATE < exhibition_start THEN 1 END) AS upcoming_exhibitions_count,\r\n"
			+ "    COUNT(CASE WHEN SYSDATE > exhibition_end THEN 1 END) AS past_exhibitions_count,\r\n"
			+ "    COUNT(CASE WHEN SYSDATE BETWEEN exhibition_start AND exhibition_end THEN 1 END) AS current_exhibitions_count\r\n"
			+ "FROM \r\n"
			+ "    exhibition\r\n"
			+ "WHERE \r\n"
			+ "    UPPER(title) LIKE '%' || UPPER(#{search}) || '%'")
	ExhibitionBean gettitleSearchExhibitionCount(@Param("search") String search);

	// 전시회 관리 작가 검색 페이징 처리 위한 검색 총 개수 반환
	@Select("SELECT \r\n"
			+ "    count(*)\r\n"
			+ "FROM \r\n"
			+ "    exhibition\r\n"
			+ "WHERE \r\n"
			+ "    UPPER(title) LIKE '%' || UPPER(#{search}) || '%'\r\n"
			+ "ORDER BY \r\n"
			+ "    exhibition_id ASC")
	int gettitleSearchExhibitionCnt(@Param("search") String search);	
	
	// 전시회 수정 전시회 모든 정보 신청인까지 다 가져오기
	@Select("SELECT \r\n"
			+ "    e.exhibition_id, \r\n"
			+ "    e.title, \r\n"
			+ "    To_char(e.regdate, 'yyyy-mm-dd') as regdate, \r\n"
			+ "    e.state, \r\n"
			+ "    e.author, \r\n"
			+ "    e.price, \r\n"
			+ "    To_char(e.exhibition_start, 'yyyy-mm-dd') as exhibition_start, \r\n"
			+ "    To_char(e.exhibition_end, 'yyyy-mm-dd') as exhibition_end, \r\n"
			+ "    e.open, \r\n"
			+ "    e.holiday, \r\n"
			+ "    e.address, \r\n"
			+ "    e.place, \r\n"
			+ "    e.latitude, \r\n"
			+ "    e.longitude, \r\n"
			+ "    e.site,\r\n"
			+ "    e.main_poster_file_id,\r\n"
			+ "    e.detail_poster_file_id,\r\n"
			+ "    u.name AS apply_name, \r\n"
			+ "    u.email AS apply_email, \r\n"
			+ "    u.telephone AS apply_telephone,\r\n"
			+ "    mf.path AS main_poster_path, \r\n"
			+ "    mf.name AS main_poster_name,\r\n"
			+ "    df.path AS detail_poster_path, \r\n"
			+ "    df.name AS detail_poster_name\r\n"
			+ "FROM \r\n"
			+ "    exhibition e\r\n"
			+ "    JOIN file_table mf ON e.main_poster_file_id = mf.file_id\r\n"
			+ "    JOIN file_table df ON e.detail_poster_file_id = df.file_id\r\n"
			+ "    LEFT JOIN user_table u ON e.apply_person = u.user_id\r\n"
			+ "WHERE \r\n"
			+ "    e.exhibition_id = #{exhibition_id}")
	ExhibitionDetailBean getAllDetailExhibitionBean(int exhibition_id);
	
	// 전시회 수정 업데이트문 1 (file table)
	@Update("update file_table set name = #{name} where file_id=#{file_id}")
	void UpdateExhibitionInfo1(@Param("name") String name,@Param("file_id") int file_id);
	
	// 전시회 수정 업데이트문 2 (exhibition table)
	@Update("UPDATE exhibition \r\n"
			+ "SET \r\n"
			+ "    title = #{title}, \r\n"
			+ "    state = #{state}, \r\n"
			+ "    price = #{price}, \r\n"
			+ "    author = #{author}, \r\n"
			+ "    exhibition_start = #{exhibition_start}, \r\n"
			+ "    exhibition_end = #{exhibition_end}, \r\n"
			+ "    open = #{open}, \r\n"
			+ "    holiday = #{holiday}, \r\n"
			+ "    address = #{address}, \r\n"
			+ "    place = #{place}, \r\n"
			+ "    site = #{site, jdbcType=VARCHAR}\r\n"
			+ "WHERE \r\n"
			+ "    exhibition_id = #{exhibition_id}")
	void UpdateExhibitionInfo2(ExhibitionDetailBean exhibitiondetailBean);
	
	// 전시회 관리자가 직접 추가 1번 file_table 테이블
	@Insert("INSERT INTO file_table (file_id, name, path, file_date) values (file_id_seq.nextval, #{name}, #{path}, sysdate)")
	void addfiletableExhibition(ExhibitionDetailBean exhibitiondetailBean);
	
	// 전시회 관리자가 직접 추가 3번 file_table에 저장한 값들의 file_id 가져오기
	@Select("SELECT file_id from file_table where name=#{name}")
	int getFileId(String name);
	
	// 전시회 관리자가 직접 추가 2번 exhibition 테이블
	@Insert("INSERT INTO exhibition (exhibition_id, title, regdate, author, price, exhibition_start, exhibition_end, open, holiday, address, place, site, state, main_poster_file_id, detail_poster_file_id) VALUES (exhibition_id_seq.NEXTVAL, #{title}, sysdate, #{author}, #{price}, #{exhibition_start}, #{exhibition_end}, #{open}, #{holiday}, #{address}, #{place}, #{site}, #{state},#{main_poster_file_id}, #{detail_poster_file_id})")
	void addexhibitiontableExhibition(ExhibitionDetailBean exhibitiondetailBean);

	
	// ============================ 전시회 등록 신청 ============================
	// 전시회 등록신청 관리자 페이지 리스트
	@Select("SELECT e.exhibition_enroll_id, e.title, e.author, e.price, To_char(e.exhibition_start, 'yyyy-mm-dd') as exhibition_start , To_char(e.exhibition_end, 'yyyy-mm-dd') as exhibition_end, e.enroll_state, u.name as apply_name\r\n"
			+ "FROM exhibition_enroll e\r\n"
			+ "JOIN user_table u ON e.apply_person = u.user_id\r\n"
			+ "ORDER BY e.exhibition_enroll_id DESC")
	List<ExhibitionDetailBean> getAllExhibitionEnroll(RowBounds rowBounds);
	
	// 전시회 등록신청 관리자 페이지 페이징 처리 위한 총개수 반환 메소드
	@Select("select count(*) from exhibition_enroll")
	int getEnrollExhibitionCnt();
	
	// 전시회 1개 상세 정보 가져가기
	@Select("SELECT \r\n"
			+ "    e.exhibition_enroll_id, \r\n"
			+ "    e.title, \r\n"
			+ "    e.author, \r\n"
			+ "    e.price, \r\n"
			+ "    TO_CHAR(e.exhibition_start, 'yyyy-mm-dd') as exhibition_start, \r\n"
			+ "    TO_CHAR(e.exhibition_end, 'yyyy-mm-dd') as exhibition_end, \r\n"
			+ "    e.open, \r\n"
			+ "    e.holiday, \r\n"
			+ "    e.address, \r\n"
			+ "    e.place, \r\n"
			+ "    e.site, \r\n"
			+ "    e.enroll_state, \r\n"
			+ "    e.main_poster_file_id,       \r\n"
			+ "    e.detail_poster_file_id,     \r\n"
			+ "	   e.apply_person,		 \r\n"
			+ "    u.name AS apply_name, \r\n"
			+ "    u.email AS apply_email, \r\n"
			+ "    u.telephone AS apply_telephone,\r\n"
			+ "    f1.name AS main_poster_name,\r\n"
			+ "    f1.path AS main_poster_path,\r\n"
			+ "    f2.name AS detail_poster_name,\r\n"
			+ "    f2.path AS detail_poster_path\r\n"
			+ "FROM \r\n"
			+ "    exhibition_enroll e\r\n"
			+ "JOIN \r\n"
			+ "    user_table u ON e.apply_person = u.user_id\r\n"
			+ "LEFT JOIN \r\n"
			+ "    file_table f1 ON e.main_poster_file_id = f1.file_id\r\n"
			+ "LEFT JOIN \r\n"
			+ "    file_table f2 ON e.detail_poster_file_id = f2.file_id\r\n"
			+ "WHERE \r\n"
			+ "    e.exhibition_enroll_id = #{exhibition_enroll_id}")
	ExhibitionDetailBean getOneEnrollExhitiion(int exhibition_enroll_id);
	
	// 전시회 등록 신청 -> 전시회 등록 하는 메소드
	@Insert("INSERT INTO exhibition (exhibition_id, title, regdate, author, price, exhibition_start, exhibition_end, open, holiday, address, place, site, state, apply_person, main_poster_file_id, detail_poster_file_id) VALUES (exhibition_id_seq.NEXTVAL, #{title}, sysdate, #{author}, #{price}, #{exhibition_start}, #{exhibition_end}, #{open}, #{holiday}, #{address}, #{place}, #{site}, #{state}, #{apply_person},#{main_poster_file_id}, #{detail_poster_file_id})")
	void addEnrollexhibitiontableExhibition(ExhibitionDetailBean exhibitiondetailBean);
	
	//전시회 등록 신청 -> 전시회 등록 완료 하면 exhibition_enroll 테이블 상태값 변경해주기
	@Update("UPDATE exhibition_enroll SET enroll_state = #{enroll_state} where exhibition_enroll_id = #{exhibition_enroll_id}")
	void UpdateExhibitionEnrollState(@Param("enroll_state")int enroll_state,@Param("exhibition_enroll_id") int exhibition_enroll_id);
	
	// 전시회 등록 신청 관리자 페이지 뱃지에 넣을 개수 반환
	@Select("SELECT\r\n"
			+ "    COUNT(*) AS total_exhibition_eroll_count,\r\n"
			+ "    COUNT(CASE WHEN enroll_state = 1 THEN 1 END) AS stay_exhibition_eroll_count,\r\n"
			+ "    COUNT(CASE WHEN enroll_state = 2 THEN 1 END) AS complete_exhibition_eroll_count\r\n"
			+ "FROM\r\n"
			+ "    exhibition_enroll")
	ExhibitionDetailBean getEnrollExhibitionbadgeCnt();
	
	// 전시회 등록 신청 제목 검색
	@Select("SELECT \r\n"
			+ "    e.exhibition_enroll_id, \r\n"
			+ "    e.title, \r\n"
			+ "    e.author, \r\n"
			+ "    e.price, \r\n"
			+ "    TO_CHAR(e.exhibition_start, 'yyyy-mm-dd') AS exhibition_start, \r\n"
			+ "    TO_CHAR(e.exhibition_end, 'yyyy-mm-dd') AS exhibition_end, \r\n"
			+ "    e.enroll_state, \r\n"
			+ "    u.name AS apply_name\r\n"
			+ "FROM \r\n"
			+ "    exhibition_enroll e\r\n"
			+ "JOIN \r\n"
			+ "    user_table u ON e.apply_person = u.user_id\r\n"
			+ "WHERE \r\n"
			+ "    UPPER(e.title) LIKE '%' || #{search} || '%'\r\n"
			+ "ORDER BY \r\n"
			+ "    e.exhibition_enroll_id DESC\r\n")
	List<ExhibitionDetailBean> getEnrollExhibitionSearchTitle(@Param("search") String search, RowBounds rowBounds);
	
	// 전시회 등록 신청 제목 검색 배지 개수 반환
	@Select("SELECT \r\n"
			+ "    COUNT(*) AS total_exhibition_eroll_count,\r\n"
			+ "    COUNT(CASE WHEN enroll_state = 1 THEN 1 END) AS stay_exhibition_eroll_count,\r\n"
			+ "    COUNT(CASE WHEN enroll_state = 2 THEN 1 END) AS complete_exhibition_eroll_count\r\n"
			+ "FROM \r\n"
			+ "    exhibition_enroll e\r\n"
			+ "JOIN \r\n"
			+ "    user_table u ON e.apply_person = u.user_id\r\n"
			+ "WHERE \r\n"
			+ "    UPPER(e.title) LIKE '%' || #{search} || '%'\r\n"
			+ "ORDER BY \r\n"
			+ "    e.exhibition_enroll_id DESC")
	ExhibitionDetailBean getEnrollExhibitionSearchTitleBadgeCnt(@Param("search") String search);
	
	// 전시회 등록 신청 제목 검색 페이징 처리를 위한 총 개수 반환
	@Select("SELECT \r\n"
			+ "    COUNT(*)\r\n"
			+ "FROM \r\n"
			+ "    exhibition_enroll e\r\n"
			+ "JOIN \r\n"
			+ "    user_table u ON e.apply_person = u.user_id\r\n"
			+ "WHERE \r\n"
			+ "    UPPER(e.title) LIKE '%' || #{search} || '%'\r\n"
			+ "ORDER BY \r\n"
			+ "    e.exhibition_enroll_id DESC")
	int getEnrollExhibitionSearchTitletotalCnt(@Param("search") String search);
	
	
	// 전시회 등록 신청 신청인 검색
	@Select("SELECT \r\n"
			+ "    e.exhibition_enroll_id, \r\n"
			+ "    e.title, \r\n"
			+ "    e.author, \r\n"
			+ "    e.price, \r\n"
			+ "    TO_CHAR(e.exhibition_start, 'yyyy-mm-dd') AS exhibition_start, \r\n"
			+ "    TO_CHAR(e.exhibition_end, 'yyyy-mm-dd') AS exhibition_end, \r\n"
			+ "    e.enroll_state, \r\n"
			+ "    u.name AS apply_name\r\n"
			+ "FROM \r\n"
			+ "    exhibition_enroll e\r\n"
			+ "JOIN \r\n"
			+ "    user_table u ON e.apply_person = u.user_id\r\n"
			+ "WHERE \r\n"
			+ "    UPPER(u.name) LIKE '%' || #{search} || '%'\r\n"
			+ "ORDER BY \r\n"
			+ "    e.exhibition_enroll_id DESC\r\n")
	List<ExhibitionDetailBean> getEnrollExhibitionSearchapply_person(@Param("search") String search, RowBounds rowBounds);
	
	// 전시회 등록 신청 제목 검색 배지 개수 반환
	@Select("SELECT \r\n"
			+ "    COUNT(*) AS total_exhibition_eroll_count,\r\n"
			+ "    COUNT(CASE WHEN enroll_state = 1 THEN 1 END) AS stay_exhibition_eroll_count,\r\n"
			+ "    COUNT(CASE WHEN enroll_state = 2 THEN 1 END) AS complete_exhibition_eroll_count\r\n"
			+ "FROM \r\n"
			+ "    exhibition_enroll e\r\n"
			+ "JOIN \r\n"
			+ "    user_table u ON e.apply_person = u.user_id\r\n"
			+ "WHERE \r\n"
			+ "    UPPER(u.name) LIKE '%' || #{search} || '%'\r\n"
			+ "ORDER BY \r\n"
			+ "    e.exhibition_enroll_id DESC")
	ExhibitionDetailBean getEnrollExhibitionSearchapply_personBadgeCnt(@Param("search") String search);		
	
	// 전시회 등록 신청 제목 검색 페이징 처리를 위한 총 개수 반환
	@Select("SELECT \r\n"
			+ "    COUNT(*)\r\n"
			+ "FROM \r\n"
			+ "    exhibition_enroll e\r\n"
			+ "JOIN \r\n"
			+ "    user_table u ON e.apply_person = u.user_id\r\n"
			+ "WHERE \r\n"
			+ "    UPPER(u.name) LIKE '%' || #{search} || '%'\r\n"
			+ "ORDER BY \r\n"
			+ "    e.exhibition_enroll_id DESC")
	int getEnrollExhibitionSearchapply_persontotalCnt(@Param("search") String search);		
	
	// 전시회 등록 신청 작가 검색
	@Select("SELECT \r\n"
			+ "    e.exhibition_enroll_id, \r\n"
			+ "    e.title, \r\n"
			+ "    e.author, \r\n"
			+ "    e.price, \r\n"
			+ "    TO_CHAR(e.exhibition_start, 'yyyy-mm-dd') AS exhibition_start, \r\n"
			+ "    TO_CHAR(e.exhibition_end, 'yyyy-mm-dd') AS exhibition_end, \r\n"
			+ "    e.enroll_state, \r\n"
			+ "    u.name AS apply_name\r\n"
			+ "FROM \r\n"
			+ "    exhibition_enroll e\r\n"
			+ "JOIN \r\n"
			+ "    user_table u ON e.apply_person = u.user_id\r\n"
			+ "WHERE \r\n"
			+ "    UPPER(e.author) LIKE '%' || #{search} || '%'\r\n"
			+ "ORDER BY \r\n"
			+ "    e.exhibition_enroll_id DESC\r\n")
	List<ExhibitionDetailBean> getEnrollExhibitionSearchauthor(@Param("search") String search, RowBounds rowBounds);
	
	// 전시회 등록 신청 제목 검색 배지 개수 반환
	@Select("SELECT \r\n"
			+ "    COUNT(*) AS total_exhibition_eroll_count,\r\n"
			+ "    COUNT(CASE WHEN enroll_state = 1 THEN 1 END) AS stay_exhibition_eroll_count,\r\n"
			+ "    COUNT(CASE WHEN enroll_state = 2 THEN 1 END) AS complete_exhibition_eroll_count\r\n"
			+ "FROM \r\n"
			+ "    exhibition_enroll e\r\n"
			+ "JOIN \r\n"
			+ "    user_table u ON e.apply_person = u.user_id\r\n"
			+ "WHERE \r\n"
			+ "    UPPER(e.author) LIKE '%' || #{search} || '%'\r\n"
			+ "ORDER BY \r\n"
			+ "    e.exhibition_enroll_id DESC")
	ExhibitionDetailBean getEnrollExhibitionSearchauthorBadgeCnt(@Param("search") String search);	
	
	// 전시회 등록 신청 제목 검색 페이징 처리를 위한 총 개수 반환
	@Select("SELECT \r\n"
			+ "    COUNT(*)\r\n"
			+ "FROM \r\n"
			+ "    exhibition_enroll e\r\n"
			+ "JOIN \r\n"
			+ "    user_table u ON e.apply_person = u.user_id\r\n"
			+ "WHERE \r\n"
			+ "    UPPER(e.author) LIKE '%' || #{search} || '%'\r\n"
			+ "ORDER BY \r\n"
			+ "    e.exhibition_enroll_id DESC")
	int getEnrollExhibitionSearchauthortotalCnt(@Param("search") String search);	
	
	// 전시회 등록 신청 상태 검색
	@Select("SELECT \r\n"
			+ "    e.exhibition_enroll_id, \r\n"
			+ "    e.title, \r\n"
			+ "    e.author, \r\n"
			+ "    e.price, \r\n"
			+ "    TO_CHAR(e.exhibition_start, 'yyyy-mm-dd') AS exhibition_start, \r\n"
			+ "    TO_CHAR(e.exhibition_end, 'yyyy-mm-dd') AS exhibition_end, \r\n"
			+ "    e.enroll_state, \r\n"
			+ "    u.name AS apply_name\r\n"
			+ "FROM \r\n"
			+ "    exhibition_enroll e\r\n"
			+ "JOIN \r\n"
			+ "    user_table u ON e.apply_person = u.user_id\r\n"
			+ "WHERE \r\n"
			+ "    e.enroll_state = #{search} \r\n"
			+ "ORDER BY \r\n"
			+ "    e.exhibition_enroll_id DESC")
	List<ExhibitionDetailBean> getEnrollExhibitionSearchstate(@Param("search") int search, RowBounds rowBounds);
	
	// 전시회 등록 신청 상태 검색 배지 개수 반환
	@Select("SELECT \r\n"
			+ "    COUNT(*) AS total_exhibition_eroll_count,\r\n"
			+ "    COUNT(CASE WHEN enroll_state = 1 THEN 1 END) AS stay_exhibition_eroll_count,\r\n"
			+ "    COUNT(CASE WHEN enroll_state = 2 THEN 1 END) AS complete_exhibition_eroll_count\r\n"
			+ "FROM \r\n"
			+ "    exhibition_enroll e\r\n"
			+ "JOIN \r\n"
			+ "    user_table u ON e.apply_person = u.user_id\r\n"
			+ "WHERE \r\n"
			+ "    e.enroll_state = #{search} \r\n"
			+ "ORDER BY \r\n"
			+ "    e.exhibition_enroll_id DESC")
	ExhibitionDetailBean getEnrollExhibitionSearchstateBadgeCnt(@Param("search") int search);	
	
	// 전시회 등록 신청 제목 검색 페이징 처리를 위한 총 개수 반환
	@Select("SELECT \r\n"
			+ "    COUNT(*)\r\n"
			+ "FROM \r\n"
			+ "    exhibition_enroll e\r\n"
			+ "JOIN \r\n"
			+ "    user_table u ON e.apply_person = u.user_id\r\n"
			+ "WHERE \r\n"
			+ "    e.enroll_state = #{search} \r\n"
			+ "ORDER BY \r\n"
			+ "    e.exhibition_enroll_id DESC")
	int getEnrollExhibitionSearchstatetotalCnt(@Param("search") int search);	
	
	
	// ================================== 메인 배너 관리 ==============================
	
	// 메인 배너 관리 페이지
	@Select("SELECT \r\n"
			+ "    mb.main_banner_id, \r\n"
			+ "    mb.exhibition_id, \r\n"
			+ "    TO_CHAR(mb.start_date, 'yyyy-mm-dd') AS start_date, \r\n"
			+ "    TO_CHAR(mb.end_date, 'yyyy-mm-dd') AS end_date, \r\n"
			+ "    mb.expose_order, \r\n"
			+ "    mb.state, \r\n"
			+ "    e.title, \r\n"
			+ "    ft.name as main_banner_name, \r\n"
			+ "    ft.path as main_banner_path\r\n"
			+ "FROM \r\n"
			+ "    main_banner mb\r\n"
			+ "INNER JOIN \r\n"
			+ "    exhibition e ON mb.exhibition_id = e.exhibition_id\r\n"
			+ "INNER JOIN \r\n"
			+ "    file_table ft ON mb.banner_file_id = ft.file_id\r\n"
			+ "WHERE \r\n"
			+ "    mb.state = 1\r\n"
			+ "ORDER BY\r\n"
			+ "    mb.expose_order ASC")
	List<MainBannerBean> getAllShowMainbannerInfo();
	
	// 메인 배너 관리 state 2 (숨김)
	@Select("SELECT \r\n"
			+ "    mb.main_banner_id, \r\n"
			+ "    mb.exhibition_id, \r\n"
			+ "    TO_CHAR(mb.start_date, 'yyyy-mm-dd') AS start_date, \r\n"
			+ "    TO_CHAR(mb.end_date, 'yyyy-mm-dd') AS end_date, \r\n"
			+ "    mb.expose_order, \r\n"
			+ "    mb.state, \r\n"
			+ "    e.title, \r\n"
			+ "    ft.name as main_banner_name, \r\n"
			+ "    ft.path as main_banner_path\r\n"
			+ "FROM \r\n"
			+ "    main_banner mb\r\n"
			+ "INNER JOIN \r\n"
			+ "    exhibition e ON mb.exhibition_id = e.exhibition_id\r\n"
			+ "INNER JOIN \r\n"
			+ "    file_table ft ON mb.banner_file_id = ft.file_id\r\n"
			+ "WHERE \r\n"
			+ "    mb.state = 2\r\n"
			+ "ORDER BY\r\n"
			+ "    mb.expose_order ASC")
	List<MainBannerBean> getAllHideMainbannerInfo();
	
	// 메인 배너 관리 페이지 배지 관련
	@Select("SELECT\r\n"
			+ "  COUNT(*) AS banner_all_Cnt,\r\n"
			+ "  COUNT(CASE WHEN state = 1 THEN 1 END) AS banner_show_Cnt,\r\n"
			+ "  COUNT(CASE WHEN state = 2 THEN 1 END) AS banner_hide_Cnt\r\n"
			+ "FROM main_banner")
	MainBannerBean getMainBannerBadgeCnt();
	
	// 메인 배너 관리 페이지 제목 검색
	@Select("SELECT \r\n"
			+ "    mb.main_banner_id, \r\n"
			+ "    mb.exhibition_id, \r\n"
			+ "    TO_CHAR(mb.start_date, 'yyyy-mm-dd') AS start_date, \r\n"
			+ "    TO_CHAR(mb.end_date, 'yyyy-mm-dd') AS end_date, \r\n"
			+ "    mb.expose_order, \r\n"
			+ "    mb.state, \r\n"
			+ "    e.title, \r\n"
			+ "    ft.name as main_banner_name, \r\n"
			+ "    ft.path as main_banner_path\r\n"
			+ "FROM \r\n"
			+ "    main_banner mb\r\n"
			+ "INNER JOIN \r\n"
			+ "    exhibition e ON mb.exhibition_id = e.exhibition_id\r\n"
			+ "INNER JOIN \r\n"
			+ "    file_table ft ON mb.banner_file_id = ft.file_id\r\n"
			+ "WHERE \r\n"
			+ "    e.title LIKE '%' || #{search} || '%'\r\n"
			+ "ORDER BY \r\n"
			+ "    mb.expose_order asc")
	List<MainBannerBean> titleSearchMainbannerInfo(@Param("search") String search);
	
	// 메인 배너 관리 페이지 제목 검색 뱃지 관련
	@Select("SELECT \r\n"
			+ "    COUNT(*) AS banner_all_Cnt,\r\n"
			+ "    COUNT(CASE WHEN mb.state = 1 THEN 1 END) AS banner_show_Cnt,\r\n"
			+ "    COUNT(CASE WHEN mb.state = 2 THEN 1 END) AS banner_hide_Cnt\r\n"
			+ "FROM \r\n"
			+ "    main_banner mb\r\n"
			+ "INNER JOIN \r\n"
			+ "    exhibition e ON mb.exhibition_id = e.exhibition_id\r\n"
			+ "INNER JOIN \r\n"
			+ "    file_table ft ON mb.banner_file_id = ft.file_id\r\n"
			+ "WHERE \r\n"
			+ "    e.title LIKE '%' || #{search} || '%'\r\n"
			+ "ORDER BY \r\n"
			+ "    mb.expose_order asc")
	MainBannerBean getTitleSearchMainBannerBadgeCnt(@Param("search") String search);
	
	// 메인 배너 순서 업데이트
	@Update("UPDATE main_banner SET expose_order = #{exposeOrder} WHERE main_banner_id = #{mainBannerId}")
    void updateExposeOrder(@Param("mainBannerId") int mainBannerId, @Param("exposeOrder") int exposeOrder);
	
	// index 페이지 메인 캐러셀 가져가기
	@Select("SELECT\r\n"
			+ "    mb.main_banner_id,\r\n"
			+ "    mb.exhibition_id,\r\n"
			+ "    mb.expose_order,\r\n"
			+ "    mb.state,\r\n"
			+ "    ft.name AS main_banner_name,\r\n"
			+ "    ft.path AS main_banner_path\r\n"
			+ "FROM\r\n"
			+ "    main_banner mb\r\n"
			+ "INNER JOIN\r\n"
			+ "    file_table ft ON mb.banner_file_id = ft.file_id\r\n"
			+ "WHERE\r\n"
			+ "    mb.state = 1\r\n"
			+ "    AND SYSDATE BETWEEN mb.start_date AND mb.end_date\r\n"
			+ "ORDER BY\r\n"
			+ "    mb.expose_order ASC")
	List<MainBannerBean> IndexMainBannerBeanList();
	
	// 메인 배너 삭제
	@Delete("DELETE FROM main_banner where main_banner_id = #{main_banner_id}")
	void DeleteMainBanner(int main_banner_id);
	
	// 메인 배너 삭제 시 노출순서가 삭제한 배너보다 높은 노출 순서 1개씩 줄이기
	@Update("UPDATE main_banner SET expose_order = expose_order - 1 WHERE expose_order > #{expose_order}")
	void UpdateDeleteAndExpose_order(@Param("expose_order") int expose_order);
	
	// 메인 배너 관리자 페이지 메인배너 한개 모든 정보 가져가기
	@Select("SELECT\r\n"
			+ "    mb.main_banner_id,\r\n"
			+ "    mb.exhibition_id,\r\n"
			+ "    To_char(mb.start_date, 'yyyy-mm-dd') as start_date,\r\n"
			+ "    To_char(mb.end_date, 'yyyy-mm-dd') as end_date,\r\n"
			+ "    mb.expose_order,\r\n"
			+ "    mb.state,\r\n"
			+ "	   mb.pay_money, \r\n"
			+ "	   mb.banner_file_id, \r\n"
			+ "    To_char(mb.regdate, 'yyyy-mm-dd') as regdate,\r\n"
			+ "    ut.name AS user_name,\r\n"
			+ "    ut.telephone AS telephone,\r\n"
			+ "    e.title AS title,\r\n"
			+ "    ft.name AS main_banner_name,\r\n"
			+ "    ft.path AS main_banner_path\r\n"
			+ "FROM\r\n"
			+ "    main_banner mb\r\n"
			+ "LEFT JOIN\r\n"
			+ "    user_table ut ON mb.apply_person_id = ut.user_id\r\n"
			+ "LEFT JOIN\r\n"
			+ "    exhibition e ON mb.exhibition_id = e.exhibition_id\r\n"
			+ "LEFT JOIN\r\n"
			+ "    file_table ft ON mb.banner_file_id = ft.file_id\r\n"
			+ "WHERE\r\n"
			+ "    mb.main_banner_id = #{main_banner_id}")
	MainBannerBean getOneMainBannerInfo(int main_banner_id);
	
	// 메인 배너 업데이트시 파일 테이블에 파일 추가
	@Insert("INSERT INTO file_table (file_id, name, path, file_date) values (file_id_seq.nextval, #{name}, #{path}, sysdate)")
	void addfiletableBanner(MainBannerBean mainBannerBean);
	
	// 배너 수정 업데이트
	@Update("UPDATE main_banner SET state=#{state}, start_date=#{start_date}, end_date=#{end_date},expose_order=#{expose_order} ,banner_file_id=#{banner_file_id} where main_banner_id=#{main_banner_id}")
	void UpdateMainBanner(MainBannerBean mainBannerBean);
	
	// 배너 수정 업데이트시 state 값 변경 확인하려고 쓰는 메소드
	@Select("SELECT state from main_banner where main_banner_id = #{main_banner_id}")
	Integer getMainBannerState(int main_banner_id);
	
	// 배너 수정 업데이트시 state 최대 값 반환 메소드
	@Select("SELECT MAX(expose_order) FROM main_banner where state = 1")
	int getMaxExposeOrder();
	
	// 배너 수정 업데이트시 expose_order 값 1씩 줄이기
	@Update("UPDATE main_banner SET expose_order = expose_order - 1 WHERE expose_order BETWEEN #{order} + 1 AND (SELECT MAX(expose_order) FROM main_banner)")
	void UpdateExpose_order(@Param("order") int expose_order);
	
	// 메인 배너 관리자 직접 추가
	@Insert("insert into main_banner (exhibition_id, start_date, end_date, expose_order, regdate, state, banner_file_id) values (#{exhibition_id},#{start_date},#{end_date},#{expose_order},sysdate,#{state},#{banner_file_id})")
	void AddmanagerMainBanner(MainBannerBean mainBannerBean);
	
	// 배너 신청 페이지 신청한 apply_person이 신청한 전시회 목록 가져가기
	@Select("SELECT\r\n"
			+ "    e.exhibition_id,\r\n"
			+ "    e.title\r\n"
			+ "FROM\r\n"
			+ "    exhibition e\r\n"
			+ "INNER JOIN\r\n"
			+ "    user_table u ON e.apply_person = u.user_id\r\n"
			+ "WHERE\r\n"
			+ "    u.user_id = #{user_id}")
	List<ExhibitionBean> getApply_personExhibitionlist(@Param("user_id") int user_id);
	
	
	// 배너 신청 폼 테이블에 insert
	@Insert("insert into banner_apply_form (apply_person_id, exhibition_id, start_date, end_date, command, regdate, payment, state, banner_type, banner_file_id) values (#{apply_person_id}, #{exhibition_id}, #{start_date}, #{end_date}, #{command}, sysdate,#{payment} ,#{state}, #{banner_type}, #{banner_file_id})")
	void insertbanner_apply_form(BannerApplyFormBean bannerApplyFormBean);
	
	// 배너 신청 할때 파일테이블에 저장
	@Insert("INSERT INTO file_table (file_id, name, path, file_date) values (file_id_seq.nextval, #{name, jdbcType=VARCHAR}, #{path, jdbcType=VARCHAR}, sysdate)")
	void addfiletableBanner1(BannerApplyFormBean bannerApplyFormBean);
	
	// 서브 배너 관리자 페이지 가져가는것들
	@Select("SELECT \r\n"
			+ "    sb.sub_banner_id, \r\n"
			+ "    sb.exhibition_id, \r\n"
			+ "    TO_CHAR(sb.start_date, 'yyyy-mm-dd') AS start_date, \r\n"
			+ "    TO_CHAR(sb.end_date, 'yyyy-mm-dd') AS end_date, \r\n"
			+ "    sb.expose_order, \r\n"
			+ "    sb.state, \r\n"
			+ "    e.title, \r\n"
			+ "    ft.name as sub_banner_name, \r\n"
			+ "    ft.path as sub_banner_path\r\n"
			+ "FROM \r\n"
			+ "    sub_banner sb\r\n"
			+ "INNER JOIN \r\n"
			+ "    exhibition e ON sb.exhibition_id = e.exhibition_id\r\n"
			+ "INNER JOIN \r\n"
			+ "    file_table ft ON sb.banner_file_id = ft.file_id\r\n"
			+ "WHERE \r\n"
			+ "    sb.state = 1\r\n"
			+ "ORDER BY\r\n"
			+ "    sb.expose_order ASC")
	List<SubBannerBean> getAllShowSubbannerInfo();
	
	// 서브 배너 관리 페이지 배지 관련
	@Select("SELECT\r\n"
			+ "  COUNT(*) AS banner_all_Cnt,\r\n"
			+ "  COUNT(CASE WHEN state = 1 THEN 1 END) AS banner_show_Cnt,\r\n"
			+ "  COUNT(CASE WHEN state = 2 THEN 1 END) AS banner_hide_Cnt\r\n"
			+ "FROM sub_banner")
	SubBannerBean getSubBannerBadgeCnt();		
	
	// 서브 배너 관리 페이지 제목 검색
	@Select("SELECT \r\n"
			+ "    mb.sub_banner_id, \r\n"
			+ "    mb.exhibition_id, \r\n"
			+ "    TO_CHAR(mb.start_date, 'yyyy-mm-dd') AS start_date, \r\n"
			+ "    TO_CHAR(mb.end_date, 'yyyy-mm-dd') AS end_date, \r\n"
			+ "    mb.expose_order, \r\n"
			+ "    mb.state, \r\n"
			+ "    e.title, \r\n"
			+ "    ft.name as sub_banner_name, \r\n"
			+ "    ft.path as sub_banner_path\r\n"
			+ "FROM \r\n"
			+ "    sub_banner mb\r\n"
			+ "INNER JOIN \r\n"
			+ "    exhibition e ON mb.exhibition_id = e.exhibition_id\r\n"
			+ "INNER JOIN \r\n"
			+ "    file_table ft ON mb.banner_file_id = ft.file_id\r\n"
			+ "WHERE \r\n"
			+ "    e.title LIKE '%' || #{search} || '%'\r\n"
			+ "ORDER BY \r\n"
			+ "    mb.expose_order asc")
	List<SubBannerBean> titleSearchSubbannerInfo(@Param("search") String search);		
	
	// 메인 배너 관리 페이지 제목 검색 뱃지 관련
	@Select("SELECT \r\n"
			+ "    COUNT(*) AS banner_all_Cnt,\r\n"
			+ "    COUNT(CASE WHEN mb.state = 1 THEN 1 END) AS banner_show_Cnt,\r\n"
			+ "    COUNT(CASE WHEN mb.state = 2 THEN 1 END) AS banner_hide_Cnt\r\n"
			+ "FROM \r\n"
			+ "    sub_banner mb\r\n"
			+ "INNER JOIN \r\n"
			+ "    exhibition e ON mb.exhibition_id = e.exhibition_id\r\n"
			+ "INNER JOIN \r\n"
			+ "    file_table ft ON mb.banner_file_id = ft.file_id\r\n"
			+ "WHERE \r\n"
			+ "    e.title LIKE '%' || #{search} || '%'\r\n"
			+ "ORDER BY \r\n"
			+ "    mb.expose_order asc")
	SubBannerBean getTitleSearchSubBannerBadgeCnt(@Param("search") String search);		
	
	// 서브 배너 관리 state 2 (숨김)
	@Select("SELECT \r\n"
			+ "    mb.sub_banner_id, \r\n"
			+ "    mb.exhibition_id, \r\n"
			+ "    TO_CHAR(mb.start_date, 'yyyy-mm-dd') AS start_date, \r\n"
			+ "    TO_CHAR(mb.end_date, 'yyyy-mm-dd') AS end_date, \r\n"
			+ "    mb.expose_order, \r\n"
			+ "    mb.state, \r\n"
			+ "    e.title, \r\n"
			+ "    ft.name as sub_banner_name, \r\n"
			+ "    ft.path as sub_banner_path\r\n"
			+ "FROM \r\n"
			+ "    sub_banner mb\r\n"
			+ "INNER JOIN \r\n"
			+ "    exhibition e ON mb.exhibition_id = e.exhibition_id\r\n"
			+ "INNER JOIN \r\n"
			+ "    file_table ft ON mb.banner_file_id = ft.file_id\r\n"
			+ "WHERE \r\n"
			+ "    mb.state = 2\r\n"
			+ "ORDER BY\r\n"
			+ "    mb.expose_order ASC")
	List<SubBannerBean> getAllHideSubbannerInfo();		
	
	
	// 메인 배너 삭제
	@Delete("DELETE FROM sub_banner where sub_banner_id = #{sub_banner_id}")
	void DeleteSubBanner(int sub_banner_id);	
	
	// 서브 배너 삭제 시 노출순서가 삭제한 배너보다 높은 노출 순서 1개씩 줄이기
	@Update("UPDATE sub_banner SET expose_order = expose_order - 1 WHERE expose_order > #{expose_order}")
	void UpdateDeleteAndExpose_orderSub(@Param("expose_order") int expose_order);		
	
	// 서브 배너 관리자 페이지 서브배너 한개 모든 정보 가져가기
	@Select("SELECT \r\n"
			+ "    sb.sub_banner_id,\r\n"
			+ "    sb.exhibition_id,\r\n"
			+ "    TO_CHAR(sb.start_date, 'yyyy-mm-dd') AS start_date,\r\n"
			+ "    TO_CHAR(sb.end_date, 'yyyy-mm-dd') AS end_date,\r\n"
			+ "    sb.expose_order,\r\n"
			+ "    sb.state,\r\n"
			+ "    sb.pay_money,\r\n"
			+ "    sb.banner_file_id,\r\n"
			+ "    TO_CHAR(sb.regdate, 'yyyy-mm-dd') AS regdate,\r\n"
			+ "    ut.name AS user_name,\r\n"
			+ "    ut.telephone AS telephone,\r\n"
			+ "    e.title AS title,\r\n"
			+ "    ft.name AS sub_banner_name,\r\n"
			+ "    ft.path AS sub_banner_path\r\n"
			+ "FROM \r\n"
			+ "    sub_banner sb\r\n"
			+ "LEFT JOIN \r\n"
			+ "    user_table ut ON sb.apply_person_id = ut.user_id\r\n"
			+ "LEFT JOIN \r\n"
			+ "    exhibition e ON sb.exhibition_id = e.exhibition_id\r\n"
			+ "LEFT JOIN \r\n"
			+ "    file_table ft ON sb.banner_file_id = ft.file_id\r\n"
			+ "WHERE \r\n"
			+ "    sb.sub_banner_id = #{sub_banner_id}")
	SubBannerBean getOneSubBannerInfo(int sub_banner_id);		
	
	
	// 서브 배너 수정시 state 값 확인하려고 사용하는 메소드
	@Select("SELECT state from sub_banner where sub_banner_id = #{sub_banner_id}")
	Integer getSubBannerState(int sub_banner_id);
	
	// 서브 배너 업데이트시 파일 테이블에 파일 추가
	@Insert("INSERT INTO file_table (file_id, name, path, file_date) values (file_id_seq.nextval, #{name}, #{path}, sysdate)")
	void addfiletableBanner2(SubBannerBean subBannerBean);
	
	// 서브 배너 수정시 expose_order 값 max 찾기
	@Select("SELECT MAX(expose_order) FROM sub_banner where state = 1")
	int getSubMaxExposeOrder();
	
	// 서브 배너 수정 업데이트시 expose_order 값 1씩 줄이기
	@Update("UPDATE sub_banner SET expose_order = expose_order - 1 WHERE expose_order BETWEEN #{order} + 1 AND (SELECT MAX(expose_order) FROM sub_banner)")
	void UpdateSubBannerExpose_order(@Param("order") int expose_order);
	
	// 서브 배너 수정 업데이트
	@Update("UPDATE sub_banner SET state=#{state}, start_date=#{start_date}, end_date=#{end_date},expose_order=#{expose_order} ,banner_file_id=#{banner_file_id} where sub_banner_id=#{sub_banner_id}")
	void UpdateSubBanner(SubBannerBean subBannerBean);
	
	// 서브 배너 관리자 직접 추가
	@Insert("insert into sub_banner (exhibition_id, start_date, end_date, expose_order, regdate, state, banner_file_id) values (#{exhibition_id},#{start_date},#{end_date},#{expose_order},sysdate,#{state},#{banner_file_id})")
	void AddmanagerSubBanner(SubBannerBean subBannerBean);
	
	// 서브 배너 순서 업데이트
	@Update("UPDATE sub_banner SET expose_order = #{exposeOrder} WHERE sub_banner_id = #{subBannerId}")
	void updateSubExposeOrder(@Param("subBannerId") int subBannerId, @Param("exposeOrder") int exposeOrder);
	
	// index 페이지 메인 캐러셀 가져가기
	@Select("SELECT\r\n"
			+ "    mb.sub_banner_id,\r\n"
			+ "    mb.exhibition_id,\r\n"
			+ "    mb.expose_order,\r\n"
			+ "    mb.state,\r\n"
			+ "    ft.name AS sub_banner_name,\r\n"
			+ "    ft.path AS sub_banner_path\r\n"
			+ "FROM\r\n"
			+ "    sub_banner mb\r\n"
			+ "INNER JOIN\r\n"
			+ "    file_table ft ON mb.banner_file_id = ft.file_id\r\n"
			+ "WHERE\r\n"
			+ "    mb.state = 1\r\n"
			+ "    AND SYSDATE BETWEEN mb.start_date AND mb.end_date\r\n"
			+ "ORDER BY\r\n"
			+ "    mb.expose_order ASC")
	List<SubBannerBean> IndexSubBannerBeanList();		
	
}