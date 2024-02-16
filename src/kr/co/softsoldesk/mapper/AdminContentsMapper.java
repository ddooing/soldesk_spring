package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import kr.co.softsoldesk.Beans.FAQBean;
import kr.co.softsoldesk.Beans.NoticeBean;
import kr.co.softsoldesk.Beans.QnABean;

public interface AdminContentsMapper {
   
   
   //=====================================1. 공지사항 관리
      //전체 공지조회, 및 수량체크
      @Select("select notice_id, title, TO_CHAR(create_date, 'YYYY-MM-DD') as create_date, views, contents, state\r\n"
            + "from notice order by notice_id desc")
      List<NoticeBean> getAllNoticeList(RowBounds rowBounds);
      
      @Select("select count(*), count(*) as count\r\n"
            + "from notice")
      int AllNoticeCnt();
      

      //제목만 검색, 수량체크
      @Select("select notice_id, title, TO_CHAR(create_date, 'YYYY-MM-DD') as create_date, views, state\r\n"
            + "from notice\r\n"
            + "where upper(title) LIKE '%' || UPPER(#{title}) || '%' order by notice_id desc")
      List<NoticeBean> getSearchNoticeTitleList(@Param("title")String title, RowBounds rowBounds);
      
      @Select("select count(*), count(*) as count\r\n"
            + "from notice\r\n"
            + "where upper(title) LIKE '%' || UPPER(#{title}) || '%'")
      int SearchNoticeCnt(@Param("title")String title);
      
      //제목+내용검색, 수량체크
      @Select("SELECT notice_id, title, TO_CHAR(create_date, 'YYYY-MM-DD') as create_date, views, state\r\n"
            + "FROM notice\r\n"
            + "WHERE UPPER(title) LIKE '%' || UPPER(#{title}) || '%'\r\n"
            + "OR UPPER(contents) LIKE '%' || UPPER(#{title}) || '%' order by notice_id desc")
      List<NoticeBean> getSearchNoticeAllTitleList(@Param("title")String title, RowBounds rowBounds);
      
      @Select("select count(*), count(*) as count\r\n"
            + "from notice\r\n"
            + "where upper(title) LIKE '%' || UPPER(#{title}) || '%'\r\n"
            + "or upper(contents) LIKE '%' || UPPER(#{title}) || '%'")
      int AllSearchNoticeCnt(@Param("title")String title);
      
      
      //공지작성
      @Insert("INSERT INTO notice (notice_id, title, create_date, views, contents, update_date, state)\r\n"
            + "VALUES (notice_id_seq.NEXTVAL, #{title}, SYSDATE, 0, #{contents}, SYSDATE, #{state})")
      void addNotice(NoticeBean njoinBean);
      
      //공지사항 세부정보 확인
      @Select("select notice_id, title, create_date, contents, state, views\r\n"
            + "from notice\r\n"
            + "where notice_id = #{notice_id}")
      NoticeBean getNoticeInfo(int notice_id);
      
      @Update("UPDATE notice\r\n"
            + "SET views = views + 1\r\n"
            + "WHERE notice_id = #{notice_id}")
      void Noticeview(int notice_id);
      
      @Update("update notice\r\n"
            + "set title = #{title}, state = #{state}, contents = #{contents}, update_date = sysdate\r\n"
            + "where notice_id = #{notice_id}")
      void ModifyNoticeInfo(NoticeBean nmodifyBean);
      
      @Update("update notice\r\n"
            + "set state = 0\r\n"
            + "where notice_id = #{notice_id}")
      void DeleteNotice(@Param("notice_id") int notice_id);
      
      
      
      
      
      
      
      
      // ===============================================3. QnA 관리========================================
      
      
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
      
      
      //========================4. FAQ관리
         //FAQ 리스트 뽑아오기
         @Select("select faq_id, title, contents, regdate, state\r\n"
               + "from faq\r\n"
               + "where state = 1 or state = 2\r\n"
               + "order by state asc")
         List<FAQBean> getFAQList(RowBounds rowBounds);
         
         //페이징
         @Select("select count(*)\r\n"
                  + "from faq\r\n"
                  + "where state = 1 or state = 2")
            int getTotalFAQCnt();
         
         
         //MyPage에서 보이는 FAQ리스트 뽑아오기
         @Select("SELECT title, contents, faq_id, TO_CHAR(regdate, 'YYYY-MM-DD') AS regdate, ROWNUM as rnum\r\n"
               + "FROM faq\r\n"
               + "WHERE state = 1 AND ROWNUM <= 5")
         List<FAQBean> getmpFAQList();
         
         
         //FAQ 글쓰기
         @Insert("INSERT INTO FAQ (faq_id, title, regdate, contents, state)\r\n"
               + "VALUES (faq_id_seq.NEXTVAL, #{title}, SYSDATE, #{contents}, 1)")
         void regFAQ(FAQBean FAQBean);

         
         //FAQ 수정
         @Update("update faq\r\n"
               + "set title = #{title}, contents = #{contents}, regdate = sysdate, state = #{state}\r\n"
               + "where faq_id = #{faq_id}")
         void FAQmodifyBean(FAQBean FAQmodifyBean);
         
         
         //title FAQ검색 쿼리
         @Select("select faq_id, title, contents, regdate, state\r\n"
               + "from faq\r\n"
               + "where upper(title) LIKE '%' || UPPER(#{title}) || '%'\r\n"
               + "order by faq_id desc")
         List<FAQBean> getFAQSerchList(RowBounds rowBounds, @Param("title")String title);
         
         //페이징
         @Select("select count(*)\r\n"
               + "from faq\r\n"
               + "where upper(title) LIKE '%' || UPPER(#{keyword}) || '%'\r\n"
               + "order by faq_id desc")
         int getFAQSerchListCnt(String keyword);
         
         //faq 1개 로드
         @Select("select faq_id, title, contents, regdate, state\r\n"
               + "from faq\r\n"
               + "where faq_id = #{faq_id}")
         FAQBean getOneFAQInfo(int faq_id);
         
         
         //FAQ 삭제
         @Update("UPDATE faq set state = 2 where faq_id = #{faq_id}")
         void deleteSelectedFAQ(@Param("faq_id") int faq_id);
      
      

}